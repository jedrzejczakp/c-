# Montaż gotowego filmu

Po zatwierdzeniu wszystkich klipów filmu zawsze pytasz użytkownika: "Czy mam sam zmontować ten film?". Montujesz tylko po odpowiedzi "tak". Pytasz przy każdym filmie, także wtedy, gdy przy poprzednim użytkownik się zgodził.

Gdy odpowie "nie", przekazujesz mu linki do klipów w kolejności ze storyboardu i plik SRT z napisami (krok 2 poniżej), żeby mógł zmontować film sam.

Skrypt: `scripts/assemble.sh` w katalogu skilla.

## Kroki

1. Zbierz klipy w kolejności ze storyboardu: URL wideo z odpowiedzi narzędzia Higgsfield albo ścieżki do plików. Jeśli odpowiedź ma tylko job ID, pobierz URL wyniku narzędziem statusu generacji w Higgsfield MCP.
2. Zapisz napisy jako plik SRT w `video-library/renders/<nazwa_filmu>/captions_src.srt`. Tekst bierzesz z kolumny "Tekst na ekranie" storyboardu, czasy liczysz od początku całego filmu (klip 2 zaczyna się po długości klipu 1). Zasady napisów:
   - najwyżej 6 do 7 słów na jedną planszę, najwyżej 2 linie,
   - plansza trwa co najmniej 1,2 s, żeby dało się ją przeczytać,
   - pierwszy napis startuje w 0,0 s, bo to część hooka.
3. Uruchom:
   ```
   .claude/skills/higgsfield-video-director/scripts/assemble.sh <nazwa_filmu> --srt <plik.srt> <klip1> <klip2> ...
   ```
4. Skrypt normalizuje każdy klip do 1080x1920 i 30 kl./s (inne proporcje przycina do pełnego kadru, bez czarnych pasów), dodaje ciszę do klipów bez dźwięku, skleja je i zapisuje dwie wersje w `video-library/renders/<nazwa_filmu>/`:
   - `final_clean.mp4` bez napisów, do aplikacji, w której dodasz napisy natywne,
   - `final.mp4` z wypalonymi napisami w strefie bezpiecznej (nad dolnym paskiem interfejsu TikToka i z dala od prawej kolumny przycisków).
5. Sprawdź wynik: `ffprobe` (1080x1920, długość równa sumie klipów) i plansza klatek z `scripts/qc_frames.sh`. Obejrzyj planszę, zanim pokażesz film użytkownikowi.
6. Prześlij użytkownikowi plik `final.mp4` (narzędzie do wysyłania plików) z jednym zdaniem: długość, liczba klipów, polecana muzyka z storyboardu i sekunda, od której ma startować.

Muzyki nie wklejasz do pliku. Użytkownik dodaje ją w aplikacji platformy (licencja i trendy: `references/music.md`).

Katalog `video-library/renders/` jest w `.gitignore`. Gotowe filmy nie trafiają do repozytorium, bo są duże. Do `test-log.md` wpisujesz tylko nazwę filmu i job ID klipów.
