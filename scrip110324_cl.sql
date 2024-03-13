create database libros2410;

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

set sql_safe_updates = 0;

update escritor set pais = 52;

update escritor set id_escritor = id_escritor + 1000;

update escritor set id_escritor = id_escritor + 1000 where naciionalidad != 'MEXICANA';

delete from escritor WHERE id_escritor = 1001;

select * from escritor;

select * from libro;

delete from libro where id_escritor is null;

delete from libro;

alter table libro auto_increment = 100;

truncate table libro;

insert into libro values
(NULL, '1100', 'Yo robot', NULL),
(null, '1100', 'Fundacion', NULL),
(null, '1003', 'El llano en llamas', NULL);