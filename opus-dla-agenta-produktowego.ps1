# Przestawia agent-produktowy na Opus 5.5 z effortem high, na stałe.
# Uruchom na komputerze w PowerShell:
#   powershell -ExecutionPolicy Bypass -File .\opus-dla-agenta-produktowego.ps1
# Każdy zmieniany plik dostaje kopię <nazwa>.bak. Skrypt nie uruchamia agenta i nie czyta plików .env.

$ErrorActionPreference = "Stop"
$agent    = "C:\Users\User\Desktop\projekty\agent-produktowy"
$model    = "claude-opus-5-5"
$settings = Join-Path $agent ".claude\settings.json"

if (-not (Test-Path $agent)) { throw "Nie ma folderu $agent" }

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
$utf8 = New-Object System.Text.UTF8Encoding($false)
[IO.File]::WriteAllText($settings, ($json | ConvertTo-Json -Depth 20), $utf8)
$changed = @($settings)
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

# 3. Rzeczy, które mogłyby nadpisać ustawienia (tylko raport, bez zmian)
if ($env:ANTHROPIC_MODEL) { Write-Warning "Zmienna ANTHROPIC_MODEL=$($env:ANTHROPIC_MODEL) nadpisuje ustawienia. Usuń ją albo ustaw na $model." }
schtasks /query /fo CSV /v | ConvertFrom-Csv |
    Where-Object { $_.'Task To Run' -match 'agent-produktowy' -or $_.'Zadanie do uruchomienia' -match 'agent-produktowy' } |
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
Write-Host "Odpowiedź testowa: $($out.result)"
if ($out.modelUsage) { Write-Host "Użyty model: $(($out.modelUsage.PSObject.Properties.Name) -join ', ')" }

# 5. Commit w repozytorium projekty, jeśli jest
Push-Location (Split-Path $agent)
if (Test-Path .git) {
    foreach ($c in $changed) { git add -- $c }
    git commit -m "agent-produktowy: Opus 5.5, effort high" | Out-Null
    Write-Host "Zrobiono commit w repozytorium projekty."
}
Pop-Location
Write-Host "Gotowe. Cofnięcie: przywróć pliki .bak albo git revert ostatniego commitu."
