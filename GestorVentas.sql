--CREATE DATABASE GestorVentas;

--USE GestorVentas;
--GO

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
-- TABLA -> PROVEEDORES
--=============================================================================================
CREATE TABLE Proveedores(
	IdProveedor INT IDENTITY(1,1),
	Compania VARCHAR(20) NOT NULL,
	NombreRepresentante VARCHAR(20) NOT NULL,
	Telefono VARCHAR(20) NOT NULL,

	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL

	CONSTRAINT PK_Proveedores PRIMARY KEY(IdProveedor)
)
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
