# Hrabia vs Pikuś, wersja 2: realistyczna seria wiralowa

Data: 2026-10-11. Rola: marketing. Zlecenie: właściciel. Zastępuje wersję 1 (`2026-10-11-hrabia-vs-pikus-seedance.md`), która była kreskówkowa, działa się w jednym mieszkaniu, a pies był w niej biernym celem psikusów.

Narzędzia: GPT Image 2 (postacie, karta wyniku), Seedance 2.0 (animacja), TopView Canvas (składanie). Format 9:16, 2K, ujęcia po 5 sekund.

## Zasady serii

Pikuś (chihuahua) wygląda groźnie: warczy, szczeka, szarżuje i zawsze atakuje pierwszy. Hrabia (sfinks) wygląda na leniwego: leży, ziewa, ma półprzymknięte oczy i rusza się minimalnie. Hrabia zawsze wygrywa jednym małym, leniwym ruchem, a atak Pikusia obraca się przeciwko niemu. Pikuś kończy upokorzony, mokry, oblepiony albo zamknięty, ale nigdy ranny.

Każdy odcinek kończy się tak samo: Hrabia patrzy w obiektyw, puszcza oczko i macha łapą. Potem na ekranie pojawia się wynik serii, np. "HRABIA 3 : PIKUŚ 0". Każdy odcinek dzieje się w innej scenerii.

Wygląd ma przypominać prawdziwe nagranie z telefonu, a nie animację. Humor robi kontrast: mały wściekły pies przegrywa z kotem, który nawet nie wstał.

## Mechanika hooków i wiralowości

Pierwsza klatka już ma ruch i konflikt: pies w pół szczeknięcia albo w pół skoku. Nie zaczynaj od pustego ujęcia. Zasada ta trzyma widza przez pierwsze 0,5 s, w którym decyduje o przewinięciu.

Napis z hookiem stoi na ekranie przez pierwsze 2 s. Ma lukę ciekawości (widz chce zobaczyć, jak to się skończy) albo zakład ("Stawiasz na psa?").

Licznik wyniku buduje serię. Widz, który zobaczy "7 : 0", wraca po odcinek 8 i przewija profil od początku.

Pytanie w opisie i w ostatniej klatce ("Drużyna Hrabia czy drużyna Pikuś?") zbiera komentarze, a komentarze zwiększają zasięg.

Ostatnia klatka (machający kot) płynnie przechodzi w pierwszą klatkę (szarżujący pies). Film zapętla się i widz ogląda go drugi raz, nie zauważając początku.

Lektor jest opcjonalny, w tonie poważnego narratora filmu przyrodniczego, który komentuje bzdurną sytuację. Zdania są krótkie i suche. Filmy działają też bez dźwięku, bo napisy niosą żart.

---

## Krok 1: postacie (GPT Image 2, 9:16, 2K)

Wygeneruj każdą postać osobno, wybierz najlepszy obraz i używaj go jako referencji we wszystkich scenach. Stałe elementy, których nie wolno zmieniać: kolor skóry i plamy u kota, złoty łańcuszek z medalionem, płowa sierść psa, czerwona obroża z dzwoneczkiem.

Hrabia:

```
Photorealistic smartphone photo, 9:16, 2K. An adult hairless Sphynx cat with pale pink-beige wrinkled skin, faint grey pigment patches on the back and shoulders, very large upright ears, almond-shaped lemon-green eyes, slim muscular body. Accessory: thin gold chain collar with a small round gold medallion. Lying sprawled on a beige linen sofa, heavy-lidded sleepy eyes, one paw hanging off the edge, completely relaxed. Soft daylight from a window on the left, slightly blurred living room background, natural skin texture with visible wrinkles and fine peach fuzz, light film grain, true-to-life colors, no filters.
```

Pikuś:

```
Photorealistic smartphone photo, 9:16, 2K. An adult tiny fawn short-haired Chihuahua with an apple-shaped head, big bulging dark glossy eyes, oversized upright ears, black nose, slightly trembling thin legs. Accessory: red leather collar with a small silver bell. Standing on a light oak floor in an aggressive stance, lips curled showing tiny teeth, ears forward, hackles raised, mid-growl. Soft daylight from a window on the right, slightly blurred living room background, real fur texture, light film grain, true-to-life colors, no filters.
```

Wspólny kadr (miniatura serii):

```
Photorealistic smartphone photo, 9:16, 2K. [Hrabia description] lies lazily on a sofa armrest, looking down with a bored half-closed stare. Below on the floor, [Pikus description] barks furiously up at the cat, front paws on the sofa, mouth wide open. Warm afternoon window light from the left, cozy living room, shallow depth of field, light film grain, candid real moment.
```

