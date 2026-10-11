# Lekcje z błędów

Najnowsze wpisy dopisuj na górze listy, pod tą instrukcją. Każdy agent czyta ten plik przed zadaniem.

Format wpisu:

```
## RRRR-MM-DD, rola: <nazwa agenta>
Co się stało: <fakt>
Przyczyna: <dlaczego>
Reguła na przyszłość: <konkretne zachowanie, które da się sprawdzić>
Dotyczy: <role lub typy zadań>
Powtórzenia: 1
```

Gdy ten sam błąd wraca, zwiększ licznik "Powtórzenia" w istniejącym wpisie zamiast dodawać nowy. Retro przenosi regułę z licznikiem 2 lub wyższym do definicji agenta.

---

## 2026-10-11, rola: marketing
Co się stało: Pierwsza wersja promptów "Hrabia vs Pikuś" była kreskówkowa (styl 3D), działa się w jednym mieszkaniu, a pies był biernym celem psikusów. Właściciel odrzucił ją tego samego dnia.
Przyczyna: Marketing nie zapytał o styl wizualny i dynamikę postaci, tylko założył styl animacji. Nie użył skilli do hooków i wideo (kreator-ugc).
Reguła na przyszłość: Przed pisaniem promptów wideo sprawdź procedurę `wiedza/procedury/prompty-wideo-seedance.md`. Domyślny styl to realistyczne nagranie z telefonu. W serii Hrabia vs Pikuś pies zawsze atakuje pierwszy, leniwy kot zawsze wygrywa, każdy odcinek ma inną scenerię.
Dotyczy: marketing
Powtórzenia: 1

## 2026-10-10, rola: system
Co się stało: Firma startuje bez wspólnej pamięci, więc agenci w każdej sesji zaczynali od zera.
Przyczyna: Wiedza zostawała w rozmowach, a nie w plikach.
Reguła na przyszłość: Każdy wynik pracy, decyzja i błąd trafia do pliku `.md` w repozytorium i do commita w tej samej sesji.
Dotyczy: wszystkich
Powtórzenia: 1
