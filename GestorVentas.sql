CREATE DATABASE GestorVentas;

USE GestorVentas;
GO

--=============================================================================================
-- TABLA -> USUARIOS
--=============================================================================================

CREATE TABLE Usuarios(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR(20) NOT NULL,
	Direccion VARCHAR(50) NOT NULL,
	Telefono VARCHAR(20) NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Usuarios PRIMARY KEY(Id)
);
GO

--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> USUARIOS
--=============================================================================================

CREATE OR ALTER PROCEDURE SP_Listar_Usuarios
	AS
BEGIN	

	SELECT Id, Nombre, Apellido, Direccion, Telefono FROM Usuarios

END
GO


CREATE OR ALTER PROCEDURE SP_Guardar_Usuarios
	@Nombre VARCHAR(20), 
	@Apellido VARCHAR(20),
	@Direccion VARCHAR(50),
	@Telefono VARCHAR(20)
	AS
BEGIN
	
	INSERT INTO Usuarios(Nombre, Apellido, Direccion, Telefono)
	VALUES(@Nombre, @Apellido, @Direccion, @Telefono)

END
GO

CREATE OR ALTER PROCEDURE SP_Actualizar_Usuarios
	@Id INT,
	@Nombre VARCHAR(20), 
	@Apellido VARCHAR(20),
	@Direccion VARCHAR(50),
	@Telefono VARCHAR(20)
	AS
BEGIN

	UPDATE Usuarios
	SET
		Nombre = @Nombre, 
		Apellido = @Apellido, 
		Direccion = @Direccion, 
		Telefono = @Telefono
	WHERE
		Id = @Id
END
GO


CREATE OR ALTER PROCEDURE SP_Eliminar_Usuarios
	@Id INT
	AS
BEGIN

	DELETE FROM Usuarios WHERE Id = @Id

END
GO 


EXEC SP_Guardar_Usuarios
	@Nombre = 'Andy', 
	@Apellido = 'Ruiz',
	@Direccion = 'Cuesta Grande',
	@Telefono  = '6406-0470'
GO

SELECT * FROM Usuarios;

--=============================================================================================
-- TABLA -> LOGIN
--=============================================================================================

CREATE TABLE Login(
	Id INT IDENTITY(1,1),
	Usuario VARCHAR(10) NOT NULL,
	Contraseña VARCHAR(10) NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Login PRIMARY KEY(Id)
);
GO

--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> LOGIN
--=============================================================================================

CREATE OR ALTER PROCEDURE SP_Listar_Login
	AS
BEGIN	

	SELECT Id, Usuario, Contraseña FROM Login

END
GO


CREATE OR ALTER PROCEDURE SP_Guardar_Login
	@Usuario VARCHAR(10),
	@Contraseña VARCHAR(10)
	AS
BEGIN
	
	INSERT INTO Login( Usuario, Contraseña)
	VALUES(@Usuario, @Contraseña)

END
GO


CREATE OR ALTER PROCEDURE SP_Actualizar_Login
	@Id INT,
	@Usuario VARCHAR(10),
	@Contraseña VARCHAR(10)
	AS
BEGIN

	UPDATE Login
	SET

		Usuario = @Usuario, 
		Contraseña = @Contraseña
		
	WHERE
		Id = @Id
END
GO


CREATE OR ALTER PROCEDURE SP_Eliminar_Login
	@Id INT
	AS
BEGIN

	DELETE FROM Login WHERE Id = @Id

END
GO 

EXEC SP_Guardar_Login
	@Usuario = 'andy',
	@Contraseña = 'andy123'
GO

SELECT * FROM Login;

--=============================================================================================
-- TABLA -> CATEGORIA
--=============================================================================================

CREATE TABLE Categorias(
	IdCategoria  INT IDENTITY(1,1),
	NombreCategoria VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Categoria PRIMARY KEY(IdCategoria )
);
GO

