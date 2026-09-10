CREATE TABLE Producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50)
);

CREATE TABLE Venta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    cantidad INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Producto(id)
);

INSERT INTO Producto (nombre, precio, categoria) VALUES
('televisor led 55', 1800000, 'electronica'),
('licuadora oster', 95000, 'electrodomesticos'),
('portatil hp', 2500000, 'tecnologia'),
('microondas lg', 350000, 'electrodomesticos'),
('audifonos sony', 120000, 'electronica');

INSERT INTO Venta (id_producto, cantidad, fecha) VALUES
(1, 2, '2026-01-15'),
(2, 5, '2026-02-10'),
(3, 1, '2026-02-20'),
(4, 3, '2026-03-05'),
(5, 4, '2026-03-12');

CREATE TABLE productos_caros AS
SELECT *
FROM Producto
WHERE precio > 100000;

DESCRIBE productos_caros;

SELECT p.nombre, p.precio, v.cantidad, v.fecha
FROM Producto AS p
JOIN Venta AS v ON p.id = v.id_producto;

SELECT
    UPPER(nombre) AS nombre_mayuscula,
    ROUND(precio, 0) AS precio_redondeado,
    CONCAT(nombre, ' - ', categoria) AS descripcion
FROM Producto;

SELECT
    nombre,
    precio,
    IF(precio > 500000, 'Premium', 'Estándar') AS clasificacion
FROM Producto;

SELECT
    p.nombre AS producto,
    UPPER(p.categoria) AS categoria,
    ROUND(p.precio, 0) AS precio,
    v.cantidad,
    v.fecha,
    IF(p.precio > 500000, 'Premium', 'Estándar') AS clasificacion
FROM Producto AS p
JOIN Venta AS v ON p.id = v.id_producto;
