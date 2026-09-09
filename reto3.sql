CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
DROP TABLE IF EXISTS productos_prueba;

ALTER TABLE clientes 
ADD COLUMN telefono VARCHAR(20);


