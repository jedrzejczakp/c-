# Biblioteka konceptów wideo

Plik czyta i uzupełnia skill `higgsfield-video-director`. Każdy wpis to jeden klip modułowy. Pola z "do uzupełnienia" wypełniasz po wgraniu klatek do Higgsfield (UUID pobierasz przez `show_medias`) albo po pierwszej udanej generacji (job ID).

## Szablon wpisu

```
### nazwa_konceptu
- Moduł: Hook / Context / Bridge / CTA
- Silnik: seedance_2_0 / kling3_0
- Czas: 5 s
- First Frame: opis; media UUID albo job ID
- End Frame: opis; media UUID albo job ID
- Stałe: tło, światło, ruch kamery, kompozycja
- Zmienne: model, produkt, napis, otoczenie
- Prompt bazowy (EN): ...
- Notatki z testów: ...
```

## Modele

### Model_1
- Element ID: do uzupełnienia
- Stały opis wyglądu: do uzupełnienia (tylko cechy widoczne: włosy, sylwetka, ubranie, dodatki)

## Produkty

Każdy produkt dostaje osobny wpis. Biblioteka nie zakłada żadnego produktu z góry.

### nazwa_produktu
- Opis wizualny: kształt, kolor, materiał, opakowanie, wielkość w dłoni
- Media UUID zdjęć produktu: do uzupełnienia
- Problem, który rozwiązuje: do uzupełnienia
- Zamiennik, z którym go porównujemy: do uzupełnienia

## Koncepty

Koncepty są niezależne od produktu. [PRODUCT] to produkt z sekcji "Produkty", [OLD_ALTERNATIVE] to rzecz, którą produkt zastępuje, [MODEL] to awatar z sekcji "Modele".

### store_shocked_concept
- Nazwa długa: shocked coffee drop panning to the right hook (w filmie źródłowym "store concept")
- Moduł: Hook
- Silnik: seedance_2_0 (gasp, upadek kubka, panorama w prawo)
- Czas: 5 s, 7 s gdy gasp, upadek i panorama mają się zmieścić bez pośpiechu
- First Frame: dwaj mężczyźni w sklepie trzymają kawę i patrzą w tę samą stronę; do uzupełnienia
- End Frame: kamera po panoramie w prawo zatrzymana na produkcie na półce; do uzupełnienia
- Stałe: tło sklepu, kompozycja, kierunek spojrzenia, panorama w prawo
- Zmienne: awatary, pudełko produktu
- Prompt bazowy (EN): według szablonu ze skilla `store-point-pan-reveal`, wariant z upuszczeniem kawy, panorama w prawo, [PRODUCT] na półce.
- Notatki z testów: brak

### 321_reveal_hook
- Moduł: Hook
- Silnik: seedance_2_0 (zmiana mimiki i ruch odsłonięcia)
- Czas: 5 s
- First Frame: osoba trzyma [OLD_ALTERNATIVE] z rozczarowaną miną; do uzupełnienia
- End Frame: miłe zaskoczenie, w dłoni [PRODUCT]; do uzupełnienia
- Stałe: zwykłe domowe wnętrze, światło dzienne z okna, ujęcie telefonem
- Zmienne: model, produkt, zamiennik, wnętrze
- Prompt bazowy (EN): Handheld iPhone 12 video in a bright everyday [ROOM], daylight from a window on the left. [MODEL] holds [OLD_ALTERNATIVE] and looks at it with a disappointed expression. She tosses it out of frame and in the same motion raises [PRODUCT] toward the camera, her expression turning to a pleasantly surprised smile. [REALISM LOCK]
- Notatki z testów: brak
- Pochodzenie: wzór zbudowany na przykładzie mydła do włosów

### store_drop_context
- Moduł: Context
- Silnik: seedance_2_0 (upadek, chodzenie, panorama)
- Czas: 7 s
- First Frame: osoba idzie alejką sklepu z [OLD_ALTERNATIVE] i go upuszcza; do uzupełnienia
- End Frame: płynna panorama w prawo na półkę z [PRODUCT]; do uzupełnienia
- Stałe: alejka sklepu, płaskie światło jarzeniowe, jedna ciągła panorama bez cięć
- Zmienne: model, produkt, zamiennik, typ sklepu
- Prompt bazowy (EN): Handheld smartphone video in a bright [STORE] aisle. [MODEL] walks toward camera holding [OLD_ALTERNATIVE]. It slips from her hand and falls out of the bottom of the frame; the camera does not tilt down and stays level. With no pause the camera pans right in one fast continuous move and locks off tight and square on a shelf display of [PRODUCT], product filling the frame, minimal dead space. Audio: footsteps, the item hitting the floor, ambient store hum, no music. [REALISM LOCK]
- Notatki z testów: brak

### selfie_cta
- Moduł: CTA
- Silnik: kling3_0 (prawie statyczne ujęcie)
- Czas: 5 s
- First Frame: selfie z bliska, uśmiechnięty model trzyma [PRODUCT] przy obiektywie; do uzupełnienia
- End Frame: model wskazuje palcem na produkt; do uzupełnienia
- Stałe: kadr selfie z wyciągniętej ręki, światło z okna
- Zmienne: model, produkt, kwestia CTA
- Prompt bazowy (EN): Selfie-style handheld smartphone video, arm extended. [MODEL] smiles at the camera holding [PRODUCT] close to the lens, then points at it with her other hand and says: "[CTA LINE]". Natural window light. [REALISM LOCK]
- Notatki z testów: brak

[REALISM LOCK] to blok z sekcji "Blokada realizmu" w `.claude/skills/higgsfield-video-director/SKILL.md`.
