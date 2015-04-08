-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.0.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for helpdesk
DROP DATABASE IF EXISTS `helpdesk`;
CREATE DATABASE IF NOT EXISTS `helpdesk` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `helpdesk`;


-- Dumping structure for table helpdesk.estado
DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Dumping data for table helpdesk.estado: ~3 rows (approximately)
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`idEstado`, `Descripcion`) VALUES
	(1, 'Espera'),
	(2, 'Proceso'),
	(3, 'Finalizado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;


-- Dumping structure for table helpdesk.fedback
DROP TABLE IF EXISTS `fedback`;
CREATE TABLE IF NOT EXISTS `fedback` (
  `idFedback` int(11) NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `Ticket` int(11) NOT NULL,
  `Empleado` int(11) NOT NULL,
  PRIMARY KEY (`idFedback`),
  KEY `FKTicket_idTicket` (`Ticket`),
  KEY `FKEmpleado_idEmpleado` (`Empleado`),
  CONSTRAINT `FKEmpleado_idEmpleado` FOREIGN KEY (`Empleado`) REFERENCES `persona` (`idPersona`),
  CONSTRAINT `FKTicket_idTicket` FOREIGN KEY (`Ticket`) REFERENCES `ticket` (`idTicket`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Dumping structure for table helpdesk.persona
DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Cargo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Dumping data for table helpdesk.persona: ~4 rows (approximately)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`idPersona`, `Nombre`, `Cargo`) VALUES
	(1, 'Frankmer', 'Soporte'),
	(2, 'Radhames', 'Secretario'),
	(3, 'Maria', 'Oficinista'),
	(4, 'Juan', 'Programador');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;


-- Dumping structure for table helpdesk.ticket
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `idTicket` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` longtext COLLATE utf8_spanish_ci NOT NULL,
  `Empleado` int(11) NOT NULL,
  `Soporte` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `FechaCreacion` date NOT NULL,
  PRIMARY KEY (`idTicket`),
  KEY `FKEstado_estado` (`idEstado`),
  KEY `FKSoporte_Empleado` (`Soporte`),
  KEY `FKEmpleado_Empleado` (`Empleado`),
  CONSTRAINT `FKEmpleado_Empleado` FOREIGN KEY (`Empleado`) REFERENCES `persona` (`idPersona`),
  CONSTRAINT `FKEstado_estado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE CASCADE,
  CONSTRAINT `FKSoporte_Empleado` FOREIGN KEY (`Soporte`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Dumping data for table helpdesk.ticket: ~7 rows (approximately)
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` (`idTicket`, `Titulo`, `Descripcion`, `Empleado`, `Soporte`, `idEstado`, `FechaCreacion`) VALUES
	(1, 'Mi pc no enciende', 'Revise la conexion a la electricidad, pero como quiera no funciono.', 2, 1, 2, '2015-04-06'),
	(2, 'Instalar paquete de offimatica', 'mi pc no trae word, exel y professional', 2, 1, 1, '2015-04-06'),
	(3, 'Monitor roto', 'la pantalla de mi monitor esta cuarteada', 2, 1, 1, '2015-04-06'),
	(4, 'Google chrome no registra los ticket', 'En mi navegador de google chrome no se me permite registrar los ticket que creo. Favor resolver lo antes posible.', 2, 1, 3, '2015-04-06');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
