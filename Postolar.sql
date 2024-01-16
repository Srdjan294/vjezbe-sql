--8. Postolar 
--Postolar popravlja obuću. Jedan korisnik može postolaru donijeti više komada obuće na popravak 
--dok jedan komad obuće može biti više puta na popravku.
--Postolar ima šegrta koji sudjeluje u određenim popravcima obuće.

use master;
go
drop database if exists postolar;
go 
create database postolar;
go 
use postolar;

create table postolari(

	sifra int not null primary key identity(1,1),
	ime varchar(100),
	prezime varchar(100),
	iban varchar(100)

);

create table segrti(

	sifra int not null primary key identity(1,1),
	ime varchar(100),
	prezime varchar(100),
	iban varchar(100)

);

create table korisnici(

	sifra int not null primary key identity(1,1),
	ime varchar(100),
	prezime varchar(100),
	brojMobitela varchar(100)

);

create table obuca(

	sifra int not null primary key identity(1,1),
	marka varchar(100),
	korisnik int

);

create table popravci(
	
	sifra int not null primary key identity(1,1),
	obuca int,
	postolar int,
	segrt int,
	cijena decimal(18,2)

);


alter table obuca add foreign key (korisnik) references korisnici(sifra);

alter table popravci add foreign key (obuca) references obuca(sifra);
alter table popravci add foreign key (postolar) references postolari(sifra);
alter table popravci add foreign key (segrt) references segrti(sifra);



insert into postolari(ime, prezime, iban) values
('Marko', 'Jelić', 'HR9839400091248766596'),
('Marijo', 'Pilić', 'HR9825000091212266596'),
('Dario', 'Borić', 'HR9825000493848766596');

insert into segrti(ime, prezime, iban) values
('Dorijan', 'Markocić', 'HR9839382091248766596'),
('Marko', 'Delić', 'HR9825009901212266596'),
('Josip', 'Brkić', 'HR9825000128848766596');

insert into korisnici(ime, prezime, brojMobitela) values
('Dajana', 'Pivić', '09826754554'),
('Marija', 'Krstić', '0914387847'),
('Josipa', 'Brkić-Marić', '0928773847');

insert into obuca(marka, korisnik) values
('Nike', 1),
('Adidas', 2),
('Elviton', 3);

insert into popravci(obuca, postolar, segrt, cijena) values
(1,1,1,12.23),
(1,2,2,11.03),
(1,2,3,9.20);

select * from postolari;
select * from segrti;
select * from korisnici;
select * from obuca;
select * from popravci;