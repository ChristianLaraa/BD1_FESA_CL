use colegio2410;

select * from alumnos;

/*fecha y hora del sistema*/
select sysdate() from dual;

select sysdate();

select sysdate(), user(), database();

show variables like '%dir%';

/*otra forma de llamar*/
select @@basedir, @@datadir;

select @@basedir, @@datadir, sysdate();

set @nombre = 'SAUL ISAAC RAMIREZ CORTES';

select @nombre;

select 'HOLA MUNDO' as saludo;

select 'HOLA MUNDO' as saludo, 
34+9 suma, 34-9 as resta, 34/9 division, 34*9 as multiplicacion;

select * from alumnos;

desc alumnos;

select clave_alu, nombre, ap_paterno, peso*1000 pesogr, estatura *100 estaturacm,
 (peso/(estatura * estatura)) imc, lower(nombre) nombremin from alumnos;
 
 select DISTINCT sexo from alumnos;
 
 select DISTINCT ciudad from alumnos;
 
 select DISTINCT ciudad, sexo from alumnos;
 
 select DISTINCT clave_alu from alumnos;

select * from alumnos;

 select * from alumnos

 where sexo= 'f';
 
 select ciudad, count(*) nreg
 from alumnos
 where sexo = 'f'
 group by ciudad;
 
  select ciudad, count(*) nreg
 from alumnos
 where sexo = 'f'
 group by ciudad
 having count(*) >= 5;
 
  select ciudad, count(*) nreg
 from alumnos
 where sexo = 'f'
 group by ciudad
 having count(*) >= 5
 order by 2 desc;
 
   select ciudad, count(*) nreg
 from alumnos
 where sexo = 'f'
 group by ciudad
 having count(*) >= 5
 order by 2 desc
 limit 2;
 
 select * from alumnos;
 
 select * from alumnos
 order by ap_paterno asc, ap_materno, nombre asc;
 
 select * from alumnos
 order by ap_paterno asc, ap_materno, nombre asc
 limit 20;
 
  select * from alumnos
 order by ap_paterno asc, ap_materno, nombre asc
 limit 21, 20;
 
  select * from alumnos
 order by ap_paterno asc, ap_materno, nombre asc
 limit 41, 20;
 
  select * from alumnos
 order by ap_paterno asc, ap_materno, nombre asc
 limit 61, 20;
 
 select * from alumnos
 order by sexo desc, ap_paterno asc, ap_materno, nombre asc;
 
  select * from alumnos
 order by sexo , ap_paterno asc, ap_materno, nombre asc;
 
 /*todo entre corchetes es opcional
 DISTINCT muestra la lista de valor unico de los campos de proyeccion
 Los demas valores del tema LMD- Sentencias de seleccion o consultas son utilizados para consultas personalizadas 
 WHERE para filtar renglones
 GROUP BY hacer grupos y saber cuantos tiene cada uno
 HAVING filtra los resultados de agregacion que vienen del group(COUNT, SUM, MAX, MIN, AVG)
 ORDER By ordena los datos desordenados de la tabla
 LIMIT limita el numero de registros que voy a ver, permite ver en cualquier posicion
 */
 
 select sexo from alumnos;
 
 select distinct sexo from alumnos;
 
 select distinct ciudad from alumnos order by 1 ASC;
 
 select distinct status_alu from alumnos;
 
 -- 1F, 2F, 3F 1:M
 
 select sexo from alumnos group by sexo;
 
 select ciudad, sexo from alumnos group by ciudad, sexo order by 1, 2;
 
 -- Funciones de agregacion: para hacer operaciones sobre los valores de los grupos que tenemos(pueden servir tambien si no hay grupos)
 -- count(contar), sum(suma), max(maximo), min(minimo), avg(promedio)
 
 select sexo, count(*) nreg from alumnos;
 
 select sexo, count(*) nalu 
 from alumnos group by sexo;
 
 select ciudad, sexo, count(*) nreg
 from alumnos
 group by ciudad, sexo
 order by 1,2;
 
 select ciudad, sexo, count(*) nreg
 from alumnos
 where sexo != ''
 having count(*) > 1
 order by 1, 2;
 
 select count(*) nreg from alumnos;
 
 select peso from alumnos;
 
 select peso, count(*) nreg, count(peso) npeso, sum(peso) suma,
 max(peso) max, min(peso) min, avg(peso) promedio
 from alumnos;
 
 select sexo, count(*) nreg,sum(peso) suma,
 max(peso) max, min(peso) min, avg(peso) promedio
 from alumnos
 group by sexo;
 
  select sexo, count(*) nreg,sum(peso) suma,
 max(peso) max, min(peso) min, avg(peso) promedio
 from alumnos
 where peso > 0
 group by sexo;
 
 select * from alumnos
 where sexo = 'f' and ciudad = 'queretaro' and peso > 0;
 
 select * from alumnos
 where sexo = 'f' or ciudad = 'queretaro';
 
 select * from alimnos
 where (sexo = 'f' and ciudad = 'queretaro') and peso > 0;
 
  select * from alimnos
 where NOT (sexo = 'f' and ciudad = 'queretaro') and peso > 0;
 
 select * from alumnos
 where ciudad = '';
 
 select * from alumnos 
 where ciudad is null;
 
 
select * from alumnos
where ciudad = 'null';

select * from alumnos
where (ciudad is null or ciudad = '' or ciudad = 'null');

select * from alumnos
where not (ciudad is null or ciudad = '' or ciudad = 'null');

 select * from alumnos
where (ciudad is null and ciudad = '' and ciudad = 'null');
 
 select * from alumnos
 where nombre = 'octavio' or nombre = 'argelia' or nombre = 
 'cesar' or nombre = 'guadalupe';
 
 select * from alumnos
 where nombre in ('octavio', 'argelia', 'cesar', 'guadalupe',
 'oscar'); 
 
 select * from alumnos
 where nombre not in ('octavio', 'argelia', 'cesar', 'guadalupe',
 'oscar'); 
 
  select * from alumnos
 where not nombre in ('octavio', 'argelia', 'cesar', 'guadalupe',
 'oscar'); 
 
 SELECT * FROM alumnos
WHERE peso between 60 AND 69
ORDER BY peso;

select * from alumnos
where nombre between ' FERNANDA' AND 'JAVIER'
order by nombre;

select * from alumnos
where nombre between 'FF' and 'JAVIER'
order by nombre;

select * from alumnos
where nombre between 'FF' and 'JAVIER'
AND sexo = 'F' AND ciudad = 'queretaro'
order by nombre;
 
 
 
 
 
 
 
 
 
 

