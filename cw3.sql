CREATE TABLE pracownik (
id_pracownika INT unsigned auto_increment PRIMARY KEY,
imie VARCHAR(40) NOT NULL,
nazwisko VARCHAR(60) NOT NULL,
data_urodzenia DATE NOT NULL);

Insert INTO pracownik (imie,nazwisko,data_urodzenia)
VALUES
("JANUSZ","KUC","2007-11-23"),
("KAROL","RYDEL","1999-07-25"),
("JAN","KOWALSKI","1998-06-21");

UPDATE pracownik
SET data_urodzenia = '2000-06-14'
WHERE id_pracownika = 1;

CREATE TABLE zadanie (
id_zadania INT unsigned auto_increment PRIMARY KEY,
nazwa_zadania VARCHAR(150) NOT NULL,
priorytet ENUM('normalny','wysoki','niski'),
opis TEXT,
pracownik INT NULL,
FOREIGN KEY (pracownik)
 REFERENCES pracownik(id_pracownika)
 ON DELETE SET NULL
);
ALTER TABLE zadanie
MODIFY priorytet ENUM('normalny','wysoki','niski')
NOT NULL DEFAULT 'normalny';
INSERT INTO zadanie (nazwa_zadania,priorytet,opis,pracownik)
VALUES
("przygotowania raportu","wysoki",'raport miesieczny',1),
("wreczyc wyplaty","niski",NULL,2),
("testowanie aplikacji","normalny",'raport problemow',3);


SELECT * FROM pracownik;

SELECT * FROM zadanie;

SELECT 
z.nazwa_zadania,
z.priorytet,
p.imie,
p.nazwisko
FROM zadania z
LEFT JOIN pracownik p
ON z.pracownik = p.id_pracownika;




