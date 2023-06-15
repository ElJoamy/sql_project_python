CREATE DATABASE IF NOT EXISTS DbOficial;
USE DbOficial;

CREATE TABLE IF NOT EXISTS Departamentos (
  id_departamento INT PRIMARY KEY AUTO_INCREMENT,
  nombre_departamento VARCHAR(100),
  ubicacion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Categorias (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nombre_categoria VARCHAR(100),
  descripcion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Articulos (
  id_articulo INT PRIMARY KEY AUTO_INCREMENT,
  nombre_articulo VARCHAR(100),
  id_categoria INT,
  cantidad_disponible INT,
  precio_unitario DECIMAL(10,2),
  FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE IF NOT EXISTS Usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre_usuario VARCHAR(100),
  departamento_id INT,
  FOREIGN KEY (departamento_id) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE IF NOT EXISTS TiposMovimientos (
  id_tipo_movimiento INT PRIMARY KEY AUTO_INCREMENT,
  nombre_tipo_movimiento VARCHAR(100),
  descripcion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Movimientos (
  id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
  id_articulo INT,
  id_usuario INT,
  id_tipo_movimiento INT,
  cantidad INT,
  fecha_movimiento DATE,
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo),
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
  FOREIGN KEY (id_tipo_movimiento) REFERENCES TiposMovimientos(id_tipo_movimiento)
);

CREATE TABLE IF NOT EXISTS Proveedores (
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
  nombre_proveedor VARCHAR(100),
  ubicacion VARCHAR(100),
  telefono VARCHAR(20),
  localidad VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Compras (
  id_compra INT PRIMARY KEY AUTO_INCREMENT,
  id_proveedor INT,
  id_articulo INT,
  cantidad INT,
  precio_unitario DECIMAL(10,2),
  fecha_compra DATE,
  FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor),
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo)
);

CREATE TABLE IF NOT EXISTS Consumos (
  id_consumo INT PRIMARY KEY AUTO_INCREMENT,
  id_articulo INT,
  id_usuario INT,
  cantidad INT,
  fecha_consumo DATE,
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo),
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS Marcas (
  id_marca INT PRIMARY KEY AUTO_INCREMENT,
  nombre_marca VARCHAR(100),
  descripcion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Modelos (
  id_modelo INT PRIMARY KEY AUTO_INCREMENT,
  nombre_modelo VARCHAR(100),
  id_marca INT,
  FOREIGN KEY (id_marca) REFERENCES Marcas(id_marca)
);

CREATE TABLE IF NOT EXISTS Clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nombre_cliente VARCHAR(100),
  apellido_m VARCHAR(100),
  apellido_p VARCHAR(100),
  telefono VARCHAR(20),
  ciudad VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Ventas (
  id_venta INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente INT,
  fecha_venta DATE,
  monto_total DECIMAL(10,2),
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE IF NOT EXISTS DetalleVentas (
  id_detalle INT PRIMARY KEY AUTO_INCREMENT,
  id_venta INT,
  id_articulo INT,
  cantidad INT,
  precio_unitario DECIMAL(10,2),
  FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo)
);

CREATE TABLE IF NOT EXISTS MarcasArticulos (
  id_marca INT,
  id_articulo INT,
  PRIMARY KEY (id_marca, id_articulo),
  FOREIGN KEY (id_marca) REFERENCES Marcas(id_marca),
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo)
);

CREATE TABLE IF NOT EXISTS UsuariosDepartamentos (
  id_usuario INT,
  id_departamento INT,
  PRIMARY KEY (id_usuario, id_departamento),
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
  FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE IF NOT EXISTS ProveedoresArticulos (
  id_proveedor INT,
  id_articulo INT,
  PRIMARY KEY (id_proveedor, id_articulo),
  FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor),
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo)
);

CREATE VIEW VistaCantidadArticulos AS
SELECT A.id_articulo, A.nombre_articulo, A.cantidad_disponible AS cantidad_anterior,
       (A.cantidad_disponible - COALESCE(SUM(C.cantidad), 0)) AS cantidad_actual
FROM Articulos A
LEFT JOIN Consumos C ON A.id_articulo = C.id_articulo
GROUP BY A.id_articulo;

CREATE TABLE IF NOT EXISTS Aviso_Proveedor (
  id_aviso INT PRIMARY KEY AUTO_INCREMENT,
  telefono_proveedor VARCHAR(20),
  id_articulo INT,
  mensaje VARCHAR(100)
);

-- Creación de la tabla Auditoria_Articulos
CREATE TABLE IF NOT EXISTS Auditoria_Articulos (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  id_articulo INT,
  nombre_articulo VARCHAR(100),
  id_categoria INT,
  cantidad_disponible INT,
  precio_unitario DECIMAL(10,2),
  fecha_modificacion TIMESTAMP,
  accion VARCHAR(10),
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo),
  FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

-- Creación de la tabla Auditoria_Usuarios
CREATE TABLE IF NOT EXISTS Auditoria_Usuarios (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT,
  nombre_usuario VARCHAR(100),
  departamento_id INT,
  fecha_modificacion TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
  FOREIGN KEY (departamento_id) REFERENCES Departamentos(id_departamento)
);

-- Creación de la tabla Auditoria_Compras
CREATE TABLE IF NOT EXISTS Auditoria_Compras (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  id_compra INT,
  id_proveedor INT,
  id_articulo INT,
  cantidad INT,
  precio_unitario DECIMAL(10,2),
  fecha_compra TIMESTAMP,
  FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
  FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor),
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo)
);

