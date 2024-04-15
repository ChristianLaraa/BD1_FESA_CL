use colegio2410;
show tables;
-- comando DDL
-- insert, update, delete

select  * from alumnos;
-- TABLA DUMMIE llamada dual, forma completa
select sysdate(); 

-- consulta que regresa 3 datos, fecha-hora, usuario y
select sysdate(), user(), database();

show variables like '%dir';

select @@basedir, @@datadir;

select @@basedir, @@datadir, sysdate();

-- darle un valor a una varibale
set @nombre = 'CHRISTIAN LARA';

-- mostrar variables no de sesion solo con 1 @
select @nombre;

-- renombrar campos
select 'hola mundo' as saludo;

select 'hola mundo' as saludo,
34+9 suma,
34-9 as resta,
34/9 division,
34*9 as multiplicacion;

select * from alumnos;
-- consultar el tipo
desc alumnos;

-- PROYECCION DE DATOS
select clave_alu, nombre, ap_paterno, peso, estatura, peso*1000 pesogr, estatura*100 estaturacm, (peso / (estatura * estatura)) imc,
lower (nombre) nombremin
 from alumnos;
 -- mientras no haya cambio en el estado puedo visualizar los mismos datos
 
 
 -- muestra la lista de valores unicos de los campos de proyeccion
select DISTINCT sexo from alumnos;
select DISTINCT ciudad, sexo from alumnos;
select DISTINCT clave_alu from alumnos;
 
 -- HAVING sirve para filtrar derivaddo a las funciones de agregacion 
 -- LIMIT limita el orden de los renglones aun asi haya un where
 -- clausulas en este orden I-FFROM, II-WHERE, III-GROUP BY, IV-HAVING, V-ORDER BY, VI-LIMIT
 
 select * from alumnos;
 
 select * from alumnos 
 where sexo = 'f';
 
 -- funciones de agregacion COUNT, MAX, MIN, AVG)
select ciudad, count(*) nreg from alumnos 
where sexo = 'f' -- filtra
group by ciudad -- agrupa
having count(*) >= 5 -- evalua
order by 2 desc -- ordena los campos de forma descendente
limit 2; -- limita el numero de registros 

 select 
 * from alumnos
 order by ap_paterno asc, ap_materno, nombre asc
 limit 41, 20;
 
select 
 * from alumnos
 order by sexo, ap_paterno asc, ap_materno, nombre asc;
 
 
 
 SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumno;
 
 -- like % ó _ "buscar cualquier cosa que contenga "nuestra cadena" cualuqier cadena 
 
SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre like 'adrian%';
 
  -- termina con Adrian
 
SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre like '%adrian';
 
   -- 4 caracteres
 
SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre like '____';
 
 SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre not like '____';
 
  SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre like '__a_';
 
   SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre like '%a_';
 
    SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre like '%a_';
 
SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre like '% %';
 
SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre like '% ____'; 
 
 SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre like '____ ____'; 
 
  SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where nombre like '% % %'; 
 
 
SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where email like '%@%';  
 
 SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where email not like '%@%.%' and email != ' ';  
 
select distinct ciudad from alumnos order by 1;

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where ciudad like 'queretaro';  
 
 SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos
 where ciudad like '%quer%' or ciudad like '%qro%';  
 
use colegio2410;
create temporary table alumnos_tmp as SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
 from alumnos;
 
 select * from alumnos_tmp;
 
select distinct ciudad from alumnos_tmp order by 1;
 
update alumnos_tmp set ciudad = 'QUERETARO'
where ciudad like '%quer%' or ciudad like '%qro%';

show variables like '%safe%';
set sql_safe_updates = 0;

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where curp like '___________DF%';

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where curp like '____95____HDF%';

select ciudad, count(*) nreg
from alumnos
group by ciudad
order by 1;

SELECT NOMBRE, AP_PATERNO, CIUDAD, 
SEXO, if(SEXO = 'M', 'MASCULINO', IF(SEXO = 'F', 'FEMENINO', 'SV')) SEXOIF
from alumnos; 

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where ciudad rlike '(QUER|QRO])';

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where nombre rlike 'jose';

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where ciudad rlike '^jose';   -- Inicia

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where nombre rlike 'jose%';   -- termina

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where nombre rlike '(jose|adrian|ale)';  -- | = or

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where nombre rlike '(^jose|adrian|ale)';  -- | = or

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where nombre rlike '[a-zA-Z]{5}'; -- entre corchete [] = rangos, entre llaves {} = numero de veces o posiciones 

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where nombre rlike '(a){Z}'; 

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where nombre rlike '.{7}'; 

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where nombre rlike '^.{7}$';  -- inicia y temina que tenga 7 caracteres

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where email rlike '^[^0-9]*$'; 

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where email rlike '[0-9]'; 

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where curp rlike '^[A-Za-z]{4,}'; 

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where curp rlike '^[A-Za-z]{4}[0-9]{6}[HM]'; 

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where curp rlike '^[A-Za-z]{4}[0-9]{6}[HM][A-Z]{2}'; 


SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where curp rlike '.+@.(net|info)$'; 

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where curp rlike '.+@*.mx$'; 

SELECT NOMBRE, AP_PATERNO, CIUDAD, SEXO, CURP, EMAIL
from alumnos
where curp rlike '.+@*.mx$'; 

