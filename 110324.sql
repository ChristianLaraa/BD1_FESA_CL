

use libros2410;

select database();

create table escritor(
id_escritor int not null auto_increment,
nombre varchar(100) not null,
paterno varchar(50) not null, 
materno varchar (50) default null,
pais int default null,
naciionalidad varchar(30) default 'MEXICANA', 
PRIMARY KEY (id_escritor),
UNIQUE KEY uk_nombre (nombre, paterno, materno)
);

create table libro(
id_libro int not null auto_increment,
id_escritor int not null,
titulo varchar(50) not null,
contenido text,
primary key(id_libro),
unique index uk_titulo(titulo),
foreign key(id_escritor) references escritor(id_escritor) 
on delete cascade on update cascade
);

show tables;

desc escritor;

INSERT INTO escritor VALUES(NULL, 'GABRIEL', 'GARCIA', 'MARQUEZ', '66', 'COLMBIANA');

INSERT INTO escritor(nombre, paterno, naciionalidad) VALUES('JUAN NEPOMUCENO', 'RULFO','MEXICANA');

INSERT INTO escritor(nombre, paterno) VALUES('AMPARO', 'DAVILA');

INSERT INTO escritor(nombre, paterno) VALUES('AMPARO', NULL);

INSERT INTO escritor(nombre, paterno) VALUES('AMPARO', 'NULL');

INSERT INTO escritor(pais, paterno, nombre) VALUES(52,'GARRO','ELENA');

INSERT INTO escritor SET
id_escritor = 100, nombre = 'ISSAC', paterno = 'ASIMOV', pais = 1, naciionalidad = 'ESTADOUNIDENSE';

INSERT INTO escritor SET
nombre = 'OCTAVIO', paterno = 'PAZ';

SELECT * from escritor;

desc libro;

show index from libro;

INSERT INTO libro VALUES(null, 1, 'Cien años de soledad', null),
(null, 1, 'El amor en tiempos de colera', null),
(null, 100, 'Yo robot', null),
(null, 100, 'Fundacion', null);

INSERT INTO libro VALUES(null, 1, 'Cien años de soledad', null),
(null, 1, 'El amor en tiempos de colera', null),
(null, 100, 'Yo robot', null),
(null, 100, 'Fundacion', null);

INSERT INTO libro VALUES(null, 300, 'El llano en llamas', null);

INSERT INTO libro VALUES(null, 3, 'El llano en llamas', null);

select * from libro;

show variables like '%safe%';

update escritor set pais = 52;

update escritor set pais = 52 WHERE naciionalidad = 'MEXICANA';

set sql_safe_updates = 1;

update escritor set pais = 52;

update escritor set id_escritor = id_escritor + 1000;

-- UPDATE
update escritor set id_escritor = id_escritor + 1000
where nacionalidad !=  'MEXICANA';

-- no lleva lista de campos, elimina todo el renglon, en su caso puede llevar u where y afecta a los rengloneds que cumplan con la condición
delete from escritor WHERE id_escritor = 1001;

select * from escritor;

select * from libro;

delete from libro where id_escritor is null;

-- DELETE SIN WHERE PARA VACIAR LA TABLA, EL NUMERO DE AI SE CONSERVA
delete from libro;


truncate table libro;

alter table libro auto_increment = 100;

--
insert into libro values 
(NULL, '1100', 'Yo robot', NULL),
(NULL, '1100', 'Fundacion', NULL),
(NULL, '1003', 'El llano en llamas ', NULL);
-- DATOOOOOOOOOSSSS
-- INSERTAR 



-- corregirrrrr
create table test2807 (
id_escritor int not null auto_increment,
nombre varchar(100) not null,
paterno varchar(50) not null, 
materno varchar (50) default null,
pais int default null,
naciionalidad varchar(30) default 'MEXICANA', 
PRIMARY KEY (id_escritor),
UNIQUE KEY uk_nombre (nombre, paterno, materno)
);
--  


show tables from test2807;
drop table test2807, libro, test2807, escritor;

rename table libro to tomo;
show tables;

select * from libro;
select * from tomo;

create table libro like tomo;
show tables;

select * from libro;

insert into libro values 
(NULL, '1100', 'Yo robot', NULL),
(NULL, '1100', 'Fundacion', NULL),
(NULL, '1003', 'El llano en llamas ', NULL);

update escritor set id_escritor = id_escritor + 1000;

select * from escritor;
select * from tomo;
select * from libro;

drop table libro;
show tables;

create table libro like tomo;

INSERT INTO libro
SELECT * FROM tomo;

rename table libros2410.libro to test2807.libro;
rename table libros2410.tomo to libros2410.libro;
show tables;

create temporary table libro_tmp like libro;
INSERT INTO libro_tmp
SELECT * FROM libro; 

CREATE TEMPORARY TABLE libro_tmp_dos as
select id_libro, id_escritor, titulo from libro;

show tables;

select * from libro_tmp;
select * from libro_tmp_dos;

desc libro_tmp_dos;

