CREATE TABLE Documentos (
    cod_documento INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);


CREATE TABLE Oficinas (
    cod_oficina INT AUTO_INCREMENT PRIMARY KEY,
    codigo_director INT,
    descripcion VARCHAR(100) NOT NULL
);


CREATE TABLE Empleados (
    cod_empleado INT AUTO_INCREMENT PRIMARY KEY,
    apellido VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    num_doc VARCHAR(20) NOT NULL,
    cod_jefe INT DEFAULT NULL,
    cod_oficina INT,
    cod_documento INT,
    FOREIGN KEY (cod_jefe) REFERENCES Empleados(cod_empleado),
    FOREIGN KEY (cod_oficina) REFERENCES Oficinas(cod_oficina),
    FOREIGN KEY (cod_documento) REFERENCES Documentos(cod_documento)
);


CREATE TABLE Datos_contratos (
    cod_empleado INT PRIMARY KEY,
    fecha_contrato DATE NOT NULL,
    cuota DECIMAL(10,2) NOT NULL,
    ventas DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cod_empleado) REFERENCES Empleados(cod_empleado)
);


CREATE TABLE Fabricantes (
    cod_fabricante INT AUTO_INCREMENT PRIMARY KEY,
    razon_social VARCHAR(100) NOT NULL
);


CREATE TABLE Listas (
    cod_lista INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    ganancia decimal(5,2) NOT NULL
);


CREATE TABLE Productos (
    cod_producto INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    cantidad_stock INT NOT NULL,
    punto_reposición INT NOT NULL,
    cod_fabricante INT,
    FOREIGN KEY (cod_fabricante) REFERENCES Fabricantes(cod_fabricante)
);


CREATE TABLE Precios (
    cod_producto INT,
    cod_lista INT,
    precio DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (cod_producto, cod_lista),
    FOREIGN KEY (cod_producto) REFERENCES Productos(cod_producto),
    FOREIGN KEY (cod_lista) REFERENCES Listas(cod_lista)
);


CREATE TABLE Clientes (
    cod_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cod_lista INT,
    razon_social VARCHAR(100) NOT NULL,
    FOREIGN KEY (cod_lista) REFERENCES Listas(cod_lista)
);


CREATE TABLE Pedidos (
    cod_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_pedido DATE NOT NULL,
    cod_empleado INT,
    cod_cliente INT,
    FOREIGN KEY (cod_empleado) REFERENCES Empleados(cod_empleado),
    FOREIGN KEY (cod_cliente) REFERENCES Clientes(cod_cliente)
);


CREATE TABLE Detalle_pedidos (
    cod_pedido INT,
    numero_linea INT,
    cod_producto INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (cod_pedido, numero_linea),
    FOREIGN KEY (cod_pedido) REFERENCES Pedidos(cod_pedido),
    FOREIGN KEY (cod_producto) REFERENCES Productos(cod_producto)
);

INSERT INTO Documentos (descripcion) VALUES
('DNI'),
('Pasaporte'),
('Licencia'),fabricantesfabricantes
('Cédula'),
('Carnet extranjero'),
('Documento laboral'),
('Cédula profesional'),
('Permiso temporal'),
('Visa'),
('Otro');

INSERT INTO Oficinas (codigo_director, descripcion) VALUES
(NULL, 'Central'),
(1, 'Sucursal Norte'),
(2, 'Sucursal Sur'),
(3, 'Sucursal Este'),
(4, 'Sucursal Oeste'),
(5, 'Sucursal Andina'),
(6, 'Sucursal Patagónica'),
(7, 'Sucursal Atlántica'),
(8, 'Sucursal Pacífica'),
(9, 'Sucursal Rural');

INSERT INTO Empleados (apellido, nombre, fecha_nacimiento, num_doc, cod_jefe, cod_oficina, cod_documento) VALUES
('Pérez', 'Juan', '1980-04-12', '12345678', NULL, 1, 1),
('Gómez', 'Maria', '1990-06-25', '98765432', 1, 2, 2),
('López', 'Carlos', '1985-01-15', '45678901', 1, 3, 1),
('Martínez', 'Laura', '1992-11-03', '32165487', 2, 4, 3),
('Rodríguez', 'Pedro', '1988-09-09', '78945612', 3, 5, 4),
('Fernández', 'Lucía', '1995-02-18', '45612378', 1, 6, 5),
('Sánchez', 'Diego', '1991-07-30', '96385274', 1, 7, 6),
('Ramírez', 'Julieta', '1994-03-10', '74125896', 2, 8, 7),
('Torres', 'Emilia', '1987-12-01', '85296374', 4, 9, 8),
('Castro', 'Mariano', '1990-08-22', '15935728', 5, 10, 9);

