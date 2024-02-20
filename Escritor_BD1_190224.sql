CREATE TABLE `escritor` (
  `id_escritor` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `rfc` varchar(13) UNIQUE NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ap_paterno` varchar(50) NOT NULL,
  `ap_materno` varchar(50),
  `fecha` date COMMENT 'fecha de nacimiento',
  `nacionalidad` varchar(30) DEFAULT 'Mexicana',
  `id_pais` int NOT NULL,
  `id_estado` int,
  `id_libro` int
);

CREATE TABLE `libro` (
  `id_libro` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) UNIQUE NOT NULL
);

CREATE TABLE `escritor_libro` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_escritor` int NOT NULL,
  `id_libro` int NOT NULL,
  `anio` int
);

CREATE TABLE `pais` (
  `id_pais` int PRIMARY KEY,
  `pais` varchar(150) UNIQUE NOT NULL,
  `codigo_iso` varchar(6) UNIQUE NOT NULL
);

CREATE TABLE `estado` (
  `id_estado` int PRIMARY KEY,
  `estado` varchar(150) UNIQUE NOT NULL,
  `codigo_iso` varchar(6) UNIQUE NOT NULL
);

CREATE UNIQUE INDEX `uk_nombre` ON `escritor` (`nombre`, `ap_paterno`, `ap_materno`);

ALTER TABLE `escritor` ADD FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`);

ALTER TABLE `escritor` ADD FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

ALTER TABLE `escritor_libro` ADD FOREIGN KEY (`id_escritor`) REFERENCES `escritor` (`id_escritor`) ON DELETE RESTRICT;

ALTER TABLE `escritor_libro` ADD FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);
