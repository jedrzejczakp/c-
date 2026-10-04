# Warianty hooka gotowego filmu

Komenda: "zrób 3 wersje tego filmu z nowymi hookami, reszta bez zmian" (albo podobna prośba z gotowym filmem). Wynik: 3 kompletne filmy, które różnią się tylko otwarciem. To czysty split test: jedna zmienna, reszta identyczna.

## Kroki

1. Lista potrzeb według `brief.md`, ale tylko punkty, które dotyczą hooka: produkt, problem widza, platforma, język, typ konta, model (ten sam co w filmie albo nowy). Resztę bierzesz z filmu.
2. Pobierz film (plik od użytkownika, URL albo skill `watch`) i znajdź koniec obecnego hooka:
   ```
   .claude/skills/higgsfield-video-director/scripts/scene_frames.sh <film.mp4> video-library/frames/<nazwa_filmu>
   ```
   Hook to zwykle pierwsza scena. Jeśli pierwsza scena trwa dłużej niż 4 s albo cięć nie ma, przyjmij koniec hooka w miejscu, gdzie zmienia się akcja lub kwestia mówiona (sprawdź transkrypcję z `watch`). Podaj użytkownikowi sekundę cięcia do potwierdzenia.
3. Wytnij resztę filmu (body) z oryginalnym dźwiękiem. Obraz jest kodowany ponownie, żeby cięcie wypadło dokładnie w podanej sekundzie, a nie na najbliższej klatce kluczowej:
   ```
   ffmpeg -ss <koniec_hooka> -i <film.mp4> -c:v libx264 -crf 18 -c:a aac video-library/renders/<nazwa_filmu>/body.mp4
   ```
4. Zaproponuj 3 hooki z trzech różnych kategorii banku (`hooks.md`, najpierw notatki z Obsidiana). Każdy hook:
   - trwa tyle co oryginalny albo krócej (najwyżej 4 s),
   - kończy się kadrem, który przechodzi w pierwszą klatkę body bez skoku: ten sam model, strój, miejsce i kierunek kamery. Pierwszą klatkę body (`scene_02_first.png`) podajesz jako klatkę końcową generacji, jeśli narzędzie Higgsfield ma taką rolę w `medias` (sprawdź schemat). Jeśli nie ma, opisujesz ją słowami w prompcie,
   - ma tekst na ekranie i kwestię mówioną dopasowane do dalszej części filmu, żeby obietnica hooka miała pokrycie.
5. Storyboard według `storyboard-template.md`, ale tylko z trzema hookami i informacją, że body zostaje bez zmian. Czekasz na akceptację.
6. Generujesz hook 1 jako testowy, kontrola jakości (`qc.md`), potem hooki 2 i 3.
7. Pytasz, czy zmontować filmy. Po "tak" dla każdego wariantu:
   ```
   .claude/skills/higgsfield-video-director/scripts/assemble.sh <nazwa_filmu>_hook_v1 --srt <napisy_v1.srt> <hook_v1.mp4> <body.mp4>
   ```
   Napisy z oryginału w body są już wypalone, więc SRT zawiera tylko napisy hooka.
8. Wpisy do `test-log.md`: trzy wiersze, w kolumnie "Zmiana" kategoria hooka, reszta identyczna. Poproś użytkownika, żeby opublikował warianty w podobnych godzinach, bo inaczej pora publikacji zafałszuje porównanie.
