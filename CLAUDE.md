# Zasady pracy dla wszystkich agentów

Ten plik czyta każdy agent i każda sesja Claude w tym repozytorium. Obowiązuje od 2026-10-10, od dnia startu biznesu.

## Pamięć firmy jest w plikach Markdown

Agent nie pamięta niczego między sesjami. Pamięta repozytorium. Dlatego każdą wiedzę, decyzję, błąd i wiadomość zapisujesz w plikach `.md` i commitujesz. Czego nie ma w pliku, tego firma nie wie.

| Plik lub katalog | Co w nim jest |
|---|---|
| `wiedza/biznes.md` | Czym zajmuje się firma, klienci, oferta, cele |
| `wiedza/lekcje.md` | Błędy i wnioski z nich, najnowsze na górze |
| `wiedza/decyzje.md` | Podjęte decyzje z uzasadnieniem i datą |
| `wiedza/procedury/` | Sprawdzone sposoby wykonania powtarzalnych zadań |
| `komunikacja/tablica.md` | Wiadomości między agentami |
| `dziennik/RRRR-MM-DD.md` | Dziennik dnia: co zrobiono, co poszło źle, plan na jutro |
| `.claude/agents/` | Definicje agentów (role zespołu) |

## Przed rozpoczęciem zadania

1. Przeczytaj `wiedza/biznes.md`, żeby wiedzieć, dla kogo pracujesz.
2. Przeczytaj `wiedza/lekcje.md` i sprawdź, czy jakaś lekcja dotyczy Twojego zadania. Jeśli tak, zastosuj ją i napisz w dzienniku, którą lekcję wykorzystałeś.
3. Sprawdź w `wiedza/procedury/`, czy istnieje procedura dla tego zadania. Jeśli istnieje, trzymaj się jej.
4. Przeczytaj w `komunikacja/tablica.md` wiadomości skierowane do Twojej roli lub do wszystkich.

## W trakcie pracy

Gdy potrzebujesz czegoś od innej roli, zostaw wiadomość na tablicy (format opisany w pliku tablicy). Nie zgaduj za innego agenta. Gdy odpowiedź jest potrzebna od razu, a pracujesz jako agent główny, uruchom tego agenta przez narzędzie Agent i przekaż mu kontekst.

Gdy coś się nie uda (błąd w kodzie, zła decyzja, poprawka od właściciela), od razu dopisz lekcję do `wiedza/lekcje.md`. Lekcja ma przyczynę i konkretną regułę na przyszłość. Zdanie "następnym razem uważać" nie jest lekcją.

## Po zakończeniu zadania

1. Dopisz wpis do dziennika dnia `dziennik/RRRR-MM-DD.md` (hook startowy tworzy go z szablonu).
2. Jeśli zadanie powtórzy się w przyszłości, zapisz lub popraw procedurę w `wiedza/procedury/`.
3. Jeśli podjąłeś decyzję, której ktoś może później nie rozumieć, zapisz ją w `wiedza/decyzje.md`.
4. Odpowiedz na wiadomości z tablicy, które załatwiłeś, i oznacz je jako zamknięte.
5. Zrób commit z opisem, co zmieniłeś.

## Codzienne doskonalenie

Raz dziennie ktoś uruchamia `/retro` (właściciel albo zaplanowana rutyna). Retro czyta dziennik dnia, wyciąga lekcje, poprawia procedury i definicje agentów, a w `wiedza/postepy.md` zapisuje, co dziś działało lepiej niż wczoraj. Agent, który dwa razy popełnił ten sam błąd, dostaje regułę wpisaną bezpośrednio do swojej definicji w `.claude/agents/`.

## Styl zapisu

Piszesz po polsku, zdaniami ciągłymi, konkretnie. Nie używasz długich myślników. Każdy wpis ma datę w formacie RRRR-MM-DD i nazwę roli autora. Nie kasujesz starych wpisów w lekcjach i decyzjach: jeśli coś przestało obowiązywać, dopisujesz "Nieaktualne od RRRR-MM-DD, powód: ...".
