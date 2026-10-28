ZADANIE 1
CREATE TABLE postac (id_postaci int AUTO_INCREMENT, nazwa varchar(40), rodzaj ENUM('wiking', 'ptak', 'kobieta'), data_ur date, wiek int unsigned, PRIMARY KEY (id_postaci));
INSERT INTO postac VALUES (1, 'Bjorn', 'wiking', '1975-02-15', 49);
 INSERT INTO postac VALUES (2, 'Drozd', 'ptak', '2020-01-11', 4);
 INSERT INTO postac VALUES (3, 'Tesciowa', 'kobieta', '1900-05-25', 124);
UPDATE postac SET wiek=88 WHERE nazwa='Tesciowa';

ZADANIE 2

CREATE TABLE walizka (id_walizki int AUTO_INCREMENT, pojemnosc int unsigned, kolor ENUM('rozowy', 'czerwony', 'teczowy', 'zolty'),id_wlasciciela int, PRIMARY KEY (id_walizki), FOREIGN KEY (id_wlasciciela) REFERENCES postac(id_postaci));

ALTER TABLE walizka ALTER kolor SET DEFAULT 'rozowy';
INSERT INTO walizka VALUES (1, 50, 'czerwony', 1);
INSERT INTO walizka VALUES (2, 120, 'rozowy', 3);

ZADANIE 3

CREATE TABLE izba (adres_budynku varchar(40) NOT NULL, nazwa_izby varchar(50) NOT NULL, metraz int unsigned, wlasciciel int, PRIMARY KEY (adres_budynku, nazwa_izby), FOREIGN KEY (wlasciciel) REFERENCES postac(id_postaci) ON DELETE SET NULL);

ALTER TABLE izba ADD COLUMN kolor_izby varchar(20) DEFAULT 'czarny' AFTER metraz;

INSERT INTO izba (adres_budynku, nazwa_izby, metraz, wlasciciel, kolor_izby)
VALUES ('Piaskowa 14a', 'Spizarnia', 127, 1, 'rozowy');

ZADANIE 4

CREATE TABLE przetwory (id_przetworu int AUTO_INCREMENT, rok_produkcji smallint DEFAULT 1654, id_wykonawcy int, zawartosc varchar(100), dodatek varchar(100) DEFAULT 'papryczka czili', id_konsumenta int, PRIMARY KEY (id_przetworu), FOREIGN KEY (id_wykonawcy) REFERENCES postac(id_postaci), FOREIGN KEY (id_konsumenta) REFERENCES postac(id_postaci));

INSERT INTO przetwory VALUES (1, 2015, 1, 'bigos', 'papryczka czili', 1);

ZADANIE 5

INSERT INTO postac VALUES (4, 'Koko', 'wiking', '2000-01-25', 24);
INSERT INTO postac VALUES (5, 'Omen', 'wiking', '1980-01-25', 44);
INSERT INTO postac VALUES (6, 'Einhar', 'wiking', '1995-03-16', 29);
INSERT INTO postac VALUES (7, 'Rambo', 'wiking', '2001-02-14', 23);
INSERT INTO postac VALUES (8, 'Pimpek', 'wiking', '1998-07-24', 26);
CREATE TABLE statek (nazwa_statku varchar(100) PRIMARY KEY, rodzaj_statku ENUM('maly', 'sredni', 'duzy'), data_wodowania DATE, max_ladownosc int unsigned);
INSERT INTO statek VALUES ('Biala Mewa', 'sredni', '2015-02-15', 5000);
INSERT INTO statek VALUES ('Szybki Bill', 'maly', '2014-07-21', 1500);
ALTER TABLE postac ADD COLUMN funkcja varchar(50);
UPDATE postac SET funkcja = 'kapitan' WHERE nazwa = 'Bjorn';
ALTER TABLE postac ADD statek_id varchar(50), ADD CONSTRAINT fk_statek_postac FOREIGN KEY (statek_id) REFERENCES statek(nazwa_statku);
UPDATE postac SET statek_id = 'Biala Mewa' WHERE nazwa = "Bjorn";
UPDATE postac SET statek_id = 'Biala Mewa' WHERE nazwa = "Koko";
UPDATE postac SET statek_id = 'Biala Mewa' WHERE nazwa = "Omen";
UPDATE postac SET statek_id = 'Biala Mewa' WHERE nazwa = "Einhar";
UPDATE postac SET statek_id = 'Szybki Bill' WHERE nazwa = "Rambo";
UPDATE postac SET statek_id = 'Szybki Bill' WHERE nazwa = "Pimpek";
UPDATE postac SET statek_id = 'Szybki Bill' WHERE nazwa = "Drozd";
DELETE FROM izba WHERE nazwa_izby = 'Spizarnia';
DROP TABLE izba;