## Blok stały do każdego promptu Seedance

Wklejaj na początku każdego promptu animacji, bez zmian:

```
CAT "Hrabia": adult hairless Sphynx cat, pale pink-beige wrinkled skin, faint grey patches on the back, very large upright ears, lemon-green eyes, thin gold chain collar with a small round gold medallion. Always lazy: heavy-lidded eyes, slow minimal movements, unbothered.
DOG "Pikus": tiny fawn short-haired Chihuahua, apple-shaped head, big bulging dark eyes, oversized ears, red leather collar with a small silver bell. Always furious: growling, barking, charging, trembling with rage.
STYLE: photorealistic real-life footage filmed on a smartphone, handheld with slight natural shake, natural lighting, light film grain, realistic animal anatomy, fur and skin texture, realistic physics and timing. No cartoon, no CGI look, no text on screen. Neither animal is ever hurt.
```

Zakończenie (ostatnie 2 s drugiego ujęcia każdego odcinka):

```
Ending: the cat turns its head to look straight into the lens, slowly closes one eye in a deliberate wink, then lifts one front paw and waves it twice at the camera, calm and smug. Hold for one second.
```

Negative prompt:

```
cartoon, animation, 3D render, CGI, plastic skin, oversmoothed, text, subtitles, watermark, logo, humans, blood, injury, extra limbs, deformed paws, fur on the Sphynx cat, long-haired dog, extra animals
```

## Krok 2: plan scen

| Odcinek | Sceneria | Ujęcie A (0 do 5 s) | Ujęcie B (5 do 10 s) | Karta wyniku |
|---|---|---|---|---|
| 1. Kanapa (TESTOWY) | salon | szarża psa na śpiącego kota | kot przesuwa się o 10 cm, pies przelatuje za kanapę | 1 : 0 |
| 2. Szyba | samochód na ulicy | pies wściekle szczeka przez szparę w szybie | kot łapą zamyka szybę, szczekanie cichnie | 2 : 0 |
| 3. Flaming | basen w ogrodzie | pies skacze z brzegu na kota na dmuchanym flamingu | flaming odpływa, pies ląduje w wodzie | 3 : 0 |
| 4. Kiełbaska | kuchnia | pies podskakuje po kiełbaskę z blatu | kot co skok przesuwa ją wyżej, w końcu zjada | 4 : 0 |
| 5. Zraszacz | trawnik | pies szarżuje przez trawnik na kota na leżaku | zraszacz włącza się dokładnie przed psem | 5 : 0 |
| 6. Piasek | plaża | pies kopie, żeby obsypać kota piaskiem | wiatr odwraca piasek na psa | 6 : 0 |
| 7. Pilot | salon wieczorem | pies szczeka na kota na kanapie | kot siada na pilocie, telewizor ryczy szczekaniem wielkiego psa | 7 : 0 |
| 8. Choinka | salon w święta | pies goni kota wokół choinki | pies zaplątany w świecące lampki | 8 : 0 |

Wszystkie ujęcia są animowane (Seedance 2.0). Karta wyniku jest statyczna (krok 4).

---

## Krok 3: prompty animacji

### Odcinek 1: Kanapa (SCENA TESTOWA, wygeneruj ją jako pierwszą)

Napis hook (0 do 2 s): "Chihuahua trenował ten atak 3 tygodnie"
Lektor (opcjonalnie): "Drapieżnik wybrał moment idealny." (ujęcie A) "Ofiara nie zauważyła ataku. Ofiara nie musiała." (ujęcie B)
Długość: 10 s (2 ujęcia po 5 s) plus karta wyniku 1 s.

Ujęcie A:
```
9:16, 5 seconds. [stały blok]
Sunny living room, beige linen sofa, light oak floor, afternoon light from a large window on the left. The cat sleeps stretched along the sofa cushions, belly up, completely still. The dog is already mid-charge from the right side of the frame, ears back, barking, claws slipping on the wooden floor, then launches himself in a full leap toward the sleeping cat.
Camera: handheld smartphone at sofa height, slight shake, the leap fills the frame.
Sound: frantic tiny barks, claws scratching on wood, soft cat snore.
```

Ujęcie B:
```
9:16, 5 seconds. [stały blok]
Same living room. At the last moment the cat, eyes still closed, lazily rolls a few centimeters toward the backrest. The dog flies through the empty spot, slides across the cushions and disappears behind the back of the sofa with a soft thump; only his ears pop up above the backrest, trembling. The cat yawns.
[zakończenie]
Camera: same handheld angle, small push-in on the cat for the ending.
Sound: whoosh, soft thump, offended growl from behind the sofa, small bell jingle.
```

