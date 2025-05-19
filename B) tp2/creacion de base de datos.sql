
CREATE DATABASE IF NOT EXISTS tienda
USE tienda


CREATE TABLE clientes (
    codigo_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    domicilio VARCHAR(150),
    provincia VARCHAR(50)
);


CREATE TABLE productos (
    codigo_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100)
);


CREATE TABLE ventas (
    numero_factura INT PRIMARY KEY,
    codigo_cliente INT,
    fecha DATE,
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
);


CREATE TABLE item_ventas (
    numero_factura INT,
    codigo_producto INT,
    cantidad INT,
    precio DECIMAL(10,2),
    PRIMARY KEY (numero_factura, codigo_producto),
    FOREIGN KEY (numero_factura) REFERENCES ventas(numero_factura),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
);


INSERT INTO clientes VALUES
(1, 'Juan Pérez', 'Calle Falsa 123', 'Buenos Aires'),
(2, 'María Gómez', 'Av. Siempre Viva 742', 'Córdoba'),
(3, 'Carlos Ruiz', 'Calle Luna 55', 'Santa Fe'),
(4, 'Ana López', 'Av. Libertad 100', 'Buenos Aires'),
(5, 'Luis Martínez', 'Calle Sol 7', 'Mendoza'),
(6, 'Sofía Fernández', 'Av. Paz 10', 'Neuquén'),
(7, 'Pedro Sánchez', 'Calle Río 20', 'Salta'),
(8, 'Laura Díaz', 'Av. Mar 3', 'Chubut'),
(9, 'Diego Torres', 'Calle Norte 9', 'Entre Ríos'),
(10, 'Marta Ruiz', 'Av. Sur 50', 'Santa Cruz');


INSERT INTO productos VALUES
(101, 'Manzanas'),
(102, 'Naranjas'),
(103, 'Bananas'),
(104, 'Leche'),
(105, 'Pan'),
(106, 'Queso'),
(107, 'Carne'),
(108, 'Arroz'),
(109, 'Fideos'),
(110, 'Aceite');


INSERT INTO ventas VALUES
(1001, 1, '2025-05-01'),
(1002, 2, '2025-05-02'),
(1003, 3, '2025-05-03'),
(1004, 4, '2025-05-04'),
(1005, 5, '2025-05-05'),
(1006, 6, '2025-05-06'),
(1007, 7, '2025-05-07'),
(1008, 8, '2025-05-08'),
(1009, 9, '2025-05-09'),
(1010, 10, '2025-05-10');


INSERT INTO item_ventas VALUES
(1001, 101, 10, 20.00),
(1001, 104, 5, 50.00),
(1002, 102, 8, 15.00),
(1002, 105, 3, 30.00),
(1003, 103, 12, 12.00),
(1004, 106, 4, 40.00),
(1005, 107, 7, 100.00),
(1006, 108, 10, 25.00),
(1007, 109, 6, 10.00),
(1008, 110, 2, 60.00);


UPDATE item_ventas SET cantidad = 35 WHERE codigo_producto = 101 AND numero_factura = 1001;
UPDATE item_ventas SET cantidad = 40 WHERE codigo_producto = 102 AND numero_factura = 1002;
UPDATE item_ventas SET cantidad = 20 WHERE codigo_producto = 103 AND numero_factura = 1003;
UPDATE item_ventas SET cantidad = 50 WHERE codigo_producto = 104 AND numero_factura = 1001;
UPDATE item_ventas SET cantidad = 10 WHERE codigo_producto = 105 AND numero_factura = 1002;
UPDATE item_ventas SET cantidad = 15 WHERE codigo_producto = 106 AND numero_factura = 1004;
UPDATE item_ventas SET cantidad = 25 WHERE codigo_producto = 107 AND numero_factura = 1005;
UPDATE item_ventas SET cantidad = 40 WHERE codigo_producto = 108 AND numero_factura = 1006;
UPDATE item_ventas SET cantidad = 5 WHERE codigo_producto = 109 AND numero_factura = 1007;
UPDATE item_ventas SET cantidad = 8 WHERE codigo_producto = 110 AND numero_factura = 1008;

INSERT INTO ventas (numero_factura, codigo_cliente, fecha) VALUES
(1011, 1, '2024-01-10'),
(1012, 3, '2024-02-15'),
(1013, 5, '2024-03-20'),
(1014, 7, '2024-04-05'),
(1015, 9, '2024-04-22');

INSERT INTO item_ventas (numero_factura, codigo_producto, cantidad, precio) VALUES
(1011, 101, 30, 100),
(1012, 102, 50, 200),
(1013, 101, 55, 100),
(1014, 103, 25, 150),
(1015, 104, 50, 180);
