create database hotel
go
use hotel
go
create table tClient
( 
id int primary key identity(1,1),
    noms nvarchar(100),
	adresse nvarchar(100),
	contact nvarchar(1000)
	)
go
create table tClasse
(
  id int primary key identity(1,1),
  designation nvarchar(100),
  prix decimal        (10,5)
  )
go

create table tChambre
(
 id int primary key identity(1,1),
    numero nvarchar(100),
	contact nvarchar(100),
	refClasse int foreign key references tClasse (id),
	  )
go
create table tReservation
(  id int primary key identity(1,1),
     refClient int foreign key references tClient (id),
	  refChambre int foreign key references tChambre (id),
	  dateEntree date,
	  dateSoetie date,
	  )
 go
create table tCategorie
(
id int primary key identity(1,1),
designation nvarchar (100)
  
  )
go
create procedure saveClient
(
@id int,
@noms nvarchar (100),
 @adresse nvarchar (100),
 @contact nvarchar (15)
 ) as
 begin

 if @id in (select id from tClient)
  begin
  update tClient set noms=@noms,adresse=@adresse,
  contact=@contact where id=@id
  end
  else
  begin
  insert into tClient(noms,adresse,contact)
  values(@noms,@adresse,@contact)
  end
  end
  go
create procedure SaveClasse
  (
  @id int ,
  @designation nvarchar(100),
  @prix decimal        (10,5)
  ) as
  begin

if @id in (select id from tClasse)
begin
update tClasse set designation=@designation, prix=@prix 
where id =@id
end
else
begin
insert into tClasse(designation,prix)
values(@designation,@prix)
end
end
go
create procedure SaveChambre
(
   @id int ,
    @numero nvarchar(100),
	@contact nvarchar(100),
	@refClasse int
	  )as
begin

if @id in(select id from  tChambre)
begin
update tChambre set numero=@numero,contact=@contact
where id=@id 
end
begin
insert into tChambre(numero,contact)
values (@numero,@contact)
end
end

go
create procedure SaveCategorie
(
  @id int ,
  @designation nvarchar (100)
  )as
  begin

  if @id in (select id from tCategorie)
  begin
  update tCategorie set designation=@designation
  where id=@id
  end
  begin
  insert into tCategorie(designation)
  values (@designation)
  end
  end


  



