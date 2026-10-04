# Kontrola jakości klipu

Robisz ją po każdej generacji, zanim pokażesz klip użytkownikowi. Skrypt: `scripts/qc_frames.sh` w katalogu skilla.

## Kroki

1. Uruchom:
   ```
   .claude/skills/higgsfield-video-director/scripts/qc_frames.sh <URL albo plik klipu> video-library/renders/qc/<nazwa_klipu>
   ```
   Skrypt zapisuje 6 klatek (początek, 20, 40, 60, 80 procent, koniec) z oznaczeniem sekundy i planszę `sheet.png`.
2. Obejrzyj `sheet.png` narzędziem Read. Gdy coś budzi wątpliwość, obejrzyj pojedynczą klatkę w pełnym rozmiarze.
3. Sprawdź listę poniżej i wpisz wynik w raporcie dla użytkownika.

## Lista kontrolna

| # | Co sprawdzasz | Jak wygląda błąd |
|---|---------------|------------------|
| 1 | Twarz modela | twarz zmienia się między klatkami albo nie przypomina Elementu |
| 2 | Produkt | zmienia kształt, rozmiar, kolor albo etykietę między klatkami |
| 3 | Dłonie i palce | dodatkowe palce, zlane dłonie, dłoń przechodzi przez przedmiot |
| 4 | Litery i napisy | zniekształcony tekst na opakowaniu lub szyldach, napis, o który nikt nie prosił |
| 5 | Realizm | rozmycie tła, bokeh, filmowa kolorystyka, dramatyczne światło |
| 6 | Ruch z promptu | kamera nie zrobiła panoramy, akcja nie nastąpiła albo nastąpiła w złej kolejności |
| 7 | Ostatnia klatka | klip kończy się na produkcie albo na kadrze, który pasuje do początku następnego klipu |
| 8 | Postać wklejona | inne światło na postaci niż w tle, brak cieni kontaktowych |

Dźwięku nie widać na planszy. Jeśli klip ma mowę albo ważny efekt dźwiękowy, napisz użytkownikowi, żeby odsłuchał, i wymień, co ma usłyszeć.

## Raport

Jedna linijka na każdy punkt listy: OK albo opis błędu z sekundą. Na końcu werdykt:

- "Do akceptacji": brak błędów w punktach 1, 2, 6.
- "Do poprawki": jest błąd w punktach 1, 2 albo 6, albo co najmniej dwa inne. Podajesz konkretną zmianę promptu z tabeli poniżej i pytasz, czy generować ponownie (kolejna generacja to kolejne kredyty).

## Typowe poprawki promptu

| Problem | Zmiana w prompcie |
|---------|-------------------|
| Twarz dryfuje | jeden Element w prompcie, reszta opisem; dodaj "same face throughout, identity consistent in every frame" |
| Produkt się zmienia | produkt jako `medias` z `role: image` albo Element zamiast opisu; dodaj "the product keeps the exact same shape, size and label for the whole clip" |
| Zniekształcone dłonie | uprość gest, ogranicz liczbę przedmiotów w dłoniach do jednego |
| Rozmycie albo filmowy wygląd | wróć do pełnej blokady realizmu z SKILL.md |
| Brak ruchu kamery | opisz ruch jako jedną ciągłą akcję z kierunkiem i miejscem lądowania ("pans right in one continuous move and locks on ...") |
| Martwa pauza w akcji | "no hesitation, no holding beat, in the same motion" |
| Napis, o który nikt nie prosił | "no on-screen text, no captions, no logos" |

Poprawkę, która naprawiła problem, dopisujesz do pola "Notatki z testów" konceptu w `video-library/concepts.md`. Przy kolejnym użyciu konceptu od razu ją stosujesz.
