CREATE TABLE `empleados` (
  `id_empleado` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `rfc` varchar(13) UNIQUE NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ap_paterno` varchar(15) NOT NULL,
  `ap_materno` varchar(15),
  `sexo` char(1) NOT NULL,
  `fecha` date COMMENT 'Fecha de Nacimiento',
  `nacionalidad` varchar(30) DEFAULT 'Mexicana',
  `calle` varchar(55),
  `ciudad` varchar(40) NOT NULL,
  `codigo_postal` int,
  `telefono` varchar(12),
  `cargo` varchar(25),
  `salario` float,
  `fecha_contratacion` date COMMENT 'Fecha de contratación',
  `tiempo_experiencia` date COMMENT 'Tiempo de Experiencia'
);

CREATE TABLE `mobiliario` (
  `id_mobiliario` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `no_serie` int,
  `nombre` varchar(35) NOT NULL,
  `area` varchar(30),
  `precio` float,
  `marca` varchar(30),
  `funcionalidad` varchar(35),
  `fecha_compra` date COMMENT 'Fecha de Compra '
);

CREATE TABLE `menus` (
  `id_menus` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60),
  `temporada` varchar(30),
  `fecha_creacion` date COMMENT 'Fecha de Creación',
  `fecha_expiracion` date COMMENT 'Fecha de Expiración',
  `categoria` varchar(35),
  `ingredientes` varchar(80) NOT NULL,
  `calorias` float,
  `popularidad` char
);

CREATE TABLE `clientes` (
  `id_clientes` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `ap_paterno` varchar(40) NOT NULL,
  `sexo` char(1),
  `fecha_nacimiento` date COMMENT 'Fecha de Nacimiento',
  `correo_electronico` varchar(60),
  `telefono` varchar(20),
  `fecha_registro` date COMMENT 'Fecha de Registro',
  `calle` varchar(30),
  `colonia` varchar(30),
  `cp` int,
  `preferencia` varchar(50),
  `forma_pago` varchar(20)
);

CREATE TABLE `ingredidentes` (
  `id_ingredientes` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(200),
  `precio` float,
  `categoria` varchar(50),
  `calorias` float,
  `disponibilidad` varchar(40),
  `menu_dirigido` varchar(60),
  `fecha_compra` date COMMENT 'Fecha de compra',
  `fecha_caducacion` date COMMENT 'Fecha en que caduca'
);

CREATE TABLE `ordenes` (
  `id_ordenes` int UNIQUE NOT NULL AUTO_INCREMENT,
  `id_clientes` int UNIQUE NOT NULL AUTO_INCREMENT,
  `id_empleado` int UNIQUE NOT NULL AUTO_INCREMENT,
  `fecha_orden` date COMMENT 'Fecha en que se ordeno',
  `hora_orden` time COMMENT 'Hora en que se ordeno',
  `estado_orden` varchar(30),
  `metodo_pago` varchar(40),
  `monto_orden` float,
  `calle` varchar(40),
  `colonia` varchar(50),
  `cp` int,
  `notas` varchar(90),
  `calificacion_serv` char(2),
  PRIMARY KEY (`id_ordenes`, `id_clientes`, `id_empleado`)
);

CREATE TABLE `sucursales` (
  `id_sucursal` int UNIQUE NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60),
  `gerente` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(20),
  `colonia` varchar(40),
  `calle` varchar(40),
  `codigo_postal` int,
  `telefono` varchar(15),
  `horario_apertura` time COMMENT 'Hora en que se abre la sucursal',
  `horario_cierre` time COMMENT 'Hora en que se cierra la sucursal',
  `num_empleado` int,
  `nivel_popularidad` char(2),
  PRIMARY KEY (`id_sucursal`, `gerente`)
);

CREATE TABLE `proveedores` (
  `id_provedores` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `rfc` varchar(13) UNIQUE NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `ap_pat` varchar(40) NOT NULL,
  `ap_mat` varchar(40),
  `estado` varchar(15),
  `calle` varchar(35),
  `colonia` varchar(20),
  `telefono` varchar(15),
  `correo_electronico` varchar(40),
  `tipo_producto` varchar(30),
  `calidad_producto` varchar(20),
  `tiempo_entrega` varchar(20),
  `rango_precios` varchar(30)
);

CREATE TABLE `recetas` (
  `id_recetas` int UNIQUE NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50),
  `ingredientes` int UNIQUE NOT NULL AUTO_INCREMENT,
  `tiempo_preparacion` time COMMENT 'Tiempo aproximado en preparar',
  `tipo_productos` varchar(60),
  `calorias` float,
  `temporada` varchar(40),
  PRIMARY KEY (`id_recetas`, `ingredientes`)
);

CREATE TABLE `promociones` (
  `id_promociones` int UNIQUE NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60),
  `tipo` varchar(50),
  `id_menu` int UNIQUE NOT NULL AUTO_INCREMENT,
  `id_ingredientes` int UNIQUE NOT NULL AUTO_INCREMENT,
  `fecha_inicio` time COMMENT 'Inicio de la promocion',
  `fecha_fin` time COMMENT 'Fin de la promocion',
  `restricciones` varchar(90),
  `elegibilidad` varchar(60),
  `nivel_exito` char(2),
  `id_sucursales` int UNIQUE NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_promociones`, `id_menu`, `id_ingredientes`, `id_sucursales`)
);

