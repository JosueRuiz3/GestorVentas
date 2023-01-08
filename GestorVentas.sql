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

EXEC SP_Listar_Usuarios;

--=============================================================================================
-- TABLA -> LOGIN
--=============================================================================================

CREATE TABLE Login(
	Id INT IDENTITY(1,1),
	Usuario VARCHAR(10) NOT NULL,
	Contrasena VARCHAR(10) NOT NULL,

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

	SELECT Id, Usuario, Contrasena FROM Login

END
GO


CREATE OR ALTER PROCEDURE SP_Guardar_Login
	@Usuario VARCHAR(10),
	@Contrasena VARCHAR(10)
	AS
BEGIN
	
	INSERT INTO Login( Usuario, Contrasena)
	VALUES(@Usuario, @Contrasena)

END
GO


CREATE OR ALTER PROCEDURE SP_Actualizar_Login
	@Id INT,
	@Usuario VARCHAR(10),
	@Contrasena VARCHAR(10)
	AS
BEGIN

	UPDATE Login
	SET

		Usuario = @Usuario, 
		Contrasena = @Contrasena
		
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
	@Contrasena = 'andy123'
GO

EXEC SP_Listar_Login;

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
	Compania VARCHAR(20) NOT NULL,
	NombreRepresentante VARCHAR(20) NOT NULL,
	Telefono VARCHAR(20) NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Proveedores PRIMARY KEY(IdProveedor)
);


--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> PROVEEDORES
--=============================================================================================

CREATE PROCEDURE SP_Listar_Proveedores
	AS
BEGIN	

	SELECT IdProveedor, Compania, NombreRepresentante, Telefono FROM Proveedores

END
GO


CREATE OR ALTER PROCEDURE SP_Guardar_Proveedores
	@Compania VARCHAR(20), 
	@NombreRepresentante VARCHAR(20),
	@Telefono VARCHAR(20)
	AS
BEGIN
	
	INSERT INTO Proveedores(Compania, NombreRepresentante, Telefono)
	VALUES(@Compania, @NombreRepresentante, @Telefono)

END
GO


CREATE OR ALTER PROCEDURE SP_Actualizar_Proveedores
	@IdProveedor INT,
	@Compania VARCHAR(20), 
	@NombreRepresentante VARCHAR(20),
	@Telefono VARCHAR(20)
	AS
BEGIN

	UPDATE Proveedores
	SET
		Compania = @Compania, 
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
	@Compania = 'Coca Cola', 
	@NombreRepresentante = 'Veronica Perez',
	@Telefono = '2209-8912'
GO


EXEC SP_Guardar_Proveedores
	@Compania = 'Pozuelo', 
	@NombreRepresentante = 'Samuel Gomez',
	@Telefono = '2288-1234'
GO

EXEC SP_Guardar_Proveedores
	@Compania = 'Tio Pelon', 
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

--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> PRODUCTOS
--=============================================================================================

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
	pr.IdProveedor, pr.Compania[ComProveedor]

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

--=============================================================================================
-- TABLA -> CLIENTES
--=============================================================================================

CREATE TABLE Clientes(
	IdCliente INT IDENTITY(1,1),
	Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR(20) NOT NULL,
	Direccion VARCHAR(50) NOT NULL,
	Telefono VARCHAR(20) NOT NULL,
	Fax VARCHAR(20) NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Cliente PRIMARY KEY(IdCliente)
);
GO

--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> CLIENTES
--=============================================================================================

CREATE OR ALTER PROCEDURE SP_Listar_Clientes
	AS
BEGIN	

	SELECT IdCliente, Nombre, Apellido, Direccion, Telefono, Fax FROM Clientes

END
GO


CREATE OR ALTER PROCEDURE SP_Guardar_Clientes
	@Nombre VARCHAR(20), 
	@Apellido VARCHAR(20),
	@Direccion VARCHAR(50),
	@Telefono VARCHAR(20),
	@Fax VARCHAR(20)

	AS
BEGIN
	
	INSERT INTO Clientes(Nombre, Apellido, Direccion, Telefono, Fax)
	VALUES(@Nombre, @Apellido, @Direccion, @Telefono, @Fax)

END
GO


CREATE OR ALTER PROCEDURE SP_Actualizar_Clientes
	@IdCliente INT,
	@Nombre VARCHAR(20), 
	@Apellido VARCHAR(20),
	@Direccion VARCHAR(50),
	@Telefono VARCHAR(20),
	@Fax VARCHAR(20)
	AS
BEGIN

	UPDATE Clientes
	SET
		Nombre = @Nombre, 
		Apellido = @Apellido, 
		Direccion = @Direccion, 
		Telefono = @Telefono,
		Fax = @Fax
	WHERE
		IdCliente = @IdCliente
END
GO


CREATE OR ALTER PROCEDURE SP_Eliminar_Clientes
	@IdCliente INT
	AS
BEGIN

	DELETE FROM Clientes WHERE IdCliente = @IdCliente

END
GO 


EXEC SP_Guardar_Clientes
	@Nombre = 'Veronica', 
	@Apellido = 'Perez',
	@Direccion = 'Samara',
	@Telefono  = '7623-0923',
	@Fax  = '7623-0923'
GO

EXEC SP_Listar_Clientes;


--=============================================================================================
-- TABLA -> FACTURACION
--=============================================================================================

