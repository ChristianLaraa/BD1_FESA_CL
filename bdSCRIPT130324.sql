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


-- SCRIPT 24-04-24
select nombre, fedita,
date_format(fedita, '%H')hora,
date_format(fedita, '%r') h12,
date_format(fedita, '%T') h24,
date_format(fedita, '%h %p') hmasampm
from alumnos;

set lc_time_names = 'es_MX';
select nombre, fedita,
date_format(fedita, '%W %d de %M del año %Y a las %H horas') hora
from alumnos;

select nombre, fedita,
YEAR(fedita), month(fedita), monthname(fedita), day(fedita), 
dayname(fedita), week(fedita), dayofyear(fedita), quarter(fedita),
hour(fedita), minute(fedita), second(fedita)
from alumnos;

set @f = '2023-12-31 23:59:59';
select 
DATE_ADD(@f, INTERVAL 1 SECOND) mas1seg,
DATE_ADD(@f, INTERVAL 1 MINUTE) ma1min,
DATE_ADD(@f, INTERVAL 1 HOUR) mas1hora,
DATE_ADD(@f, INTERVAL 1 DAY) mas1dia,
DATE_ADD(@f, INTERVAL 1 WEEK) mas1sem,
DATE_ADD(@f, INTERVAL 1 MONTH) mas1mes,
DATE_ADD(@f, INTERVAL 1 QUARTER) mas1trim,
DATE_ADD(@f, INTERVAL 1 YEAR) mas1anio;


select 
DATE_ADD(@f, INTERVAL -1 SECOND) menos1seg,
DATE_ADD(@f, INTERVAL -1 MINUTE) mmenos1min;

select  -- SUB EN POSIUTIVO RESTA
DATE_SUB(@f, INTERVAL 1 SECOND) menos1seg,
DATE_SUB(@f, INTERVAL 1 MINUTE) mmenos1min;

select  -- SUB EN NEGATIVOS SUMA
DATE_SUB(@f, INTERVAL -1 SECOND) menos1seg,
DATE_SUB(@f, INTERVAL -1 MINUTE) mmenos1min;

select sysdate() hlocal, -- Hora local vs hora Tijuana vs hora Buenos Aires
DATE_ADD(sysdate(), INTERVAL -2 HOUR) hTJ,
DATE_ADD(sysdate(), INTERVAL 3 HOUR) hBA;
-- mejor usar date add para sumar y date sub para restar

select nombre, fedita,
DATEDIFF(sysdate(), fedita) diffendias,
(DATEDIFF(sysdate(), fedita) * 24) diffhr,
(DATEDIFF(sysdate(), fedita) / 7) diffsemanas,
TIMESTAMPDIFF(HOUR, fedita, sysdate())difhrts,
TIMESTAMPDIFF(WEEK, fedita, sysdate()) difsemts,
TIMESTAMPDIFF(YEAR, fedita, sysdate()) difanio
from alunos;

select nombre, fedita,
EXTRACT(DAY from fedita) dia,
EXTRACT(YEAR from fedita) anio,
EXTRACT(MONTH from fedita) mes
from alumnos;

select nombre, fedita,
DATEDIFF(sysdate(), fedita) diffendias,
FROM_DAYS(DATEDIFF(sysdate(), fedita))
from alumnos;

select from_days(367),
from_days(100), from_days(1000), from_days(10000),
from_days(100000);

select nombre, fedita,
DATEDIFF(sysdate(), fedita) diffendias,
FROM_DAYS(DATEDIFF(sysdate(), fedita)) fd,
date_format(FROM_DAYS(DATEDIFF(sysdate(), fedita)),
'%Y años, %m meses y %d dias') f,
concat(
YEAR(FROM_DAYS(DATEDIFF(sysdate(), fedita))), ' años ',
MONTH(FROM_DAYS(DATEDIFF(sysdate(), fedita))), ' meses y ',
DAY(FROM_DAYS(DATEDIFF(sysdate(), fedita))), ' dias '
) f2
from alumnos;

select
date_format(FROM_DAYS(DATEDIFF(sysdate(), '2004-12-09')),
'%Y años, %m meses y %d dias') edad;

SELECT now(), LAST_DAY(now()), last_day('2024-02-01'),
DAY(last_day('2024-02-01'));

select distinct YEAR(fedita) anio,
CONCAT(YEAR(fedita), '.02-01') feb,
if(DAY(last_day(CONCAT(YEAR(fedita), '.02-01'))) = 29, 'Bisiesto',
'Biciesto' 'No biciesto') b
from alumnos;

