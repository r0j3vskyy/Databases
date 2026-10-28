CREATE DATABASE IF NOT EXISTS wikingowie;
CREATE DATABASE IF NOT EXISTS pracownia;

CREATE TABLE IF NOT EXISTS wikingowie.kreatura (
    idKreatury INT PRIMARY KEY,
    nazwa VARCHAR(50) NOT NULL,
    rodzaj VARCHAR(30) NOT NULL,
    udzwig INT NOT NULL,
    dataUr DATE
);

CREATE TABLE IF NOT EXISTS wikingowie.zasob (
    idZasobu INT PRIMARY KEY,
    nazwa VARCHAR(50) NOT NULL,
    rodzaj VARCHAR(30),
    waga DECIMAL(8,2) NOT NULL,
    ilosc INT NOT NULL,
    dataPozyskania DATE
);

CREATE TABLE IF NOT EXISTS wikingowie.ekwipunek (
    idKreatury INT NOT NULL,
    idZasobu INT NOT NULL,
    ilosc INT NOT NULL,
    PRIMARY KEY (idKreatury, idZasobu)
);

CREATE TABLE IF NOT EXISTS wikingowie.uczestnicy (
    id_wyprawy INT NOT NULL,
    id_uczestnika INT NOT NULL,
    PRIMARY KEY (id_wyprawy, id_uczestnika)
);

CREATE TABLE IF NOT EXISTS wikingowie.etapy_wyprawy (
    idEtapu INT PRIMARY KEY,
    idWyprawy INT NOT NULL,
    sektor INT NOT NULL,
    kolejnosc INT NOT NULL,
    dziennik TEXT
);

CREATE TABLE IF NOT EXISTS wikingowie.sektor (
    id_sektora INT PRIMARY KEY,
    nazwa VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS wikingowie.wyprawa (
    id_wyprawy INT PRIMARY KEY,
    nazwa VARCHAR(80) NOT NULL,
    data_rozpoczecia DATE NOT NULL
);

INSERT INTO wikingowie.kreatura (idKreatury, nazwa, rodzaj, udzwig, dataUr)
VALUES
    (1, 'Bjorn', 'wiking', 80, '1671-03-12'),
    (2, 'Koral', 'wiedzma', 35, '1680-06-01'),
    (3, 'Thor', 'wiking', 65, '1675-08-20'),
    (4, 'Mewa', 'ptak', 10, '2001-07-14'),
    (5, 'Wigor', 'wiking', 55, '1690-02-11'),
    (6, 'Ruda', 'wiedzma', 25, '1668-11-03'),
    (7, 'Borys', 'wiking', 45, '1702-04-25'),
    (8, 'Sokół', 'ptak', 15, '1999-09-30')
ON DUPLICATE KEY UPDATE
    nazwa = VALUES(nazwa), rodzaj = VALUES(rodzaj), udzwig = VALUES(udzwig),
    dataUr = VALUES(dataUr);

INSERT INTO wikingowie.zasob (idZasobu, nazwa, rodzaj, waga, ilosc, dataPozyskania)
VALUES
    (1, 'Banan', 'jedzenie', 1.20, 10, '2003-07-12'),
    (2, 'Miecz', 'bron', 5.00, 2, '2001-08-01'),
    (3, 'Bigos', 'jedzenie', 3.50, 6, '2005-07-21'),
    (4, 'Koc', 'wyposazenie', 2.00, 4, '1999-04-10'),
    (5, 'Os', 'zwierze', 0.10, 8, '2007-08-18'),
    (6, 'Prowiant', 'jedzenie', 4.00, 5, '2010-01-15'),
    (7, 'Bańka', NULL, 6.00, 1, '2004-10-02')
ON DUPLICATE KEY UPDATE
    nazwa = VALUES(nazwa), rodzaj = VALUES(rodzaj), waga = VALUES(waga),
    ilosc = VALUES(ilosc), dataPozyskania = VALUES(dataPozyskania);

INSERT INTO wikingowie.ekwipunek (idKreatury, idZasobu, ilosc)
VALUES
    (1, 1, 3), (1, 2, 1), (3, 3, 2), (3, 4, 1),
    (5, 6, 3), (7, 5, 2), (8, 1, 1)
ON DUPLICATE KEY UPDATE ilosc = VALUES(ilosc);

INSERT INTO wikingowie.sektor (id_sektora, nazwa)
VALUES
    (1, 'Północ'), (2, 'Zatoka'), (7, 'Wyspa Mgły')
ON DUPLICATE KEY UPDATE nazwa = VALUES(nazwa);

INSERT INTO wikingowie.wyprawa (id_wyprawy, nazwa, data_rozpoczecia)
VALUES
    (1, 'Wyprawa Północna', '2020-05-10'),
    (2, 'Rejs przez Zatokę', '2021-08-16')
ON DUPLICATE KEY UPDATE
    nazwa = VALUES(nazwa), data_rozpoczecia = VALUES(data_rozpoczecia);

INSERT INTO wikingowie.uczestnicy (id_wyprawy, id_uczestnika)
VALUES
    (1, 1), (1, 3), (2, 5)
ON DUPLICATE KEY UPDATE id_uczestnika = VALUES(id_uczestnika);

INSERT INTO wikingowie.etapy_wyprawy (idEtapu, idWyprawy, sektor, kolejnosc, dziennik)
VALUES
    (1, 1, 1, 1, 'Wyruszono o świcie.'),
    (2, 1, 7, 2, 'Osiągnięto wyspę i rozbito obóz.'),
    (3, 2, 2, 1, 'Przepłynięto przez zatokę.')
ON DUPLICATE KEY UPDATE
    idWyprawy = VALUES(idWyprawy), sektor = VALUES(sektor),
    kolejnosc = VALUES(kolejnosc), dziennik = VALUES(dziennik);