CREATE TABLE Facturacion(
	IdFacturacion INT IDENTITY(1,1),
	ClienteId INT,
	NumDocumento VARCHAR(50),
	DocCliente VARCHAR(50),
	MontoPagoCon DECIMAL(10,2),
	MontoCambio DECIMAL(10,2),
	MontoSubTotal DECIMAL(10,2),
	MontoIVA DECIMAL(10,2),
	MontoTotal DECIMAL(10,2),

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Facturacion PRIMARY KEY(IdFacturacion)
);
GO


--=============================================================================================
-- TABLA -> DetalleVenta
--=============================================================================================

CREATE TABLE DetalleVenta(
	IdDatelleVenta INT IDENTITY(1,1),
	FacturacionId INT,
	ProductoId INT,
	ClienteId INT,
	PrecioVenta DECIMAL(10,2),
	Cantidad INT,
	TOTAL DECIMAL(10,2),

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_DetalleVenta PRIMARY KEY(IdDatelleVenta)
)
GO



--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> REGISTAR VENTA
--=============================================================================================

CREATE PROCEDURE SP_Registrar_Venta(
	@Venta_xml XML,
	@NroDocumento VARCHAR(6) OUTPUT
	)
	AS
BEGIN
	
	DECLARE @facturacion TABLE(
		ClienteId INT,
		NumDocumento VARCHAR(50),
		DocCliente VARCHAR(50),
		MontoPagoCon DECIMAL(10,2),
		MontoCambio DECIMAL(10,2),
		MontoSubTotal DECIMAL(10,2),
		MontoIVA DECIMAL(10,2),
		MontoTotal DECIMAL(10,2)
	)

	DECLARE @detalleVenta TABLE(
		FacturacionId INT,
		ProductoId INT,
		ClienteId INT,
		PrecioVenta DECIMAL(10,2),
		Cantidad INT,
		TOTAL DECIMAL(10,2)
	)

	BEGIN TRY
		BEGIN TRANSACTION

		INSERT INTO @facturacion(ClienteId, NumDocumento, DocCliente, MontoPagoCon, MontoCambio, MontoSubTotal, MontoIVA, MontoTotal)
		SELECT 
			nodo.elemento.value('ClienteId[1]','INT') AS ClienteId,
			nodo.elemento.value('NumDocumento[1]','VARCHAR(50)') AS NumDocumento,
			nodo.elemento.value('DocCliente[1]','VARCHAR(50) ') AS DocCliente,
			nodo.elemento.value('MontoPagoCon[1]','DECIMAL(10,2)') AS MontoPagoCon,
			nodo.elemento.value('MontoCambio[1]','DECIMAL(10,2)') AS MontoCambio,
			nodo.elemento.value('MontoSubTotal[1]','DECIMAL(10,2)') AS MontoSubTotal,
			nodo.elemento.value('MontoIVA[1]','DECIMAL(10,2)') AS MontoIVA,
			nodo.elemento.value('MontoTotal[1]','DECIMAL(10,2)') AS MontoTotal
		FROM @Venta_xml.nodes('Facturacion') nodo(elemento)

		INSERT INTO @detalleVenta(FacturacionId, ProductoId, ClienteId, PrecioVenta, Cantidad, TOTAL)
		SELECT 
			nodo.elemento.value('FacturacionId[1]','INT') AS FacturacionId,
			nodo.elemento.value('ProductoId[1]','INT') AS ProductoId,
			nodo.elemento.value('ClienteId[1]','INT') AS ClienteId,
			nodo.elemento.value('PrecioVenta[1]','DECIMAL(10,2)') AS PrecioVenta,
			nodo.elemento.value('Cantidad[1]','INT') AS Cantidad,
			nodo.elemento.value('TOTAL[1]','DECIMAL(10,2)') AS TOTAL
		FROM @Venta_xml.nodes('Facturacion/DetalleVenta/Item') nodo(elemento)

		--================================================
		-- EMPIEZA EL REGISTRO DE LA VENTA
		--================================================
		DECLARE @identity AS TABLE(ID INT)
		DECLARE @id INT = (SELECT ISNULL(MAX(IdFacturacion), 0) + 1 FROM Facturacion)
		DECLARE @tempnrodocumento VARCHAR(50) = RIGHT('000000' + CONVERT(VARCHAR(MAX), @id), 6)

		INSERT INTO Facturacion(ClienteId, NumDocumento, DocCliente, MontoPagoCon, MontoCambio, MontoSubTotal, MontoIVA, MontoTotal)
		OUTPUT inserted.IdFacturacion INTO @identity
		SELECT ClienteId, @tempnrodocumento, DocCliente, MontoPagoCon, MontoCambio, MontoSubTotal, MontoIVA, MontoTotal FROM @facturacion

		UPDATE @detalleVenta SET FacturacionId = (SELECT ID FROM @identity)

		INSERT INTO DetalleVenta(FacturacionId, ProductoId, ClienteId,PrecioVenta, Cantidad, TOTAL)
		SELECT FacturacionId, ProductoId, ClienteId,PrecioVenta, Cantidad, TOTAL FROM @detalleVenta

		UPDATE p SET p.UnidadesEnExistencia = p.UnidadesEnExistencia - dv.Cantidad FROM Productos p
		INNER JOIN @detalleVenta dv ON  dv.FacturacionId = p.IdProducto

		COMMIT 
		SET @NroDocumento = @tempnrodocumento

	END TRY
	BEGIN CATCH
		ROLLBACK
		SET @NroDocumento = ''
	END CATCH

END

GO

SELECT * FROM Facturacion;