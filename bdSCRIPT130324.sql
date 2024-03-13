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
 
 

