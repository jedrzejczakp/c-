# Koncept z filmu konkurencji

Komenda: "zrób koncept z tego filmu <link albo plik>" (albo podobna prośba z filmem referencyjnym). Wynik: nowe koncepty w bibliotece z klatkami First i End Frame oraz mechanizm hooka w banku hooków.

## Kroki

1. Pobierz i obejrzyj film skillem `watch` (pobiera film przez yt-dlp, wycina klatki, robi transkrypcję). Przy pierwszym użyciu skill może poprosić o instalację yt-dlp i klucz do transkrypcji: według preferencji użytkownika Whisper działa przez Groq. Klucz trzymasz tylko w `~/.config/watch/.env`, nigdy w repozytorium.
2. Wykryj sceny i wytnij klatki:
   ```
   .claude/skills/higgsfield-video-director/scripts/scene_frames.sh <pobrany_film.mp4> video-library/frames/<nazwa_filmu>
   ```
   Skrypt zapisuje `scene_NN_first.png`, `scene_NN_end.png` i `scenes.csv` z czasami. Jeśli film ma jedną długą scenę z ruchem kamery, a skrypt nie znalazł cięć, zostaw jedną scenę. Jeśli znalazł za dużo cięć (szybkie migawki), uruchom go ponownie z wyższym progiem, np. `0.45`.
3. Rozłóż film na strukturę według skilla `dekoder-ugc`: format, rola każdej sceny (hook, problem, rozwiązanie, dowód, CTA), dlaczego hook zatrzymuje kciuk. Zasada antyplagiatowa z `dekoder-ugc` obowiązuje: bierzesz mechanizm, rytm i kadr, nigdy dialogi ani tekst oryginału.
4. Obejrzyj klatki każdej sceny i zbuduj koncept według szablonu z `video-library/concepts.md`:
   - nazwa `snake_case` opisująca mechanizm, nie markę ani twórcę (np. `mirror_gasp_hook`, nie `konkurent_x_hook`),
   - moduł z roli sceny, silnik według zasad z SKILL.md, czas z `scenes.csv`,
   - First i End Frame: ścieżka do pliku w `video-library/frames/` plus opis słowami,
   - stałe (kadr, ruch kamery, światło) i zmienne (model, produkt),
   - prompt bazowy po angielsku z blokadą realizmu,
   - pole "Pochodzenie: <link do filmu>, data analizy".
5. Dopisz mechanizm hooka do `references/hooks.md` w sekcji "Bank wzorców" (kategoria, opis pierwszej sekundy, przykład z [produkt]), jeśli takiego wzorca jeszcze nie ma.
6. Pokaż użytkownikowi podsumowanie: lista nowych konceptów z jedną klatką na każdy, rola i silnik. Zapytaj, które zostawić. Koncepty, których nie chce, usuwasz z biblioteki razem z klatkami.

Klatki z `video-library/frames/` służą jako opis i podgląd. Żeby użyć ich w generacji jako `start_image`, użytkownik wgrywa je w aplikacji Higgsfield, a Ty pobierasz UUID przez `show_medias` i dopisujesz go do konceptu. Kopiowanie cudzej klatki 1:1 jako pierwszej klatki filmu może naruszać prawa autorskie twórcy, dlatego do generacji lepiej użyć klatki odtworzonej (`gpt_image_2` z opisem kadru i Twoim modelem) niż oryginału.