### Odcinek 2: Szyba

Napis hook: "Szczekał przez 40 minut. Kot rozwiązał to w 2 sekundy"
Lektor: "Samiec dominuje dźwiękiem." / "Do czasu."

Ujęcie A:
```
9:16, 5 seconds. [stały blok]
Quiet residential street on a cloudy day, a parked silver car with the passenger window half open. The cat lies lazily on the passenger seat inside. The dog stands outside on the sidewalk, front paws on the car door, barking furiously through the open window gap, his face right at the opening.
Camera: handheld smartphone from inside the car, from the driver's seat, slight shake, the dog barking toward the lens.
Sound: loud sharp barks, distant street noise.
```

Ujęcie B:
```
9:16, 5 seconds. [stały blok]
Without lifting its head, the cat steps one paw on the window switch in the door panel. The window glides up and closes completely. The dog's barking becomes muffled to silence; outside, he presses his nose against the glass, mouth still open mid-bark, fogging the window with his breath, stunned.
[zakończenie]
Camera: handheld, quick pan from the paw on the switch to the dog behind the glass, back to the cat.
Sound: electric window motor hum, barking cut to muffled silence.
```

### Odcinek 3: Flaming

Napis hook: "Pies: atakuję z powietrza. Kot: ok"
Lektor: "Atak z wysokości. Bez szans na ucieczkę." / "Prawie."

Ujęcie A:
```
9:16, 5 seconds. [stały blok]
Backyard swimming pool, bright summer sun from above, turquoise water. The cat lies on its back on a big pink inflatable flamingo floating near the pool edge, eyes closed, sunbathing. The dog runs along the stone pool edge barking, then crouches and jumps off the edge toward the floating cat.
Camera: handheld smartphone from the pool corner, slight shake, sun glare on the water.
Sound: barking, running paws on stone, gentle water lapping.
```

Ujęcie B:
```
9:16, 5 seconds. [stały blok]
A tiny ripple drifts the flamingo half a meter away. The dog misses and lands in the shallow water with a splash, immediately paddles back to the steps and climbs out unharmed, soaked, ears flat, looking furious and tiny. The cat stays perfectly dry on the flamingo, one paw dipped lazily in the water.
[zakończenie]
Camera: handheld, follows the splash, then settles on the cat.
Sound: splash, dog sneeze, water dripping, calm birdsong.
```

### Odcinek 4: Kiełbaska

Napis hook: "Pies vs kot o ostatnią kiełbaskę. Postaw zakład w komentarzu"
Lektor: "Samiec skacze wysoko." / "Samica myśli wyżej."

Ujęcie A:
```
9:16, 5 seconds. [stały blok]
Bright modern kitchen, white marble countertop, morning light from a window on the left. A single grilled sausage lies near the edge of the counter. The dog jumps again and again trying to reach it, growling, snapping at the air. The cat lies on the counter right next to the sausage, chin on its paws, watching with half-closed eyes.
Camera: handheld smartphone at counter height, slight shake.
Sound: repeated little jumps and growls, paws thudding on tiles.
```

Ujęcie B:
```
9:16, 5 seconds. [stały blok]
Every time the dog jumps, the cat lazily nudges the sausage a few centimeters further from the edge with one paw. The dog finally collapses on the floor, panting, exhausted. The cat slowly pulls the sausage over and takes a big bite, chewing with eyes half closed.
[zakończenie]
Camera: handheld, alternating between the dog's jump and the cat's paw.
Sound: panting, slow chewing, a tiny frustrated whine.
```

### Odcinek 5: Zraszacz

Napis hook: "Zaatakował kota na jego terenie. Błąd"
Lektor: "Przewaga terenu jest po stronie napastnika." / "Tak mu się wydawało."

Ujęcie A:
```
9:16, 5 seconds. [stały blok]
Green garden lawn on a sunny afternoon, sun from behind the camera, trees in the soft background. The cat lies on a small wooden deck chair in the middle of the lawn, eyes closed. The dog sprints across the grass straight at the cat, barking, ears back, at full speed.
Camera: handheld smartphone at ground level, slight shake, dog running toward the lens.
Sound: barking, fast paws on grass, summer insects.
```

