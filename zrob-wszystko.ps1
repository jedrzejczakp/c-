# Robi wszystko naraz:
#  1. agent-coach i agent-yt-radar zostają na Sonnet 5,
#  2. pobiera kopię z GitHuba (git-kurs, branch claude-kopia),
#  3. wdraża agenta produktowego v2 (kalkulator, punktacja, baza, nowy prompt),
#  4. włącza codzienną kopię na GitHub o 21:00,
#  5. robi commit w repozytorium projekty.
# Każdy zmieniany plik dostaje kopię .bak (tylko przy pierwszym uruchomieniu, więc można go puścić ponownie). Skrypt nie uruchamia agentów i nie czyta plików .env.

$ErrorActionPreference = "Stop"
$root  = "C:\Users\User\Desktop\projekty"
$agent = Join-Path $root "agent-produktowy"
$kopia = Join-Path $env:USERPROFILE "claude-kopia"
$utf8  = New-Object System.Text.UTF8Encoding($false)

function Ustaw-Model($dir, $model, $effort) {
    $d = Join-Path $dir ".claude"; New-Item -ItemType Directory -Force $d | Out-Null
    $f = Join-Path $d "settings.json"
    if (Test-Path $f) { if (-not (Test-Path "$f.bak")) { Copy-Item $f "$f.bak" }; $j = [IO.File]::ReadAllText($f) | ConvertFrom-Json } else { $j = [pscustomobject]@{} }
    $j | Add-Member -NotePropertyName model -NotePropertyValue $model -Force
    if ($effort) { $j | Add-Member -NotePropertyName effortLevel -NotePropertyValue $effort -Force }
    [IO.File]::WriteAllText($f, ($j | ConvertTo-Json -Depth 20), $utf8)
    Write-Host "  $(Split-Path $dir -Leaf) -> $model"
}

Write-Host "`n[1/5] Modele"
foreach ($a in "agent-coach", "agent-yt-radar") {
    $p = Join-Path $root $a
    if (Test-Path $p) { Ustaw-Model $p "claude-sonnet-5" $null } else { Write-Warning "Brak folderu $p" }
}
Ustaw-Model $agent "claude-opus-5-5" "high"

Write-Host "`n[2/5] Kopia z GitHuba"
if (Test-Path (Join-Path $kopia ".git")) { git -C $kopia pull --quiet origin claude-kopia }
else { git clone --quiet -b claude-kopia --single-branch https://github.com/jedrzejczakp/git-kurs.git $kopia }
$v2 = Join-Path $kopia "ulepszenia\agent-produktowy-v2"

Write-Host "`n[3/5] Agent produktowy v2"
foreach ($n in "kalkulator.py", "test_kalkulator.py", "punktacja.md", "prompt-v2.md") {
    $cel = Join-Path $agent $n
    if ((Test-Path $cel) -and -not (Test-Path "$cel.bak")) { Copy-Item $cel "$cel.bak" }
    Copy-Item (Join-Path $v2 $n) $cel -Force
}
if (-not (Test-Path (Join-Path $agent "baza-produktow.csv"))) { Copy-Item (Join-Path $v2 "baza-produktow.csv") $agent }
Push-Location $agent
$py = if (Get-Command python -ErrorAction SilentlyContinue) { "python" } else { "py" }
$ErrorActionPreference = "Continue"
& $py test_kalkulator.py 2>$null
$ErrorActionPreference = "Stop"
if ($LASTEXITCODE -ne 0) { Pop-Location; throw "Testy kalkulatora nie przeszly. Uruchom: $py test_kalkulator.py w folderze $agent" }
Write-Host "  Testy kalkulatora: OK"
$polecenie = @"
W tym folderze jest agent produktowy. Plik prompt-v2.md zawiera nowe zasady researchu. Połącz je z obecnym promptem agenta.
1. Znajdź obecny prompt (CLAUDE.md, plik z promptem albo tekst w skrypcie uruchomieniowym .py/.ps1/.bat). Przed zmianą zrób kopię <plik>.bak.
2. Zasady z prompt-v2.md (źródła, kalkulator.py, filtry, punktacja.md, format raportu, baza-produktow.csv) zastępują stare zasady researchu.
3. Zachowaj z obecnego promptu: ścieżki zapisu raportów, wysyłkę na Telegram, język i wszystko, co dotyczy uruchamiania.
4. Nie czytaj i nie zmieniaj plików .env. Niczego nie uruchamiaj.
5. Na koniec wypisz w 5 zdaniach, który plik zmieniłeś i co z niego zostało, a co jest nowe.
"@
claude -p $polecenie --permission-mode acceptEdits --allowedTools "Read,Glob,Grep,Edit,Write"
Pop-Location

Write-Host "`n[4/5] Codzienna kopia na GitHub"
powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $kopia "skrypty\zainstaluj-kopie.ps1")

Write-Host "`n[5/5] Commit w repozytorium projekty"
if (Test-Path (Join-Path $root ".git")) {
    git -C $root add -u
    foreach ($n in "kalkulator.py", "test_kalkulator.py", "punktacja.md", "prompt-v2.md", "baza-produktow.csv", ".claude\settings.json") {
        $p = Join-Path $agent $n; if (Test-Path $p) { git -C $root add -- $p }
    }
    foreach ($a in "agent-coach", "agent-yt-radar") {
        $p = Join-Path $root "$a\.claude\settings.json"; if (Test-Path $p) { git -C $root add -- $p }
    }
    git -C $root commit --quiet -m "agent-produktowy v2 na Opus 5.5; coach i yt-radar na Sonnet 5"
    git -C $root show --stat --oneline HEAD
}
Write-Host "`nGotowe. Agent produktowy v2 ruszy przy najbliższym uruchomieniu z Harmonogramu."
Write-Host "Cofnięcie: pliki .bak albo: git -C $root revert HEAD"