-- Creación de la tabla Auditoria_Ventas
CREATE TABLE IF NOT EXISTS Auditoria_Ventas (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  id_venta INT,
  id_cliente INT,
  fecha_venta TIMESTAMP,
  monto_total DECIMAL(10,2),
  FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Creación de la tabla Auditoria_DetalleVentas
CREATE TABLE IF NOT EXISTS Auditoria_DetalleVentas (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  id_detalle INT,
  id_venta INT,
  id_articulo INT,
  cantidad INT,
  precio_unitario DECIMAL(10,2),
  FOREIGN KEY (id_detalle) REFERENCES DetalleVentas(id_detalle),
  FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo)
);

-- Creación de la tabla Auditoria_MarcasArticulos
CREATE TABLE IF NOT EXISTS Auditoria_MarcasArticulos (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  id_marca INT,
  id_articulo INT,
  fecha_modificacion TIMESTAMP,
  FOREIGN KEY (id_marca) REFERENCES Marcas(id_marca),
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo)
);

-- Creación de la tabla Auditoria_UsuariosDepartamentos
CREATE TABLE IF NOT EXISTS Auditoria_UsuariosDepartamentos (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT,
  id_departamento INT,
  fecha_modificacion TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
  FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

-- Creación de la tabla Auditoria_ProveedoresArticulos
CREATE TABLE IF NOT EXISTS Auditoria_ProveedoresArticulos (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  id_proveedor INT,
  id_articulo INT,
  fecha_modificacion TIMESTAMP,
  FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor),
  FOREIGN KEY (id_articulo) REFERENCES Articulos(id_articulo)
);


CREATE INDEX idx_articulos_id_articulo ON Articulos (id_articulo);

CREATE INDEX idx_usuarios_nombre_usuario ON Usuarios (nombre_usuario);

CREATE INDEX idx_movimientos_id_usuario_fecha_movimiento ON Movimientos (id_usuario, fecha_movimiento);

CREATE INDEX idx_compras_id_proveedor ON Compras (id_proveedor);

CREATE INDEX idx_ventas_id_cliente ON Ventas (id_cliente);

CREATE INDEX idx_detalleventas_id_venta ON DetalleVentas (id_venta);

CREATE INDEX idx_marcasarticulos_id_marca ON MarcasArticulos (id_marca);

DELIMITER $$

CREATE PROCEDURE GetCantidadDisponibleByNombre(IN articulo_nombre VARCHAR(100), OUT cantidad_disponible INT)
BEGIN
  SELECT cantidad_disponible INTO cantidad_disponible
  FROM Articulos
  WHERE nombre_articulo = articulo_nombre;
END$$

CREATE PROCEDURE GetMontoTotalVentaByID(IN venta_id INT, OUT monto_total DECIMAL(10,2))
BEGIN
  SELECT monto_total INTO monto_total
  FROM Ventas
  WHERE id_venta = venta_id;
END$$

