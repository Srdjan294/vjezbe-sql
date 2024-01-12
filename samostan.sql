--6. Samostan 
--U samostanu se nalaze sveæenici. Svaki sveæenik je zadužen za više poslova. 
--Jedan posao u isto vrijeme može obavljati više sveæenika. 
--Svaki sveæenik ima samo jednog nadreðenog sveæenika. 

use master;
go
drop database if exists samostan;
go
create database samostan collate Croatian_CI_AS;
go 
use samostan;

create table svecenici(

	sifra int not null primary key identity(1,1),
	ime varchar(100) not null,
	prezime varchar(100) not null,
	nadredeniSvecenik int

);

create table poslovi(

	sifra int not null primary key identity(1,1),
	naziv varchar(255) not null,
	svecenik int not null

);

alter table svecenici add foreign key (nadredeniSvecenik) references svecenici(sifra);
alter table poslovi add foreign key (svecenik) references svecenici(sifra);

insert into svecenici(ime,prezime,nadredeniSvecenik) values
('Josip','Josiæ', 2),
('Marko','Maruliæ', 3),
('Davor','Kaliæ', 3);

insert into poslovi(naziv, svecenik) values
('branje jabuka', 1),
('branje šljiva', 3),
('branje trešnji', 3);

select * from svecenici;
select * from poslovi;

