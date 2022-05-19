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
	Contrase�a VARCHAR(10) NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Login PRIMARY KEY(Id)
);
GO

--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> LOGIN
--=============================================================================================

CREaTE OR ALTER PROCEDURE SP_Listar_Login
	AS
BEGIN	

	SELECT Id, Usuario, Contrase�a FROM Login

END
GO


CREATE OR ALTER PROCEDURE SP_Guardar_Login
	@Usuario VARCHAR(10),
	@Contrase�a VARCHAR(10)
	AS
BEGIN
	
	INSERT INTO Login( Usuario, Contrase�a)
	VALUES(@Usuario, @Contrase�a)

END
GO


CREATE OR ALTER PROCEDURE SP_Actualizar_Login
	@Id INT,
	@Usuario VARCHAR(10),
	@Contrase�a VARCHAR(10)
	AS
BEGIN

	UPDATE Login
	SET

		Usuario = @Usuario, 
		Contrase�a = @Contrase�a
		
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
	@Contrase�a = 'andy123'
GO

SELECT * FROM Login;

--=============================================================================================
-- TABLA -> CATEGORIA
--=============================================================================================

CREATE TABLE Categorias(
	Id INT IDENTITY(1,1),
	NombreCategoria VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Categoria PRIMARY KEY(Id)
);
GO

--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> CATEGORIA
--=============================================================================================

CREATE PROCEDURE SP_Listar_Categoria
	AS
BEGIN	

	SELECT Id, NombreCategoria, Descripcion FROM Categorias

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


CREATE PROCEDURE SP_Actualizar_Categoria
	@Id INT,
	@NombreCategoria VARCHAR(20),
	@Descripcion VARCHAR(100)
	AS
BEGIN

	UPDATE Categorias
	SET

		NombreCategoria = @NombreCategoria, 
		Descripcion = @Descripcion
		
	WHERE
		Id = @Id
END
GO


CREATE PROCEDURE SP_Eliminar_Categoria
	@Id INT
	AS
BEGIN

	DELETE FROM Categorias WHERE Id = @Id

END
GO 

EXEC SP_Guardar_Categoria
	@NombreCategoria = 'Bebidas',
	@Descripcion = 'Gaseosas, Caf�, t�, cervezas y maltas'
GO

EXEC SP_Guardar_Categoria
	@NombreCategoria = 'Lacteos',
	@Descripcion = 'Quesos'
GO

EXEC SP_Guardar_Categoria
	@NombreCategoria = 'Pescado/Marsicos',
	@Descripcion = 'Pescados, mariscos y algas'
GO

EXEC SP_Listar_Categoria
GO


--=============================================================================================
-- TABLA -> PROVEEDORES
--=============================================================================================

CREATE TABLE Proveedores(
	Id INT IDENTITY(1,1),
	Compa�ia VARCHAR(20) NOT NULL,
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

	SELECT Id, Compa�ia, NombreRepresentante, Telefono FROM Proveedores

END
GO


CREATE OR ALTER PROCEDURE SP_Guardar_Proveedores
	@Compa�ia VARCHAR(20), 
	@NombreRepresentante VARCHAR(20),
	@Telefono VARCHAR(20)
	AS
BEGIN
	
	INSERT INTO Proveedores(Compa�ia, NombreRepresentante, Telefono)
	VALUES(@Compa�ia, @NombreRepresentante, @Telefono)

END
GO


CREATE OR ALTER PROCEDURE SP_Actualizar_Proveedores
	@Id INT,
	@Compa�ia VARCHAR(20), 
	@NombreRepresentante VARCHAR(20),
	@Telefono VARCHAR(20)
	AS
BEGIN

	UPDATE Proveedores
	SET
		Compa�ia = @Compa�ia, 
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
	@Compa�ia = 'Coca Cola', 
	@NombreRepresentante = 'Veronica Perez',
	@Telefono = '2209-8912'
GO

EXEC SP_Guardar_Proveedores
	@Compa�ia = 'Pozuelo', 
	@NombreRepresentante = 'Samuel Gomez',
	@Telefono = '2288-1234'
GO

EXEC SP_Guardar_Proveedores
	@Compa�ia = 'Tio Pelon', 
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
	NombreProducto VARCHAR(20) NOT NULL,
	PrecioUnidad decimal(10,2) NOT NULL,
	PrecioVenta decimal(10,2) NOT NULL,
	UnidadesEnExistencia INT NOT NULL,
	CodigoProducto VARCHAR(20) NOT NULL,
	CategoriaConProductoId INT NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Producto PRIMARY KEY(Id),
	CONSTRAINT FK_Producto_Categoria FOREIGN KEY(CategoriaConProductoId) REFERENCES Categorias(Id)
);
GO



SELECT * FROM Productos;