-- CLASE 26_04-24

select * from niveles;
select * from grados;

select * from niveles, grados;

select * from niveles n, grados g where n.id_nivel = g.id_grado;

select count(*)from alumnos;
select count(*)from pagos;

select count(*) from alumnos a, pagos p;

select * from pagos;

select * from alumnos a, pagos p order by 1 limit 100;

select * from alumnos a, pagos p
where a.clave_alu = p.clave_alu;

select * from cursos;

select * 
from alumnos a, pagos p, cursos c
where a.clave_alu = p.clave_alu
AND p.id_curso = c.id_curso;

select a.clave_alu, a.nombre, ap_paterno, p.*
from alumnos a, pagos p, cursos c
where a.clave_alu = p.clave_alu
AND p.id_curso = c.id_curso;

select a.clave_alu, a.nombre, ap_paterno, pago, fecha_pago, abreviatura curso
from alumnos a, pagos p, cursos c
where a.clave_alu = p.clave_alu
AND p.id_curso = c.id_curso;

select a.clave_alu, a.nombre, ap_paterno, pago, fecha_pago, abreviatura curso
from alumnos a, pagos p, cursos c
where a.clave_alu = p.clave_alu
AND p.id_curso = c.id_curso
AND  sexo = 'f'
AND month(fecha_pago) = 4
AND abreviatura = '2017-2018';

select a.clave_alu, a.nombre, ap_paterno, pago, fecha_pago, abreviatura curso
from (select * from alumnos where sexo = 'f') a,
(select * from pagos where month(fecha_pago) = 4) p, 
(select * from cursos where abreviatura = '2017-2018') c
where a.clave_alu = p.clave_alu
AND p.id_curso = c.id_curso;

select a.clave_alu, a.nombre, ap_paterno, ap_materno, 
sum(pago) tpago, count(*) npagos
from alumnos a, 
(select clave_alu, sum(pago) tpago, count(*) npagos 
	from pagos
    group by clave_alu
    ) p
where a.clave_alu = p.clave_alu
group by a.clave_alu, a.nombre, ap_paterno, ap_materno
order by 3, 4, 2;
-- group de 3M de registros 


-- clase 29-04-24

select a.clave_alu, a.nombre, ap_paterno, ap_materno
from alumnos a
where a.clave_alu in(select distinct clave_alu from pagos);

select a.clave_alu, a.nombre, ap_paterno, ap_materno
from alumnos a
where a.clave_alu not in(select distinct clave_alu from pagos);

select *
from alumnos a, pagos p
where a.clave_alu = p.clave_alu;

select * 
from alumnos a 
JOIN pagos p ON(a.clave_alu = p.clave_alu);

select a.clave_alu, a.nombre, ap_paterno, ap_materno, p.clave_alu, p.*
from alumnos a
JOIN pagos p ON(a.clave_alu = p.clave_alu);

select a.clave_alu, a.nombre, ap_paterno, ap_materno, p.*
from alumnos a
left join pagos p ON(a.clave_alu = p.clave_alu)
where p.clave_alu is null
order by 5;

select a.clave_alu, a.nombre, ap_paterno, ap_materno, p.*
from alumnos a
join pagos p ON(a.clave_alu = p.clave_alu)
order by 5;

select a.clave_alu, a.nombre, ap_paterno, ap_materno, pago, fecha_pago, c.*
from alumnos a
join pagos p ON(a.clave_alu = p.clave_alu)
join cursos c on(p.id_curso = c.id_curso)
order by 5;

select a.clave_alu, a.nombre, ap_paterno, ap_materno, pago, fecha_pago, c.*
from alumnos a
join pagos p ON(a.clave_alu = p.clave_alu)
right join cursos c on(p.id_curso = c.id_curso)
order by 7;

select a.clave_alu, a.nombre, ap_paterno, ap_materno, 
pago, fecha_pago, p.id_curso, c.*
from alumnos a
join pagos p ON(a.clave_alu = p.clave_alu)
right join cursos c on(p.id_curso = c.id_curso)
where P.id_curso is null
order by 7;

-- pago de un curso no valido
select a.clave_alu, a.nombre, ap_paterno, ap_materno, 
pago, fecha_pago, p.id_curso, c.*
from alumnos a
join pagos p ON(a.clave_alu = p.clave_alu)
left join cursos c on(p.id_curso = c.id_curso)
where C.id_curso is null
order by 7;

