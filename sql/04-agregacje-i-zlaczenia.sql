ZADANIE 1

USE pracownia;

SELECT AVG(waga) as srednia_waga FROM kreatura WHERE rodzaj='wiking';
SELECT AVG(waga) as srednia_waga, rodzaj FROM kreatura GROUP BY rodzaj;
SELECT AVG((2024-(YEAR(dataUr)))) as sredni_wiek, rodzaj FROM kreatura GROUP BY rodzaj;


ZADANIE 2

SELECT SUM(ilosc*waga) as waga_wspolna, rodzaj FROM zasob GROUP BY rodzaj;
SELECT AVG(waga) AS sr_waga, nazwa FROM zasob WHERE ilosc>= 4 GROUP BY nazwa HAVING SUM(waga)>10;
SELECT rodzaj, COUNT(nazwa) as ilerazy FROM zasob GROUP BY rodzaj HAVING MIN(ilosc) > 1;


ZADANIE 3

SELECT kreatura.nazwa, SUM(ekwipunek.ilosc) as suma FROM kreatura INNER JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury GROUP BY kreatura.nazwa;

SELECT kreatura.nazwa, GROUP_CONCAT(zasob.nazwa SEPARATOR ', ') as przedmioty FROM ekwipunek INNER JOIN zasob ON zasob.idZasobu=ekwipunek.idZasobu INNER JOIN kreatura ON kreatura.idKreatury=ekwipunek.idKreatury GROUP BY kreatura.nazwa;

SELECT kreatura.nazwa FROM kreatura LEFT JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury WHERE ekwipunek.idKreatury IS NULL;


ZADANIE 4

SELECT kreatura.nazwa, GROUP_CONCAT(zasob.nazwa SEPARATOR ', ') FROM kreatura INNER JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury INNER JOIN zasob ON ekwipunek.idZasobu=zasob.idZasobu WHERE (kreatura.rodzaj = 'wiking') AND (kreatura.dataUr BETWEEN '1670-01-01' AND '1679-12-31') GROUP BY kreatura.nazwa;

SELECT kreatura.nazwa FROM kreatura INNER JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury INNER JOIN zasob ON ekwipunek.idZasobu=zasob.idZasobu WHERE zasob.rodzaj = 'jedzenie' ORDER BY kreatura.dataUr DESC LIMIT 5;

SELECT CONCAT(k1.nazwa, ' - ', k2.nazwa) as ParyKreatur FROM kreatura k1 JOIN kreatura k2 ON ABS(k1.idKreatury - k2.idKreatury) = 5;


ZADANIE 5

SELECT AVG(z.waga), k.rodzaj FROM kreatura k INNER JOIN ekwipunek e ON k.idKreatury=e.idKreatury INNER JOIN zasob z ON e.idZasobu=z.idZasobu AND e.ilosc<30 WHERE k.rodzaj != 'waz' AND k.rodzaj != 'malpa' GROUP BY k.rodzaj;

SELECT rodzaj,
    CONCAT((SELECT nazwa FROM kreatura k1 WHERE k1.rodzaj = k.rodzaj ORDER BY k1.dataur ASC LIMIT 1), ' - ', (SELECT dataur FROM kreatura k1 WHERE k1.rodzaj = k.rodzaj ORDER BY k1.dataur ASC LIMIT 1)) AS Najstarsza,
    CONCAT((SELECT nazwa FROM kreatura k2 WHERE k2.rodzaj = k.rodzaj ORDER BY k2.dataur DESC LIMIT 1), ' - ', (SELECT dataur FROM kreatura k2 WHERE k2.rodzaj = k.rodzaj ORDER BY k2.dataur DESC LIMIT 1)) AS Najmlodsza
FROM kreatura k GROUP BY rodzaj;
