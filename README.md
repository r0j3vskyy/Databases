# Bazy danych

Zbiór ćwiczeń z baz danych wykonanych w języku SQL z wykorzystaniem
MySQL. Repozytorium zawiera skrypty tworzące i modyfikujące struktury
baz danych, zapytania `SELECT`, raporty, modele MySQL Workbench oraz
materiały pomocnicze.

## Zawartość

```text
sql/
├── 00-przygotowanie-danych.sql
├── 01-podstawy-i-definicje.sql
├── 02-modyfikacja-struktury.sql
├── 03-select-podstawy.sql
├── 04-agregacje-i-zlaczenia.sql
└── 05-wyprawy-i-raporty.sql
models/
├── baza1.mwb
├── baza2.mwb
├── baza3.mwb
├── baza4.mwb
└── baza5.mwb
docs/
├── lab2_zad1.png
├── lab2_zad2.png
├── zad1.png
├── zad2.png
└── zad3.png
```

### Skrypty SQL

| Plik | Opis |
|---|---|
| `00-przygotowanie-danych.sql` | Tworzy przykładowe schematy `wikingowie` i `pracownia` oraz tabele i dane potrzebne do ćwiczeń 03–05. |
| `01-podstawy-i-definicje.sql` | Tworzy podstawowe tabele, klucze, ograniczenia i dane przykładowe. |
| `02-modyfikacja-struktury.sql` | Modyfikuje struktury tabel, ograniczenia oraz dane. |
| `03-select-podstawy.sql` | Zawiera podstawowe zapytania `SELECT`, filtrowanie, sortowanie i funkcje SQL. |
| `04-agregacje-i-zlaczenia.sql` | Pokazuje agregacje, grupowanie, złączenia i podzapytania. |
| `05-wyprawy-i-raporty.sql` | Zawiera zapytania dotyczące wypraw, uczestników, etapów i zasobów. |

Katalog `models/` zawiera modele baz danych w formacie MySQL Workbench.
Katalog `docs/` zawiera zrzuty ekranów i materiały ilustrujące wybrane
zadania.

## Wymagania

- MySQL 8.0 lub MariaDB;
- MySQL Workbench — opcjonalnie, do otwierania plików `.mwb`;
- klient MySQL lub dowolne narzędzie umożliwiające wykonywanie skryptów SQL.

Skrypty wykorzystują między innymi typ `ENUM`, funkcje dat, `GROUP_CONCAT`
oraz składnię charakterystyczną dla MySQL/MariaDB.

## Uruchamianie

### Ćwiczenia 01–02

Skrypty `01` i `02` tworzą oraz modyfikują bazę używaną w pierwszej części
ćwiczeń. Skrypt `02` zależy od struktur utworzonych przez `01`, dlatego
należy uruchamiać je w podanej kolejności na bazie testowej.

```sql
CREATE DATABASE pracownia_bazy;
USE pracownia_bazy;

SOURCE sql/01-podstawy-i-definicje.sql;
SOURCE sql/02-modyfikacja-struktury.sql;
```

Skrypt `02` wykonuje operacje zmieniające strukturę i dane, dlatego nie
powinien być uruchamiany wielokrotnie na tej samej bazie bez jej
odtworzenia.

### Ćwiczenia 03–05

Skrypt `00-przygotowanie-danych.sql` przygotowuje komplet przykładowych
danych i tabel wymaganych przez kolejne ćwiczenia. Następnie skrypty można
uruchomić w następującej kolejności:

```sql
SOURCE sql/00-przygotowanie-danych.sql;
SOURCE sql/03-select-podstawy.sql;
SOURCE sql/04-agregacje-i-zlaczenia.sql;
SOURCE sql/05-wyprawy-i-raporty.sql;
```

Skrypty `03` i `05` tworzą od nowa tabele robocze w schemacie `pracownia`,
dzięki czemu można je uruchamiać ponownie. Skrypt `04` wykonuje zapytania
na tabelach przygotowanych przez `03`.

## Modele MySQL Workbench

Pliki `.mwb` można otworzyć w programie MySQL Workbench. Modele odpowiadają
kolejnym etapom ćwiczeń i przedstawiają struktury baz danych używane
w skryptach SQL.