select a.clave_alu, a.nombre, ap_paterno, ap_materno,  p.clave_alu, 
count(*) npagos, sum(pago) tpago
from alumnos a
left join pagos p ON(a.clave_alu = p.clave_alu)
group by a.clave_alu, a.nombre, ap_paterno, ap_materno,  p.clave_alu
order by 5;

select a.clave_alu, a.nombre, ap_paterno, ap_materno, 
count(p.clave_alu) npagos, ifnull(sum(pago),0) tpago
from alumnos a
left join pagos p ON(a.clave_alu = p.clave_alu)
group by a.clave_alu, a.nombre, ap_paterno, ap_materno,  p.clave_alu
order by 5;

select a.clave_alu, a.nombre, ap_paterno, ap_materno, pago, fecha_pago
from alumnos a
join pagos p ON(a.clave_alu = p.clave_alu);

select a.clave_alu, a.nombre, ap_paterno, ap_materno, pago, fecha_pago
from alumnos a
natural join pagos p;

select ciudad, COUNT(p.clave_alu) npagos, ifnull(sum(pago),0) tpago,
avg(pago) promedio
from alumnos a
NATURAL LEFT JOIN pagos p
where YEAR(fecha_pago) = 2017
group by ciudad;


update alumnos set id_estado = null
where ap_paterno = 'Mejia' and ap_paterno = 'Jimenez' and nombre = 'luisa';

select * from alumnos 
where ap_paterno = 'Mejia' and ap_paterno = 'Jimenez' and nombre = 'luisa';

select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombres) alumno,
a.id_estado, e.id_estado, estado, abreviatura
from alumnos a
JOIN estados e ON (a.id_estado = e.id_estado);

select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombres) alumno,
a.id_estado, e.id_estado, estado, abreviatura
from alumnos a
LEFT JOIN estados e ON (a.id_estado = e.id_estado)
order by e.id_estado;

-- Union al menos la misma cantidad de campos en la misma consultas

select * from niveles; -- priemar tabala define el numero de campos
select * from grados;
select * from estados;

select * from niveles
UNION
select * from grados;

select * from niveles
UNION
select * from grados
UNION
select id_estado, estado from estados;

-- 
select * from alumnos;
select * from profesores;

select clave_alu clave, concat_ws(' ', ap_paterno, ap_materno, nombre) persona,
sexo, curp, 'alumno' tipo
from alumnos
where sexo = 'f'
UNION
select clave_prof, concat_ws(' ', apellido_p, apellido_m, nombres) profesor,
sexo, curp, 'profesor' tipo
from profesores
where sexo = 'f'
order by 2;

select clave_alu clave, concat_ws(' ', ap-paterno, ap_materno, nombre)
persona,
sexo, curp, 'alumno' tipo
from alumnos
UNION ALL
select clave_alu clave, concat_ws(' ', ap-paterno, ap_materno, nombre)
persona,
sexo, curp, 'alumno' tipo
from alumnos;

select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombre) alumno,
a.id_estado, e.id_estado, estado, abreviatura
from alumnos a
LEFT JOIN estados e ON(a.id_estado = e.id_estado)
where e.id_estado is null
UNION
select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombre) alumno,
a.id_estado, e.id_estado, estado, abreviatura
from alumnos a
RIGHT JOIN estados e ON(a.id_estado = e.id_estado)
where e.id_estado is null
order by 4;

select estado,
SUM(IF(sexo = ' ', 1, 0)) as 'Sin Dato',
SUM(IF(sexo = 'f', 1, 0)) as 'Femenino',
SUM(IF(sexo = 'm', 1, 0)) as 'Maculino'
from alumnos a
RIGHT JOIN estados e ON(a.id_estado = e.id_estado)
GROUP BY estado
order by 1;

select *, (sindato + femenino + masculino) total
from (
select estado,
SUM(IF(sexo = ' ', 1, 0)) as 'Sin Dato',
SUM(IF(sexo = 'f', 1, 0)) as 'Femenino',
SUM(IF(sexo = 'm', 1, 0)) as 'Maculino'
from alumnos a
RIGHT JOIN estados e ON(a.id_estado = e.id_estado)
GROUP BY estado
) s
order by 1;


select estado,
SUM(IF(anio = 2017, tpago, 0)) '2017',
SUM(IF(anio = 2018, tpago, 0)) '2018'
from 
(
select estado, a.clave_alu, YEAR(fecha_pago), anio, sum(pago) tpago
from alumnos a
JOIN pagos p on (a.clave_alu = p.clave_alu)
RIGHT JOIN estados e ON(a.id_estado = e.id_estado)
GROUP BY estado, a.clave_alu, YEAR(fecha_pago)
) x
group by estado
order by estado;

