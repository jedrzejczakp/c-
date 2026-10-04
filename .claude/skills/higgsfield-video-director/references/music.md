# Muzyka do filmów

## Gdzie muzyka trafia do filmu

Higgsfield generuje dźwięk sceny (kroki, gasp, upadek, głos). Muzykę dokładasz w montażu albo w aplikacji platformy przy publikacji, nie w generacji. Dlatego w promptach z muzyką w tle i tak piszesz "no music, no background score": jeden czysty dźwięk sceny da się potem podłożyć pod dowolny trend, a muzyka wygenerowana przez model jest zszyta z obrazem i nie da się jej wymienić.

## Licencja: sprawdzasz zawsze, zanim zaproponujesz utwór

Utwór z listy przebojów można użyć zgodnie z licencją tylko w części przypadków. Przed propozycją pytasz (albo bierzesz z briefu):

1. Konto prywatne czy firmowe (TikTok Business, konto firmowe na Instagramie)?
2. Film organiczny czy reklama płatna?

Zasady:

- Konto prywatne, film organiczny: możesz proponować utwory z listy trendów platformy, dodawane w aplikacji z jej biblioteki dźwięków.
- Konto firmowe albo reklama płatna: tylko utwory z biblioteki komercyjnej platformy (na TikToku Commercial Music Library, w Creative Center filtr "Approved for business use") albo muzyka z licencją (np. biblioteki royalty free, na które użytkownik ma subskrypcję).
- Plik audio popularnego utworu wgrany do montażu poza aplikacją grozi wyciszeniem filmu albo blokadą. Takiej drogi nie proponujesz.

Jeśli nie wiesz, jakie konto ma użytkownik, każdą propozycję oznaczasz: "tylko konto prywatne" albo "dozwolone dla firm".

## Skąd brać dane o trendach

Kolejność:

1. TikTok Creative Center, zakładka popularnej muzyki: `https://ads.tiktok.com/business/creativecenter/inspiration/popular/music/pc/en`. Ustawiasz kraj z briefu i okres (7, 30 albo 120 dni). Strona renderuje się w JavaScripcie, więc pobranie jej narzędziem może się nie udać. Wtedy próbujesz przeglądarki (skille `built-in-browser` albo `chrome-browser`), a gdy jej nie ma, prosisz użytkownika o zrzut ekranu listy.
2. Wyszukiwanie w sieci (WebSearch) z datą i niszą, np. "trending TikTok sounds [nisza] [miesiąc rok]", oraz listy Spotify Viral 50 dla kraju z briefu.
3. Instagram Reels: dźwięki oznaczone strzałką trendu w aplikacji. Tych danych nie pobierzesz sam, prosisz użytkownika o nazwy albo zrzut ekranu.
4. Dane z lat poprzednich z `video-library/music-calendar.md`, gdy film dotyczy sezonu, a obecne dane jeszcze nie pokazują trendu (sezonowe utwory zaczynają rosnąć zwykle na kilka tygodni przed świętem).

Przy każdej propozycji podajesz źródło i datę sprawdzenia. Nie podajesz utworu jako trendującego bez źródła. Gdy nie masz danych, piszesz to wprost i proponujesz sprawdzenie.

## Jak dobierasz utwór

1. Nastrój pasuje do hooka: szok i odsłonięcie potrzebują wyraźnego uderzenia (drop), spokojne CTA potrzebuje tła bez wokalu w miejscu kwestii mówionej.
2. Moment uderzenia w muzyce wypada na moment odsłonięcia albo panoramy. W storyboardzie podajesz sekundę utworu, od której ma startować film.
3. Wokal nie zagłusza kwestii mówionej. Przy filmie z mową proponujesz wersję instrumentalną albo fragment bez śpiewu i ściszenie muzyki pod głosem.
4. Utwór pasuje do niszy i grupy wiekowej z briefu.
5. Dajesz 3 propozycje: najmocniejszy trend, bezpieczny wybór dla firm i jeden zapasowy. Polecasz jeden.

Każdy użyty utwór wpisujesz do kolumny "Muzyka" w `video-library/test-log.md`. Po kilku filmach widać, które dźwięki dają lepszy czas oglądania w danej niszy.
