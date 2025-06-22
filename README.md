# Warsztaty Looker: Analiza danych pogodowych z NOAA GSOD
<b>Czas trwania</b>: 90 minut <br>
<b>Cel</b>: W trakcie tych warsztatów uczestnicy nauczą się tworzyć obiekty w LookML, eksplorować dane,budować interaktywne dashboardy oraz konfigurować udostępnianie i automatyzację raportowania w Lookerze.
Wykorzystamy publiczny zbiór danych pogodowych NOAA Global Historical Climatology Network Daily (GSOD) dostępny w Google BigQuery, aby przeanalizować trendy pogodowe. <br>
<b>Zbiór danych</b>: `bigquery-public-data.ghcn_d.ghcnd_2025` i `bigquery-public-data.ghcn_d.ghcnd_stations`

---
## Zadanie 1. Tworzenie warstwy semantycznej
Zadanie rozpoczniemy od stworzenia modelu danych dla zbioru NOAA GSOD, koncentrując się na podstawowych informacjach o stacjach pogodowych i dziennych pomiarach.
- Zaloguj się do portalu [Looker](https://datumo.cloud.looker.com/browse) i w menu głównym włącz tryp deweloperski. Wybierz zakładkę `Develop` i projekt `datumo-training`.
- w IDE utwórz foldery `views`, `explores`, `dashboards` i `models`.
- W folderze `models` utwórz plik `datumo-training`. Zdefiniuj w nim `connection` jako `"datumo-training"`.
- w folderze `views` utwórz widok `weather_stations` na podstawie tabeli `bigquery-public-data.ghcn_d.ghcnd_stations`.
- Określ wymiary `id`, `name`, `location`, `elevation`, `state`. Dla każdego wymiaru określ jego typ (`type` i pole `sql`).
- Wymiar `id` oznacz jako klucz główny i ukryj, by nie był widoczny do eksploracji.
- Zdefiniuj miarę `count`.
- Dodaj `description` do wszsytkich wymiarów i metryk.
- Utwórz widok `weather_measurements` na podstawie tabeli `bigquery-public-data.ghcn_d.ghcnd_2025`.
- Określ wymiary `id`, `primary_key` (jako konkatenacja `id` i `created_date`, oznacz jako klucz główny i ukryj wymiar).
- Określ `dimension_group` o nazwie `created`, sql `parse_timestamp("%Y-%m-%d%H%M",concat(date,case when time = '2400' then '0000' else time end))` i typie `time`. Zdefiniuj listę dostępnych agregacji daty w `timeframes`.
- Określ wymiary `element` i `value` i je ukryj.
- Zdefiniuj miary `count`, `total_precipitation`, `max_temperature`, i `min_temperature`. Każdą z nich podziel przez 10. Dla każdej dobierz odpowiedni `type`. Zastosuj pole `filters` aby agregować jedynie pożądane elementy.
- Dodaj `description` do wszsytkich wymiarów i metryk.
- W folderze `explores` utwórz plik `weather`. Wskaź w nim opracowane widoki (`include`). Utwórz explore i połącz widoki ze sobą (dla `join` określ `type`, `relationship` i `sql_on`). Opisz explore w `description`.
- W pliku `datumo-training.model` dodaj opracowany explore (`include`).

---
## Zadanie 2. Self-service BI
Wykorzystaj nowo utworzoną eksplorację do zadawania pytań biznesowych i tworzenia dashboardów.
- Wejdź w tryb `Explore`.
- W stworzonej exploracji znajdź maksymalną i minimalną temperaturę dla stacji `ABERDEEN` dla każdego miesiąca. Zwizualizuj rezultaty na wykresie liniowym.
- Zidentyfikuj 5 dni z największymi opadami dla stacji `ABERDEEN` . Zwizualizuj rezultaty w formie tabeli.

---
## Zadanie 3. Tworzenie warstwy wizualnej
Stwórz interaktywny dashboard przedstawiający kluczowe wskaźniki pogodowe.
- Look 1 (Wykres liniowy): Dzienne temperatury maksymalne dla stanu Kalifornia (`CA`). Nazwij Look.
- Look 2 (Wykres kolumnowy): Suma miesięcznych opadów dla stanu Kalifornia (`CA`). Nazwij Look.
- Look 3 (Mapa): Maksymalna temperatura dla stanu Kalifornia (`CA`) według lokalizacji . Nazwij Look.
- Dodaj filtr `State` jako single value, który będzie filtrował wszystkie Looki w dashboardzie.
- Ustaw filtr na `NY` i zapisz dashboard.
- Wybierz opcję `Get LookML`, skopiuj kod dashboardu i utwórz dashboard LookML w folderze `dashbaords`. W pliku `datumo-training.model` dodaj dashboard za pomocą `include`.
- Zobacz zapisany dashboard w folderze `LookML dashboards`.
- Dodaj commit ze zmianami w repozytorium do swojego personalnego brancha.
