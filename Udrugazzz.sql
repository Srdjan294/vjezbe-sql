--3. Udruga za zaštitu životinja 
--U udruzi radi više osoba. Jedna osoba se brine za jednog ili više štiæenika udruge. Štiæenici udruge su životinje. Svaki štiæenik se nalazi u jednom prostoru.

use master;
go 
drop database if exists udrugaZZZ;
go
create database udrugaZZZ collate Croatian_CI_AS;
go

use udrugaZZZ;

create table osobe(

	sifra int not null primary key identity(1,1),
	ime varchar(100),
	prezime varchar(100),
	oib char(11),
	email varchar(255),
	iban varchar(100)

);

create table sticenici(

	sifra int not null primary key identity(1,1),
	ime varchar(100),
	vrsta varchar(100),
	osoba int,
	prostor int

);

create table prostori(

	sifra int not null primary key identity(1,1),
	lokacija varchar(255),
	osoba int
);

alter table sticenici add foreign key (osoba) references osobe(sifra);
alter table sticenici add foreign key (prostor) references prostori(sifra);
alter table prostori add foreign key (osoba) references osobe(sifra);

insert into osobe(ime, prezime, oib, email, iban) values
('Marko', 'Markoviæ', '74049106109', 'mmarkovic@gmail.com', 'HR0624020064587153297' ),
('Marija', 'Markoviæ', '74043456109', 'marijamarkovic@gmail.com', 'HR9024840084596384469' ),
('Ivan', 'Mariæ', '73649106102', 'mmarkovic@gmail.com', 'HR0824840085426361498' );

insert into prostori(lokacija,osoba) values
('a1',1),
('b2',2),
('v1',1);

insert into sticenici(ime, vrsta, osoba, prostor) values
('Dodi', 'njemaèki ovèar', 1, 1),
('Loki', 'hrvatski ovèar', 2, 2),
('Bruno', 'medvjed', 3, 3);

select * from osobe;
select * from sticenici;
select * from prostori;