ZADANIE 1

INSERT INTO pracownia.kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE pracownia.uczestnicy AS SELECT * FROM wikingowie.uczestnicy;
CREATE TABLE pracownia.etapy_wyprawy AS SELECT * FROM wikingowie.etapy_wyprawy;
CREATE TABLE pracownia.sektor AS SELECT * FROM wikingowie.sektor;
CREATE TABLE pracownia.wyprawa AS SELECT * FROM wikingowie.wyprawa;

SELECT kreatura.nazwa FROM kreatura LEFT JOIN uczestnicy ON uczestnicy.id_uczestnika=kreatura.idKreatury WHERE uczestnicy.id_uczestnika IS NULL;

SELECT wyprawa.nazwa, SUM(ekwipunek.ilosc) FROM wyprawa INNER JOIN uczestnicy ON uczestnicy.id_wyprawy=wyprawa.id_wyprawy INNER JOIN kreatura ON uczestnicy.id_uczestnika=kreatura.idKreatury INNER JOIN ekwipunek ON ekwipunek.idKreatury=kreatura.idKreatury GROUP BY wyprawa.nazwa;


ZADANIE 2

SELECT wyprawa.nazwa, COUNT(kreatura.nazwa) AS ilosc_uczestnikow, GROUP_CONCAT(kreatura.nazwa SEPARATOR ', ') FROM wyprawa INNER JOIN uczestnicy ON wyprawa.id_wyprawy=uczestnicy.id_wyprawy INNER JOIN kreatura ON kreatura.idKreatury=uczestnicy.id_uczestnika GROUP BY wyprawa.nazwa;

SELECT wyprawa.nazwa, etapy_wyprawy.idEtapu, wyprawa.data_rozpoczecia, sektor.nazwa FROM wyprawa INNER JOIN etapy_wyprawy ON wyprawa.id_wyprawy=etapy_wyprawy.idWyprawy INNER JOIN sektor ON sektor.id_sektora=etapy_wyprawy.sektor ORDER BY wyprawa.data_rozpoczecia, etapy_wyprawy.kolejnosc;


ZADANIE 3

SELECT s.nazwa, COUNT(e.sektor) AS ilosc FROM etapy_wyprawy e RIGHT JOIN sektor s ON s.id_sektora=e.sektor GROUP BY s.nazwa;

SELECT k.nazwa, CASE WHEN COUNT(u.id_wyprawy) > 0 THEN 'bral udzial w wyprawie' ELSE 'nie bral udzialu w wyprawie' END AS status FROM kreatura k LEFT JOIN uczestnicy u ON u.id_uczestnika=k.idKreatury GROUP BY k.nazwa;


ZADANIE 4

SELECT w.nazwa, SUM(length(e.dziennik)) AS dlugosc FROM etapy_wyprawy e LEFT JOIN wyprawa w ON w.id_wyprawy=e.idWyprawy GROUP BY w.nazwa HAVING (dlugosc)<400;

SELECT w.nazwa, AVG(z.waga*z.ilosc)/COUNT(DISTINCT u.id_uczestnika) AS sr_waga FROM wyprawa w JOIN uczestnicy u ON w.id_wyprawy=u.id_wyprawy JOIN ekwipunek e ON u.id_uczestnika=e.idKreatury JOIN zasob z ON e.idZasobu=z.idZasobu GROUP BY w.id_wyprawy, w.nazwa;


ZADANIE 5

SELECT w.nazwa, CONCAT(k.nazwa) AS imie, DATEDIFF(w.data_rozpoczecia, k.dataUr) AS wiek FROM wyprawa w INNER JOIN uczestnicy u ON w.id_wyprawy=u.id_wyprawy INNER JOIN kreatura k ON k.idKreatury=u.id_uczestnika INNER JOIN etapy_wyprawy e ON w.id_wyprawy=e.idWyprawy WHERE e.sektor=7 GROUP BY w.nazwa, k.nazwa, wiek;