-- Vistas = resultado de una consulta SQL de cero, una o varias tablas.
-- tienen la misma estructura que una tabla: filas y columnas. La unica diferencia es que solo se almacena de elllas la deficnion no los datos
-- toda vista pertenece a una base de datos.
-- Tiene Limitaciones una vista puede servir pars crear otra vista, no se puede usar tablas temporales, la estructura de la tabla es persistente

-- SINTAXIS Vistas 
-- CREATE [OR REPLACE] --> remplaza por una nueva, {}=optativo

use colegio2410;
-- conservar o tratar de consevar la independencia logica

CREATE OR  REPLACE VIEW estudiantes AS 
SELECT * FROM alumnos;

show tables;

select * from estudiantes;

select * from 
information_schema.tables    -- metadatos de los objetos de mi informacion 
where table_schema = 'colegio2410'
and table_type = 'VIEW'; -- mayusculas

show create view estudiantes;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estudiantes` AS 
select `alumnos`.`clave_alu` AS `clave_alu`,`alumnos`.`clave_admin` AS 
`clave_admin`,`alumnos`.`ap_paterno` AS `ap_paterno`,`alumnos`.`ap_materno`
 AS `ap_materno`,`alumnos`.`nombre` AS `nombre`,`alumnos`.`sexo` AS `sexo`,`alumnos`.`curp` 
 AS `curp`,`alumnos`.`peso` AS `peso`,`alumnos`.`estatura` AS `estatura`,`alumnos`.`direccion`
 AS `direccion`,`alumnos`.`colonia` AS `colonia`,`alumnos`.`cp` AS `cp`,`alumnos`.`ciudad` 
 AS `ciudad`,`alumnos`.`id_estado` AS `id_estado`,`alumnos`.`delegacion` AS `delegacion`,`alumnos`.`telefono`
 AS `telefono`,`alumnos`.`celular` AS `celular`,`alumnos`.`email` AS `email`,`alumnos`.`status_alu` AS 
 `status_alu`,`alumnos`.`fedita` AS `fedita` from `alumnos`;

CREATE OR REPLACE VIEW alumnas AS
SELECT * FROM alumnos WHERE sexo = 'f';

select * from alumnas;

select distinct status_alu from alumnos;  -- funcionalidad de vista puede ser esconder campos 

create or replace view alumnos_activos as
select clave_alu matricula, concat_ws(' ', ap_paterno, ap_materno, nombre) alumno, curp, sexo, ciudad
from alumnos
WHERE status_alu = 'AC';

select * from alumnos_activos;

create temporary table alumnos_tmp as
select * from alumnos;

select * from alumnos_tmp;

truncate table alumnos;

insert into alumnos
select * from alumnos_tmp;

select matricula, alumno, sum(pago) tpago, count(p.clave_alu) npagos
from
alumnos_activos ac 
LEFT JOIN pagos p ON(ac.matricula = p.clave_alu)
GROUP BY matricula, alumno
ORDER BY 2;


select matricula, alumno, sum(pago) tpago, count(p.clave_alu) npagos
from
alumnos_activos ac 
LEFT JOIN pagos p ON(ac.matricula = p.clave_alu)
where sexo = 'f'
GROUP BY matricula, alumno
ORDER BY 2;


create or replace view personas as 
select clave_alu clave, concat_ws(' ', ap_paterno, ap_materno, nombre) persona,
sexo, curp, ciudad, 'alumno' tipo
from alumnos
union
select clave_prof , concat_ws(' ', apellido_p, apellido_m, nombres) profesor,
sexo, curp, ciudad, 'profesor' tipo
from profesores;

select * from personas
order by 2;

CREATE OR REPLACE VIEW personas_qro AS
select * from personas
where ciudad rlike '(qro|quer)';

select * from personas_qro order by tipo;

CREATE OR REPLACE VIEW personas_qro AS
select clave, persona, sexo, curp,
if(ciudad rlike '(qro|quer)', 'QUERETATO', ciudad) ciudad, tipo
from personas
where ciudad rlike '(qro|quer)';

select * 
from INFORMATION_SCHEMA.TRIGGERS
where event_object_schema = database();

desc cursos;

-- apartir de aquí la consultas terminan con el delimiter

DELIMITER // 
DROP TRIGGER IF EXISTS bi_cursos //
CREATE TRIGGER bi_cursos
BEFORE INSERT ON cursos
FOR EACH ROW
BEGIN
	if(left(NEW.nombre,5) <> 'CURSOS') then
		SET NEW.nombre = upper(concat(' curso ', NEW.nombre));
	end if;
    SET NEW.nombre = upper(NEW.nombre);
END //
DELIMITER ;

select * from cursos;

insert into cursos values
('C014', 'escolar 2019-2020', '2019-2020', '2019-07-31 00:00:00', '2020-07-30 00:00:00'
),
('C015', 'curso semestral 2020-2021', '2020-2021', '2020-07-31 00:00:00', '2021-07-30 00:00:00'
);

insert into cursos values
('C016', 'escolar 2019-2020', '2019-2020', '2021-07-31 00:00:00', '2020-07-30 00:00:00'
);

DELIMITER // 
DROP TRIGGER IF EXISTS bi_cursos //
CREATE TRIGGER bi_cursos
BEFORE INSERT ON cursos
FOR EACH ROW
BEGIN
	if(left(NEW.nombre,5) <> 'CURSOS') then
		SET NEW.nombre = upper(concat(' curso ', NEW.nombre));
	end if;
    SET NEW.nombre = upper(NEW.nombre);
    IF(NEW.ffin <= NEW.finicio) then
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Fecha Final fuera de rango';
    end if;
END //
DELIMITER ;

insert into cursos values
('C017', 'escolar 2019-2020', '2019-2020', '2021-07-31 00:00:00', '2020-07-30 00:00:00'
);


show create trigger bi_cursos;

drop table if exists bitacora;
create table bitacora(
	id int not null auto_increment primary key,
    fecha datetime not null,
    usuario varchar (50) not null,
    tabla varchar(50) not null,
    accion text null
    );
select * from bitacora; 

DELIMITER // 
DROP TRIGGER IF EXISTS bu_cursos //
CREATE TRIGGER bu_cursos
BEFORE UPDATE ON cursos
FOR EACH ROW
BEGIN
	DECLARE caso varchar (10) default 'caso 0';
    SET new.nombre = upper(NEW.nombre);
    IF NEW.ffin = OLD.ffin THEN 
		SET NEW.ffin = DATE_ADD(OLD.ffin, INTERVAL 1 day); 
        SET CASO = 'Caso 1';
	END IF;
        IF NEW.ffin <= NEW.ffin THEN 
        IF NEW.nombre like '%curso%' THEN 
			SET NEW.ffin = DATE_ADD(OLD.ffin, INTERVAL 1 year); 
        SET CASO = 'Caso 1';
	END IF;
    if new.nombre like '%semestre%' then
    alter set new.ffin = date_add(old.ffin, interval 1 day)
    end if;
    
    



	-- CSV
   -- INSERT INTO bitacora VALUES (NULL, sysdate(), user(), 'CURSOS',
    -- CONCAT_WS('|', 'ELIMINACION', OLD.id_curso, OLD.nombre, OLD.abreviatura, OLD.finicion, OLD.ffinal));
    
    -- JSON
      INSERT INTO bitacora VALUES (NULL, sysdate(), user(), 'CURSOS',
      JSON_OBJECT('accion', 'ACTUALIZACION', 'caso', caso,
      'old_id_curso', OLD.id_curso, 
      'old_nombre', old.nombre, 'old_abreviatura', OLD.abreviatura, 
      
      'finicio', OLD.finicio, 'ffin', OLD.ffin));
END //
DELIMITER ;

select * from bitacora;
select * from cursos;
select * from cursos_tmp;

create temporary table cursos_tmp as
select * from cursos;

delete from cursos where id_curso = 'C015';
delete from cursos where id_curso = 'C014';

delete from cursos;

select id, fecha, JSON_EXTRACT(accion, '$.accion') acc,
JSON_UNQUOTE(JSON_EXTRACT(accion, '$.abreviatura')) abreviatura,
JSON_UNQUOTE(accion -> '$.id_curso') id_curso
from bitacora where id >= 2;

insert into cursos
select * from cursos_tmp;

truncate table cursos;

update cursos set nombre = 'semestre 2024-2', abreviatura = '2024-2', finicio = '2024-2', finicio = '2024-02-01',
ffin = '2024-01-01'
where id_curso = 'C015';
update cursos set nombre = 'semestre 2024-2', abreviatura = '2024-2', finicio = '2024-2', finicio = '2024-02-01',
ffin = '2024-01-01'
where id_curso = 'C014';