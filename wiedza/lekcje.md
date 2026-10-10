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

## 2026-10-10, rola: system
Co się stało: Firma startuje bez wspólnej pamięci, więc agenci w każdej sesji zaczynali od zera.
Przyczyna: Wiedza zostawała w rozmowach, a nie w plikach.
Reguła na przyszłość: Każdy wynik pracy, decyzja i błąd trafia do pliku `.md` w repozytorium i do commita w tej samej sesji.
Dotyczy: wszystkich
Powtórzenia: 1
