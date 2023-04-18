--ANALISIS DE LOS INDICADORES PARA LOS MUNICIPIOS DE TABASCO DE PARTICIPACION RELATIVA (PR), COEFICIENTE HIRSCHMAN-HERFINDAHL (HH) Y COEFICIENTE DE LOCALIZACION
use PR_HH_QL
GO

-- De acuerdo con el indicador Hirschman–Herfindahl (HH) nos indica que Si es positivo indica particular importancia de una actividad productiva en una región.
--Para este caso, lo que haremos es identificar los municipios los cuales sus actividades sean >0 para los periodos de estudio
SELECT H.AÑO, H.MUNICIPIO AS MUNICIPIO, H.ID_MUN_SEC_AÑO AS ID, H.HH_VACB AS HH_VACB
FROM HH_2$ as H
WHERE  H.AÑO = 2018 and HH_VACB > 0 
order by MUNICIPIO ASC, HH_VACB DESC

SELECT H.AÑO, H.MUNICIPIO AS MUNICIPIO, H.ID_MUN_SEC_AÑO AS ID, H.HH_VACB AS HH_VACB
FROM HH_2$ as H
WHERE  H.AÑO = 2013 and HH_VACB > 0 
order by MUNICIPIO ASC, HH_VACB DESC

SELECT H.AÑO, H.MUNICIPIO AS MUNICIPIO, H.ID_MUN_SEC_AÑO AS ID, H.HH_VACB AS HH_VACB
FROM HH_2$ as H
WHERE  H.AÑO = 2008 and HH_VACB > 0 
order by MUNICIPIO ASC, HH_VACB DESC

SELECT H.AÑO, H.MUNICIPIO AS MUNICIPIO, H.ID_MUN_SEC_AÑO AS ID, H.HH_VACB AS HH_VACB
FROM HH_2$ as H
WHERE  H.AÑO = 2003 and HH_VACB > 0 
order by MUNICIPIO ASC, HH_VACB DESC

-- Para nuestro analisis es necesrios identificar el numero de actividades que se desempeña en todos los municipios, por lo que ejecutamos la siguiente sintaxis: 

SELECT 2018 AS AÑO, QL.Municipio AS MUNICIPIO,COUNT(QL.Municipio) AS CUENTA
FROM QL_2$ AS QL
WHERE QL.AÑO = 2018
Group by QL.Municipio


SELECT 2013 AS AÑO, QL.Municipio AS MUNICIPIO,COUNT(QL.Municipio) AS CUENTA
FROM QL_2$ AS QL
WHERE QL.AÑO = 2013
Group by QL.Municipio


SELECT 2008 AS AÑO, QL.Municipio AS MUNICIPIO,COUNT(QL.Municipio) AS CUENTA
FROM QL_2$ AS QL
WHERE QL.AÑO = 2008
Group by QL.Municipio

SELECT 2003 AS AÑO, QL.Municipio AS MUNICIPIO,COUNT(QL.Municipio) AS CUENTA
FROM QL_2$ AS QL
WHERE QL.AÑO = 2003
Group by QL.Municipio

-- Para identificar un la presensia de una actividad importantee en un municipios y que ademas se trate de un posible aglomeracion productiva realizamos lo siguiente:
-- Primeramente identificamos los municipios con un HH>, situacion que hicimos en el primer paso
-- Posteriormente realizamos un inner join con la finalidad de unir las diferentes tablas que contienen los diferentes indicadores.
-- Con eso en mente, con la siguiente sintaxis solicitamos que me filtre los municipios con un PR>0.005 y con un QL < 1 .
-- Esto es asi ya que un PR >0.005 nos indica que la actividad tiene participacion de un 5% o mas en el estado
-- Asi mismo un QL > 1 garantiza que la participacion de la actividad a nivel municipal es mayor que la que hay a nivel estatal.

SELECT 2018 AS AÑO, H.Municipio AS MUNICIPIO, H.ID_MUN_SEC_AÑO AS ID, H.ID_SEC AS SECTOR, H.HH_VACB AS HH_VACB, PR.PR_VACB AS PR_VACB, QL.QL_VACB AS QL_VACB
FROM HH_2$ AS H
INNER JOIN [PR_2$] AS PR ON H.ID_MUN_SEC_AÑO = PR.ID_MUN_SEC_AÑO
INNER JOIN [QL_2$] AS QL ON PR.ID_MUN_SEC_AÑO = QL.ID_MUN_SEC_AÑO
WHERE H.HH_VACB > 0 AND PR.PR_VACB >0.005 AND QL.QL_VACB >1 AND H.AÑO = 2018
ORDER BY MUNICIPIO,HH_VACB  desc;

