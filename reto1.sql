
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    ciudad VARCHAR(100),
    fecha_registro DATE,
    acepta_promociones BOOLEAN
);
SELECT * FROM clientes;