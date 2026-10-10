---
name: retro
description: "Codzienne retro zespołu agentów. Czyta dziennik dnia, tablicę i lekcje, zamienia błędy w reguły, ulepsza agentów i procedury, zapisuje postęp względem wczoraj. Używaj raz dziennie, na koniec dnia pracy, albo gdy właściciel wpisze /retro."
---

# Retro dnia

Wykonaj kroki po kolei. Wszystko zapisuj w plikach `.md`, na końcu zrób commit i push.

1. Ustal datę dzisiejszą (`date +%F`) i wczorajszą. Przeczytaj `dziennik/<dziś>.md`, `komunikacja/tablica.md`, `wiedza/lekcje.md`, ostatni wpis w `wiedza/postepy.md` oraz `git log --since=yesterday --oneline`.
2. Wypisz błędy i problemy z dziennika i z commitów. Dla każdego sprawdź, czy w `wiedza/lekcje.md` jest już lekcja o tej samej przyczynie. Jeśli jest, zwiększ jej licznik "Powtórzenia". Jeśli nie ma, dopisz nową lekcję na górze.
3. Każdą lekcję z licznikiem 2 lub wyższym przenieś jako regułę do sekcji "Reguły nabyte z doświadczenia" w pliku agenta z pola "Dotyczy" (`.claude/agents/<rola>.md`). Reguła ma datę i tytuł lekcji. Jeśli "Dotyczy" to "wszystkich", dopisz regułę do `CLAUDE.md`.
4. Jeśli dziś jakieś zadanie wykonano drugi raz, a nie ma dla niego procedury, napisz ją w `wiedza/procedury/` i dodaj do spisu w `wiedza/procedury/README.md`.
5. Sprawdź tablicę. Wiadomości otwarte dłużej niż 2 dni wypisz właścicielowi w podsumowaniu.
6. Dopisz wpis na górze `wiedza/postepy.md` według formatu z pliku. Porównaj liczby z wpisem z wczoraj. "Lepiej niż wczoraj" i "Do poprawy jutro" to konkretne zachowania, nie ogólniki.
7. Uzupełnij sekcję "Retro dnia" i "Plan na jutro" w `dziennik/<dziś>.md`.
8. Commit z opisem `retro: <data>` i push na bieżącą gałąź.
9. Odpowiedz właścicielowi krótko: co poprawiono w agentach, które sprawy czekają na jego decyzję.
