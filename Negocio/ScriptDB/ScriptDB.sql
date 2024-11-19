CREATE DATABASE Inmobiliaria
GO
USE Inmobiliaria
GO
CREATE TABLE TipoInmueble(
    ID int not null primary key identity(1,1),
    Descripcion varchar(50) not null
)
GO
CREATE TABLE Estado(
    ID int not null primary key identity(1,1),
    Descripcion varchar(50) not null
)
GO
CREATE TABLE Provincia(
    ID int not null primary key identity(1,1),
    Descripcion varchar(50) not null
)
CREATE TABLE Ciudad (
    ID int not null primary key identity(1,1),
    IdProvincia int not null,
    Descripcion varchar(50) not null,
    foreign key (IdProvincia) references Provincia(ID) -- Referencia correcta a Provincia
)
GO
CREATE TABLE Ubicacion(
    ID int not null primary key identity(1,1),
	IdCiudad int not null foreign key references Ciudad(ID),
    Descripcion varchar(50) not null
)
GO
CREATE TABLE Moneda(
    ID int not null primary key identity(1,1),
    Descripcion varchar(50) not null
)
GO
CREATE TABLE Inmueble(
    ID int not null primary key identity(1,1),
	IdTipoInmueble int not null foreign key references TipoInmueble(ID),
	IdUbicacion int not null foreign key references Ubicacion(ID),
	IdEstado int not null foreign key references Estado(ID),
	IdMoneda int not null foreign key references Moneda(ID),
    Descripcion varchar(1000) not null,
    Precio money not null CHECK(Precio > 0), 
    Ambientes int not null CHECK(Ambientes >= 0),
	Garage int not null CHECK(Garage >= 0),
	Dormitorios int not null CHECK(Dormitorios >= 0),
	Banos int not null CHECK(Banos >= 0),
	Antiguedad int not null CHECK(Antiguedad >= 0),
    Expensas money not null CHECK(Expensas > 0), 
	Superficie int not null CHECK(Superficie >= 0),
)
GO
CREATE TABLE Imagenes(
    ID int not null primary key identity(1,1),
	IdInmueble int not null foreign key references Inmueble(ID),
    ImagenUrl varchar(1000) not null
)
GO
CREATE TABLE Cuenta(
    ID int not null primary key identity(1,1),
    Email varchar(50) not null UNIQUE,
    Pass varchar(16) not null, 
    Apellidos varchar(100) null,
    Nombres varchar(100) null,
    Nacimiento date null,
	Telefono int null
)
GO
CREATE TABLE CuentaXinmueble (
    IdCuenta int not null,
    IdInmueble int not null,
    primary key (IdCuenta, IdInmueble),
    foreign key (IdCuenta) references Cuenta(ID),
    foreign key (IdInmueble) references Inmueble(ID)
)
GO
CREATE PROCEDURE [dbo].[insertarNuevo]
@email varchar (50),
@pass varchar (16)
AS
INSERT INTO Cuenta (Email, Pass) OUTPUT inserted.ID VALUES (@email, @pass)