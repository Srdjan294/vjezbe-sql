--6. Samostan 
--U samostanu se nalaze sve�enici. Svaki sve�enik je zadu�en za vi�e poslova. 
--Jedan posao u isto vrijeme mo�e obavljati vi�e sve�enika. 
--Svaki sve�enik ima samo jednog nadre�enog sve�enika. 

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
('Josip','Josi�', 2),
('Marko','Maruli�', 3),
('Davor','Kali�', 3);

insert into poslovi(naziv, svecenik) values
('branje jabuka', 1),
('branje �ljiva', 3),
('branje tre�nji', 3);

select * from svecenici;
select * from poslovi;

