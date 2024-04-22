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

-- funciones de cadena 
select concat(ap_paterno, ' ', ap_materno, ' ', nombre) alumno
from alumnos order by 1;

select * from
(select concat(ap_paterno, ' ', ap_materno, ' ', nombre) alumno
from alumnos ) a
where alumno like '%ros%';

select concat(ap_paterno, ' ', ap_materno, ' ', nombre) alumno
from alumnos
where
concat(ap_paterno, ' ', ap_materno, ' ', nombre) like '%ros%';

select concat_ws('  ', ap_paterno, ' ', ap_materno, nombre, ciudad, peso, sexo, curp) alumno
from alumnos;

select ucase (nombre), upper(nombre), lcase(nombre), lower(nombre)
from alumnos;

select ucase('Patito 23'), lcase('Patito 23');  -- ucase = mayus.  lcase = minus

select lcase(concat_ws(' ', ap_paterno, ap_materno, nombre))
alumno
from alumnos;

select distinct nombre, left(nombre, 3), right (nombre, 3), 
substr(nombre, 3), substr(nombre, 3, 3),
mid(nombre, 3), mid(nombre, 3, 3), mid(nombre, 3, 5)
from alumnos order by 1;

select distinct nombre, locate(' ', nombre),
locate(' ', nombre, 7)
from alumnos order by 1;

select distinct nombre, locate(' ', nombre) 
from alumnos 
where locate (' ', nombre) > 0
order by 1;

select locate(' ', nombre) locate, count(*) 
from alumnos 
group by locate (' ', nombre)
order by 1;


select distinct nombre, length(nombre), 
length(lcase(concat_ws(' ', ap_paterno, ap_materno, nombre))) lalu
from alumnos order by 2 desc;


-- listar el año, mes y dia de nacimiento de los alumnos con un curp valido

select concat_ws(' ', ap_paterno, ap_materno, nombre) alu,
curp, substr(curp, 5,2) anio, substr(curp,7,2) mes, substr(curp, 9,2) dia,
if(left(substr(curp,5,2),1) = '0', '20', 19) pre,
concat(if(left(substr(curp,5,2),1) = '0', '20', 19),
   substr(curp,5,2)) aniocompleto
from alumnos
where length(curp) = 18
order by 3;


select concat_ws(' ', ap_paterno, ap_materno, nombre) alu,
curp, concat_ws('-',
concat(if(left(substr(curp,5,2),1) = '0', '20', 19),
	substr(curp,5,2)),
    substr(curp,7,2),
    substr(curp,9,2)
    ) fnac
    from alumnos
    where length(curp) = 18
    order by 3;
    
select distinct nombre, locate(' ', nombre),
left(nombre, locate(' ', nombre) - 1) n1,
right(nombre, locate(' ',  nombre) + 1),
mid(nombre, locate(' ', nombre) + 1)  n2
from alumnos
order by 1;


select distinct nombre, locate(' ', nombre),
if(locate(' ', nombre) > 0,
 left(nombre, locate(' ', nombre)-1), nombre) n1,
if(locate(' ', nombre) > 0,
	mid(nombre, locate(' ',nombre) + 1), ' ')n2
    from alumnos
    order by 1;
    
select distinct nombre, repeat(nombre,4), repeat('-', 30 - LENGTH(NOMBRE)),
concat(nombre, repeat('-', 30 - LENGTH(NOMBRE))) C1
from alumnos order by 1;

 select MAX(LENGTH(nombre)) Mn, MAX(LENGTH(ap_paterno)) Mp, MAX(LENGTH(ap_materno))Mm, MAX(LENGTH(ciudad)) Mc
 from alumnos;


-- @ = una variable
set @sep = '-';
select concat (
nombre, repeat(@sep, 25 - LENGTH(NOMBRE)),
ap_paterno, repeat(@sep, 25 - LENGTH(ap_paterno)),
ap_materno, repeat(@sep, 25 - LENGTH(ap_materno)),
curp, repeat(@sep, 18 - LENGTH(curp)),
ciudad, repeat(@sep, 35 - LENGTH(ciudad)),
sexo, repeat(@sep, 1 - LENGTH(sexo))
) campo
from alumnos order by 1;


select count (nombre) n, count (ap_paterno) p, count (ap_materno) m,
count (curp) c, count(ciudad) cd, count (sexo) s 
from alumnos;

select nombre, ciudad, ifnull(ciudad, '')
from alumnos order by 2;

set @sep = ' ';
select concat (
nombre, repeat(@sep, 25 - LENGTH(NOMBRE)),
ap_paterno, repeat(@sep, 25 - LENGTH(ap_paterno)),
ap_materno, repeat(@sep, 25 - LENGTH(ap_materno)),
curp, repeat(@sep, 18 - LENGTH(curp)),
-- ifnull (ciudad, ''), repeat(@sep, 35 - LENGTH(ifnull(ciudad, ''))),
sexo, repeat(@sep, 1 - LENGTH(sexo))
) campo
from alumnos order by 1;



set @sep = ' ';
select concat (
nombre, repeat(@sep, 25 - LENGTH(NOMBRE)),
ap_paterno, repeat(@sep, 25 - LENGTH(ap_paterno)),
ap_materno, repeat(@sep, 25 - LENGTH(ap_materno)),
curp, repeat(@sep, 18 - LENGTH(curp)),
-- ifnull (ciudad, ''), repeat(@sep, 35 - LENGTH(ifnull(ciudad, ''))),
sexo, repeat(@sep, 1 - LENGTH(sexo))
) campo
INTO OUTFILE '/Users/christianlara/Desktop/BD1/ALU_LF_2410.txt'
fields terminated by ''
lines terminated by '\n'
from alumnos order by 1;

show variables like '%secure%';

select sysdate(), curdate(), curtime();  -- fecha y hora del servidor

select sysdate(), date_format(sysdate(), '%Y') anio;

