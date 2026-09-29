# Polecenie dla lokalnego Claude Code (folder projekty)

To polecenie ustawia agentów tak, jak ustaliliśmy 2026-09-29. Opus 5.5 z effortem high dostają agent-produktowy i porównanie Amazon z Allegro. Pozostali agenci zostają na Sonnecie 5. Na koniec polecenie włącza codzienną kopię na GitHub. Sesja w chmurze wysyła je do sesji Remote Control na komputerze. Możesz je też wkleić ręcznie w `claude` uruchomionym w `C:\Users\User\Desktop\projekty`.

```text
Wprowadź ustalone zmiany modeli w moich agentach. Zasady: nie uruchamiaj agentów ani niczego, co wysyła na Telegram albo handluje (bot-okx). Nie pokazuj i nie kopiuj wartości z plików .env ani innych sekretów. Przed każdą zmianą zapisz kopię zmienianego pliku jako <nazwa>.bak.

1. Przeczytaj, jak uruchamiają się agenci: agent-produktowy, agent-inwestycyjny, agent-coach, agent-yt-radar oraz skrypt porównania Amazon z Allegro (szukaj w folderach i w: schtasks /query /fo LIST /v | findstr /i projekty). Napisz krótko, jak każdy jest wywoływany i jakim modelem.

2. agent-produktowy oraz porównanie Amazon z Allegro mają działać na Opus 5.5 z effortem high:
   - w ich folderze w .claude\settings.json ustaw "model": "claude-opus-5-5" i effort high (nazwę klucza effortu sprawdź w /config swojej wersji);
   - jeśli wywołanie idzie przez "claude -p", dopisz --model claude-opus-5-5;
   - jeśli model jest wpisany na sztywno w skrypcie .py/.ps1/.bat, zamień go na claude-opus-5-5.

3. agent-yt-radar, agent-coach i agent-inwestycyjny mają zostać na claude-sonnet-5. Jeśli któryś z nich nie ma jawnie ustawionego modelu, ustaw mu "model": "claude-sonnet-5" w jego .claude\settings.json, żeby zmiana domyślnego modelu go nie przestawiła.

4. Sprawdź bez uruchamiania pełnego agenta, że ustawienia działają: w folderze agent-produktowy wykonaj claude -p "Podaj tylko nazwę modelu, na którym działasz." --output-format json i pokaż pole z modelem.

5. Kopia na GitHub (tylko jeśli repo https://github.com/jedrzejczakp/claude-kopia istnieje): sklonuj je do %USERPROFILE%\claude-kopia i uruchom skrypty\zainstaluj-kopie.ps1. Pokaż ostatnie 3 linie skrypty\kopia.log. Jeśli skan zgłosi sekret, wypisz tylko ścieżkę pliku (bez wartości) i zaproponuj przeniesienie sekretu do .env.

6. Zrób commit zmian w repozytorium projekty z opisem "Modele: Opus 5.5 dla agent-produktowy i porównania Amazon/Allegro, reszta Sonnet 5".

7. Na koniec wypisz tabelę: agent, model przed, model po, plik, który zmieniłeś. Dopisz, jak cofnąć zmiany (pliki .bak).
```

Wycofanie zmian: przywróć pliki `.bak` albo wykonaj `git revert` ostatniego commitu w repozytorium `projekty`.
