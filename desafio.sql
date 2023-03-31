
-- Creamos la base de datos

CREATE DATABASE Desafio2_Francisco_Moya_177;

-- Creamos la tabla

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)VALUES
(44, '01/01/2021', 'Blog'),
(56, '01/01/2021', 'Página'),
(39, '01/02/2021', 'Blog'),
(81, '01/02/2021', 'Página'),
(12, '01/03/2021', 'Blog'),
(91, '01/03/2021', 'Página'),
(48, '01/04/2021', 'Blog'),
(45, '01/04/2021', 'Página'),
(55, '01/05/2021', 'Blog'),
(33, '01/05/2021', 'Página' ),
(18, '01/06/2021', 'Blog'),
(12, '01/06/2021', 'Página'),
(34, '01/07/2021', 'Blog'),
(24, '01/07/2021', 'Página'),
(83, '01/08/2021', 'Blog'),
(99, '01/08/2021', 'Página');
SELECT * FROM INSCRITOS;

-- 1 ¿Cuántos registros hay?

SELECT COUNT(FECHA) AS "TOTAL DE REGISTROS"
FROM INSCRITOS;

-- 2 ¿Cuántos inscritos hay en total?

SELECT SUM(CANTIDAD) AS "TOTAL DE INSCRITOS"
FROM INSCRITOS;

-- 3 ¿Cuál o cuáles son los registros de mayor antigüedad?

SELECT *
FROM INSCRITOS 
WHERE FECHA = (SELECT FECHA FROM INSCRITOS ORDER BY FECHA ASC LIMIT 1);

-- 4 ¿Cuántos inscritos hay por día? 

SELECT FECHA, SUM(CANTIDAD) AS"INSCRITOS" 
FROM INSCRITOS 
GROUP BY FECHA
ORDER BY FECHA;

-- 5 ¿Cuántos inscritos hay por fuente?

SELECT FUENTE, SUM(CANTIDAD) AS "INSCRITOS POR FUENTE" 
FROM INSCRITOS
GROUP BY FUENTE;

-- 6 ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

SELECT FECHA, SUM(CANTIDAD)
FROM INSCRITOS
GROUP BY FECHA 
ORDER BY SUM DESC LIMIT 1;

-- 7 ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?

SELECT FECHA, CANTIDAD 
FROM INSCRITOS 
WHERE FUENTE='Blog' 
ORDER BY CANTIDAD 
DESC LIMIT 1;

-- 8 ¿Cuántas personas en promedio se inscriben en un día?

SELECT AVG(CANTIDAD) AS "PROMEDIO", FECHA
FROM INSCRITOS
GROUP BY FECHA 
ORDER BY FECHA ASC;

-- 9 ¿Qué días se inscribieron más de 50 personas?

SELECT FECHA, SUM(CANTIDAD) AS "CANTIDAD"
FROM INSCRITOS 
GROUP BY FECHA 
HAVING SUM(CANTIDAD) > 50 
ORDER BY fecha ASC;

-- 10 ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?

SELECT FECHA, AVG(CANTIDAD) AS "PROMEDIO" 
FROM INSCRITOS 
GROUP BY FECHA 
HAVING (FECHA >= '2021-03-01') 
ORDER BY FECHA ASC;


-- Salir de postgreSQL

\q
