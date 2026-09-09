-- =========================================================
-- TALLER PRACTICO DE SQL - TechStore
-- Ejercicios 1 a 10 (DDL, DML, DQL, filtros, orden)
-- =========================================================

-- ---------------------------------------------------------
-- EJ. 01 - Construir la base
-- ---------------------------------------------------------
CREATE DATABASE IF NOT EXISTS techstore;
USE techstore;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(60)    NOT NULL,
    categoria   VARCHAR(50)    NOT NULL,
    precio      DECIMAL(10,2)  NOT NULL,
    stock       INT            NOT NULL DEFAULT 0
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre     VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    ciudad     VARCHAR(50)  NOT NULL
);

CREATE TABLE ventas (
    id_venta     INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente   INT NOT NULL,
    id_producto  INT NOT NULL,
    cantidad     INT NOT NULL,
    fecha_venta  DATE NOT NULL,
    CONSTRAINT fk_ventas_cliente
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_ventas_producto
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- ---------------------------------------------------------
-- EJ. 02 - Modificar una estructura
-- ---------------------------------------------------------
-- Agregar telefono a clientes (no existia)
ALTER TABLE clientes ADD COLUMN telefono VARCHAR(20);

-- Ampliar el tamano permitido para nombres de producto
ALTER TABLE productos MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

-- ---------------------------------------------------------
-- EJ. 03 - Cargar productos y clientes
-- ---------------------------------------------------------
INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Teclado mecanico RGB',        'Perifericos',     185000, 40),
('Mouse inalambrico',           'Perifericos',      65000, 80),
('Monitor 24 pulgadas Full HD', 'Monitores',       620000, 25),
('Monitor 27 pulgadas 144Hz',   'Monitores',       980000, 15),
('Portatil Core i5',            'Computadores',   2450000, 10),
('Computador escritorio Ryzen5','Computadores',   2100000,  8),
('Disco SSD 1TB',               'Almacenamiento',  320000, 50),
('Memoria RAM 16GB DDR4',       'Componentes',     210000, 60),
('Tarjeta grafica RTX 4060',    'Componentes',    1850000, 12),
('Audifonos inalambricos',      'Audio',           145000, 45),
('Parlante bluetooth',          'Audio',            95000, 30),
('Mochila para portatil',       'Accesorios',       78000, 35);

INSERT INTO clientes (nombre, email, ciudad, telefono) VALUES
('Laura Gomez',      'laura.gomez@example.com',      'Bucaramanga', '3001112233'),
('Carlos Perez',     'carlos.perez@example.com',     'Bogota',      '3002223344'),
('Maria Rodriguez',  'maria.rodriguez@example.com',  'Medellin',    '3003334455'),
('Andres Torres',    'andres.torres@example.com',    'Cali',        '3004445566'),
('Sofia Ramirez',    'sofia.ramirez@example.com',    'Cucuta',      '3005556677'),
('Julian Ortiz',     'julian.ortiz@example.com',     'Bucaramanga', '3006667788');

-- ---------------------------------------------------------
-- EJ. 04 - Registrar ventas con sentido
-- ---------------------------------------------------------
INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta) VALUES
(1, 1, 2, '2025-01-10'),
(2, 3, 1, '2025-01-12'),
(3, 5, 1, '2025-01-15'),
(1, 7, 3, '2025-01-18'),
(4, 2, 4, '2025-01-20'),
(5, 9, 1, '2025-01-22'),
(6, 1, 1, '2025-01-25'),
(2, 8, 2, '2025-01-28'),
(3, 10, 2, '2025-02-01'),
(4, 6, 1, '2025-02-03'),
(1, 3, 1, '2025-02-05'),
(5, 11, 3, '2025-02-08'),
(6, 12, 2, '2025-02-10');

-- ---------------------------------------------------------
-- EJ. 05 - Corregir y eliminar con seguridad
-- ---------------------------------------------------------
-- 1) Corregir el precio de un producto concreto (verificar antes)
SELECT id_producto, nombre, precio FROM productos WHERE id_producto = 4;
UPDATE productos SET precio = 899000 WHERE id_producto = 4;

-- 2) Ajustar stock de otro producto tras una venta (venta #1: producto 1, cantidad 2)
SELECT id_producto, nombre, stock FROM productos WHERE id_producto = 1;
UPDATE productos SET stock = stock - 2 WHERE id_producto = 1;

-- 3) Eliminar un registro creado por error
INSERT INTO productos (nombre, categoria, precio, stock)
VALUES ('Producto de prueba ERROR', 'Accesorios', 1000, 1);

SELECT * FROM productos WHERE nombre = 'Producto de prueba ERROR';
DELETE FROM productos WHERE nombre = 'Producto de prueba ERROR';

-- ---------------------------------------------------------
-- EJ. 06 - Primera exploracion
-- ---------------------------------------------------------
SELECT * FROM productos;
SELECT nombre, precio FROM productos;
SELECT nombre, precio AS precio_unitario FROM productos;

-- ---------------------------------------------------------
-- EJ. 07 - Filtrar por una condicion
-- ---------------------------------------------------------
SELECT * FROM productos WHERE precio > 500000;
SELECT * FROM clientes  WHERE ciudad = 'Bucaramanga';
SELECT * FROM productos WHERE categoria = 'Componentes';

-- ---------------------------------------------------------
-- EJ. 08 - Combinar condiciones
-- ---------------------------------------------------------
SELECT * FROM productos WHERE categoria = 'Perifericos' AND precio < 100000;
SELECT * FROM clientes  WHERE ciudad IN ('Bogota', 'Medellin');

-- ---------------------------------------------------------
-- EJ. 09 - Buscar por rangos y texto
-- ---------------------------------------------------------
SELECT * FROM productos WHERE precio BETWEEN 100000 AND 500000;
SELECT * FROM productos WHERE categoria IN ('Audio', 'Accesorios');
SELECT * FROM productos WHERE nombre LIKE '%inalambric%';

-- ---------------------------------------------------------
-- EJ. 10 - Ordenar resultados
-- ---------------------------------------------------------
SELECT * FROM productos ORDER BY precio ASC;
SELECT * FROM productos ORDER BY stock DESC;
SELECT * FROM productos WHERE categoria = 'Componentes' ORDER BY stock DESC;
