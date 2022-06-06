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

CREATE PROCEDURE SP_Listar_Categoria
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


CREATE PROCEDURE SP_Actualizar_Categoria
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


CREATE PROCEDURE SP_Eliminar_Categoria
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
	IdProveedor INT IDENTITY(1,1),
	Compañia VARCHAR(20) NOT NULL,
	NombreRepresentante VARCHAR(20) NOT NULL,
	Telefono VARCHAR(20) NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Proveedores PRIMARY KEY(IdProveedor)
);


--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> PROVEEDORES
--=============================================================================================

CREATE OR ALTER PROCEDURE SP_Listar_Proveedores
	AS
BEGIN	

	SELECT IdProveedor, Compañia, NombreRepresentante, Telefono FROM Proveedores

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
	@IdProveedor INT,
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
		IdProveedor = @IdProveedor
END
GO


CREATE OR ALTER PROCEDURE SP_Eliminar_Proveedores
	@IdProveedor INT
	AS
BEGIN

	DELETE FROM Proveedores WHERE IdProveedor = @IdProveedor

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
	IdProducto INT IDENTITY(1,1),
	Codigo VARCHAR(100),
	IdCategoria INT,
	NombreProducto VARCHAR(100),
	PrecioCompra DECIMAL(10,2),
	PrecioVenta DECIMAL(10,2),
	UnidadesEnExistencia  INT,
	IdProveedor INT, 

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Producto PRIMARY KEY(IdProducto)
)
GO


CREATE OR ALTER PROCEDURE SP_Listar_Productos
	AS
BEGIN	
	SELECT  
	p.IdProducto,
	p.Codigo,
	c.IdCategoria,c.Descripcion[DesCategoria],
	p.NombreProducto,
	p.PrecioCompra,
	p.PrecioVenta,
	p.UnidadesEnExistencia,
	pr.IdProveedor, pr.Compañia[ComProveedor]

	FROM  Productos p
	INNER JOIN Categorias c ON c.IdCategoria = p.IdCategoria
	INNER JOIN Proveedores pr ON pr.IdProveedor = p.IdProveedor
	ORDER BY p.IdProducto DESC
END
GO


CREATE OR ALTER PROCEDURE SP_Guardar_Producto
	@Codigo VARCHAR(100),
	@IdCategoria INT,
	@NombreProducto VARCHAR(100),
	@PrecioCompra DECIMAL(10,2),
	@PrecioVenta DECIMAL(10,2),
	@UnidadesEnExistencia  INT,
	@IdProveedor INT
	AS

BEGIN
	
	INSERT INTO Productos(Codigo,IdCategoria,NombreProducto,PrecioCompra,PrecioVenta,UnidadesEnExistencia, IdProveedor) 
	VALUES(@Codigo,@IdCategoria,@NombreProducto,@PrecioCompra,@PrecioVenta,@UnidadesEnExistencia, @IdProveedor)

END
GO


CREATE OR ALTER PROCEDURE SP_Editar_Producto
	@IdProducto INT,
	@Codigo VARCHAR(100),
	@IdCategoria INT,
	@NombreProducto VARCHAR(100),
	@PrecioCompra DECIMAL(10,2),
	@PrecioVenta DECIMAL(10,2),
	@UnidadesEnExistencia  INT,
	@IdProveedor INT
	AS

BEGIN
	UPDATE Productos set Codigo = @Codigo, IdCategoria = @IdCategoria, NombreProducto = @NombreProducto, PrecioCompra = @PrecioCompra,
	PrecioVenta = @PrecioVenta, UnidadesEnExistencia = @UnidadesEnExistencia, IdProveedor = @IdProveedor WHERE IdProducto = @IdProducto

END
GO


CREATE OR ALTER PROCEDURE SP_Eliminar_Producto
	@IdProducto INT
	AS
BEGIN

	DELETE FROM Productos WHERE IdProducto = @IdProducto

END
GO 


EXEC SP_Guardar_Producto
	@Codigo = 'gpc2ax',
	@IdCategoria =  4,
	@NombreProducto = 'Galleta Pozuelo',
	@PrecioCompra = '1070.00',
	@PrecioVenta = '1570.00',
	@UnidadesEnExistencia = 25,
	@IdProveedor = 2
GO


EXEC SP_Guardar_Producto
	@Codigo = 'ATP18KG',
	@IdCategoria =  4,
	@NombreProducto = 'ARROZ TIO PELON',
	@PrecioCompra = '1070.00',
	@PrecioVenta = '1570.00',
	@UnidadesEnExistencia = 35,
	@IdProveedor = 3
GO

EXEC SP_Listar_Productos;