Ujęcie B:
```
9:16, 5 seconds. [stały blok]
The cat lazily lets one paw drop onto a garden hose valve beside the chair. A lawn sprinkler pops up from the grass exactly in front of the running dog and sprays him full in the face. The dog skids to a stop, soaked, sneezing, shaking off water, while the cat stays completely dry.
[zakończenie]
Camera: handheld, quick whip to the sprinkler, then back to the cat.
Sound: hiss of water, splash, sneeze, shaking ears flapping.
```

### Odcinek 6: Piasek

Napis hook: "Pies zaplanował zemstę na plaży. Wiatr miał inny plan"
Lektor: "Zemsta wymaga cierpliwości." / "I sprawdzenia kierunku wiatru."

Ujęcie A:
```
9:16, 5 seconds. [stały blok]
Sunny sandy beach, sea and waves in the soft background, a striped beach umbrella casting shade. The cat lies on a towel under the umbrella, eyes closed. The dog stands a short distance away with his back toward the cat and digs furiously with his front paws, glancing back with a vengeful look, trying to throw sand at the cat.
Camera: handheld smartphone at sand level, slight shake, strong sunlight.
Sound: waves, wind, frantic digging, growling.
```

Ujęcie B:
```
9:16, 5 seconds. [stały blok]
A gust of wind blows all the flying sand back onto the dog. He stops, completely covered in sand from head to tail, only his big eyes blinking, then sneezes a little sand cloud. The cat, untouched, slowly stretches on the towel.
[zakończenie]
Camera: handheld, close-up of the sandy dog, then the cat.
Sound: gust of wind, sand hiss, sneeze, waves.
```

### Odcinek 7: Pilot

Napis hook: "Kot wezwał posiłki"
Lektor: "Konflikt nasilał się." / "Wtedy przybyło wsparcie."

Ujęcie A:
```
9:16, 5 seconds. [stały blok]
Living room in the evening, warm lamp light from the right, blue glow of a turned-off TV screen. The cat lies on a dark sofa next to a black TV remote. The dog stands on the rug in front of the sofa, barking nonstop at the cat, bouncing on his front legs.
Camera: handheld smartphone from the armchair, slight shake.
Sound: nonstop sharp barks.
```

Ujęcie B:
```
9:16, 5 seconds. [stały blok]
The cat lazily shifts its weight and sits down on the remote. The TV turns on behind the dog showing a huge dog barking loudly at the camera. The dog jumps, spins around, sees the giant dog on the screen and runs under the armchair, only his trembling nose visible. The cat lies back down.
[zakończenie]
Camera: handheld, quick pan to the TV and back.
Sound: TV click, deep loud bark from the TV, tiny yelp, sudden silence.
```

### Odcinek 8: Choinka

Napis hook: "Pies goni kota wokół choinki. Zgadnij, kto zostanie ozdobą"
Lektor: "Pościg trwa." / "Trofeum zdobyte. Przez kogoś."

Ujęcie A:
```
9:16, 5 seconds. [stały blok]
Cozy living room at Christmas, a decorated tree with warm string lights, evening light from lamps, soft bokeh. The dog chases the cat around the Christmas tree, barking; the cat walks slowly and calmly, the dog runs fast in circles behind it.
Camera: handheld smartphone at floor level, slight shake.
Sound: barking, jingling bell, soft Christmas music in the background.
```

Ujęcie B:
```
9:16, 5 seconds. [stały blok]
The cat simply stops and steps aside. The dog keeps running around the tree and wraps himself in the loose string of lights, ending up gently tangled and glowing like a small decoration, standing still with a grumpy face, lights blinking on and off. The cat sits next to him.
[zakończenie]
Camera: handheld, small push-in on the glowing dog, then on the cat.
Sound: jingle, soft rustle of lights, offended huff, Christmas music.
```

---

## Krok 4: sceny statyczne (GPT Image 2)

Karta wyniku (zmieniaj tylko liczby):

```
Vertical 9:16, 2K. Close-up photo of a vintage wooden boxing scoreboard on a wall, warm light. Left side label "HRABIA" with a large white number "1", right side label "PIKUŚ" with a large white number "0". Real wood texture, slight film grain, photorealistic.
```

Jeśli GPT Image 2 przekręci litery, zrób samo tło tablicy bez tekstu i dodaj wynik napisem w montażu.

## Krok 5: składanie w TopView Canvas

