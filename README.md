# Bazy danych

Materiały z ćwiczeń z baz danych w dialekcie MySQL. Repozytorium zawiera
skrypty SQL, modele baz z MySQL Workbench, zrzuty ekranów oraz materiały
pomocnicze.

## Zawartość repozytorium

```text
sql/
├── 01-podstawy-i-definicje.sql
├── 02-modyfikacja-struktury.sql
├── 03-select-podstawy.sql
├── 04-agregacje-i-zlaczenia.sql
└── 05-wyprawy-i-raporty.sql
models/
└── baza1.mwb ... baza5.mwb
docs/
├── lab2_zad1.png
├── lab2_zad2.png
├── zad1.png
├── zad2.png
└── zad3.png
```

`models/` zawiera pliki do otwarcia w MySQL Workbench. Obrazy w `docs/`
prezentują wyniki lub rozwiązania wybranych zadań.

## Zakres skryptów

| Plik | Zakres |
|---|---|
| `sql/01-podstawy-i-definicje.sql` | tworzenie tabel `postac`, `walizka`, `izba`, `przetwory` i `statek` oraz dane przykładowe |
| `sql/02-modyfikacja-struktury.sql` | modyfikowanie tabel, kluczy i ograniczeń oraz operacje na danych |
| `sql/03-select-podstawy.sql` | filtrowanie, sortowanie, funkcje agregujące i podstawowe zapytania `SELECT` |
| `sql/04-agregacje-i-zlaczenia.sql` | agregacje, grupowanie, złączenia i podzapytania |
| `sql/05-wyprawy-i-raporty.sql` | raporty dotyczące wypraw, uczestników, etapów i zasobów |

## Wymagania

- MySQL 8.0 lub MariaDB z obsługą użytych typów `ENUM`, funkcji dat i
  `GROUP_CONCAT`;
- MySQL Workbench — tylko do otwierania plików `.mwb`;
- opcjonalnie dowolny edytor SQL.

## Uruchamianie

Skrypty `01` i `02` są ćwiczeniami wykonywanymi etapami. Uruchamiaj je
w tej kolejności na testowej bazie danych, ponieważ skrypt `02` modyfikuje
strukturę utworzoną przez `01` i nie jest przeznaczony do wielokrotnego
uruchamiania bez odtworzenia bazy.

Przykład z klienta MySQL:

```sql
CREATE DATABASE pracownia_bazy;
USE pracownia_bazy;
SOURCE sql/01-podstawy-i-definicje.sql;
SOURCE sql/02-modyfikacja-struktury.sql;
```

Skrypty `03`–`05` korzystają dodatkowo z istniejących schematów
`wikingowie` i `pracownia` oraz tabel takich jak `kreatura`, `zasob`,
`ekwipunek`, `uczestnicy`, `etapy_wyprawy`, `sektor` i `wyprawa`.
Ich definicje nie znajdują się w tym repozytorium, dlatego przed
uruchomieniem trzeba przygotować te schematy we własnym środowisku.

## Walidacja przed publikacją

- pliki SQL zostały sprawdzone pod kątem ścieżek lokalnych, danych
  uwierzytelniających i odwołań do nieistniejących katalogów;
- skrypty `01`–`02` mają zależności między kolejnymi zadaniami i należy je
  testować na kopii bazy;
- skryptów `03`–`05` nie można zweryfikować jako samodzielnych bez
  dostarczenia schematów `wikingowie` i `pracownia`;
- pliki `.mwb`, obrazy i materiały PDF są plikami pomocniczymi i nie
  wymagają kompilacji;
- przed wysłaniem zmian warto wykonać `git diff --check` oraz upewnić się,
  że pliki prywatne i dane dostępowe pozostają poza repozytorium.

Pliki tymczasowe, ustawienia edytora i lokalne dane z katalogu
`archive/private/` są wykluczone przez `.gitignore`.
