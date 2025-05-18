-- 1) Obtener una lista con los nombres de las distintas oficinas de la empresa --
SELECT cod_oficina,descripcion
FROM oficinas
-- 2) obtener una lista de todos los productos indicando descripcion del producto,
 -- su precio de costo y su precio de costo iva incluido (tomar el iva como 21%)
SELECT cod_producto, descripcion, precio, precio+precio*21/100 AS precio_con_iva
FROM productos
-- 3) Obtener una lista indicando para cada empleado apellido,nombre,fecha de 
-- cumpleaños y edad --
SELECT apellido,nombre,fecha_nacimiento,
TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
FROM empleados
-- 4) Obtener todos los empleados que tiene un jefe asignado
SELECT cod_empleado,nombre,apellido,cod_jefe
FROM empleados
WHERE cod_jefe IS NOT NULL 
-- 5)listar los empleados de nombre "maria" ordenado por apellido.
SELECT cod_empleado, apellido, nombre
FROM empleados
WHERE nombre LIKE 'maria'

-- 6)listar los clientes cuya razon social comience con "l" 
-- ordenado por codigo de cliente
SELECT *
from clientes
WHERE razon_social LIKE "L%"
-- 7)--
SELECT *
FROM pedidos
WHERE MONTH(fecha_pedido)=3						
ORDER BY fecha_pedido
-- 8)--
SELECT *
FROM oficinas
WHERE codigo_director IS NOT NULL 
-- 9--
SELECT cod_producto,descripcion,precio
FROM productos
ORDER BY precio asc
LIMIT 4
-- 10--
SELECT cod_empleado,cuota
FROM datos_contratos
ORDER BY cuota DESC
LIMIT 3
-- multitablas 1)--
SELECT cod_producto,razon_social,descripcion,cantidad_stock
FROM productos as p,fabricantes as f
WHERE p.cod_fabricante = f.cod_fabricante
ORDER BY razon_social, descripcion
-- 2)--
SELECT cod_pedido,fecha_pedido,apellido,razon_social
FROM pedidos AS pe,empleados AS e,clientes AS c
WHERE pe.cod_empleado = e.cod_empleado AND pe.cod_cliente = c.cod_cliente
-- 3) --
SELECT apellido,descripcion AS oficina, cuota
FROM empleados AS e,oficinas AS o,datos_contratos AS dc
WHERE e.cod_oficina = o.cod_oficina AND e.cod_empleado = dc.cod_empleado
ORDER BY cuota DESC
-- 4)-- 
SELECT DISTINCT c.razon_social,c.cod_cliente, p.fecha_pedido
FROM empleados AS e, clientes AS c, pedidos AS p
WHERE p.cod_empleado = e.cod_empleado AND p.cod_cliente = c.cod_cliente
AND MONTH(p.fecha_pedido) = 4
-- 5 --
SELECT DISTINCT cod_pedido,fecha_pedido
FROM pedidos AS p
WHERE MONTH(fecha_pedido) = 3
-- 6 --
SELECT e.cod_empleado, fecha_contrato,
TIMESTAMPDIFF(YEAR, fecha_contrato, CURDATE()) AS tiempo_contratado
FROM empleados AS e,datos_contratos AS dc
WHERE e.cod_empleado= dc.cod_empleado AND TIMESTAMPDIFF(YEAR, fecha_contrato, CURDATE())>=10
ORDER BY tiempo_contratado
-- 7 --
SELECT cod_cliente,razon_social
FROM clientes AS c
order BY razon_social
-- 8--
SELECT DISTINCT c.razon_social, pr.descripcion AS producto
FROM clientes AS c
JOIN pedidos AS p ON c.cod_cliente = p.cod_cliente
JOIN detalle_pedidos AS dp ON p.cod_pedido = dp.cod_pedido
JOIN productos AS pr ON dp.cod_producto = pr.cod_producto
ORDER BY c.razon_social, pr.descripcion
-- 9 --
SELECT pr.descripcion AS producto, 
(pr.punto_reposición - pr.cantidad_stock) AS cantidad_a_comprar,
f.razon_social
FROM productos AS pr
JOIN fabricantes AS f ON pr.cod_fabricante = f.cod_fabricante
WHERE pr.cantidad_stock < pr.punto_reposición
ORDER BY f.razon_social, pr.descripcion
-- 10 --
SELECT e.cod_empleado, e.apellido, e.nombre, dc.cuota
FROM empleados AS e
JOIN datos_contratos AS dc ON e.cod_empleado = dc.cod_empleado
WHERE dc.cuota < 50000 OR dc.cuota > 100000;