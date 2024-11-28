USE Inmobiliaria
GO
INSERT INTO Cuenta (Email, Pass, Nombres, Apellidos, Telefono, adm)
VALUES 
('Josias@gmail.com', '1234', 'Josias', 'Olave', 11111111, 1),
('Juancruz@gmail.com', '1234', 'Juan Cruz', 'Escalante', 11111111, 1)
GO
INSERT INTO TipoInmueble VALUES 
('Casa'), 
('Departamento')
GO
INSERT INTO Provincia VALUES 
('Buenos Aires'), 
('Cordoba')
GO
INSERT INTO Estado VALUES 
('Venta'), 
('Alquiler'),
('Vendido'),
('Alquilado'),
('Inactivo')
GO
INSERT INTO Moneda VALUES 
('Dolar')
GO
INSERT INTO Ciudad VALUES 
('1','Tigre'),
('1','Puerto Madero')
GO
INSERT INTO Ubicacion VALUES 
('1','Don Torcuato')