CREATE TABLE `eventosEspeciales` (
  `id_eventosEsp` int UNIQUE NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50),
  `fecha` date COMMENT 'Inicio evento especial',
  `hora` time COMMENT 'Hora de inicio de evento especial',
  `tipo_evento` varchar(60),
  `costo` float,
  `cupo_asistentes` int,
  `nivel_impactoVentas` varchar(15),
  `id_sucursales` int UNIQUE NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_eventosEsp`, `id_sucursales`)
);

CREATE TABLE `transaccionesVentas` (
  `id_transaccion` int UNIQUE NOT NULL AUTO_INCREMENT,
  `tipo` varchar(40),
  `monto_total` float,
  `nivel_rentabilidad` varchar(50),
  `fecha_corte` date COMMENT 'Fecha de corte para el analisis',
  `id_productoMasVendido` int UNIQUE NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_transaccion`, `id_productoMasVendido`)
);

CREATE TABLE `encuestas` (
  `id_encuesta` int UNIQUE NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30),
  `id_cliente` int UNIQUE NOT NULL AUTO_INCREMENT,
  `numero_preguntas` int,
  `nivel_sastifaccion` varchar(60),
  `fecha_encuesta` date COMMENT 'Fecha de aplicacion de lña encuesta',
  PRIMARY KEY (`id_encuesta`, `id_cliente`)
);

CREATE TABLE `seguimientoEntregas` (
  `id_seguimientoEntregas` int UNIQUE NOT NULL AUTO_INCREMENT,
  `id_empleado` int UNIQUE NOT NULL AUTO_INCREMENT,
  `id_cliente` int UNIQUE NOT NULL AUTO_INCREMENT,
  `turno` varchar(20),
  `id_pedido` int UNIQUE NOT NULL AUTO_INCREMENT,
  `tiempo_entrega` time COMMENT 'Tiempo estimado de entrega',
  `fecha_entrega` date COMMENT 'Tiempo de entrega real',
  PRIMARY KEY (`id_seguimientoEntregas`, `id_empleado`, `id_cliente`, `id_pedido`)
);

CREATE TABLE `vehiculoServicio` (
  `id_vehiculo` int UNIQUE NOT NULL AUTO_INCREMENT,
  `placa` int UNIQUE NOT NULL,
  `marca` varchat(40),
  `kilometraje` int,
  `id_empleadoCargo` int UNIQUE NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_vehiculo`, `id_empleadoCargo`)
);

CREATE UNIQUE INDEX `uk_nombre` ON `empleados` (`nombre`, `ap_paterno`, `ap_materno`);

CREATE INDEX `clientes_index_1` ON `clientes` (`calle`, `colonia`, `cp`);

ALTER TABLE `ingredidentes` ADD FOREIGN KEY (`id_ingredientes`) REFERENCES `menus` (`ingredientes`);

ALTER TABLE `menus` ADD FOREIGN KEY (`id_menus`) REFERENCES `ingredidentes` (`menu_dirigido`);

ALTER TABLE `clientes` ADD FOREIGN KEY (`id_clientes`) REFERENCES `ordenes` (`id_clientes`);

ALTER TABLE `empleados` ADD FOREIGN KEY (`id_empleado`) REFERENCES `ordenes` (`id_empleado`);

ALTER TABLE `clientes` ADD FOREIGN KEY (`calle`) REFERENCES `ordenes` (`calle`);

ALTER TABLE `clientes` ADD FOREIGN KEY (`colonia`) REFERENCES `ordenes` (`colonia`);

ALTER TABLE `clientes` ADD FOREIGN KEY (`forma_pago`) REFERENCES `ordenes` (`metodo_pago`);

ALTER TABLE `clientes` ADD FOREIGN KEY (`cp`) REFERENCES `ordenes` (`cp`);

ALTER TABLE `empleados` ADD FOREIGN KEY (`id_empleado`) REFERENCES `sucursales` (`gerente`);

ALTER TABLE `ingredidentes` ADD FOREIGN KEY (`id_ingredientes`) REFERENCES `proveedores` (`tipo_producto`);

ALTER TABLE `ingredidentes` ADD FOREIGN KEY (`id_ingredientes`) REFERENCES `recetas` (`ingredientes`);

ALTER TABLE `menus` ADD FOREIGN KEY (`id_menus`) REFERENCES `promociones` (`id_menu`);

ALTER TABLE `ingredidentes` ADD FOREIGN KEY (`id_ingredientes`) REFERENCES `promociones` (`id_ingredientes`);

ALTER TABLE `sucursales` ADD FOREIGN KEY (`id_sucursal`) REFERENCES `promociones` (`id_sucursales`);

ALTER TABLE `sucursales` ADD FOREIGN KEY (`id_sucursal`) REFERENCES `eventosEspeciales` (`id_sucursales`);

ALTER TABLE `menus` ADD FOREIGN KEY (`id_menus`) REFERENCES `transaccionesVentas` (`id_productoMasVendido`);

ALTER TABLE `clientes` ADD FOREIGN KEY (`id_clientes`) REFERENCES `encuestas` (`id_cliente`);

ALTER TABLE `empleados` ADD FOREIGN KEY (`id_empleado`) REFERENCES `seguimientoEntregas` (`id_empleado`);

ALTER TABLE `clientes` ADD FOREIGN KEY (`id_clientes`) REFERENCES `seguimientoEntregas` (`id_cliente`);

ALTER TABLE `ordenes` ADD FOREIGN KEY (`id_ordenes`) REFERENCES `seguimientoEntregas` (`id_pedido`);

ALTER TABLE `empleados` ADD FOREIGN KEY (`id_empleado`) REFERENCES `vehiculoServicio` (`id_empleadoCargo`);
