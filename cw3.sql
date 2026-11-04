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
select * from pracownik;
CREATE TABLE zadanie (
id_zadania INT unsigned auto_increment PRIMARY KEY,
nazwa_zadania VARCHAR(150) NOT NULL,
priorytet ENUM('normalny','wysoki','niski'),
opis TEXT,
pracownik INT NULL,
godziny_szacowane int(8),
FOREIGN KEY (pracownik)
 REFERENCES pracownik(id_pracownika)
 ON DELETE SET NULL
);
ALTER TABLE zadanie
 Alter priorytet set default 'normalny';
INSERT INTO zadanie (nazwa_zadania,priorytet,opis,pracownik,godziny_szacowane)
VALUES
("przygotowania raportu","wysoki",'raport miesieczny',1,4),
("wreczyc wyplaty","niski",NULL,2,12),
("testowanie aplikacji","normalny",'raport problemow',3,16);
select  * from zadanie;

CREATE TABLE projekt (
id_projektu int primary key auto_increment,
nazwa_projektu varchar(150),
data_rozpoczecia date,
data_zakonczenia date
);
Alter table projekt
add manadzer_projektu int;

alter table projekt 
add foreign key (manadzer_projektu)
references pracownik(id_pracownika);
 insert into projekt 
 values
 ('Projekt strony','2025-05-11','2025-07-13',1),
 ('projekt aplikacji','2025-06-18',NULL,2);
 
 Alter table zadanie 
 add foreign key(projekt)
 References projekt(id_projektu)
 on delete cascade;
 
 Update zadanie
 set projekt = 1
 where id_zadania = 1;
 
  Update zadanie
 set projekt = 1
 where id_zadania = 2;
 
  Update zadanie
 set projekt = 2
 where id_zadania = 3;
select * from projekt;

Create table sprint (
id_sprintu int primary key auto_increment,
numer_sprintu smallint unsigned,
data_rozpoczecia date,
data_zakonczenia date);

alter table zadanie 
add sprint int null;

alter table zadanie
add constraint fk_zadanie_sprint
foreign key (sprint)
references sprint(id_sprintu)
on delete set null;

Insert into sprint
values
(1,'2025-04-18','2025-09-12');

Update zadanie
 set sprint = 1
 where id_zadania = 1;
 
 Update zadanie
 set sprint = 1
 where id_zadania = 2;
 
 select * from sprint;

Create Table status (
id_statusu int auto_increment primary key,
nazwa_statusu varchar(20)
);
insert into status (nazwa statusu)
values 
('nowe'),
('w trakcie'),
('zakonczone');

 
 
 
 



