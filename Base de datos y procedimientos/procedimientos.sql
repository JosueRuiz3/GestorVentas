--=============================================================================================
-- PROCEDIMIENTOS ALMACENADOS -> USUARIOS
--=============================================================================================
CREATE PROCEDURE SP_Listar_Usuarios
	AS
BEGIN	

	SELECT Id, Nombre, Apellido, Direccion, Telefono FROM Usuarios

END
GO


CREATE PROCEDURE SP_Guardar_Usuarios
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

CREATE PROCEDURE SP_Actualizar_Usuarios
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


CREATE PROCEDURE SP_Eliminar_Usuarios
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
-- PROCEDIMIENTOS ALMACENADOS -> LOGIN
--=============================================================================================
CREATE PROCEDURE SP_Listar_Login
	AS
BEGIN	

	SELECT Id, Usuario, Contrasena FROM Login

END
GO


CREATE PROCEDURE SP_Guardar_Login
	@Usuario VARCHAR(10),
	@Contrasena VARCHAR(10)
	AS
BEGIN
	
	INSERT INTO Login( Usuario, Contrasena)
	VALUES(@Usuario, @Contrasena)

END
GO


CREATE PROCEDURE SP_Actualizar_Login
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


CREATE PROCEDURE SP_Eliminar_Login
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
-- PROCEDIMIENTOS ALMACENADOS -> PROVEEDORES
--=============================================================================================
CREATE PROCEDURE SP_Listar_Proveedores
	AS
BEGIN	

	SELECT IdProveedor, Compania, NombreRepresentante, Telefono FROM Proveedores

END
GO


CREATE PROCEDURE SP_Guardar_Proveedores
	@Compania VARCHAR(20), 
	@NombreRepresentante VARCHAR(20),
	@Telefono VARCHAR(20)
	AS
BEGIN
	
	INSERT INTO Proveedores(Compania, NombreRepresentante, Telefono)
	VALUES(@Compania, @NombreRepresentante, @Telefono)

END
GO


CREATE PROCEDURE SP_Actualizar_Proveedores
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


CREATE PROCEDURE SP_Eliminar_Proveedores
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
-- PROCEDIMIENTOS ALMACENADOS -> PRODUCTOS
--=============================================================================================
CREATE PROCEDURE SP_Listar_Productos
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


CREATE PROCEDURE SP_Guardar_Producto
	@Codigo VARCHAR(100),
	@IdCategoria INT,
	@NombreProducto VARCHAR(100),
	@PrecioCompra DECIMAL(10,2),
	@PrecioVenta DECIMAL(10,2),
	@UnidadesEnExistencia  INT,
	@IdProveedor INT
	AS

BEGIN
	
	INSERT INTO Productos(Codigo,IdCategoria, NombreProducto, PrecioCompra, PrecioVenta, UnidadesEnExistencia, IdProveedor) 
	VALUES(@Codigo, @IdCategoria, @NombreProducto, @PrecioCompra, @PrecioVenta, @UnidadesEnExistencia, @IdProveedor)

END
GO


CREATE PROCEDURE SP_Editar_Producto
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
	UPDATE Productos SET Codigo = @Codigo, IdCategoria = @IdCategoria, NombreProducto = @NombreProducto, PrecioCompra = @PrecioCompra,
	PrecioVenta = @PrecioVenta, UnidadesEnExistencia = @UnidadesEnExistencia, IdProveedor = @IdProveedor WHERE IdProducto = @IdProducto

END
GO


CREATE PROCEDURE SP_Eliminar_Producto
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
-- PROCEDIMIENTOS ALMACENADOS -> CLIENTES
--=============================================================================================

CREATE PROCEDURE SP_Listar_Clientes
	AS
BEGIN	

	SELECT IdCliente, Nombre, Apellido, Direccion, Telefono, Fax FROM Clientes

END
GO


CREATE PROCEDURE SP_Guardar_Clientes
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


CREATE PROCEDURE SP_Actualizar_Clientes
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


CREATE PROCEDURE SP_Eliminar_Clientes
	@IdCliente INT
	AS
BEGIN

	DELETE FROM Clientes WHERE IdCliente = @IdCliente

END
GO 


EXEC SP_Guardar_Clientes
	@Nombre = 'Josue', 
	@Apellido = 'Ruiz',
	@Direccion = 'Nicoya',
	@Telefono  = '7623-0923',
	@Fax  = '7623-0923'
GO

EXEC SP_Listar_Clientes;

CREATE OR ALTER PROCEDURE SP_RealizarCompras
    @ClienteId INT,
    @ProductoId INT,
    @Cantidad INT,
    @NumDocumento VARCHAR(50),
    @DocCliente VARCHAR(50),
    @MontoPagoCon DECIMAL(10,2),
    @MontoCambio DECIMAL(10,2),
    @MontoSubTotal DECIMAL(10,2),
    @MontoIVA DECIMAL(10,2),
    @MontoTotal DECIMAL(10,2)
AS
BEGIN
    DECLARE @PrecioVenta DECIMAL(10,2)

    -- Get product details
    SELECT @PrecioVenta = PrecioVenta
    FROM Productos
    WHERE IdProducto = @ProductoId

    -- Calculate subtotal, tax, and total
    SET @MontoSubTotal = @PrecioVenta * @Cantidad
    SET @MontoIVA = 0.13 * @MontoSubTotal  -- Assuming 13% tax, adjust as needed
    SET @MontoTo	tal = @MontoSubTotal + @MontoIVA

    -- Insert into Facturacion table
    INSERT INTO Facturacion (ClienteId, NumDocumento, DocCliente, MontoPagoCon, MontoCambio, MontoSubTotal, MontoIVA, MontoTotal, FechaCreacion)
    VALUES (@ClienteId, @NumDocumento, @DocCliente, @MontoPagoCon, @MontoCambio, @MontoSubTotal, @MontoIVA, @MontoTotal, GETDATE())

    -- Get the generated invoice ID
    DECLARE @FacturacionId INT
    SET @FacturacionId = SCOPE_IDENTITY()

    -- Insert into DetalleVenta table
    INSERT INTO DetalleVenta (FacturacionId, ProductoId, ClienteId, PrecioVenta, Cantidad, TOTAL)
    VALUES (@FacturacionId, @ProductoId, @ClienteId, @PrecioVenta, @Cantidad, @MontoTotal)

END
