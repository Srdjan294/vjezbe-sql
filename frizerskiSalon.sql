--1. Frizerski salon 
--frizerskom salonu radi više djelatnica. Jedna djelatnica na dan radi s više korisnika. Korisnik tijekom jednog posjeta koristi jednu usluga

use master;
go
drop database if exists FrizerskiSalon;
go

create database FrizerskiSalon collate Croatian_CI_AS;
go

use FrizerskiSalon;

create table djelatnice(

	sifra int not null primary key identity(1,1),
	ime varchar(100),
	prezime varchar(100),
	oib char(11),
	email varchar(255),
	iban varchar(100)

);

create table korisnici(

	sifra int not null primary key identity(1,1),
	ime varchar(100),
	prezime varchar(100),
	oib char(11),
	email varchar(255),
	brojTelefona varchar(30)
);

create table posjete(

	datum datetime,
	korisnik int,
	usluga int,
	djelatnica int

);

create table usluge(

	sifra int not null primary key identity(1,1),
	naziv varchar(255),
	cijena decimal(18,2)

);

alter table posjete add foreign key (usluga) references usluge(sifra);
alter table posjete add foreign key (korisnik) references korisnici(sifra);
alter table posjete add foreign key (djelatnica) references djelatnice(sifra);

insert into djelatnice(ime, prezime, oib, email, iban) values
('Ivana', 'Mariæ', '80168220113', 'ivanamaric@gmail.com','HR4524020065354911475' ),
('Ilonka', 'Ðurièiæ', '81739348771', 'dilonka@gmail.com','HR7823600002875654661' ),
('Marka', 'Josipoviæ', '66084145009', 'marka@gmail.com','HR4624840089757421484' );

insert into korisnici(ime, prezime, oib, email, brojTelefona) values
('Ivan', 'Josiæ', '21544253622', 'ijosic@gmail.com', '0982347485'),
('Igor', 'Jadiæ', '19422696473', 'igorjadic@gmail.com', '0914356475'),
('Marija', 'Jadiæ', '10754445176', 'marijajadic@gmail.com', '0914339475');


insert into usluge values
('trajna', 20),
('pranje kose', 15),
('šišanje', 10);

insert into posjete(datum, korisnik, usluga, djelatnica) values
('2024-03-02',1,2,1),
('2024-03-03',1,3,1),
('2024-03-04',2,2,1);