CREATE PROCEDURE GetNombreCategoriaByID(IN categoria_id INT, OUT nombre_categoria VARCHAR(100))
BEGIN
  SELECT nombre_categoria INTO nombre_categoria
  FROM Categorias
  WHERE id_categoria = categoria_id;
END$$

CREATE PROCEDURE GetNombreMarcaByID(IN marca_id INT, OUT nombre_marca VARCHAR(100))
BEGIN
  SELECT nombre_marca INTO nombre_marca
  FROM Marcas
  WHERE id_marca = marca_id;
END$$

CREATE PROCEDURE filtrar_proveedores(
  IN p_nombre VARCHAR(100),
  IN p_ubicacion VARCHAR(100),
  IN p_telefono VARCHAR(20),
  IN p_localidad VARCHAR(100)
)
BEGIN
  SET @query = 'SELECT * FROM Proveedores WHERE 1=1'; 

  IF p_nombre IS NOT NULL THEN
    SET @query = CONCAT(@query, ' AND nombre_proveedor LIKE \'%', p_nombre, '%\'');
  END IF;

  IF p_ubicacion IS NOT NULL THEN
    SET @query = CONCAT(@query, ' AND ubicacion LIKE \'%', p_ubicacion, '%\'');
  END IF;

  IF p_telefono IS NOT NULL THEN
    SET @query = CONCAT(@query, ' AND telefono LIKE \'%', p_telefono, '%\'');
  END IF;

  IF p_localidad IS NOT NULL THEN
    SET @query = CONCAT(@query, ' AND localidad LIKE \'%', p_localidad, '%\'');
  END IF;

  PREPARE stmt FROM @query;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

-- para probar el filtrado de proveedores ejecutar:
-- CALL filtrar_proveedores('a', 'a', 'a', 'a');

CREATE PROCEDURE filtrar_personas(
  IN p_nombre VARCHAR(100),
  IN p_apellido VARCHAR(100),
  IN p_telefono VARCHAR(20),
  IN p_ciudad VARCHAR(100),
  IN p_email VARCHAR(100)
)
BEGIN
  SET @query = 'SELECT * FROM Clientes WHERE 1=1'; 

  IF p_nombre IS NOT NULL THEN
    SET @query = CONCAT(@query, ' AND nombre_cliente LIKE \'%', p_nombre, '%\'');
  END IF;

  IF p_apellido IS NOT NULL THEN
    SET @query = CONCAT(@query, ' AND (apellido_m LIKE \'%', p_apellido, '%\' OR apellido_p LIKE \'%', p_apellido, '%\')');
  END IF;

  IF p_telefono IS NOT NULL THEN
    SET @query = CONCAT(@query, ' AND telefono LIKE \'%', p_telefono, '%\'');
  END IF;

  IF p_ciudad IS NOT NULL THEN
    SET @query = CONCAT(@query, ' AND ciudad LIKE \'%', p_ciudad, '%\'');
  END IF;

  IF p_email IS NOT NULL THEN
    SET @query = CONCAT(@query, ' AND email LIKE \'%', p_email, '%\'');
  END IF;

  PREPARE stmt FROM @query;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

CREATE TRIGGER triger_articulos_menos_items
BEFORE INSERT ON Articulos
FOR EACH ROW
BEGIN
  IF NEW.cantidad_disponible < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No puede haber menos items de los que haya';
  END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER triger_usuarios
BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
  IF NEW.email NOT LIKE '%@%' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El email debe contener un @';
  END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER triger_usuarios_update
BEFORE UPDATE ON Clientes
FOR EACH ROW
BEGIN
  IF NEW.email NOT LIKE '%@%' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El email debe contener un @';
  END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER triger_compras
BEFORE UPDATE ON Compras
FOR EACH ROW
BEGIN
  IF NEW.fecha_compra < OLD.fecha_compra THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La fecha debe ser mayor o igual a la fecha existente';
  END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER triger_articulos
BEFORE UPDATE ON Articulos
FOR EACH ROW
BEGIN
  IF NEW.precio_unitario < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El precio unitario no puede ser menor a cero';
  END IF;
