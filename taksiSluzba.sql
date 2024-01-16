--7. Taksi služba 
--Taksi tvrtka ima više vozila. Jedno vozilo vozi jedan vozač. U jednoj vožnji vozač može prevesti više putnika. 
--Jedan putnik se naravno može tijekom vremena imati više vožnji.

use master;
go 
drop database if exists taksiSluzba;
go
create database taksiSluzba;
go
use taksiSluzba;

create table vozaci(

	sifra int not null primary key identity(1,1),
	ime varchar(100),
	prezime varchar(100),
	iban varchar(100)

);

create table vozila(
	
	sifra int not null primary key identity(1,1),
	registracija varchar(100),
	marka varchar(100),
	vozac int

);

create table voznje(

	sifra int not null primary key identity(1,1),
	vrijeme datetime,
	vozilo int

);

create table putnici(

	sifra int not null primary key identity(1,1),
	ime varchar(100),
	prezime varchar(100),
	brojMobitela varchar(100),

);

create table stavke(

	voznja int,
	putnik int

);


alter table vozila add foreign key (vozac) references vozaci(sifra);

alter table voznje add foreign key (vozilo) references vozila(sifra);

alter table stavke add foreign key (voznja) references voznje(sifra);
alter table stavke add foreign key (putnik) references putnici(sifra);


insert into vozaci(ime, prezime, iban) values
('Marko', 'Jelić', 'HR5423400098135242496'),
('Ivan', 'Marić', 'HR5423400098135549496'),
('Josip', 'Josipović', 'HR5943400098135242496');

insert into vozila(registracija, marka, vozac) values
('os-435-nk', 'golf 5', 1),
('os-345-tk', 'mazda', 1),
('os-003-ko', 'mercedes', 1);

insert into putnici(ime, prezime, brojMobitela) values
('Mirko', 'Volić', '0983276473'),
('Jasna', 'Tabak', '0917488375'),
('Marko', 'Tolić', '0923748576');

insert into voznje(vrijeme, vozilo) values
('2024-12-01 17:45:00', 1),
('2024-12-01 17:55:00', 2),
('2024-12-01 18:45:00', 3);

insert into stavke(voznja, putnik) values
(1,1),(1,2),(1,3);

select * from vozaci;
select * from vozila;
select * from putnici;
select * from voznje;
select * from stavke;