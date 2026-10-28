ZADANIE 1
DELETE FROM postac WHERE id_postaci != 1 and rodzaj='wiking' ORDER BY data_ur ASC LIMIT 2;

ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_2;
ALTER TABLE postac MODIFY id_postaci INT NOT NULL;
ALTER TABLE postac DROP PRIMARY KEY;

ZADANIE 2

ALTER TABLE postac ADD COLUMN pesel int(11) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE postac MODIFY rodzaj ENUM('wiking', 'ptak', 'kobieta', 'syrena');
INSERT INTO postac (id_postaci, nazwa, rodzaj) VALUES (9, 'Gertruda Nieszczera', 'syrena');

ZADANIE 3

UPDATE postac SET statek_id='Biala Mewa' WHERE nazwa LIKE '%a%';
UPDATE statek SET max_ladownosc=max_ladownosc*0.7 WHERE YEAR(data_wodowania) BETWEEN 1900 AND 1999;
ALTER TABLE postac ADD CHECK (wiek>1000);

ZADANIE 4

INSERT INTO postac (id_postaci, nazwa) VALUES (10, 'Wonsz Loko');

CREATE TABLE Marynarz AS SELECT * FROM postac WHERE statek_id IS NOT NULL;

ALTER TABLE Marynarz ADD PRIMARY KEY (pesel);
ALTER TABLE Marynarz ADD FOREIGN KEY (statek_id) REFERENCES statek(nazwa_statku);

ZADANIE 5

UPDATE Marynarz SET statek_id = NULL;

DELETE FROM Marynarz WHERE rodzaj='wiking' LIMIT 1;

UPDATE postac SET statek_id= NULL;
DELETE FROM statek;

ALTER TABLE postac DROP FOREIGN KEY fk_statek_postac;
ALTER TABLE Marynarz DROP FOREIGN KEY Marynarz_ibfk_1;
DROP TABLE statek;

CREATE TABLE zwierz (id int PRIMARY KEY AUTO_INCREMENT, nazwa varchar(30), wiek int(4));

INSERT INTO zwierz (nazwa, wiek) SELECT nazwa, wiek FROM postac WHERE id_postaci IN (2, 9, 10);