END$$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER trigger_verificar_cantidad_minima
AFTER UPDATE ON Articulos
FOR EACH ROW
BEGIN
  DECLARE cantidad_minima INT;
  DECLARE proveedor_telefono VARCHAR(20);
  DECLARE mensaje VARCHAR(100);
  
  SET cantidad_minima = 10;
  
  IF NEW.cantidad_disponible < cantidad_minima THEN
    SELECT telefono INTO proveedor_telefono
    FROM Proveedores
    WHERE id_proveedor IN (
      SELECT id_proveedor
      FROM ProveedoresArticulos
      WHERE id_articulo = NEW.id_articulo
    );
    
    IF proveedor_telefono IS NOT NULL THEN
      SET mensaje = CONCAT('El artículo con ID ', NEW.id_articulo, ' está en una cantidad mínima. Por favor enviar más.');
      
      INSERT INTO Aviso_Proveedor (telefono_proveedor, id_articulo, mensaje)
      VALUES (proveedor_telefono, NEW.id_articulo, mensaje);
    END IF;
  END IF;
END$$

CREATE TRIGGER triger_actualizar_fecha_modificacion
BEFORE UPDATE ON Articulos
FOR EACH ROW
BEGIN
  SET NEW.fecha_modificacion = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER triger_calcular_monto_total_venta
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
  DECLARE total DECIMAL(10, 2);
  
  SET total = (
    SELECT SUM(d.cantidad * a.precio_unitario)
    FROM DetalleVentas d
    INNER JOIN Articulos a ON d.id_articulo = a.id_articulo
    WHERE d.id_venta = NEW.id_venta
  );
  
  SET NEW.monto_total = total;
END$$

CREATE TRIGGER triger_auditar_articulos
AFTER UPDATE ON Articulos
FOR EACH ROW
BEGIN
  DECLARE accion VARCHAR(10);
  SET accion = 'UPDATE';

  INSERT INTO Auditoria_Articulos (id_articulo, nombre_articulo, cantidad_disponible, precio_unitario, accion, fecha_modificacion)
  VALUES (OLD.id_articulo, OLD.nombre_articulo, NEW.cantidad_disponible, NEW.precio_unitario, accion, CURRENT_TIMESTAMP);
END$$

CREATE TRIGGER triger_auditar_usuarios
AFTER UPDATE ON Usuarios
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Usuarios (id_usuario, nombre_usuario, departamento_id, fecha_modificacion)
  VALUES (NEW.id_usuario, NEW.nombre_usuario, NEW.departamento_id, CURRENT_TIMESTAMP);
END$$

CREATE TRIGGER triger_auditar_compras
AFTER UPDATE ON Compras
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Compras (id_compra, id_proveedor, id_articulo, cantidad, precio_unitario, fecha_compra)
  VALUES (NEW.id_compra, NEW.id_proveedor, NEW.id_articulo, NEW.cantidad, NEW.precio_unitario, NEW.fecha_compra);
END$$

CREATE TRIGGER triger_auditar_ventas
AFTER UPDATE ON Ventas
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Ventas (id_venta, id_cliente, fecha_venta, monto_total)
  VALUES (NEW.id_venta, NEW.id_cliente, NEW.fecha_venta, NEW.monto_total);
END$$

CREATE TRIGGER triger_auditar_detalle_ventas
AFTER UPDATE ON DetalleVentas
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_DetalleVentas (id_detalle, id_venta, id_articulo, cantidad, precio_unitario)
  VALUES (NEW.id_detalle, NEW.id_venta, NEW.id_articulo, NEW.cantidad, NEW.precio_unitario);
END$$

CREATE TRIGGER triger_auditar_marcas_articulos
AFTER UPDATE ON MarcasArticulos
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_MarcasArticulos (id_marca, id_articulo, fecha_modificacion)
  VALUES (NEW.id_marca, NEW.id_articulo, CURRENT_TIMESTAMP);
END$$

CREATE TRIGGER triger_auditar_usuarios_departamentos
AFTER UPDATE ON UsuariosDepartamentos
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_UsuariosDepartamentos (id_usuario, id_departamento, fecha_modificacion)
  VALUES (NEW.id_usuario, NEW.id_departamento, CURRENT_TIMESTAMP);
END$$

CREATE TRIGGER triger_auditar_proveedores_articulos
AFTER UPDATE ON ProveedoresArticulos
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_ProveedoresArticulos (id_proveedor, id_articulo, fecha_modificacion)
  VALUES (NEW.id_proveedor, NEW.id_articulo, CURRENT_TIMESTAMP);
END$$

DELIMITER ;