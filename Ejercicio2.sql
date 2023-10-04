SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, ROUND(precio) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre;
SELECT * FROM producto ORDER BY nombre;
SELECT * FROM producto ORDER BY precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM  producto ORDER BY precio LIMIT 1;
SELECT * FROM producto ORDER BY precio DESC LIMIT 1;
SELECT *  FROM  producto WHERE precio<=120;
SELECT * FROM producto WHERE precio BETWEEN 60 AND 200;
SELECT * FROM producto WHERE codigo_fabricante IN (1,3, 5);
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';

#Multitabla
SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo ORDER BY producto.precio LIMIT 1;
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Lenovo';
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Crucial' AND producto.precio>200 ;
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre IN ('Asus','Hewlett-Packard');
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE producto.precio>=180 ORDER BY producto.precio DESC;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE producto.precio>=180 ORDER BY producto.nombre;

#Multitabla
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo=producto.codigo_fabricante;
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo=producto.codigo_fabricante WHERE producto.nombre IS NULL;

#Subconsultas WHERE
SELECT nombre FROM producto WHERE codigo_fabricante=(SELECT codigo_fabricante FROM fabricante WHERE nombre='Lenovo');
SELECT * FROM producto WHERE precio=(SELECT MAX(precio) FROM producto WHERE codigo_fabricante=(SELECT codigo_fabricante FROM fabricante WHERE nombre='Levono'));
SELECT nombre FROM producto WHERE precio=(SELECT MAX(precio) FROM producto WHERE codigo_fabricante=(SELECT codigo FROM fabricante WHERE nombre='Lenovo'));
SELECT nombre, precio FROM producto WHERE codigo_fabricante=(SELECT codigo FROM fabricante WHERE nombre='Asus') AND precio> (SELECT AVG(precio) FROM producto WHERE codigo_fabricante=(SELECT codigo FROM fabricante WHERE nombre='Asus'));

#IN - NOT IT 
SELECT nombre FROM fabricante WHERE codigo IN (SELECT DISTINCT codigo_fabricante FROM producto);
SELECT nombre FROM fabricante WHERE codigo NOT IN (SELECT DISTINCT codigo_fabricante FROM producto WHERE codigo_fabricante IS NULL);

SELECT nombre FROM fabricante WHERE codigo NOT IN (SELECT DISTINCT codigo_fabricante FROM producto);
SELECT nombre FROM fabricante WHERE codigo NOT IN (SELECT DISTINCT codigo_fabricante FROM producto WHERE codigo_fabricante IS NOT NULL);

#Having
SELECT fabricante.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo=producto.codigo_fabricante GROUP BY fabricante.nombre HAVING COUNT(producto.codigo)=(SELECT COUNT(producto.codigo) FROM producto INNER JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Lenovo');