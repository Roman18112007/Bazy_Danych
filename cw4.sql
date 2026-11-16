
CREATE DATABASE IF NOT EXISTS firma;
USE firma;

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS zadanie_has_status;
DROP TABLE IF EXISTS zadanie;
DROP TABLE IF EXISTS sprint;
DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS projekt;
DROP TABLE IF EXISTS pracownik;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE pracownik (
    id_pracownika INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(40) NOT NULL,
    nazwisko VARCHAR(60) NOT NULL,
    data_urodzenia DATE NOT NULL
);

INSERT INTO pracownik (imie, nazwisko, data_urodzenia)
VALUES
('JANUSZ', 'KUC', '2007-11-23'),
('KAROL', 'RYDEL', '1999-07-25'),
('JAN', 'KOWALSKI', '1998-06-21');

UPDATE pracownik
SET data_urodzenia = '2000-06-14'
WHERE id_pracownika = 1;

SELECT * FROM pracownik;

CREATE TABLE zadanie (
    id_zadania INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nazwa_zadania VARCHAR(150) NOT NULL,
    priorytet ENUM('normalny', 'wysoki', 'niski'),
    opis TEXT,
    pracownik INT UNSIGNED NULL,

    CONSTRAINT fk_zadanie_pracownik
    FOREIGN KEY (pracownik)
    REFERENCES pracownik(id_pracownika)
    ON DELETE SET NULL
);

ALTER TABLE zadanie
ALTER COLUMN priorytet SET DEFAULT 'normalny';

INSERT INTO zadanie (nazwa_zadania, priorytet, opis, pracownik)
VALUES
('przygotowania raportu', 'wysoki', 'raport miesieczny', 1),
('wreczyc wyplaty', 'niski', NULL, 2),
('testowanie aplikacji', 'normalny', 'raport problemow', 3);

SELECT * FROM zadanie;

CREATE TABLE projekt (
    id_projektu INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nazwa_projektu VARCHAR(150),
    data_rozpoczecia DATE,
    data_zakonczenia DATE
);

ALTER TABLE projekt
ADD menadzer_projektu INT UNSIGNED;

ALTER TABLE projekt
ADD CONSTRAINT fk_projekt_pracownik
FOREIGN KEY (menadzer_projektu)
REFERENCES pracownik(id_pracownika);


INSERT INTO projekt (nazwa_projektu, data_rozpoczecia, data_zakonczenia, menadzer_projektu)
VALUES
('Projekt strony', '2025-05-11', '2025-07-13', 1),
('Projekt aplikacji', '2025-06-18', NULL, 2);


ALTER TABLE zadanie
ADD projekt INT UNSIGNED;

ALTER TABLE zadanie
ADD CONSTRAINT fk_zadanie_projekt
FOREIGN KEY (projekt)
REFERENCES projekt(id_projektu)
ON DELETE CASCADE;

UPDATE zadanie SET projekt = 1 WHERE id_zadania = 1;
UPDATE zadanie SET projekt = 1 WHERE id_zadania = 2;
UPDATE zadanie SET projekt = 2 WHERE id_zadania = 3;

SELECT * FROM projekt;
SELECT * FROM zadanie;


CREATE TABLE sprint (
    id_sprintu INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    numer_sprintu INT UNSIGNED,
    data_rozpoczecia DATE,
    data_zakonczenia DATE
);

ALTER TABLE zadanie
ADD sprint INT UNSIGNED NULL;

ALTER TABLE zadanie
ADD CONSTRAINT fk_zadanie_sprint
FOREIGN KEY (sprint)
REFERENCES sprint(id_sprintu)
ON DELETE SET NULL;


INSERT INTO sprint (numer_sprintu, data_rozpoczecia, data_zakonczenia)
VALUES
(1, '2025-04-18', '2025-09-12');


UPDATE zadanie SET sprint = 1 WHERE id_zadania = 1;
UPDATE zadanie SET sprint = 1 WHERE id_zadania = 2;

SELECT * FROM sprint;
SELECT * FROM zadanie;


CREATE TABLE status (
    id_statusu INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nazwa_statusu VARCHAR(20)
);

INSERT INTO status (nazwa_statusu)
VALUES
('nowe'),
('w trakcie'),
('zakonczone');

CREATE TABLE zadanie_has_status (
    id_zdarzenia INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_zadania INT UNSIGNED,
    id_statusu INT UNSIGNED,
    data_zdarzenia DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_zadania)
    REFERENCES zadanie(id_zadania)
    ON DELETE CASCADE,

    FOREIGN KEY (id_statusu)
    REFERENCES status(id_statusu)
);

INSERT INTO zadanie_has_status (id_zadania, id_statusu)
VALUES
(1, 1),
(2, 2),
(3, 3);

SELECT * FROM status;
SELECT * FROM zadanie_has_status;

DELETE FROM projekt
WHERE id_projektu = 1;


SELECT * FROM zadanie;


ALTER TABLE zadanie
DROP FOREIGN KEY fk_zadanie_sprint;

ALTER TABLE zadanie
DROP COLUMN sprint;

DROP TABLE sprint;

ALTER TABLE zadanie
ADD godziny_szacowane INTEGER DEFAULT 8;


UPDATE zadanie
SET godziny_szacowane = 12
WHERE id_zadania = 3;


ALTER TABLE zadanie
ALTER COLUMN godziny_szacowane SET DEFAULT 6;


INSERT INTO zadanie (nazwa_zadania, priorytet, opis, pracownik, projekt)
VALUES ('zadanie tymczasowe', 'normalny', 'test domyslnej wartosci', 1, 2);

SELECT id_zadania, nazwa_zadania, godziny_szacowane
FROM zadanie
WHERE id_zadania = 4;

DELETE FROM zadanie
WHERE id_zadania = 4;




ALTER TABLE projekt
ADD opis_projektu VARCHAR(50) NULL;


ALTER TABLE projekt
MODIFY opis_projektu VARCHAR(200) NULL;


UPDATE projekt
SET opis_projektu = 'pilne wdrozenie - wersja MVP'
WHERE id_projektu = 2;

SELECT * FROM projekt;


ALTER TABLE projekt
DROP COLUMN opis_projektu;




ALTER TABLE zadanie
DROP FOREIGN KEY fk_zadanie_projekt;


ALTER TABLE zadanie
ADD CONSTRAINT fk_zadanie_projekt
FOREIGN KEY (projekt)
REFERENCES projekt(id_projektu)
ON DELETE SET NULL;


DELETE FROM projekt
WHERE id_projektu = 2;

SELECT * FROM zadanie;