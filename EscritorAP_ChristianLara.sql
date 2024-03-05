show variables like '%dir';

create database libros2410;
show databases;
use libros2410;
select database();

-- CHRISTIAN GAEL LARA MARTINEZ
create table escritor(
	id_escritor int not null auto_increment primary key,
    nombre varchar (50) not null,
    apellidos varchar (40) not null,
    pais varchar (100),
    nacionalidad varchar (30) null default 'MEXICANA'
    );
    
	show tables;
    
    show columns from escritor;
    desc escritor;
    describe escritor;
    show index from escritor;
    /*Recuperar datos de la tabla*/
    show create table escritor;
    
    CREATE TABLE `escritor` (
  `id_escritor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `nacionalidad` varchar(30) DEFAULT 'MEXICANA',
  PRIMARY KEY (`id_escritor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- CHRISTIAN GAEL LARA MARTINEZ 
create table libro (
	id_libro int not null auto_increment,
    id_escritor int not null,
    titulo varchar (50) not null,
    contenido text,
    primary key (id_libro),
    unique index uk_titulo (titulo),
    /*Llave foranea*/
    foreign key (id_escritor) references escritor (id_escritor)
    on delete cascade on update cascade
);

show columns from libro;
show index from libro;

select * from escritor;

-- Christian Gael Lara Martinez

alter table escritor
add unique index uk_nombre (nombre, apellidos);

alter table escritor drop primary key;

alter table escritor
add paterno varchar (50) not null;

alter table escritor drop paterno;

alter table escritor
change apellidos paterno varchar (50) not null,
add materno varchar (50) not null after paterno,
modify pais int not null;

desc escritor;
-- LARA MARTINEZ CHRISTIAN GAEL 

drop table libro;
drop table escritor;
drop database libros2410;