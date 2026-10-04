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

### hair_soap_bar
- Opis wizualny: do uzupełnienia (kształt, kolor kostki, opakowanie, faktura)
- Media UUID zdjęcia produktu: do uzupełnienia

## Koncepty

### hair_soap_321_hook
- Moduł: Hook
- Silnik: seedance_2_0 (zmiana mimiki i ruch odsłonięcia)
- Czas: 5 s
- First Frame: osoba trzyma plastikową butelkę szamponu, matowe włosy, rozczarowana mina; do uzupełnienia
- End Frame: miłe zaskoczenie, w dłoni naturalna kostka mydła do włosów, zdrowe lśniące włosy; do uzupełnienia
- Stałe: tło łazienki, światło dzienne z okna, ujęcie telefonem w stylu iPhone
- Zmienne: model, opakowanie produktu
- Prompt bazowy (EN): Handheld iPhone 12 video in a bright everyday bathroom, daylight from a window on the left. [MODEL] holds a plastic shampoo bottle, looks at it with a disappointed expression, hair dull and flat. She tosses the bottle out of frame and in the same motion raises a natural hair soap bar [PRODUCT] toward the camera, her expression turning to a pleasantly surprised smile. Her hair looks healthy and natural, no dramatic change in the frame. [REALISM LOCK]
- Notatki z testów: brak

### hair_soap_store_context
- Moduł: Context
- Silnik: seedance_2_0 (upadek, chodzenie, panorama)
- Czas: 7 s
- First Frame: osoba idzie alejką drogerii z płynnym szamponem i go upuszcza; do uzupełnienia
- End Frame: płynna panorama w prawo na półkę z kostkami mydła do włosów; do uzupełnienia
- Stałe: alejka drogerii, płaskie światło jarzeniowe, jedna ciągła panorama bez cięć
- Zmienne: model, produkt na półce
- Prompt bazowy (EN): Handheld smartphone video in a bright drugstore aisle. [MODEL] walks toward camera holding a liquid shampoo bottle. The bottle slips from her hand and falls out of the bottom of the frame; the camera does not tilt down and stays level. With no pause the camera pans right in one fast continuous move and locks off tight and square on a shelf display of [PRODUCT], product filling the frame, minimal dead space. Audio: footsteps, bottle hitting the floor, ambient store hum, no music. [REALISM LOCK]
- Notatki z testów: brak

### hair_soap_selfie_cta
- Moduł: CTA
- Silnik: kling3_0 (prawie statyczne ujęcie)
- Czas: 5 s
- First Frame: selfie z bliska, uśmiechnięty model trzyma kostkę mydła przy obiektywie; do uzupełnienia
- End Frame: model wskazuje palcem na produkt; do uzupełnienia
- Stałe: kadr selfie z wyciągniętej ręki, światło z okna
- Zmienne: model, produkt, kwestia CTA
- Prompt bazowy (EN): Selfie-style handheld smartphone video, arm extended. [MODEL] smiles at the camera holding [PRODUCT] close to the lens, then points at it with her other hand and says: "[CTA LINE]". Natural window light. [REALISM LOCK]
- Notatki z testów: brak

[REALISM LOCK] to blok z sekcji "Blokada realizmu" w `.claude/skills/higgsfield-video-director/SKILL.md`.