--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> CATEGORIA
--=============================================================================================

CREATE OR ALTER PROCEDURE SP_Listar_Categoria
	AS
BEGIN	

	SELECT IdCategoria, NombreCategoria, Descripcion FROM Categorias

END
GO


CREATE PROCEDURE SP_Guardar_Categoria
	@NombreCategoria VARCHAR(20),
	@Descripcion VARCHAR(100)
	AS
BEGIN
	
	INSERT INTO Categorias( NombreCategoria, Descripcion)
	VALUES(@NombreCategoria, @Descripcion)

END
GO


CREATE OR ALTER PROCEDURE SP_Actualizar_Categoria
	@IdCategoria  INT,
	@NombreCategoria VARCHAR(20),
	@Descripcion VARCHAR(100)
	AS
BEGIN

	UPDATE Categorias
	SET

		NombreCategoria = @NombreCategoria, 
		Descripcion = @Descripcion
		
	WHERE
		IdCategoria  = @IdCategoria 
END
GO


CREATE OR ALTER PROCEDURE SP_Eliminar_Categoria
	@IdCategoria  INT
	AS
BEGIN

	DELETE FROM Categorias WHERE IdCategoria  = @IdCategoria 

END
GO 

EXEC SP_Guardar_Categoria
	@NombreCategoria = 'Bebidas',
	@Descripcion = 'Gaseosas, Café, té, cervezas y maltas'
GO

EXEC SP_Guardar_Categoria
	@NombreCategoria = 'Lacteos',
	@Descripcion = 'Quesos'
GO

EXEC SP_Guardar_Categoria
	@NombreCategoria = 'Pescado/Marsicos',
	@Descripcion = 'Pescados, mariscos y algas'
GO

EXEC SP_Guardar_Categoria
	@NombreCategoria = 'Granos/Cereales',
	@Descripcion = 'Arroz, Pan, Galletas, Cereales, Pastas, Frijoles'
GO

EXEC SP_Listar_Categoria
GO


--=============================================================================================
-- TABLA -> PROVEEDORES
--=============================================================================================

CREATE TABLE Proveedores(
	Id INT IDENTITY(1,1),
	Compañia VARCHAR(20) NOT NULL,
	NombreRepresentante VARCHAR(20) NOT NULL,
	Telefono VARCHAR(20) NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Proveedores PRIMARY KEY(Id)
);

--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> PROVEEDORES
--=============================================================================================

CREATE PROCEDURE SP_Listar_Proveedores
	AS
BEGIN	

	SELECT Id, Compañia, NombreRepresentante, Telefono FROM Proveedores

END
GO


CREATE OR ALTER PROCEDURE SP_Guardar_Proveedores
	@Compañia VARCHAR(20), 
	@NombreRepresentante VARCHAR(20),
	@Telefono VARCHAR(20)
	AS
BEGIN
	
	INSERT INTO Proveedores(Compañia, NombreRepresentante, Telefono)
	VALUES(@Compañia, @NombreRepresentante, @Telefono)

END
GO


CREATE OR ALTER PROCEDURE SP_Actualizar_Proveedores
	@Id INT,
	@Compañia VARCHAR(20), 
	@NombreRepresentante VARCHAR(20),
	@Telefono VARCHAR(20)
	AS
BEGIN

	UPDATE Proveedores
	SET
		Compañia = @Compañia, 
		NombreRepresentante = @NombreRepresentante, 
		Telefono = @Telefono
	WHERE
		Id = @Id
END
GO

CREATE OR ALTER PROCEDURE SP_Eliminar_Proveedores
	@Id INT
	AS
BEGIN

	DELETE FROM Proveedores WHERE Id = @Id

END
GO 

EXEC SP_Guardar_Proveedores
	@Compañia = 'Coca Cola', 
	@NombreRepresentante = 'Veronica Perez',
	@Telefono = '2209-8912'
GO

