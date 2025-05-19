-- 1--
SELECT MAX(cantidad) AS cantidad_maxima
FROM item_ventas;
-- 2 --
SELECT SUM(iv.cantidad) AS total_unidades_vendidas
FROM item_ventas AS iv
JOIN productos AS p ON iv.codigo_producto = p.codigo_producto
WHERE p.nombre_producto = 'Queso';
-- 3 --
SELECT p.nombre_producto, SUM(iv.cantidad) AS total_vendido
FROM item_ventas AS iv
JOIN productos AS p ON iv.codigo_producto = p.codigo_producto
GROUP BY p.nombre_producto
ORDER BY total_vendido DESC;
-- 4 --
SELECT p.nombre_producto, SUM(iv.cantidad) AS total_vendido
FROM item_ventas AS iv
JOIN productos AS p ON iv.codigo_producto = p.codigo_producto
GROUP BY p.nombre_producto
HAVING total_vendido > 30
ORDER BY p.nombre_producto ASC;
-- 5 --
SELECT c.codigo_cliente, c.nombre, COUNT(v.numero_factura) AS cantidad_compras
FROM clientes AS c
JOIN ventas AS v ON c.codigo_cliente = v.codigo_cliente
GROUP BY c.codigo_cliente, c.nombre
ORDER BY cantidad_compras DESC;
-- 6 -- 
SELECT iv.codigo_producto, AVG(iv.cantidad) AS promedio_unidades
FROM ventas AS v
JOIN item_ventas AS iv ON v.numero_factura = iv.numero_factura
WHERE v.codigo_cliente = 1
GROUP BY iv.codigo_producto;

SELECT * FROM item_ventas