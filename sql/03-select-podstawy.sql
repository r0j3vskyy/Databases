ZADANIE 1

CREATE TABLE pracownia.kreatura AS SELECT * FROM wikingowie.kreatura;
CREATE TABLE pracownia.zasob AS SELECT * FROM wikingowie.zasob;
CREATE TABLE pracownia.ekwipunek AS SELECT * FROM wikingowie.ekwipunek;

SELECT * FROM zasob;
SELECT * FROM zasob WHERE rodzaj='jedzenie';
SELECT * FROM zasob, kreatura WHERE kreatura.idKreatury IN (1,3,5);


ZADANIE 2

SELECT * FROM kreatura WHERE rodzaj !='wiedzma' AND udzwig>50;
SELECT * FROM zasob WHERE waga BETWEEN 2 AND 5;
SELECT * FROM kreatura WHERE nazwa LIKE '%or%' AND udzwig BETWEEN 30 AND 70;


ZADANIE 3

SELECT * FROM zasob WHERE MONTH(dataPozyskania) IN (7,8);
SELECT * FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC;
SELECT * FROM kreatura WHERE dataUr IS NOT NULL ORDER BY dataUr ASC LIMIT 5;


ZADANIE 4

SELECT DISTINCT rodzaj FROM zasob;
SELECT CONCAT(nazwa, ' - ', rodzaj) FROM kreatura WHERE rodzaj LIKE 'wi%';
SELECT *, (ilosc*waga) AS waga_calkowita FROM zasob WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;


ZADANIE 5

SELECT nazwa, waga, ilosc, (waga*0.3) AS waga_odpad, (waga - waga*0.3) AS masa_netto FROM zasob WHERE rodzaj='jedzenie';
SELECT * FROM zasob WHERE rodzaj IS NULL;
SELECT DISTINCT rodzaj, nazwa FROM zasob WHERE nazwa LIKE 'Ba%' OR nazwa LIKE '%os' ORDER BY nazwa ASC;
