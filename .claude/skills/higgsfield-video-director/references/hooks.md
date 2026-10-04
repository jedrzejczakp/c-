# Hooki: źródła wiedzy i bank wzorców

## Skąd brać wiedzę

Kolejność sprawdzania:

1. Vault Obsidian użytkownika. Sprawdź zmienną `OBSIDIAN_VAULT`, potem katalogi `~/Obsidian`, `~/Documents/Obsidian`, `~/obsidian` i folder `obsidian/` w repozytorium. Przeszukaj notatki: `grep -ril -e "hook" -e "haczyk" -e "pierwsze 3 sekundy" <vault>`. Czytaj całe notatki, które trafią, i cytuj nazwę notatki przy każdym pomyśle, który z niej bierzesz.
2. Folder `video-library/hooks-obsidian/` w tym repozytorium. To miejsce, do którego użytkownik może skopiować notatki z Obsidiana, gdy sesja działa w chmurze i nie widzi jego komputera.
3. Bank wzorców poniżej.
4. Na prośbę użytkownika: subagent (narzędzie Agent), który analizuje wskazane filmy referencyjne skillem `watch` albo `dekoder-ugc` i wyciąga z nich mechanizm hooka.

Jeśli żadnego z punktów 1 i 2 nie ma, napisz to wprost jednym zdaniem i pracuj na banku.

## Zasady dobrego hooka wideo

Kolejność ważności, gdy oceniasz hook:

1. Ruch albo zdarzenie w pierwszej sekundzie. Zatrzymuje kciuk szybciej niż słowa.
2. Emocja widoczna na twarzy (szok, zachwyt, obrzydzenie). Widz odruchowo chce wiedzieć, co ją wywołało.
3. Luka ciekawości: film pokazuje reakcję albo zakryty przedmiot, a przyczynę dopiero później.
4. Wyraźny związek z problemem widza, żeby obejrzał z właściwego powodu i nie odpadł w 3 sekundzie.

Pierwsza klatka ma już coś pokazywać. Nie zaczynasz od wejścia postaci w kadr ani od pustego tła.

Obraz, tekst na ekranie i kwestia mówiona w pierwszej sekundzie mówią to samo albo się uzupełniają. Tekst dodajesz w montażu, nie w generacji, bo modele psują litery.

Hook zapowiada coś, co film później naprawdę pokazuje. Hook bez pokrycia obniża czas oglądania, a to szkodzi zasięgom bardziej niż słaby hook.

Jeden hook to jedna zmienna w split teście. Pozostałe klipy filmu zostają te same.

## Bank wzorców

Każdy wzorzec ma przykład dla mydła do włosów (szampon w kostce).

### Przerwanie wzorca (pattern interrupt)
Nagły ruch albo zdarzenie fizyczne w pierwszej sekundzie: upadek, rzut, zgniecenie, rozlanie.
Przykład: plastikowa butelka szamponu wylatuje z ręki i uderza o podłogę łazienki, kamera nie drgnie. Tekst: "Wyrzuciłam szampon na zawsze".

### Odsłonięcie z odliczaniem
Ukryty produkt i obietnica pokazania. Format `321-cloth-reveal`.
Przykład: kostka pod ściereczką na umywalce, "Trzy, dwa, jeden".

### Reakcja w sklepie (point and pan)
Zszokowana osoba wskazuje coś poza kadrem. Format `store-point-pan-reveal`.
Przykład: gasp w alejce drogerii, panorama na półkę z kostkami mydła.

### Wynik najpierw
Zaczynasz od efektu, dopiero potem pokazujesz, jak do niego doszło.
Przykład: zbliżenie na suche, błyszczące włosy w świetle okna. Tekst: "Bez szamponu od 30 dni".

### Wywołanie problemu
Nazywasz problem widza w pierwszych słowach.
Przykład: "Jeśli twoje włosy są tłuste już drugiego dnia, posłuchaj".

### Sprzeciw wobec powszechnej opinii
Teza, z którą widz chce się kłócić.
Przykład: "Twój szampon to w 80 procentach woda i płacisz za plastik". Liczbę podajesz tylko wtedy, gdy masz źródło (np. skład INCI konkretnego produktu).

### POV
Widz wchodzi w sytuację.
Przykład: "POV: twoja łazienka po wyrzuceniu wszystkich butelek".

### Ostrzeżenie
"Nie kupuj X, zanim nie zobaczysz Y".
Przykład: "Nie kupuj kolejnego szamponu, zanim nie zobaczysz tej kostki".

### Test na żywo
Obietnica sprawdzenia czegoś na oczach widza.
Przykład: kostka wrzucona do szklanki wody, "Sprawdzam, czy rozpuści się szybciej niż szampon".

## Format odpowiedzi z hookami

Dla każdego wariantu podaj: kategorię, opis pierwszej sekundy obrazu, tekst na ekranie, kwestię mówioną, silnik i źródło (nazwa notatki z Obsidiana albo "bank wzorców"). Na końcu poleć jeden wariant i napisz, dlaczego pasuje do tego produktu.