SELECT 2013 AS AÑO, H.Municipio AS MUNICIPIO, H.ID_MUN_SEC_AÑO AS ID, H.ID_SEC AS SECTOR, H.HH_VACB AS HH_VACB, PR.PR_VACB AS PR_VACB, QL.QL_VACB AS QL_VACB
FROM HH_2$ AS H
INNER JOIN [PR_2$] AS PR ON H.ID_MUN_SEC_AÑO = PR.ID_MUN_SEC_AÑO
INNER JOIN [QL_2$] AS QL ON PR.ID_MUN_SEC_AÑO = QL.ID_MUN_SEC_AÑO
WHERE H.HH_VACB > 0 AND PR.PR_VACB >0.005 AND QL.QL_VACB >1 AND H.AÑO = 2013
ORDER BY MUNICIPIO,HH_VACB  desc;

SELECT 2008 AS AÑO, H.Municipio AS MUNICIPIO, H.ID_MUN_SEC_AÑO AS ID, H.ID_SEC AS SECTOR, H.HH_VACB AS HH_VACB, PR.PR_VACB AS PR_VACB, QL.QL_VACB AS QL_VACB
FROM HH_2$ AS H
INNER JOIN [PR_2$] AS PR ON H.ID_MUN_SEC_AÑO = PR.ID_MUN_SEC_AÑO
INNER JOIN [QL_2$] AS QL ON PR.ID_MUN_SEC_AÑO = QL.ID_MUN_SEC_AÑO
WHERE H.HH_VACB > 0 AND PR.PR_VACB >0.005 AND QL.QL_VACB >1 AND H.AÑO = 2008
ORDER BY MUNICIPIO,HH_VACB  desc;

SELECT 2003 AS AÑO, H.Municipio AS MUNICIPIO, H.ID_MUN_SEC_AÑO AS ID, H.ID_SEC AS SECTOR, H.HH_VACB AS HH_VACB, PR.PR_VACB AS PR_VACB, QL.QL_VACB AS QL_VACB
FROM HH_2$ AS H
INNER JOIN [PR_2$] AS PR ON H.ID_MUN_SEC_AÑO = PR.ID_MUN_SEC_AÑO
INNER JOIN [QL_2$] AS QL ON PR.ID_MUN_SEC_AÑO = QL.ID_MUN_SEC_AÑO
WHERE H.HH_VACB > 0 AND PR.PR_VACB >0.005 AND QL.QL_VACB >1 AND H.AÑO = 2003
ORDER BY MUNICIPIO,HH_VACB  desc;

-- El siguiente paso es hacer un recuento de aquellas actividades de cada muncipio que ha pasado un filtro de un HH>0,un PR>0.005 y un QL> 1


SELECT  H.AÑO,H.Municipio AS MUNICIPIO, COUNT(QL.QL_VACB) AS CUENTA
FROM HH_2$ AS H
INNER JOIN PR_2$ AS PR ON H.ID_MUN_SEC_AÑO = PR.ID_MUN_SEC_AÑO
INNER JOIN QL_2$ AS QL ON PR.ID_MUN_SEC_AÑO = QL.ID_MUN_SEC_AÑO
WHERE H.HH_VACB > 0 AND PR.PR_VACB >0.005 AND QL.QL_VACB >1 AND H.AÑO = 2018
GROUP BY H.Municipio, H.AÑO;

SELECT  H.AÑO,H.Municipio AS MUNICIPIO, COUNT(QL.QL_VACB) AS CUENTA
FROM HH_2$ AS H
INNER JOIN PR_2$ AS PR ON H.ID_MUN_SEC_AÑO = PR.ID_MUN_SEC_AÑO
INNER JOIN QL_2$ AS QL ON PR.ID_MUN_SEC_AÑO = QL.ID_MUN_SEC_AÑO
WHERE H.HH_VACB > 0 AND PR.PR_VACB >0.005 AND QL.QL_VACB >1 AND H.AÑO = 2013
GROUP BY H.Municipio, H.AÑO;

SELECT  H.AÑO,H.Municipio AS MUNICIPIO, COUNT(QL.QL_VACB) AS CUENTA
FROM HH_2$ AS H
INNER JOIN PR_2$ AS PR ON H.ID_MUN_SEC_AÑO = PR.ID_MUN_SEC_AÑO
INNER JOIN QL_2$ AS QL ON PR.ID_MUN_SEC_AÑO = QL.ID_MUN_SEC_AÑO
WHERE H.HH_VACB > 0 AND PR.PR_VACB >0.005 AND QL.QL_VACB >1 AND H.AÑO = 2008
GROUP BY H.Municipio, H.AÑO;

SELECT  H.AÑO,H.Municipio AS MUNICIPIO, COUNT(QL.QL_VACB) AS CUENTA
FROM HH_2$ AS H
INNER JOIN PR_2$ AS PR ON H.ID_MUN_SEC_AÑO = PR.ID_MUN_SEC_AÑO
INNER JOIN QL_2$ AS QL ON PR.ID_MUN_SEC_AÑO = QL.ID_MUN_SEC_AÑO
WHERE H.HH_VACB > 0 AND PR.PR_VACB >0.005 AND QL.QL_VACB >1 AND H.AÑO = 2003
GROUP BY H.Municipio, H.AÑO;

-- Con estos datos podemos darnos una idea de los posibles resultados que pudieramos tener y ademas podemos ingresarlos a un sofware de visualizacion de datos para una mejor interpretación
