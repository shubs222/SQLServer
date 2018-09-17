										--cretae table politicians
create table politicians
(
	Id int identity(1,1) primary key,
	Name varchar(20) not null
)
										--drop table politicians
										--insert values into politicians table

insert into politicians(Name) values('gandhi'); 
insert into politicians(Name) values('obama'); 
insert into politicians(Name) values('mandela');
insert into politicians(Name) values('patel'); 
insert into politicians(Name) values('modi'); 
insert into politicians(Name) values('trump');
insert into politicians(Name) values('rabada');
insert into politicians(Name) values('washington');
   
 
										--create another table countries
create table countries
(
	Id int identity (1,1) primary key,
	country varchar(25) not null
)

											--inserting values into country table
insert into countries(country) values('India');
insert into countries(country) values('united states');
insert into countries(country) values('South africa');

											--alter table country add country id column
alter table politicians add CountryId int  foreign key references Countries(id)  ;

										--update table politicians set countryId
update politicians set CountryId=1 where id in (1,4,5);
update politicians set CountryId=2 where id in (2,6,8);
update politicians set CountryId=3 where id in (3,7);

										--changing united states to USA and south africa to SA
update countries set country='USA' where country='united states';
update countries set country='SA' where country='south africa';
										--joining two table
select p.Id,p.Name,p.CountryId,c.Country from politicians p
full outer join  Countries c on  c.id=p.CountryId;

										--create table portfollio
create table Portfollio
(
	Id int identity (1,1) primary key,
	Name varchar(25) not null

)
insert into Portfollio(Name) values('Prime Minister');
insert into Portfollio(name) values('President');
insert into Portfollio(name) values('Defence Minister');

--retieving values from both the table
select * from politicians;
--select * from countries;
select * from Portfollio;

										--table for creating many to many relations
create table Relationships
(
	PoliticiansId int  foreign key references Politicians(Id),
	portfollioID int  foreign key references Portfollio(Id)
)

insert into Relationships values(1,2);
insert into Relationships values(1,3);
insert into Relationships values(2,2);
insert into Relationships values(2,3);
insert into Relationships values(5,1);
insert into Relationships values(5,3);

select * from Relationships;

select p.id, p.name, pf.name,c.country from politicians p full outer join
countries c on c.id=p.id 
full outer join Relationships r on p.Id=r.PoliticiansId
full outer join Portfollio pf on r.portfollioID=pf.Id