EXEC SP_Guardar_Proveedores
	@Compañia = 'Pozuelo', 
	@NombreRepresentante = 'Samuel Gomez',
	@Telefono = '2288-1234'
GO

EXEC SP_Guardar_Proveedores
	@Compañia = 'Tio Pelon', 
	@NombreRepresentante = 'Alexandro Gomez',
	@Telefono = '2421-8756'
GO

EXEC SP_Listar_Proveedores
GO

--=============================================================================================
-- TABLA -> PRODUCTO
--=============================================================================================

CREATE TABLE Productos(
	Id INT IDENTITY(1,1),
	NombreProducto VARCHAR(100) NOT NULL,
	PrecioUnidad decimal(10,2) NOT NULL,
	PrecioVenta decimal(10,2) NOT NULL,
	UnidadesEnExistencia INT NOT NULL,
	CodigoProducto VARCHAR(20) NOT NULL,
	IdCategoria INT,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Producto PRIMARY KEY(Id)
);
GO

CREATE OR ALTER PROCEDURE SP_Listar_Producto
	AS
BEGIN	
	SELECT 
		p.Id,
		p.NombreProducto,
		p.PrecioUnidad,
		p.PrecioVenta,
		p.UnidadesEnExistencia,
		p.CodigoProducto,
		c.IdCategoria,c.Descripcion

	FROM Productos p
	INNER JOIN Categorias c on c.IdCategoria  = p.IdCategoria
	ORDER BY p.Id ASC
END
GO

EXEC SP_Listar_Producto;

CREATE OR ALTER PROCEDURE SP_Guardar_Producto
	@NombreProducto VARCHAR(20),
	@PrecioUnidad decimal(10,2),
	@PrecioVenta decimal(10,2),
	@UnidadesEnExistencia INT,
	@CodigoProducto VARCHAR(20),
	@IdCategoria INT
	AS
BEGIN
	
	INSERT INTO Productos(NombreProducto, PrecioUnidad, PrecioVenta, UnidadesEnExistencia, CodigoProducto,IdCategoria)
	VALUES(@NombreProducto, @PrecioUnidad, @PrecioVenta, @UnidadesEnExistencia, @CodigoProducto, @IdCategoria)

END
GO

CREATE OR ALTER PROCEDURE SP_Actualizar_Producto
	@Id INT,
	@NombreProducto VARCHAR(20),
	@PrecioUnidad decimal(10,2),
	@PrecioVenta decimal(10,2),
	@UnidadesEnExistencia INT,
	@CodigoProducto VARCHAR(20),
	@IdCategoria INT
	AS
BEGIN

	UPDATE Productos
	SET
		NombreProducto = @NombreProducto,
		PrecioUnidad = @PrecioUnidad,
		PrecioVenta = @PrecioVenta,
		UnidadesEnExistencia = @UnidadesEnExistencia,
		CodigoProducto = @CodigoProducto,
		IdCategoria = @IdCategoria 
	WHERE
		Id = @Id
END
GO

CREATE OR ALTER PROCEDURE SP_Eliminar_Producto
	@Id INT
	AS
BEGIN

	DELETE FROM Productos WHERE Id = @Id

END
GO 

EXEC SP_Guardar_Producto
	@NombreProducto = 'Galleta Pozuelo Cremas Choy´s',
	@PrecioUnidad = '1070.00',
	@PrecioVenta = '1570.00',
	@UnidadesEnExistencia = 25 ,
	@CodigoProducto = 'gpc2ax',
	@IdCategoria =  4
GO


EXEC SP_Guardar_Producto
	@NombreProducto = 'ARROZ TIO PELON NEGRO 99% GRANO ENTERO 1,8kg',
	@PrecioUnidad = '1070.00',
	@PrecioVenta = '1570.00',
	@UnidadesEnExistencia = 35 ,
	@CodigoProducto = 'ATP18KG',
	@IdCategoria =  4
GO

EXEC SP_Listar_Producto;