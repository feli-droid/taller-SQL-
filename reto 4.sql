INSERT INTO clientes (nombre, email, ciudad, fecha_registro, acepta_promociones) VALUES
('Carlos Gómez', 'carlos@email.com', 'Bogotá', '2026-01-15', TRUE),
('Ana López', 'ana@email.com', 'Bogotá', '2026-02-20', FALSE),
('Luisa Martínez', 'luisa@email.com', 'Medellín', '2026-03-10', TRUE),
('Pedro Ruiz', 'pedro@email.com', 'Bogotá', '2026-04-05', TRUE),
('Sofia Torres', 'sofia@email.com', 'Bogotá', '2026-05-12', TRUE),
('Diego Morales', 'diego@email.com', 'Bogotá', '2026-06-18', FALSE);

SELECT nombre, fecha_registro
FROM clientes
WHERE ciudad = 'Bogotá'
ORDER BY fecha_registro DESC
LIMIT 5;