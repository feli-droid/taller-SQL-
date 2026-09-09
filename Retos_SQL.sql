CREATE TABLE clientes (
  id_cliente          INT,
  nombre              VARCHAR(100),
  email               VARCHAR(150),
  ciudad              VARCHAR(60),
  fecha_registro      DATE,
  acepta_promociones  BOOLEAN
);


CREATE TABLE empleados (
  id_empleado         INT PRIMARY KEY AUTO_INCREMENT,
  nombre              VARCHAR(100) NOT NULL,
  email               VARCHAR(150) UNIQUE,
  salario             DECIMAL(10,2) CHECK (salario >= 0),
  id_departamento     INT,
  fecha_contratacion  DATE,
  FOREIGN KEY (id_departamento)
    REFERENCES departamentos(id_departamento)
);


DROP TABLE productos_prueba;

ALTER TABLE clientes
  ADD COLUMN telefono VARCHAR(20);


UPDATE productos
SET precio = 549.00
WHERE id_producto = 310;

DELETE FROM productos
WHERE id_producto = 118;


SELECT nombre, fecha_registro
FROM clientes
WHERE ciudad = 'Bogotá'
ORDER BY fecha_registro DESC
LIMIT 5;


SELECT nombre, precio, categoria
FROM productos
WHERE categoria IN ('Electrodomésticos', 'Tecnología')
  AND nombre LIKE '%Smart%';


SELECT
  id_categoria,
  AVG(precio) AS precio_promedio
FROM productos
GROUP BY id_categoria
HAVING AVG(precio) > 300000;
