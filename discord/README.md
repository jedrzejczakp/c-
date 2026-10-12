# Wiedza z Discorda

## Krok 1: eksport

1. Pobierz DiscordChatExporter: https://github.com/Tyrrrz/DiscordChatExporter/releases
2. Zaloguj się w nim tokenem bota albo własnym tokenem konta.
3. Zaznacz kanały, z których chcesz notatki. Format: **JSON**.
4. Wrzuć pliki `.json` do `discord/export/` i wypchnij je na gałąź.

Kanały z samymi memami albo powitaniami możesz pominąć, bo nic nie wniosą.

## Krok 2: konwersja

```
python3 discord/konwertuj.py
```

Skrypt zapisze każdy kanał jako `discord/surowe/<kategoria>/<kanał>.md`. Pomija wiadomości botów i systemowe, łączy kolejne wiadomości jednej osoby, oznacza przypięte wiadomości, odpowiedzi i posty z co najmniej 3 reakcjami.

## Krok 3: notatki

Claude czyta pliki z `surowe/` i pisze notatki tematyczne do `discord/notatki/`:

- `00-indeks.md`: spis tematów z linkami,
- jeden plik na temat (zasady, porady, narzędzia, decyzje, FAQ), z datą i kanałem źródłowym przy każdym fakcie,
- `linki.md`: zebrane linki i zasoby.