1. Załóż projekt "Hrabia vs Pikuś" i otwórz Canvas.
2. Wrzuć agentowi Canvas trzy obrazy z kroku 1 (Hrabia, Pikuś, wspólny kadr) z opisem: "To są stałe postacie serii, trzymaj ich wygląd we wszystkich scenach".
3. Na płótnie ułóż ujęcia odcinka 1 obok siebie: A, B, karta wyniku. Wygeneruj tylko ujęcie A odcinka 1. Sprawdź twarz i skórę kota, obrożę psa, realizm ruchu. Dopiero gdy wygląda dobrze, generuj resztę.
4. Generuj w Seedance 2.0: 9:16, 2K, 5 s na ujęcie, obraz postaci jako referencja w każdej generacji.
5. Montaż w tej kolejności: ujęcie A, ujęcie B, karta wyniku przez 1 s. Napis hook przez pierwsze 2 s u góry kadru, dużą białą czcionką z czarnym obrysem. Napisy lektora na dole. Cięcie z A do B w momencie skoku albo ataku, żeby ruch ciągnął się przez cięcie. Ostatnią klatkę (machający kot) dobierz tak, żeby pasowała do pierwszej klatki odcinka, wtedy film zapętla się płynnie.
6. Opis pod filmem: "Odcinek X. Drużyna Hrabia czy drużyna Pikuś? 🐱🐶" plus 3 do 5 hashtagów (#kot #pies #sfinks #chihuahua #śmieszneZwierzęta).

## Krok 6: wersja slideshow (opcjonalna, karuzela zdjęć)

1. Pies w pół szczeknięcia, napis: "Ten pies myśli, że wygra".
2. Kot śpi, napis: "Kot nawet nie otworzył oczu".
3. Pies w locie, napis: "Atak!".
4. Pies za kanapą, widać tylko uszy, napis: "...".
5. Kot puszcza oczko, napis: "HRABIA 1 : PIKUŚ 0. Kto wygra następną rundę?".

Każdy slajd generujesz w GPT Image 2 z opisami postaci z kroku 1 i stylem "photorealistic smartphone photo".

## Krok 7: 20 kolejnych odcinków

1. Hamak: pies szarpie hamak, żeby zrzucić kota, sam wpada w siatkę.
2. Kartonowe pudło: pies atakuje pudło z kotem, pudło przewraca się na psa i go nakrywa.
3. Śnieg: pies szarżuje w zaspie, zapada się po uszy, kot siedzi na płocie.
4. Ruchome schody w galerii: pies biegnie pod prąd, kot jedzie spokojnie w górę.
5. Wózek w supermarkecie: pies szczeka z dołu, kot jedzie w koszyku i zrzuca mu paczkę chusteczek na głowę.
6. Drzwi szklane: pies szarżuje, kot zamyka przesuwne drzwi tarasu.
7. Kosz na pranie: pies wskakuje, żeby wyciągnąć kota, kot wychodzi, pies zostaje z majtkami na głowie.
8. Kąpiel w wannie: pies ciągnie kota do wody, sam ląduje w pianie.
9. Kanapa z kocem: pies zabiera kotu koc, kot zabiera psu legowisko.
10. Liście jesienią: pies wpada w kupkę liści, kot siedzi na grabiach.
11. Lustro w windzie: pies szczeka na odbicie, kot obok ziewa.
12. Ciepła mata: pies zajmuje matę grzewczą, kot wyłącza ją ogonem.
13. Kajak na jeziorze: pies skacze do kajaku, kajak odpływa.
14. Piknik: pies kradnie kanapkę, kot ma już kurczaka.
15. Dzwonek do drzwi: pies biega do drzwi, kot dzwoni łapą z drugiego pokoju i ślizga go w kółko.
16. Balkon z pomidorami: pies kopie w doniczce, kot strąca konewkę, woda leje się na psa.
17. Fryzjer: groomer suszy psa, kot włącza suszarkę na pełną moc, pies jak puchowa kulka.
18. Wyścig do miski: pies biegnie przez cały dom, kot już je, bo miska stoi przy jego legowisku.
19. Fotel bujany: pies skacze na fotel, kot buja się i pies spada miękko na poduszkę.
20. Finał sezonu: pies buduje "zasadzkę" z poduszek, kot śpi na niej, wynik 20 : 0.

## Diagnostyka

Jeśli kot wychodzi z futrem, dopisz na początku "completely hairless Sphynx cat, no fur at all". Jeśli ruch jest sztuczny albo za szybki, dodaj "realistic animal movement, real-time speed, no slow motion". Jeśli kot nie macha, rozbij zakończenie na osobne ujęcie 3 s tylko z oczkiem i machaniem. Jeśli wygląd przypomina render, dodaj "shot on a phone camera, slight motion blur, imperfect framing" i usuń słowa opisujące efekty. Każdy problem i poprawkę zapisuj w `wiedza/lekcje.md`.
