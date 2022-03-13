/*1*/
SELECT prod.* 
FROM factura fac
INNER JOIN producto prod on prod.idproducto = fac.id_producto
WHERE id_tipo_doc_cliente = 1 AND num_doc_cliente = 21654654;


/*2*/

SELECT prov.idproveedor, prov.nombre_prv
FROM producto prod
INNER JOIN proveedor prov ON prov.idproveedor = prod.id_proveedor
WHERE prod.nombre_prod = "PAN TAJADO";

/*3*/

SELECT fac.id_producto, pro.nombre_prod, count(fac.id_producto) AS CANTIDAD
FROM factura fac
INNER JOIN producto pro ON pro.idproducto = fac.id_producto
GROUP BY id_producto
ORDER BY 3 DESC;