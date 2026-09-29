# Opus 5.5 czy Sonnet 5 dla agentów produktowych

Data: 2026-09-29

Twoi agenci działają lokalnie na komputerze z Windows, w folderze `C:\Users\User\Desktop\projekty`, i uruchamia ich Harmonogram Zadań. Sesja w chmurze, która przygotowała ten plik, nie miała dostępu do tego komputera. Nie widziała więc promptów ani skryptów agentów. Ocena opiera się na opisach zadań z rutyny "Poranny digest automatów" i na tytułach wcześniejszych sesji. Wszystkie te sesje chodziły na modelu `claude-sonnet-5`.

Zmiany wprowadzisz sam, w jeden z dwóch sposobów. Możesz wkleić gotowy prompt z sekcji 4 do lokalnego Claude Code. Możesz też przejść ręcznie kroki z sekcji 5 i 6.

## 1. Ceny

| Model | Wejście za 1M tokenów | Wyjście za 1M tokenów | Domyślny effort |
|---|---|---|---|
| Opus 5.5 (`claude-opus-5-5`) | $4 | $20 | medium |
| Sonnet 5 (`claude-sonnet-5`) | $2 | $10 | high |

Token Opusa kosztuje dwa razy więcej. Przy jednym raporcie dziennie różnica wynosi zwykle od kilku centów do kilku dolarów. Liczy się koszt ukończonego zadania, a Opus często kończy research w mniejszej liczbie kroków.

## 2. Ocena agentów

| Agent | Zadanie | Zysk z Opus 5.5 | Decyzja |
|---|---|---|---|
| agent-produktowy | codzienny research "winning products" pod dropshipping w PL | duży | Opus 5.5, effort high |
| porównanie Amazon z Allegro (zabawki) | dopasowanie tych samych produktów i policzenie marży | duży | Opus 5.5, effort high |
| asystent ofertowy CAGEREX | oferty dla klubów sportów walki | średni | Sonnet, chyba że sam dobiera konfigurację i wycenę |
| agent-coach | mentoring biznesowy i radar narzędzi z GitHuba | średni | Sonnet, ewentualnie Opus tylko dla części mentorskiej |
| agent-inwestycyjny | research rynków (poza procesem produktowym) | duży | warto przetestować tak samo jak produktowy |
| agent-yt-radar | wrzucanie nowych filmów do NotebookLM | brak | zostaje Sonnet |
| rutyna "Poranny digest automatów" | sprawdzenie dat plików i krótkie streszczenie | brak | zostaje Sonnet |

Agent produktowy stoi na początku całego procesu, dlatego zysk jest tam największy. Z jego raportu biorą się decyzje o zakupie, porównania cen, oferty i materiały wideo. Sonnet częściej przepisuje hype z TikToka jako trend i podaje liczby sprzedaży, których nie sprawdził. Opus lepiej zestawia źródła ze sobą i częściej wprost pisze, że jakiejś liczby nie udało się potwierdzić. Błąd popełniony na tym etapie przechodzi do wszystkich następnych kroków.

W porównaniu Amazon z Allegro trzeba rozpoznać ten sam produkt po różnych nazwach, zestawach i wariantach, a potem odjąć prowizję Allegro, wysyłkę i VAT. W obu tych rzeczach Opus myli się rzadziej.

## 3. Plan testu A/B (3 do 5 dni)

Najpierw zmierz różnicę, dopiero potem zmieniaj produkcję. Test wygląda tak:

1. Produkcyjny agent-produktowy działa dalej bez zmian na Sonnecie i nadal wysyła wszystko tam, gdzie wysyłał.
2. Kopia agenta w folderze `agent-produktowy-ab` codziennie robi ten sam research na Opus 5.5. Kopia nie ma sekretów Telegrama, niczego nie wysyła i zapisuje raport do `raporty-ab\raport-YYYY-MM-DD-opus.md`.
3. Raport Sonneta z produkcji kopiujesz obok jako `raport-YYYY-MM-DD-sonnet.md` (robi to skrypt z sekcji 6).
4. Po 3 do 5 dniach oceniasz oba raporty według tabeli z sekcji 7.

## 4. Prompt do wklejenia w lokalny Claude Code

Otwórz terminal w `C:\Users\User\Desktop\projekty`, uruchom `claude` i wklej:

```text
Przygotuj test A/B modeli dla agenta produktowego. Zasady bezpieczeństwa: nie zmieniaj niczego w folderze agent-produktowy ani w innych agentach, nie uruchamiaj nic, co wysyła na Telegram, nie kopiuj plików .env ani innych plików z tokenami.

1. Przeczytaj, jak działa agent-produktowy: jego CLAUDE.md, prompt, skrypt uruchomieniowy i zadanie w Harmonogramie Zadań (schtasks /query /fo LIST /v, szukaj "projekty"). Opisz mi w 5 zdaniach, jak jest wywoływany i na jakim modelu.
2. Utwórz folder agent-produktowy-ab jako kopię agent-produktowy bez: .env, plików z tokenami, folderu raporty, logów i kodu wysyłającego na Telegram (zamiast wysyłki ma być nic).
3. W kopii ustaw model claude-opus-5-5 i effort high: w .claude\settings.json wpisz "model": "claude-opus-5-5" oraz ustawienie effortu (sprawdź w /config, jak nazywa się ten klucz w twojej wersji). Jeśli agent jest wywoływany przez "claude -p", dopisz też flagę --model claude-opus-5-5.
4. Zmień w kopii tylko ścieżkę wyjścia: raport ma trafiać do raporty-ab\raport-YYYY-MM-DD-opus.md. Treść promptu researchu ma zostać identyczna jak w produkcji, żeby porównanie było uczciwe.
5. Zapisz skrypt ab-test.ps1 według wzoru z pliku opus-vs-sonnet-agenci.md (sekcja 6) i dopasuj go do tego, jak naprawdę uruchamia się agent.
6. Dodaj w Harmonogramie Zadań zadanie "agent-produktowy-ab" uruchamiane 15 minut po produkcyjnym, na 5 dni.
7. Uruchom ab-test.ps1 raz ręcznie i pokaż mi, gdzie leżą oba raporty z dzisiaj.
```

