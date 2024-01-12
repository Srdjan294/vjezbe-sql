--5. Muzej 
--U muzeju postoji više izložaba. Jedna izložba ima više djela. 
--Svaki kustos je zadužen za jednu izložbu. Svaka izložba ima jednog sponzora.

use master;
go 
drop database if exists muzej;
go 
create database muzej collate Croatian_CI_AS;
go
use muzej;

create table djela(

	sifra int not null primary key identity(1,1),
	naziv varchar(255) not null

);

create table kustosi(

	sifra int not null primary key identity(1,1),
	ime varchar(100) not null,
	prezime varchar(100) not null,
	iban varchar(100) not null

);

create table sponzori(

	sifra int not null primary key identity(1,1),
	ime varchar(100) not null

);

create table izlozbe(

	sifra int not null primary key identity(1,1),
	naziv varchar(100) not null,
	djela int not null,
	kustos int not null,
	sponzor int not null

);

alter table izlozbe add foreign key (djela) references djela(sifra);
alter table izlozbe add foreign key (kustos) references kustosi(sifra);
alter table izlozbe add foreign key (sponzor) references sponzori(sifra);

insert into djela(naziv) values
('Mona Lisa'),
('Psi kartaju poker'),
('Proljeće');

insert into kustosi(ime, prezime, iban) values
('Marko', 'Jelić', 'HR25RABO9691303264'),
('Ivan', 'Korić', 'HR25RABO9691303484'),
('Ivana', 'Jeličević', 'HR25RABO9648395844');

insert into sponzori(ime) values
('Addiko banka'),
('Plodine'),
('INA');

insert into izlozbe(naziv, djela, kustos, sponzor) values
('Renesansa', 1,1,1),
('Moderna umjetnost', 2,2,2),
('Romantika', 3,3,3);

select * from djela;
select * from kustosi;
select * from sponzori;
select * from izlozbe;