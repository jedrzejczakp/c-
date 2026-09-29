# Przestawia na Opus 5.5 (effort high) agentów: agent-produktowy, agent-inwestycyjny
# oraz folder z porównaniem Amazon/Allegro (wykrywany po nazwie). Zmiana jest trwała.
# Uruchom na komputerze w PowerShell:
#   powershell -ExecutionPolicy Bypass -File .\opus-dla-agentow.ps1
# Każdy zmieniany plik dostaje kopię <nazwa>.bak. Skrypt nie uruchamia agentów i nie czyta plików .env.

$ErrorActionPreference = "Stop"
$root  = "C:\Users\User\Desktop\projekty"
$model = "claude-opus-5-5"
$utf8  = New-Object System.Text.UTF8Encoding($false)

$names = @("agent-produktowy", "agent-inwestycyjny")
$names += Get-ChildItem $root -Directory | Where-Object { $_.Name -match 'amazon|allegro|zabawk|porown' } | ForEach-Object { $_.Name }
$names = $names | Select-Object -Unique
Write-Host "Agenci do przestawienia: $($names -join ', ')"
if (-not ($names | Where-Object { $_ -match 'amazon|allegro|zabawk|porown' })) {
    Write-Warning "Nie znalazłem folderu z porównaniem Amazon/Allegro. Jeśli ma inną nazwę, dopisz ją do listy `$names na górze skryptu."
}

$changed = @()
foreach ($name in $names) {
$agent    = Join-Path $root $name
$settings = Join-Path $agent ".claude\settings.json"
if (-not (Test-Path $agent)) { Write-Warning "Nie ma folderu $agent, pomijam"; continue }
Write-Host "`n=== $name ==="

# 1. Ustawienia projektu: model i effort
New-Item -ItemType Directory -Force -Path (Split-Path $settings) | Out-Null
if (Test-Path $settings) {
    Copy-Item $settings "$settings.bak" -Force
    $json = [IO.File]::ReadAllText($settings) | ConvertFrom-Json
} else {
    $json = [pscustomobject]@{}
}
$json | Add-Member -NotePropertyName model       -NotePropertyValue $model -Force
$json | Add-Member -NotePropertyName effortLevel -NotePropertyValue "high" -Force
[IO.File]::WriteAllText($settings, ($json | ConvertTo-Json -Depth 20), $utf8)
$changed += $settings
Write-Host "Ustawiono model $model i effortLevel high w $settings"

# 2. Model wpisany na sztywno w skryptach agenta (flaga --model albo nazwa modelu Sonnet)
$files = Get-ChildItem $agent -Recurse -File -Include *.ps1, *.bat, *.cmd, *.py, *.sh, *.json |
    Where-Object { $_.FullName -notmatch '\\(\.venv|venv|node_modules|raporty|\.git)\\' -and $_.Name -notlike '*.bak' -and $_.FullName -ne $settings }
foreach ($f in $files) {
    $text = [IO.File]::ReadAllText($f.FullName)
    if ($null -eq $text) { continue }
    $new = $text -replace 'claude-sonnet-[0-9][0-9a-z\-]*', $model `
                 -replace '(--model\s+)["'']?sonnet["'']?', "`$1$model"
    if ($new -ne $text) {
        Copy-Item $f.FullName "$($f.FullName).bak" -Force
        [IO.File]::WriteAllText($f.FullName, $new, $utf8)
        Write-Host "Zamieniono model w $($f.FullName)"
        $changed += $f.FullName
    }
}

# 3. Zadania w Harmonogramie, które mogłyby wymusić inny model (tylko raport)
schtasks /query /fo CSV /v | ConvertFrom-Csv |
    Where-Object { $_.'Task To Run' -match [regex]::Escape($name) -or $_.'Zadanie do uruchomienia' -match [regex]::Escape($name) } |
    ForEach-Object {
        $cmd = $_.'Task To Run'; if (-not $cmd) { $cmd = $_.'Zadanie do uruchomienia' }
        if ($cmd -match '--model' -and $cmd -notmatch [regex]::Escape($model)) {
            Write-Warning "Zadanie $($_.TaskName) ma w poleceniu inny --model: $cmd. Popraw je w Harmonogramie Zadań."
        } else {
            Write-Host "Zadanie $($_.TaskName): OK"
        }
    }

# 4. Sprawdzenie: krótkie pytanie w folderze agenta, bez uruchamiania researchu
Push-Location $agent
$out = claude -p "Odpowiedz tylko identyfikatorem modelu, na którym działasz." --output-format json | ConvertFrom-Json
Pop-Location
Write-Host "$name, odpowiedź testowa: $($out.result)"
if ($out.modelUsage) { Write-Host "Użyty model: $(($out.modelUsage.PSObject.Properties.Name) -join ', ')" }

}

if ($env:ANTHROPIC_MODEL) { Write-Warning "Zmienna ANTHROPIC_MODEL=$($env:ANTHROPIC_MODEL) nadpisuje ustawienia wszystkich agentów. Usuń ją albo ustaw na $model." }

# 5. Commit w repozytorium projekty, jeśli jest
Push-Location $root
if (Test-Path .git) {
    foreach ($c in $changed) { git add -- $c }
    git commit -m "Opus 5.5, effort high: $($names -join ', ')" | Out-Null
    Write-Host "Zrobiono commit w repozytorium projekty."
}
Pop-Location
Write-Host "Gotowe. Cofnięcie: przywróć pliki .bak albo git revert ostatniego commitu."
