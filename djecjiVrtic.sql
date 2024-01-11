--4. Dječji vrtić 
--U dječjem vrtiću postoji više odgojnih skupina. Svaka odgojna skupina ima više djece i vodi ih jedna odgajateljica. Odgajateljica ima jednu stručnu spremu.

use master;
go
drop database if exists djecjivrtic;
go
create database djecjivrtic collate Croatian_CI_AS;
go 
use djecjivrtic;

create table odgajateljice(

		sifra int not null primary key identity(1,1),
		ime varchar(100),
		prezime varchar(100) not null,
		iban varchar(100) not null,
		strucnaSprema int not null

);

create table djeca(

	sifra int not null primary key identity(1,1),
	ime varchar(100) not null,
	prezime varchar(100) not null,
	datumRodenja datetime

);

create table strucneSpreme(

	sifra int not null primary key identity(1,1),
	naziv varchar(255)

);

create table odgojneSkupine(

	djeca int not null,
	odgajateljica int not null

)


alter table odgojneSkupine add foreign key (odgajateljica) references odgajateljice(sifra);
alter table odgojneSkupine add foreign key (djeca) references djeca(sifra);

alter table odgajateljice add foreign key (strucnaSprema) references strucneSpreme(sifra);

insert into strucneSpreme(naziv) values
('farmaceutski tehničar'),
('odgajateljica'),
('frizerka');

insert into odgajateljice(ime, prezime, iban, strucnaSprema) values
('Marija', 'Glović', 'HR4024020066314519276', 1),
('Maja', 'Ivić', 'HR4024020045614519276', 2),
('Marija', 'Gavran', 'HR4024020066398459276', 3);

insert into djeca(ime, prezime, datumRodenja) values
('Marko', 'Marković', '2020-03-04'),
('Marijo', 'Mrik', '2020-03-04'),
('David', 'Josić', '2020-03-04');

insert into odgojneSkupine(djeca, odgajateljica) values
(1,1),
(2,1),
(3,1);

select * from djeca;
select * from odgajateljice;
select * from odgojneSkupine;
select * from strucneSpreme;