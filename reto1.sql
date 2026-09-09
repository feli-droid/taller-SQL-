CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salario DECIMAL(10, 2) CHECK (salario >= 0),
    id_departamento INT,
    fecha_contratacion DATE,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);
