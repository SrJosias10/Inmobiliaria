CREATE DATABASE TP_Final
GO
USE TP_Final
GO
CREATE TABLE Categoria(
    ID int not null primary key identity(1,1),
    Nombre varchar(50) not null
)
GO
CREATE TABLE Marca(
    ID int not null primary key identity(1,1),
    Nombre varchar(50) not null
)
GO
CREATE TABLE Articulos(
    ID int not null primary key identity(1,1),
    Nombre varchar(50) not null,
    Descripcion varchar(500) not null,
    IdCategoria int not null foreign key references Categoria(ID),
    IdMarca int not null foreign key references Marca(ID),
    Precio money not null CHECK(Precio > 0), 
    ImagenUrl varchar (1000),
    Disponible bit default(1),
    Stock int not null CHECK(Stock >= 0)
)
GO
CREATE TABLE Usuarios(
    ID int not null primary key identity(1,1),
    Usuario varchar(50) not null UNIQUE,
    Pass varchar(16) not null, 
    Apellidos varchar(100) null,
    Nombres varchar(100) null,
    Nacimiento date null,
    ImagenUrl varchar (1000) null,
    Adm bit default(0) NULL
)
GO
create Procedure insertarNuevo
@user varchar(50),
@pass varchar(16)
as
insert into Usuarios (Usuario, Pass, Adm) output inserted.ID values (@user, @pass, 0)