## 5. Zmiana w produkcji (po teście)

Jeśli Opus wygra, w folderze `agent-produktowy` zmień jedną rzecz na dwa sposoby naraz, żeby żadna ścieżka wywołania nie została na starym modelu.

Plik `agent-produktowy\.claude\settings.json`:

```json
{
  "model": "claude-opus-5-5"
}
```

Wywołanie w skrypcie lub w Harmonogramie Zadań:

```powershell
claude -p "<dotychczasowy prompt>" --model claude-opus-5-5
```

Effort ustaw na `high`, bo domyślny dla Opus 5.5 to `medium`. Klucz ustawień sprawdź w `/config` swojej wersji Claude Code. To samo zrób dla skryptu porównania Amazon z Allegro. agent-yt-radar, agent-coach i rutyny digestu nie ruszaj.

Wycofanie zmiany: usuń linię `"model"` z `settings.json` i flagę `--model` z wywołania.

## 6. Skrypt ab-test.ps1 (wzór)

Zapisz w `C:\Users\User\Desktop\projekty\ab-test.ps1`. Zakłada, że agent działa przez `claude -p` z promptem w pliku `prompt.md`. Jeśli u ciebie jest inaczej, krok 5 promptu z sekcji 4 dopasuje skrypt.

```powershell
$ErrorActionPreference = "Stop"
$root  = "C:\Users\User\Desktop\projekty"
$prod  = Join-Path $root "agent-produktowy"
$ab    = Join-Path $root "agent-produktowy-ab"
$out   = Join-Path $ab "raporty-ab"
$today = Get-Date -Format "yyyy-MM-dd"

New-Item -ItemType Directory -Force -Path $out | Out-Null

# Wersja Opus: ten sam prompt, inny model, zapis do raporty-ab
$prompt = Get-Content (Join-Path $ab "prompt.md") -Raw
$prompt += "`n`nZapisz raport do pliku raporty-ab\raport-$today-opus.md. Nie wysyłaj niczego na Telegram."
Push-Location $ab
$start = Get-Date
claude -p $prompt --model claude-opus-5-5 --output-format json |
    Out-File (Join-Path $out "run-$today-opus.json") -Encoding utf8
$sec = [int]((Get-Date) - $start).TotalSeconds
Pop-Location
Add-Content (Join-Path $out "czasy.csv") "$today,opus,$sec"

# Kopia dzisiejszego raportu z produkcji (Sonnet) do porównania
$prodReport = Join-Path $prod "raporty\raport-$today.md"
if (Test-Path $prodReport) {
    Copy-Item $prodReport (Join-Path $out "raport-$today-sonnet.md") -Force
} else {
    Add-Content (Join-Path $out "czasy.csv") "$today,sonnet,BRAK_RAPORTU"
}
```

Plik `run-...-opus.json` z opcji `--output-format json` zawiera koszt i liczbę tur przebiegu. Porównasz je z kosztem Sonneta widocznym w historii sesji na claude.ai.

## 7. Jak ocenić raporty

Dla każdej pary raportów z tego samego dnia wypełnij jeden wiersz. Pierwsze trzy kolumny sprawdzasz ręcznie w 10 minut: otwierasz linki i porównujesz ceny.

| Kryterium | Jak mierzyć | Waga |
|---|---|---|
| Produkty zweryfikowane | ile produktów ma działający link, a cena i dostępność zgadzają się z raportem | 3 |
| Produkty, które byś wziął | ile z listy realnie rozważasz do sklepu | 3 |
| Zmyślone liczby | ile liczb (sprzedaż, wyświetlenia, marża) nie ma źródła albo się nie zgadza, liczy się na minus | 2 |
| Marża po kosztach | czy raport liczy prowizję, wysyłkę i VAT, czy podaje samą różnicę cen | 1 |
| Koszt przebiegu | USD z `run-...json` i z historii sesji | 1 |

Szablon wyników:

| Dzień | Model | Zweryfikowane | Do wzięcia | Zmyślone | Marża OK | Koszt USD |
|---|---|---|---|---|---|---|
| | Sonnet 5 | | | | | |
| | Opus 5.5 | | | | | |

Opus wygrywa, jeśli średnio daje co najmniej jeden produkt "do wzięcia" więcej dziennie albo wyraźnie mniej zmyślonych liczb. Wtedy przejdź do sekcji 5. Jeśli różnica jest w granicach szumu, zostań na Sonnecie i usuń folder `agent-produktowy-ab` oraz zadanie z Harmonogramu.

## 8. Czego ten plik nie obejmuje

Sesja w chmurze nie widziała kodu agentów, więc ścieżki `prompt.md`, sposób wywołania i nazwy plików w sekcji 6 są założeniem. Prompt z sekcji 4 każe lokalnemu Claude Code najpierw sprawdzić, jak jest naprawdę, i dopasować do tego skrypt. Rutyny w chmurze "Poranny digest automatów" nie zmieniano. Zostaje na Sonnecie, bo tylko sprawdza daty plików.