DELETE FROM empleados 
WHERE cod_empleado>10;



INSERT INTO Datos_contratos (cod_empleado, fecha_contrato, cuota, ventas) VALUES
(1, '2010-01-01', 1000.00, 20000.00),
(2, '2015-03-15', 950.00, 15000.00),
(3, '2012-07-20', 980.00, 16000.00),
(4, '2018-05-10', 870.00, 12000.00),
(5, '2016-09-01', 920.00, 13000.00),
(6, '2020-01-05', 890.00, 11000.00),
(7, '2021-06-18', 930.00, 12500.00),
(8, '2019-10-25', 970.00, 14500.00),
(9, '2014-11-30', 990.00, 17500.00),
(10, '2013-02-12', 850.00, 10000.00);

INSERT INTO Fabricantes (razon_social) VALUES
('TechCorp S.A.'),
('Industrias López'),
('GammaTech'),
('Mundo Electrónico'),
('Soluciones Globales'),
('Distribuciones Norte'),
('Fábrica Andina'),
('Exportadora Sur'),
('TecnoDigital'),
('Innovaciones SA');

INSERT INTO Listas (descripcion, ganancia) VALUES
('Lista A', 10.00),
('Lista B', 15.00),
('Lista C', 8.50),
('Lista D', 12.75),
('Lista E', 20.00),
('Lista F', 7.25),
('Lista G', 18.00),
('Lista H', 6.00),
('Lista I', 14.30),
('Lista J', 11.50);

INSERT INTO Productos (descripcion, precio, cantidad_stock, punto_reposición, cod_fabricante) VALUES
('Laptop X1', 1200.00, 50, 10, 1),
('Mouse óptico', 15.00, 200, 50, 2),
('Teclado mecánico', 80.00, 100, 20, 3),
('Monitor LED', 250.00, 30, 10, 4),
('Tablet 10"', 300.00, 40, 15, 5),
('Impresora láser', 180.00, 25, 5, 6),
('Router WiFi', 70.00, 60, 20, 7),
('Auriculares BT', 90.00, 75, 25, 8),
('Webcam HD', 50.00, 90, 30, 9),
('Disco SSD 1TB', 150.00, 35, 10, 10);

INSERT INTO Precios (cod_producto, cod_lista, precio) VALUES
(1, 1, 1250.00),
(2, 1, 16.50),
(3, 2, 85.00),
(4, 2, 260.00),
(5, 3, 310.00),
(6, 3, 190.00),
(7, 4, 75.00),
(8, 5, 95.00),
(9, 6, 55.00),
(10, 7, 160.00);

INSERT INTO Clientes (cod_lista, razon_social) VALUES
(1, 'Empresa Alfa S.A.'),
(2, 'Beta Ltda.'),
(3, 'Gama Import'),
(4, 'Delta Corp.'),
(5, 'Epsilon Systems'),
(6, 'ZetaNet'),
(7, 'Eta S.A.'),
(8, 'Theta Solutions'),
(9, 'Iota Comercial'),
(10, 'Kappa S.R.L.');

INSERT INTO Pedidos (fecha_pedido, cod_empleado, cod_cliente) VALUES
('2023-01-10', 1, 1),
('2023-01-15', 2, 2),
('2023-02-01', 3, 3),
('2023-02-10', 4, 4),
('2023-02-20', 5, 5),
('2023-03-05', 6, 6),
('2023-03-15', 7, 7),
('2023-04-01', 8, 8),
('2023-04-10', 9, 9),
('2023-04-15', 10, 10);

INSERT INTO Detalle_pedidos (cod_pedido, numero_linea, cod_producto, cantidad) VALUES
(1, 1, 1, 2),
(2, 1, 2, 10),
(3, 1, 3, 3),
(4, 1, 4, 1),
(5, 1, 5, 2),
(6, 1, 6, 1),
(7, 1, 7, 4),
(8, 1, 8, 2),
(9, 1, 9, 5),
(10, 1, 10, 1);
