CREATE DATABASE  IF NOT EXISTS `intex` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `intex`;
-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: intex
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acceso` (
  `idacceso` int(30) NOT NULL AUTO_INCREMENT,
  `accesoNombre` varchar(30) NOT NULL,
  `accesoIndice` int(30) DEFAULT '0',
  `accesourl` varchar(100) NOT NULL,
  `accesoComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idacceso`),
  UNIQUE KEY `accesoNombre_UNIQUE` (`accesoNombre`),
  UNIQUE KEY `idacceso_UNIQUE` (`idacceso`),
  KEY `fk_acceso_1_idx` (`accesoIndice`),
  CONSTRAINT `fk_acceso_1` FOREIGN KEY (`accesoIndice`) REFERENCES `acceso` (`idacceso`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
REPLACE INTO `acceso` VALUES (9,'Administraci√≥n',NULL,'#','fa fa-cog'),(10,'Sistema',9,'tipopp.intex','pi pi-folder-open'),(11,'Permisos y Licencias',9,'lictp.intex','pi pi-th-large'),(12,'Acad√©mica',9,'academico.intex','fa fa-leaf'),(13,'Perfil',NULL,'#','pi pi-user'),(14,'Permisos',45,'#','pi pi-eye'),(15,'Solicitar Permiso',14,'permisoE.intex','pi pi-briefcase'),(16,'Personal',NULL,'#','pi pi-users'),(17,'Gesti√≥n de maestros',27,'agregacion.intex','pi pi-user-plus'),(18,'Gesti√≥n de administradores',16,'agAdm.intex','pi pi-plus'),(19,'Plantel Institucional',35,'plantel.intex','pi pi-table'),(20,'Inventario',23,'inventario.intex','fa fa-barcode'),(21,'Libros',23,'libros.intex','fa fa-book'),(22,'Nuevo Ingreso',36,'inscripcion.intex','pi pi-user'),(23,'Recursos',9,'#','fa fa-yelp'),(24,'Nomina de Alumnos',36,'nominaA.intex','pi pi-user'),(25,'Gesti√≥n de Recursos',23,'admRecurso.intex','fa fa-table'),(26,'Lista de Representantes',35,'listaRepresentantes.intex','pi pi-list'),(27,'Maestros',16,'#','fa fa-puzzle-piece'),(28,'Gesti√≥n de horarios',27,'horario.intex','pi pi-plus'),(29,'Gesti√≥n de permisos',14,'permiso.intex','fa fa-legal'),(30,'Solicitud de permisos',14,'permisoM.intex','fa fa-ge'),(31,'Administrador de anuncios',9,'anuncios.intex','fa fa-bell'),(32,'Matricula',36,'matricula.intex','fa fa-slideshare'),(33,'Entrega de √ötiles',36,'paquetes.intex','fa fa-sliders'),(34,'Contribuciones',36,'contribuciones.intex','fa fa-money'),(35,'Listados',16,'#','fa fa-list-ul'),(36,'Alumnos',16,'#','fa fa-graduation-cap'),(37,'Reservas de Equipo',45,'#','fa fa-gamepad'),(38,'Solicitud de Reserva',37,'solicitudR.intex','fa fa-flag'),(39,'Historial de Reservas',43,'solicitudH.intex','fa fa-archive'),(40,'Gestionar Reservas de equipo',37,'srCra.intex','fa fa-certificate'),(41,'Historial de Notificaciones',43,'notifh.intex','fa fa-forumbee'),(42,'Proyecto Planificado',37,'solicitudRPP.intex','pi pi-pencil'),(43,'Historiales',13,'#','fa fa-folder-open'),(44,'Historial de permisos',43,'permisoH.intex','fa fa-database'),(45,'Solicitudes',NULL,'#','fa fa-street-view'),(46,'√Årea psicol√≥gica',45,'#','fa fa-ambulance'),(47,'Solicitud de cita psicol√≥gica',46,'solicitudCP.intex','pi pi-bookmark'),(48,'Adminitraci√≥n citas pscol√≥gica',46,'admCitasPs.intex','pi pi-calendar'),(49,'Consulta Psicol√≥gica',46,'consultasPS.intex','pi pi-window-maximize'),(50,'Historial citas Psicol√≥gicas',43,'citasPSH.intex','fa fa-file'),(51,'Horario de clases',13,'horarioCl.intex','fa fa-calendar'),(52,'Aspecto de la aplicaci√≥n',13,'temas.intex','fa fa-picture-o'),(53,'Mi usuario',13,'infoPerfil.intex','fa fa-android');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accesoTipoPersona`
--

DROP TABLE IF EXISTS `accesoTipoPersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesoTipoPersona` (
  `idacceso` int(30) NOT NULL,
  `idTipoPersona` int(30) NOT NULL,
  `accesoTipoPersonaComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idacceso`,`idTipoPersona`),
  KEY `fk_accesoTipoPersona_2_idx` (`idTipoPersona`),
  CONSTRAINT `fk_accesoTipoPersona_1` FOREIGN KEY (`idacceso`) REFERENCES `acceso` (`idacceso`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_accesoTipoPersona_2` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesoTipoPersona`
--

LOCK TABLES `accesoTipoPersona` WRITE;
/*!40000 ALTER TABLE `accesoTipoPersona` DISABLE KEYS */;
REPLACE INTO `accesoTipoPersona` VALUES (9,1,''),(9,2,''),(9,3,''),(9,5,''),(9,6,''),(9,7,''),(10,1,''),(10,2,''),(11,1,''),(11,2,''),(11,3,''),(12,1,''),(12,2,''),(13,1,''),(13,2,''),(13,3,''),(13,4,''),(13,5,''),(13,6,''),(13,7,''),(13,8,''),(13,9,''),(13,12,''),(13,13,''),(13,14,''),(13,15,''),(14,1,''),(14,2,''),(14,3,''),(14,4,''),(14,5,''),(14,6,''),(14,7,''),(14,8,''),(14,9,''),(14,12,''),(14,13,''),(14,14,''),(14,15,''),(15,8,''),(15,9,''),(16,1,''),(16,2,''),(16,3,''),(16,4,''),(16,12,''),(16,13,''),(17,1,''),(17,2,''),(18,1,''),(18,2,''),(19,1,''),(19,2,''),(19,3,''),(19,13,''),(20,1,''),(20,2,''),(20,5,''),(20,6,''),(20,7,''),(21,1,''),(21,2,''),(21,5,''),(22,1,''),(22,2,''),(22,3,''),(22,4,''),(22,13,''),(23,1,''),(23,2,''),(23,5,''),(23,6,''),(23,7,''),(24,1,''),(24,2,''),(24,3,''),(24,4,''),(24,13,''),(25,1,''),(25,2,''),(25,5,''),(25,6,''),(25,7,''),(26,1,''),(26,2,''),(26,3,''),(26,4,''),(26,13,''),(27,1,''),(27,2,''),(28,1,''),(28,2,''),(29,1,''),(29,2,''),(29,3,''),(30,1,''),(30,2,''),(30,3,''),(30,4,''),(30,5,''),(30,6,''),(30,7,''),(30,12,''),(30,13,''),(30,14,''),(30,15,''),(31,1,''),(31,2,''),(31,3,''),(31,4,''),(31,5,''),(31,6,''),(31,7,''),(31,13,''),(32,1,''),(32,2,''),(32,13,''),(33,1,''),(33,2,''),(33,12,''),(34,1,''),(34,2,''),(34,12,''),(35,1,''),(35,2,''),(35,3,''),(35,4,''),(35,13,''),(36,1,''),(36,2,''),(36,3,''),(36,4,''),(36,13,''),(37,1,''),(37,2,''),(37,3,''),(37,4,''),(37,5,''),(37,6,''),(37,7,''),(37,8,''),(37,13,''),(38,1,''),(38,2,''),(38,3,''),(38,4,''),(38,5,''),(38,6,''),(38,7,''),(38,8,''),(39,1,''),(39,2,''),(39,3,''),(39,4,''),(39,5,''),(39,6,''),(39,7,''),(39,8,''),(40,1,''),(40,2,''),(40,5,''),(40,6,''),(40,7,''),(41,1,''),(41,2,''),(41,3,''),(41,4,''),(41,5,''),(41,6,''),(41,7,''),(41,8,''),(41,9,''),(41,12,''),(41,14,''),(41,15,''),(42,1,''),(42,2,''),(42,4,''),(43,1,''),(43,2,''),(43,3,''),(43,4,''),(43,5,''),(43,6,''),(43,7,''),(43,8,''),(43,9,''),(43,12,''),(43,13,''),(43,14,''),(43,15,''),(44,1,''),(44,2,''),(44,3,''),(44,4,''),(44,5,''),(44,6,''),(44,7,''),(44,8,''),(44,9,''),(44,12,''),(44,13,''),(44,14,''),(44,15,''),(45,1,''),(45,2,''),(45,3,''),(45,4,''),(45,5,''),(45,6,''),(45,7,''),(45,8,''),(45,9,''),(45,12,''),(45,13,''),(45,14,''),(45,15,''),(46,1,''),(46,8,''),(46,14,''),(47,8,''),(48,1,''),(48,14,''),(49,1,''),(49,14,''),(50,8,''),(51,4,''),(51,8,''),(51,9,''),(52,1,''),(52,2,''),(52,3,''),(52,4,''),(52,5,''),(52,6,''),(52,7,''),(52,8,''),(52,9,''),(52,12,''),(52,13,''),(52,14,''),(52,15,''),(53,1,''),(53,2,''),(53,3,''),(53,4,''),(53,5,''),(53,6,''),(53,7,''),(53,8,''),(53,9,''),(53,12,''),(53,13,''),(53,14,''),(53,15,'');
/*!40000 ALTER TABLE `accesoTipoPersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anuncio`
--

DROP TABLE IF EXISTS `anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncio` (
  `idanuncio` int(30) NOT NULL AUTO_INCREMENT,
  `anuncioTitulo` varchar(45) NOT NULL,
  `anuncioFechaFin` date NOT NULL,
  `anuncioTexto` text NOT NULL,
  `anuncioAnunciante` int(30) NOT NULL,
  `anuncioTipoPersona` int(30) DEFAULT NULL,
  `anuncioComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idanuncio`),
  KEY `fk_anuncio_1_idx` (`anuncioAnunciante`),
  KEY `fk_anuncio_2_idx` (`anuncioTipoPersona`),
  CONSTRAINT `fk_anuncio_1` FOREIGN KEY (`anuncioAnunciante`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_anuncio_2` FOREIGN KEY (`anuncioTipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
REPLACE INTO `anuncio` VALUES (1,'Inicio de clases','2020-01-31','las clases inicial el 20/01/2020. con uniforme desde las 08:30 am.',1045367073,NULL,NULL),(2,'CANCELACI√ìN DE ENSAYO','2020-01-30','HOLA',1045367083,8,'Desabilitado por: Laura Mar√≠a L√≥pez Su√±iga'),(3,'Lorem ipsum dolor sit amet','2020-03-10','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1045367083,NULL,'Modificado por: Guillermo Aldolfo Delsas Murcia'),(4,'no hay clases','2020-02-08','el s√°bado XD XD :V',1045367084,NULL,NULL);
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aula` (
  `idaula` int(30) NOT NULL AUTO_INCREMENT,
  `zonaAula` int(30) NOT NULL,
  `aulaComentario` varchar(145) DEFAULT NULL COMMENT 'Contiene la lista de las aulas del instituto',
  PRIMARY KEY (`idaula`),
  KEY `fk_aula_1_idx` (`zonaAula`),
  CONSTRAINT `fk_aula_1` FOREIGN KEY (`zonaAula`) REFERENCES `zona` (`idzona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
REPLACE INTO `aula` VALUES (1,1,''),(2,1,''),(3,1,''),(4,1,''),(5,1,''),(6,2,''),(7,2,''),(8,3,''),(9,3,''),(10,3,''),(11,3,'');
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `idautor` int(30) NOT NULL AUTO_INCREMENT,
  `autorNombre` varchar(30) NOT NULL,
  `autorComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idautor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
REPLACE INTO `autor` VALUES (1,'Rusou 1',''),(2,'loosss','8'),(3,'Delsas',''),(4,'Lic. Julio Zelada',''),(5,'Museo de la palabra y la image',''),(6,'Rudyard Kipling',''),(7,'Gabriel Alegr√≠a',''),(8,'D.J. Flakoll',''),(9,'Paul Watzlawick','');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorLibro`
--

DROP TABLE IF EXISTS `autorLibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorLibro` (
  `idautor` int(30) NOT NULL,
  `idLibro` int(30) NOT NULL,
  `autorLibrocComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idautor`,`idLibro`),
  KEY `fk_autorLibro_2_idx` (`idLibro`),
  CONSTRAINT `fk_autorLibro_1` FOREIGN KEY (`idautor`) REFERENCES `autor` (`idautor`) ON UPDATE CASCADE,
  CONSTRAINT `fk_autorLibro_2` FOREIGN KEY (`idLibro`) REFERENCES `recurso` (`idrecurso`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorLibro`
--

LOCK TABLES `autorLibro` WRITE;
/*!40000 ALTER TABLE `autorLibro` DISABLE KEYS */;
REPLACE INTO `autorLibro` VALUES (3,766,''),(4,1,''),(5,1140,''),(6,7663,''),(7,98,''),(8,98,''),(9,1890,'');
/*!40000 ALTER TABLE `autorLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacitaciones`
--

DROP TABLE IF EXISTS `capacitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capacitaciones` (
  `idMaestro` int(30) NOT NULL,
  `fechaCapacitaciones` date NOT NULL,
  `capacitacionCategoria` varchar(50) NOT NULL,
  `capacitacionArea` varchar(50) NOT NULL,
  `capacitacionNombre` varchar(50) NOT NULL,
  `capacitacionCertificado` bit(1) NOT NULL DEFAULT b'0',
  `capacitacionPatrocinador` varchar(80) NOT NULL,
  `capacitacionModalidad` enum('P','S','V') NOT NULL DEFAULT 'P',
  `capacitacionComentario` varchar(145) DEFAULT NULL COMMENT 'Hist√≥rico de las capacitaciones que cada maestro de la instituci√≥n ha hecho.',
  PRIMARY KEY (`idMaestro`,`fechaCapacitaciones`),
  CONSTRAINT `fk_capacitaciones_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacitaciones`
--

LOCK TABLES `capacitaciones` WRITE;
/*!40000 ALTER TABLE `capacitaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `capacitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `idcargo` int(30) NOT NULL AUTO_INCREMENT,
  `cargoNombre` varchar(50) NOT NULL COMMENT 'Lista de los cargos que el personal docente puede desempe√±ar.',
  `cargoTipoPersona` int(30) DEFAULT NULL,
  `cargoComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idcargo`),
  KEY `fk_cargo_1_idx` (`cargoTipoPersona`),
  CONSTRAINT `fk_cargo_1` FOREIGN KEY (`cargoTipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
REPLACE INTO `cargo` VALUES (1,'Director',2,''),(2,'Subdirector',3,''),(3,'Coordinador de √°rea bibliogr√°fica',5,''),(4,'Coordinador de √°rea Inform√°tica',6,''),(5,'Psic√≥logo',14,''),(6,'Coordinador de laboratorio de CC.NN',7,NULL);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(30) NOT NULL,
  `categoriaNombre` varchar(50) NOT NULL,
  `categoriaComentario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
REPLACE INTO `categoria` VALUES (0,'Generalidades s',NULL),(100,'Filosof√≠as y Disciplinas afines',NULL),(300,'Ciencias Sociales',''),(400,'Leguas',''),(500,'Ciencias Puras',''),(600,'Ciencias Aplicadas',''),(700,'Bellas Artes',''),(800,' Literatura',''),(900,'Geografia e Historia','');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citaPsicologia`
--

DROP TABLE IF EXISTS `citaPsicologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citaPsicologia` (
  `estudiante` int(30) NOT NULL,
  `fechaSolicitada` datetime NOT NULL,
  `fechaSolicitud` datetime NOT NULL,
  `estado` enum('S','A','P','C','T') NOT NULL DEFAULT 'S',
  `motivo` varchar(145) DEFAULT NULL,
  `comentarios` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`estudiante`,`fechaSolicitada`),
  KEY `fk_citaPsixologia_1_idx` (`estudiante`),
  CONSTRAINT `fk_citaPsixologia_1` FOREIGN KEY (`estudiante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citaPsicologia`
--

LOCK TABLES `citaPsicologia` WRITE;
/*!40000 ALTER TABLE `citaPsicologia` DISABLE KEYS */;
REPLACE INTO `citaPsicologia` VALUES (16018,'2020-01-30 21:54:00','2020-01-30 19:38:29','C','','tr'),(16018,'2020-01-30 21:59:46','2020-01-30 21:56:53','T','frnh',''),(16018,'2020-01-31 11:26:32','2020-01-31 11:23:51','T','','ya tengo una.'),(16018,'2020-02-03 10:30:00','2020-01-30 22:03:33','A','gfdvdsgdfsgsdfgd','');
/*!40000 ALTER TABLE `citaPsicologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constancias`
--

DROP TABLE IF EXISTS `constancias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constancias` (
  `idConstancias` int(30) NOT NULL,
  `fechaSolicitud` date NOT NULL,
  `tioPermiso` int(30) NOT NULL,
  `fechaInicio` date NOT NULL,
  `documento` longblob NOT NULL,
  `extenci√≥n` varchar(100) NOT NULL,
  `comentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idConstancias`,`fechaSolicitud`,`tioPermiso`,`fechaInicio`),
  KEY `fk_constancias_1_idx` (`idConstancias`),
  CONSTRAINT `fk_constancias_1` FOREIGN KEY (`idConstancias`, `fechaSolicitud`, `tioPermiso`, `fechaInicio`) REFERENCES `permisos` (`ipPersona`, `permisoFechaSolicitud`, `tipoPermiso`, `permisoFechaInicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constancias`
--

LOCK TABLES `constancias` WRITE;
/*!40000 ALTER TABLE `constancias` DISABLE KEYS */;
REPLACE INTO `constancias` VALUES (1045367085,'2020-02-03',1,'2020-02-03','ˇÿˇ‡\0JFIF\0\0H\0H\0\0ˇ€\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ˇ€\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ˇ¬\0XR\"\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇƒ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ˇ⁄\0\0\0\0‰f“ﬂ	ÃDY”]Z6â«‚˚5x˛óñÓ„yF]ºéAŒ¢RÑ*J†‚J∆è>ım<9;E ®ävjSì\n!ÌP6π]úC@Ö(Õ2vNÌE2J2€ôß	<:®ÙÂ·˙ÙûÊFwÃc\\ßÌyŒÈˆ…ßÂ›¨»=K·Ófì·–—õÍR€\nµÔÉ\\®:ïØr•Ã\ZkLÔUNú\Zm5ºi=äÛj¬ä©Ãú\'YºáyÔr¨¯ûµ‘ñx∫Yµß\r‹OcŒIÂ¶PDµ5háπ$≥—”¶ôùTŒﬁmùy…ùp©I£”Œzz4B\'”6RuPi∆h\r8éÅe%Söî^eÌ)Íy>™yKè®÷3Ô<≤´ªU«\'^\ZG2M1uÚ◊≥&ç\n®ïUõ±≥ö§\"ƒö:g mÑONÌM0]´∂6j\\¨!\'ZC…:qi•U∆q™\nò’_YÈÄ‘ÃÎÒ≠W\"ÒΩh¥‚ÑÎ¥ºiºaá¨l‰™˝LµüYyJ:g—ÜÜN+qπ˝W∫ß™JÕßÎç˙\Z9ÕX¨A‘A\'§ùòsqºµ	ƒ°W=y∂CJü–¯_F‚ËÉº˛¿¿Ù[º8Ÿ¨ËP±ô≤éM†ud13Xº·5#Br”:ï42∆[$’À§ámWú;V*ÿ”+W≥Ô8Ÿ≈≤ÁUÁ\"∆Ä≈\0¢ƒd\0◊≥YPíS{]Á%ÿy}êD\\€É§„Ï©<ò˜aØ^µ´@Ø™0œ,ájquÃ∑±4Ô8fûƒ[X\ZUdbûôÑ™ÀrW$ñ)µf+Ühª6ıo¬MyW≠b¢¥zV∆ı≠VN∫íW‹ıõgT*ªsÓ‹ó]äÎç¥◊zÛí¬3«©èj #mùeb:ÁN–!PkYrO^TÀH§:ºË)V«vsV	®E‰Z≠ûÊ}Á;væxRΩU÷q@£m*∂k o⁄kF◊ïŸMÿiG£¶ÎçØ∞.©é£VÍWñä9÷MÆuÏJ\rÄ@“ºÎŒƒ^R6ôQ’¢kVig§ PÁ•f3ií≤8÷çãÁ+4\0‹à˘gQœ´V≠™Æô-=nıe·w€ŸÖŒ≥»U\nÖ˘ÙM)úcÆBïav•CC+\\‰f.Ÿº„$V∑JŒôñµ±ÕP˙!tuÔ„≠x1njı»˝W—ﬂ6ã´1|≠}¯È‘£!¶íJΩÑd©·z2Xc≠6)SL$!Z¶Â:ı˜ŒÕEfÊ∏ç≈Bı.åéPó\\ëÅaï„#\n•àVöπîﬁm©UIX‡jßRËl‘◊Ë·ºV+ƒ15∆À0ß¶NƒU5QÏA÷Õ˝:Z8—“ÓC∫\r=LÀŒë∑ ¶êÓßé˜ÄÃ¸Õú^¨gb°∂ FØ9¢HS•âu^bMÊ!5`Û¥∂≥Ïºı7hÏk∆)ö.kùß\nµs\n““l√§ì\'€K¬Ù@¿õÀ≠f¨Ù\nªY€:Ÿù/yÎ^°z.∏.M>kgªû˘3E+Um0EÉ\r«6À»]\nÆYcÔı+üX¨ÛOû*<wEœ\Z pëSxΩ¬LÖÏëÑºT)´ØÖ∫’U4nQy÷‰˙~OY—ªï†hKyV¶π⁄ó≥{y`PÈ‹‘çë∆é;©46z˘8\Zæ°Áı9•	Váøë°”√€3¥ƒ\Zpjñ	±[Eßx¥T•Su5Î5ÏÁ˝LãôZOX◊65öˆ˘k:Á#wè¨Ât4ˆõzY7Ú‘∆Œÿ˘nèKïk4vYiOd∂òlÎ„`®µ¡]Œ4\0¨‚kû£öÛw\ZπZπ[bÈy–@rìΩVƒ[¥ï ´Å)!˙tÛµ<^Ób¯•Z>^éseòŸ¢JıòÏü†`•c¶=™ÚÀUó°r9Ê≥ûÍ¡b≥kï†Aø]\\◊gW∏Ü∏ÎÇ>~ÊUk≠e;ËcIM§ÏíM” Ô∂xû”ÃË°õπJ5£ù“sfè\\∑Wpuâ’√w¬ÿØ◊èF*]\0d±!MFu⁄⁄ePè≠P5y§w∫8R∫åå\Z∫fRÜÂ±â<ÅHÏƒ)2qwq≤tãﬁã„˛µ¡±¡d|˚.jıÖXAª[K¨+∫õcÀèc+XÈ^…∏ÙÂıwZ◊;®Öõ9˚AD(mõºÀ§eÌW\0n¯kë-ÃMÚqêW%I&iï5âf†]Ø9si¶í@@}é=ahÒÌÜ˝\0çï◊S†]á%∂|˝mlÕé÷–.y›Õ\'\'›œgBÜìµ&hÅ¨Q±S*å√îûqQîPÛã-ãå˙˜ñŸg2Ñ]íV3Aª\\ÌÏé¶∫ö€ÜPyo‘≈üÀÌ{9∂”Õ–°Dz‹ÈˆÂ,ÛTËÀ–ÙqÔy€„Q=é¨Ú≤Ìfoú¢∏JC§ÏòiÀb\\ƒ„ãBòÓLm^fàï~ŒP\nM:HÅúªE©’œ∑ïI$≥∞<HOOÿyó•˘›@4kqu0t≥U— ËktgÑùŒQÓghÒÈôt6’`Âu€G,=mNº9πˆÖóÀÈõô√m<%.å”J\rCnÆ\\≤”MæDÄﬂIdíhëö2ıIj@íSX⁄ÿ˙B?o»Í·}µKqÚ{⁄´ië‹Ø:<Á[ ÙÊ>Û ∫›cn†,skV∆.F≥€dÛ\Zùﬁf±p#õ&…ïÍAíÇ{î9≈®<ì“C¬C8¶\nQê$ênÙæSË<õk‰Z≥´oëÎ<˛ÅÁÎSÁ›Jå\ZôÜÔßGó›À’p:E∆ªp◊|U®\nN¬0ﬁë∞≈n4›´l9µ8∆4§É)dfà›⁄bO⁄,PAî·zù–“I˙<ËØc*Ì<ﬁΩ\Zõ4πzË4GZT™X ∂¿\\ÁWü”Õîil¬)Œ‰rõ!¢¢”û≥•Vab|Ìfnü“L‰ \Z≤0LwS∞2Hx˙4ÏTYõg‡Œ”§·w®‚ñWÈ‡Ûéáì´z7™rˆV±4 §Ç6«ùπS\\≥\Z”È4c°©î∂⁄Õéµ4tÂ^\"íÎÁLË\'ØüÆ å˘”gHI&ÖŒLúI;1:@ì8;;\n«oÁÔûû∑SŒ˙æ.õŸ⁄˘ŸÙcÖ9ßBå+GH)Ey*«º˘’ø*È9^ÆdÈ˙qEéêXB=LÂRÇ*_†¶˙<≠®Ωıû¶≤ì-∞úá\"dô1“@ÔdÑ…!º£6ãßñìËnr/é›Ö|πÈ§LìFõ:∂p◊J¶^ôd6…ªπp-ıò\0zô©£0$òE¡\'êEM ÇÍÒôù(π)‚·\'fi“`öãÉ≤@ÛÉ¥VÖêÁ1êH±C⁄Æˆc]íQJº9ˆüüº\Zê5ä¿ nx¡ÑqIPA44Å(ZsÕS(dí	;0§ÏÏLò3Ñùê•(Õé§Ñ¶∆D^T\'F∞\rYw/^´ï™◊1≠b´cb3 ”ãùÅ$Å$ÉiËêõ∏∂ÍÉ\'pI–(ÕÅ;†fúDœ(OjoVÂ^ﬁ≥ÃÂZú÷æÍ¨Mzº∫Æáõ‹Ã(<dÇ-&≈›êRã;ÑS†‘àÄÚã;´ãª°ù‹#\'pe#\0£◊s\\»v°$ÌJp X”—“∆≥yÛ‘πîÄ‘ï[5JE’EŸvõ Õ É ¶ú\Z	1$ÇnŒL›HQrNXßkj:˝hVÿ“Á—ø∆Ωêi5¶õ8ûqêhÔs=>OõE§∆2çå¢Â1M…ò√)µ´IåIÿk<∆ÿ≈&bI¡ì†îîíë!jSËkw∏ﬂ9cN÷uƒŸ‘Â—kçµG¢!meìƒ&ìâ;L‘ÚªPÍØ4æ}~ŒSY\r®÷∑÷”ŒŸã”¡ •´¿’k{ô,Ãb=tÅ&@i»≤°πôøçz/#’˘åR6)Zıﬁ\"Óö~g[Jé–$4ñHÅj}\r¨´áV°j\'Gƒ-s0ÓÏÚ≤µ“Ûõw—»≠\rZ\\’ûîQvksAOÆÜ~¢s„Ôe‹ÑÇtòíH÷Ë3=ö∏˝>’°∑ítºu°¶¶≤_CÛ#e]óÍ⁄8a⁄2∆A‘√>ﬁU´v£:À\\:©Ωùi$CTÕìØ»…í,ÑM@Za(Â¶ÈôÉ ;Q&vBIeÿÂ_Ûµ”Êtx-dtdòìETÿ=Mv˝7!ÿsﬂó◊€∫Ÿ{˝™^aw∞Á—ƒäbËáPjSq…©<S$¢·)BBLò%aÖ2W$…	ù1ùíIüBÜœ7√|ß9≠ã™à-ÛdìÈÏzgêËc^«ó»cCÌπ\\P≥∏ÊÚG§°J\ZJd®Rgíi‰Œ…&BIê$êD6 ®i%NùÅ$ËätEÿKù˘áî∫∞Kß8≤LNêNi&mT† Æïd©4RbI∫M<RöA$ìIííÈBí©$¶ô“c$ëˇƒ\0.\0\0\0\0! 1\"02#A3@4B$%ˇ⁄\0\0É≥{q1∏√,:K\'Ï=‚%0ò}Õÿ;1ﬂ‚?Òµ—cö‹hÓ>{é’‘^*≠s…öÜ∂Ñkÿ#w¨¡->ÌoŸˇ\0ûÿXÛãE®ôvíæ§ﬁ{ˇ\0}’K\ZÈÿÎ˜QL5Bã∏˘˛õÁ€Qˆˇ\0Êt‹?R\0{õìÊ‰{™¨πU\n=µyR;1–c»ßÕΩ«¥˜Oû√∞¯¡«ıúxúÒIï„ {j´îC›[hÀ˚=áÕüµ¯ÁŸâIπ’B≠oÆ˘\'Ìô¥rö◊m@±+ä=Ñh˜ˇ\0“ÁlD=æW‹}âÛﬁ•6=\n´ÌSv∏Ó»eı8¿∞,QÏ≠5-˝˚ëÂgµãŸS¯áÉﬂ“Æ‹6◊ª\r∆ÆqÄG<W‘:©˜+Mv∑˜ÔÛüÿÚ,Ïü©¸Ω:üV˛3]ÃÁ≈}Ü5«|⁄s‰C≈Åÿ∂’¨s{éÕ+3\\°˘©¸&˝%8„{n‰ÃÀ∏ØJ€ﬂoïãxÆ¶∞±6qãi3fr3úÂjœÒüòÑ∆Ïf:pßS]å\ZÖÜî¬∆‘U˛kIIÍÓù≠˝b¸âÍÄ{ßô®ß≈ø∞∑P⁄ˆÓaÌJÛø]Ãπ˝1ázZÆeØ£ZÊ#À©YÒÒ+˝õ√X>…πÍªLRÛî+jnnd üE~;ò{ò›∫ZÚÕÓfmÌEØÈ9ˆ¨l≈3ÍDkÉB–4N\">¯–€è-:D≈≠D\ZÏ¿¬ªü@ƒAd…?r©1k‘©ªò–Õ¡n›\rwg}Nßˇ\0`ˆZY¢–ÇzI¢*µ€s˙kñùƒ¯õûDW‹a»4ﬁª™Ú`5	‘Â+~kŸ£Mƒ¯1ªt*ø˘Ç«àÌ‘ko\\è5®ißWP¯Ü≈öÕÓ7ÉiÄE‹a~^≠ŒDMÓ0‘æÌ\rd-71ÔÄ∆åjO‹—ªtu„Ç|C‰ˆ JX∫t´@ŸRïŸñû*ƒô¿B≥S”X49y–0	Uõãwë¶\Z‘¥y‹˘ƒ˘\'±ÌÜª≥±é#_Ïcˆ∆®«s≥©Æ◊a±7Smg”≤ÈZ%@Ÿ\Z∂hl«IeÏCYd≠kAHôXH2ÂÚå»k¥8a\n¡ˆÀ‡3…ä∞P≠4∫◊}FˆXæVŒÿm¬ãWVj\nâ)R“œ€Ê3†ÜÎ\Z\Z∂u∆6…Æ≠CÊ?⁄£·O€mSLã≥S$¯>Ø⁄¡ﬁ]|©‘‹K∏ö]l]Mv‘‘ÿLÒ€˚ ¸(µıÎ<f,Kíé@[.Mª≥≈ß««b7\0?c©ívuˆßÍø-≈ïåàÎ<°ã)ÿµ|∞F„|J\\÷Íy/≥(jÒ1èÒì≥Ì?V∂UüH¬*\n…ööç•áœc>H˝kƒø/2FöÜ˛3€Rƒ„µ›e©±€\ræœfx’¬+q^Ï¡g≠\\ıR=»G©„ƒ\"©∫vÆz»%y∑‚XtÉı˛4˝µ˜dR ∂ïŸ‹çÇ8ö€Ï[‡ÀV1ºEˆuÚèmﬂ\rÛﬂÊ2˘dàñ˝®´°o˘5.«˝‘~ã˛M∆ﬁø -D≥S}¨^@\rC‡øï¨Ìl˝kYZÒãÊkµ∑◊S]g©`Ïˆ‘q±byo¥UgüÊ;r)+Ï‘aª[¬Ÿ˙F>\"˛€—~*>YAûR	Íj-\\°©´3J*¿ΩèÅk˙ñ@¶©æﬂ∏oÛsB≤§ÏÊS}∆Æˇ\0≤º5Â5˜-v@Ñ}øﬂ…sÂ!é~ÔÓøÿ√VnlúeµÒ®¯n{jóÏUÒÆŸáé,pûËu,MvtVåäÅæáç\"™ı3OÛt·¸TÆÂcfÙè˙ŸÛ_œÀ§?#Õø›}á¬¯$v´Ó\\ü∑◊»˘¿©ñùC7:°ˇ\0‰Ç/œu¯W+=Xƒm˛H¸…MÄ\rÃœ˚8-™(o∑\Zd¸1˛r4yiTj,2ø›æ’O’éÄ])˘Åw(˚nv7[çÄïØ;∑√7û©gÅÿ{ÍY‡ÚÑÀT÷o¯È¯zñ∆˚S+˛∆)˛,s£éﬂnA›ygéEﬁH“ áÒˇ\0R°©fÀBéÃ)pxâ˚^\0NêªøŸ{hÁfqﬁOaÏŒ3‘ZXYóÖñ>„GóWc7!›XÁÏv⁄gèª˙EÊ÷\rU©‡@√ä}œèé\\—”:zÀP¨ü¸ªr=6Œ]œÅïtÔ£‹)3ák?]˘æŸıLç^bølÇIÍUÆ>>7å\\;QS±º‘›eN´bíÔ÷zr‘\"bcÏ‡‚˙K:ñ^ÊA€ ü=˙~O‘W€©‰\niÊZ1‹Q≤\0·púµ=Nœ[Fì…r?C‰ UiH§c”k>Eöˇ\0˘ÿU/Õ©´j¨Á^>™ˇ\0≈ËdÙ…ïAV¯â‰\"m˙o•RŸ‘+Që‘]•∂r/Ûi·R€®≠»\'ß„tô-Xœï{hvì„æß(nt7∆Gá√ÚôæJ¯ 1’_=Y‡¨WE\0zXuzÊ€Í=?=.⁄ÇÉ‚◊P3˝6é6@“É®-0ÿL\'µ5Ã0i◊“–GYƒLVÈŸ˝R€™Û2*÷},_-ƒñ¨iΩΩ)π`Ã’˚zq⁄g¸àfı´∆≤◊±üY™ﬁ¶5û§FeÉ!ß¨amˆ∞}æ√1ôZûŸòuÂÃNüF)»¥QNVKd1;Ï£qT(oüwKÙ¿x…^I“Vuãh™ŒÍÇ¥v	RŸËÃ^)KöüàjΩé~ﬂé€PYúUA=[ÉøUØäı¨õü™SJ€÷Æ2˚≠Ω±*kZ⁄8≈O≈–Ï)íN·¯©Y’Ú©aö‰}Ji\rñ≤¸éu›∂(Ïë ¥¿»˙V∫Ö‚{˙ã3¡B«ZVRÙ¢f‰SR—Eπë∆ºúcåÏƒÄ	ûõMî†˛Eç\\ŸÅÑ◊ª\n–ô—F€06-Ù⁄ûùçÿàÀçΩÙ≠µ]J∫ÕXXú◊È/‰‘Î*√ΩÅ¡É\n∫á§h¥çz\"DÂFI°1l[´÷’˙mÿ¡˛≠yB5+mÿw4ø©Rû1œ(?Ç¸¥‰∫D)¬.3=/TŒöºq2Íı™¶±2õ”Zi‚m…DñÂñÜ√9M ˇ\0Xa=™¥◊/E∏©˝O¸ˆVÑn2ÍV€A›k‹È\'xÑMK´‰1∂fF$·πáåâ^eÕmçÊqÛà5ãq–&^Y$í}µ˛—å>O`u,„\r5õ≠±6˙◊u=õÌ(=@*“”§iq˛é¶›St¿+a™}J˙ôT	∞1m≈∑ïò÷$içˇ\0]Œ≥”«b÷Bû◊∑zÖº≥Cﬁ„πå>õÛ0⁄·„åg™fF]π\rMﬁùªÜ+Ë∑Ú÷Û4\nÚ≥É÷ˆû6ZÊΩÃo˙Î˙ıZ–ºC«?w‡J{9–¬£’|˚9XæEß¡ ã€ˆó7nZúßN≥’ƒ=±èÚ—£dhcx8ñ!ú=[Ω-L∑”w◊éı‘ˆCW§KÏNÖ5›ä’^ˆ‘ü∂√∂?=Ñ\'∆s>{zê4ËvÒ¶/˘ﬂˆñ§\"gGo‡?c¯52pEåÿà Tè\'PQeíæúÊ&5Ã¨›«¿¶¶»nIR_isj∏ñ@„Sò>\"®ö‘¶√]™C+	VºS5πìè„è^Ìañ¡ƒz≠∑¬bçcŸ¸c’Ivr¨˙\\¨ó´¶xØ\nö„X\Z]x¨_ê÷¿;\0®oç`Ewﬂs	ﬂ∞OñSƒ1ÿÏÆDF‰>H∑û<q1O‹TÜÆ≥Àâï„ïñ€ª\n·VQF=…¬¿ˆ7“¨J—!π*KzåØ÷ ks+«[Xÿ”q¨‘Z•ón‹˚ââÛøeh÷znT”öraá¡Lï›wXG¨⁄Û:ÆîÈWÛ®üK*À±oSPmÕ∫»æbP™ôºá(\ZkîÙ)J°%è„_oˇ\0ú4ŸA¢ë>öÆ7 Cãg©Tuÿ2Ø—ú,{	Ììè©çq¢ÎërqÌ/Ãv√zC]YΩ≈(±µﬂ…öÌ±6\'!ò√GÒ‚XıdU‘iµFeR˚je∆ JmbZìg]èlånS¶ÂzO‘±=OoôππŒ3g∞Å{j„ss}áΩ[à.I\Zxül¯=;7–\0ÏK]∑7löEÉßfq=OM®µì=>fß8$·\\‡∞WXúH~ô`ª\0OS£‘…4gH#_ÇΩâÚ7ƒYg3áüv,≈Íÿ˜OY\\>;nnYX™Àáq„óçÈ0åõûú]…ÄlüÎRÔë˛~‘ev≥‚s3c‹ÅmQXYæÿ±Ôèïv9£≠Dª&:ÔÊÎﬁ#\'Ñ—ü|”œ3É√@ ç¡Wõ›+Ù¯æƒvCCÊ°^¬›qPávã~RjÄTπH5¶°ól€ïπÆXÄ˚øN\nƒÀ}6\'6Î∑yˆUW)[üE‘±tÄ<„55+_·;?ÜãÏ°˙Ω6Ø`çLÅˆÍÆÃªûú‡!\'‘®^V8£r∂ƒ«¢€\r∂w≠vÊ¢èˆÉ«Wïbƒ»Æ…©©eöó*ÏcGWÆ…g)ÔΩ∆©pc>Âx ≥Ü†ﬁ˙ﬁF€∞ü2∫Ç™òƒ0ık&ÔYª’{◊>∞†\"í•3,ãîçã√[à|A∏ƒqÕâõê1(Ú«SRö^”È◊@k÷5ÑíIˇ\0\\w‹‹K¨Hπ˜âˇ\0$vπ‘±bAf.≠Ã·\Zú¨ßˇ\0éæWÖ¬ÃºuÙﬂ,≠dñ¸e–„±]ƒuhæö!’X~>ûπËW-5™Êfõ*ˆÒúfΩøISä\rM˛êÉΩW¶‹\Z2≠=Yeƒãú∏dÜ≥5€SzÖªÓno≤8◊$»[k5Y˛òÇ-}œ¿;èkB ¯Íà√P¸Í7ÉÛ5¯	‰‘¨ıÛˇ\0†;Å5Ü>JÆÂ)©ÖèÍN°í/ΩŒÁÃv‘◊‚≈ÆÎﬁ´ΩCszµ§¢Qãe±:M†dÙ€Q\nLüfJå<lsôúoå∆:¸ÑràºMÆ&Ω¬W32m«©Ì,h»≤õ/≈ƒ{22q+ƒgú¶„ÀÀ«¿>O·◊cêæëˆãπèW;:≥ÚŒ&rú•Üoπˆò!Ï=ÿËr˚¢¨©qh¬≥À{DËGYÁ©qñ6…ˆ0—›x_í!\"O≥Á›®„\0äõîaZÔ’∫Ò‹&=Ü∑Í¿}Iˆü>¡7-^!G›®ˇ\0º{«m@ IÖÄr&N‘NÖZ:}ñ±å–˚“7ÛtÜ˜0Ó¢bT7î5b\røwÕbxÇ* Í‹ß£ÿkÍµÙd€ér)[Ò˙ùâéé\nNù˜„0úa^¬4D√¨YsÂ-q€rü€åΩ~ˆS∂Ω’ÆÁO¬9ct⁄®|û†R⁄s)»Ø®t‚°r.≈6πb}¢k∫Ã˛ûÒFë˙N√tåùYC#2˜#}∫~Ωrı(_∏,∫í∂^<ksZõˆj0Èı\r1&nkõÚM7›*Ê∂û®†Z˛›J){ûÍó\"\"ŒùO≠n^O≠x∞ÇùW(§ã`+55\nJ6∂_Ùx∂ˇ\0»TÚÃ0≤µ.z°˛[ºœÄ`ÓfÜÍ[|,ÜÛ∏ç:FWzŒ6Õ©ˆ,Ë‰ÖÊs:{,¿&a˙\\B”p4√Ã◊Ù∏ŸP‘ ÙÙÃáé\rÎÒÎ7\\l∞>¶_†Ì’,„mëåoò;™Ã>ùnD∑ õ‘≥ &>ÁÃ≠•.k~ü‘)≤û´ÄZöá∫Œäwìá”‹›7’}tÍ Ãƒ&∫pÎ9Wµ◊nnn+E}˘{¯›ëeßúc±æ¡ß9ÀŸ˝vEÛ–ÃÃ∆ı•J∏x˝W8ﬁÓ€3+—ó€Í=6zUﬁΩ=_—±«q0ﬂ“»ÍIÈg.EàÖÁ9 Ì‹‹ﬂv”Ó)¶Ëß˘- 8Ÿ=G?÷k_pûıïﬂ!À£Ú9=máGû0WR§”ıùˇ\0»7}Õ˛3‹{Úh„wLF˙é¥√‘µ°>’ù&ˇ\0FŒ≥_:ﬁØ5Ù˚ôp:J∫66\r\"ÓîK˙\n¯e7Á>∆®Ω◊◊åô∂Ú/¥Lk87O∂¨åoK[÷+Só÷î˝IÂOZ∂™Û2ö˜oÙ~k‹Õ°¿»çπN•vÍSyª÷`≈Á) ˛ëÇ´Î≥∑V£—Ω·˜ÉJÿdG\Z?ÍëÔˇƒ\0\'\0\0\0\0\0\0\0!1 A0Q\"@aBqˇ⁄\0?Œñì’tài≠5H¸©sXecOBSÂÙF\n\n£î…1ãŒstç4¥„∂\"nL÷w7ÜÖ¯Fó„®ÚÛ$1>IæK^c\'H”¸◊1çh8ÀÉfúWÑ•»˙7eñ_è‚Ël[üxíƒ‡§è”BçâHæ\"oqz\'Ÿ.±be‚è«éÌOOj%\"Õƒß¿µ/Å¶Sõ±øè√]≤À-élª$⁄,ær•âƒHj¸V?T%\"§Õ¨¨>—E\"ÑH°E#SÔdqˆ§EVlc≤û,ﬂlCGEíÎ¬ƒ87Pπ\Z.éFõ*é«é$0’ìãC≈·wÜì6§.\n≤≥?¢À‰x™(Ï‘Ï‘^ÛÑ∞çÜ—·rÒ> °<t\"|ƒì¬\"©cs#+#çL˚≈{7ˇ\0\Zc∆öØ°6]!±âpQ®,(Ûb\"5DﬁﬁG!îAp<˚(ı»ë\"=b}¥G≤ã∑HüM€(¢≥Ÿ∞Xe˝í∂¥F^çFõ Ü]\r7Ÿ™€·ä¬^|,6á¡∏q≤*ÜÛcà–Ú≥Fì›Nà±ãjÂík–‚Ó‰A)ìO¯è{Âñ≈˛í^Z—V»™&±\\tÕødúN1tF~ô8÷Z¬Ã÷~œ˝∑ËZè˛Ñ˘∂Y“%#s}Âã*&ÓrÀ97‰î}íÜ„nﬁ	hŸÏï/∞˛ë/·\Z=ã¢9–|S;TA⁄5\"Å2Qèl⁄˝\nc€Ω›‚‘Ô¡ãiÀlÑËvù¢[¨q}êÏI!ÍE€Ë›ıé}õææ&∫c4ÂπfŒJ£WG˛¢IoV±|Uã-n/·å∂ÚàÎ&Fy‘á7pæQEäF”Ñp ØÜ:íèFüÂzëvIó∏p?Z?R>Ñ´ñU-œ6Ze|1õèDuìÏèX£w¯Tô¥’ï∫E–•ˆZ¯c9G¶/…ü±~Jb÷GÏDıóQ+‡n˛5&vpY”è_∆æ*¯êü…EØÜÑ®‰ˇ\0G‚ä+·B˚,ˆ<—X≤ÒBÀ¢ŒÖÁ~>∞¸6ú|+…r?Œ=õ®øÖ?®—^ˇƒ\0+\0\0\0\0\0\0\0!1 \"0AQ2@Ba#qbˇ⁄\0?◊.X‚ç≤yeí[§zH˚oD^ô3∆<.«\'7rçD~ô8Óf\\Ø,∑1Vÿ-íÂô=CóX≤#D:—ÍµîîU≥>göW¢0ÕJ%éi&‰¸,è”µ„ÍÛ˝Gµu·én,˙÷9n‡x⁄“Ö“Q˚êËè~VzôÏ«„nLÜ4ç®⁄Cªë·ÆÑ÷ïhÇ°/?].£¢V>xÏJà$ +çe˘6ê—ÂÍ›‰”\ZÁí8”ÏˆDS_Å1¢À,b,rlèÉ”\"NmíïêÏr‡ËÉlTZ(F—âËêº≤ΩÀÅEæÑ‹X¶(∑ÀB®ñt&.Ñ…Íù˘©5–Â)v»≠ÔëJ17XòàrÏ¢∏ÀDEXà§:H]˙—çh˘“=¯=(ú6Î˙FG»•ÕòÙ˚iei∑õ’¯Zj§4æÃ\\õi[1Û\"}≤Ã#—æ+I	ëÁ≈jπC¢5Ÿ)Óf…ÆJ1~î…U+bó$ü‰B\\yÓ“h∆âbæbb\\ç)&Ÿ%∆„kÇS±GÑ5¡EçãF¸&™MÊCÙïf÷óÙ+ü«∆—pI9rGÇä\'-®Sbüy’ØSåá)¢=Q{Á¬D1µŸ5√Òúú~¬äk‹E„∫BäÙE˘z»Úò§¢ç‹ëd_<hÁY\rÛn—ı•‘H}OªÔ»ÜØ≤X˛Ò!+_Xπ«ìËˇ\0È„˛d®î#À∆˙\Z·$Er!Båc÷´K— ë∑çQG”æ…∆ù˚ÿ˙f)∏±\\ù≤Ìì>≠* ù_ÉíËGˆ»{ÂªG¢Ïñüs÷F•π	Ìídï3O≥3F¶;m—ô:FÙª%ôˇ\0/©îå-)‰ˇ\0ÑUp^®ñåœ\r‡djKlùaékÙôïF«)1a….≈âG±CÛßﬂœ√Í!;∏ëËœèdÜ¥L≈ö÷Ÿòˇ\0”-≤ÎMú›õYEm6¸3Çö¶dÙ”á\\îm(å”[&b…^…À/KfÊU˝ k¢Ô·ûO¥dÙé<¿E&m¢7≥Í1OÚ9_Ωœb÷¨¶ã¯gä3Ïüßú:‰R(∂m˛Õ–CùÙzl{VÔœãIéÇü√(F]°˙x˝áÇHxﬂ‡ñ7¯1˙v›À¢Œˇ\0eZ[—~ «ÿ⁄Eãˆ-ËÏ°/ï±1-Ym+‰r7ób^^7Êÿ‹•—Ì|&+^ŸÒbë∏OF&Y~ddª⁄áèÉ¯ˇ\0¬ı‹)Bâ∑M√‰ß§|≠—±Óß–ΩœÅé◊(\\rÑÙbF—-M¶“äÒÑ˝»I›U£GQdrp\\ü\"ø∏æW-ùD«·(◊\'ª¯}=›ä6	ºë∂c·µ‰æˇƒ\0=\0\0\0\0\0! \"102AQaqÅë#@BR°3±brÇ¡$PSí—Cc¢ˇ⁄\0\0?∑”\r¯öNŒoˆT˘qÇ¸Mx$ˆŸr\nö€¡Tl%∞û[DHûÅhVj)7äk}v5N=\nÆ‘·=ÏÛbåú5KOJ\'cË©à€_ì*ÙO“\ZıT““l~*Ë©èΩµ˘28q(5¥HÈhÏº›Uv5¡Oï\rn•]m∑Má•0KŒ∏≤™ÌÁÇÛ∑›¯¡E{cU\"¶u˘©ù\\NÒPIj§Î‰¶T€Àbv˜æ„≤ÿ∑çÂ\\&z\nn’SU_ócy3ôZï«›R~Îä{è`¶4\\ç§Y⁄…Ÿ,““•µcyª\rÈLqD1¿ ∏8ÿEí∑∫6—Peö⁄K‰[¸ ú-ïZFãÃÄÛ\n\'-ÿ†9hÂ°URx›ekm$z*kÀp];8Æ‰%Ü\\ÖºïJ‚∏˚¨≥≈.’M∂Ê˜¡”ˆOw7asÂóùì\\JÂÉ[(Î$0’M∫©:`•§s¡•í¿–yú&q.?äê ØÓ§\r˜rj´eÉEP¥\\T÷b¶Ÿ©TüC¥ü≤dCº[\\%Õp3Êßp˛Î1¢ÀÓ≤â©≈phZòá¢…ÔuW7Ÿ% …]\nrëAÀ*ÎÇc\\\Zï-U0ú0&ÑÎ8ÍF…ı≤¶˜@•jo%«©TTSv∂U„Ç∫°%ñù\"ß®TR*„µ∑Öìn#ﬁœTl¢’j™Æö¢\\dKfUt‰≥˚aÈ`mÇ◊Í™≥{™™id∆°O\0!LauÖéÏ0KÄ/àZŒöïMpUV“lz&∏rBzõ+¢ë—t]∞Sa‹X·œVÚ’)©3(Ë™\nØ*éjﬂ(.EÓ‘°a¥XS{¨™ÏJ;∞€<mÌä{¡ºÌq∂ŸŸ‘+ØU∂™{Æ5’l+eh[ftj.6\r°tQ≥òY¢Ã,ëp\nÎ±’9«é\'O–Æ++B™ö™îÑóóUçÚÉBw¢!8‡GTS≠òU∞f5@á-∏\"ûñ◊\0<4+•ôÑ‘á;	o‹§7èπEŒﬂróD{ße{†äò‚âÂÄ\"è{H∂S™∫ßgƒ§¯`Óqû÷n5¨ úgIøhRÜ4ˆW‚˛£øıÍT1Õ«˜A=•§é\"¶uB—yeÏƒﬁ®3◊`môEy—ø•∂I=zîŒ…ùø∫ou51≈LÎ¿\'8Ò6ﬁ*V´1&…Ÿ›u;•6Ã˚,£‘≠}”á5z-y.B◊§‘Ypˇ\0•Ûh]â®?{ftWçùôçﬁàìèD@3∑¢˙©Ñ…{[°≈EŒ…£0…g l∏Õ‚°±õ \'V†ﬂ©™ Î;)hÙ≤n™o·7\nŸu¶ñ;}∫€/©⁄`ª	`Ω¬rZÂF,_‘w·>!@çZá!RØp(OTXÔE6…nêW≠†´Ò\\–xñnR“ŸÚ\n™äCRçÛô÷ø@ãù©¸):îF&;õm(vøq⁄´◊√Â¢\ZîG∫|7ËD‘éÒ©W[∫,ÕCŒ …§…è/©Y€∫óì_ ôPÓ\nÊM”ê∞æ!ê\ng,1ßEuöqÎdïq√ÈK;\'wM¡0˜ûÖ˛õuSl;ƒ~ô!ÂÙ*ÛçÍ1z‚Ö≠Û≤È\"Ø0ˇ\0π…œvÅ^ài¡£6Ü$“g.EL¢¢∑íiÙ¡qúPctî‚PòΩ\r√0W°õ–è8&≈áXn„˝∞ ›BìuR#Ã·Ÿ|6óq¢∫ÿçÑﬁr—]¯ë8 S_	ågz´—^Á®Å∫*J¶`™ÏûŸÔ6Ÿ\r\"~Ëëlïÿs<œ5∫U–YA7GuUc}(ç/A~˚	^gá7·~[ﬂÖ{,≠óuôŒq‰å1Ÿe∫ªö#ïÿM.rΩ˝√TÅ7xC´…P¢Ú«\Zπ7Ωî≤™ò°wë∂mﬁ\ncé®åSO/$÷Bj¨mÓ	(wÜ˚ß˝!:$8≠i*n0ái’M≈¨ÓcÚ§»—?ıb/‘à∑üÓ∑ﬁ¶‚‚ÆCcP fãNÖHå\rMïÿ—1„Í∑¯¯*˜Ç¸Cr‹QÚ7,oZ´£öìtK õéçW‚—9ÚZ™lz)çTé∂∑±˝¶X<∑j¶*,Ûc\"Nú+U˘m1ü«NÅ|=’\\u√’H¶√SÆöpU√0©¢‚∏≠JΩ‚]w†^\\\"	>´E¢†:ÄÖ!Pºÿ~©≥–â)5∑∫ç‹ÒvÓ≥≤ÚÖ4y∫ä™™Xfß∞tGâI∂Wç∫,ÓòÂ¡5‹ç≥ü¨~T€™Ã\'%q≠í-ôó$\\KÇ»À`o\0v˜ù∏?(0pS∆˚%ÅÑÍ2õeÃJÀÌı¡5¥¨{¯NJäCpdi+‚úﬂhU∑ìxïM$Ò]±ìÇñ=é—’±Ng⁄lÕóödU$Tú$m»“WƒpoÂTO´ï»Í∂LÆMU÷Ë-Ôåa¢k«“fÉõ°≤cUÊ∑é‰líºœT÷NS‚å+Æg˛¬xˆNì·Ω§}.N=K∏≠Â(m/r1ŸOöŒˇ\0e3^ÍÏ,≈f+ìm™ûÏ5uö\rüDpNÀáV~÷òn›}VÈˆZ\rÕôOp–ï\r‰»TIpsNíY!»ÀU7òí≤¥ù¿/Ü=÷ge‚ºø&ÓjÙGf∂äˇ\0àÙj¶ü!ë•›óÈô,…§ö\ZŒfyjŒVÒ[≈^núEÜ’ø≤ÆÏO›MÓJowZ›Ìgô‚\r÷Ú‚U»B„mb÷Öó3πï3Ú1†ƒ¯7÷ÁÂUÇjçÀ®°√UJYz≤k«™ß\ZÇàâ®•≥å„>ïÁxÄÂR©mm◊‰\Z¯FNjœœ\"öXg¨◊Í3›U¬È’Lid‘ßÜÛ5‰º®ªáNãÃÜ3qÎÛî≤˜+.G˝.¬¶4ÿOÍ^DÈ+ÃÜ5‘[Wº\r∫üeºÔ¯≠Ûˇ\0˙ü¸Ø÷Ò+ı[ÏUc0zõƒ{0™∫3ΩõÊ7Ωµ ,ßcz…πtRaõ>“§ˇ\0ÑÔ‚”›tT≈˝◊¯˝.Ê¶4≥S≤\0\'À@em»ÇÙ?Ÿ^ÜÎÃ˝≠Æ:å ä∏~»È¡KƒCıb¯Q\ZO.*∂»qRr-5W#fáœàWõV≥E∫∑W,Rjâ‚®√6\n9\r5#a5í Ï<∏Û|?»W‡89™R*g[\Z™©VZØC”∂ÎuWüß$œﬁùÜÒ›W\0∫ﬁúT∆ÚÜˆÊk÷]yaêR\nª+–úZUœ<∑}‹ËdlÌõhW#À™d\n©œ;≠	œ~Ûå\0PN%WU>çú·˜≤¶Íæ”÷Ÿ7m^GN\n^%óO6ËØBpxÈÇ´ùö[háái›´ª‡êFˆ®OZ…Te‡O≤‰—†¡Ãr+s‰f“AY§ÓÎ4⁄≤=á’nïUÀ\rÔ¸Æ£B$‘õez©Nn‚W5J*üú»˜≈U¡ﬂÃŸØâÌ0´ ˛WMftV˜\nëüÏø √$˝Ôˇ\0•y¿π›’nÍMÛ_\rÕúàI≠\0!√ΩïO˙\rPE@\'°CŸ|B{«›n¢–—T›~ßmr∏©CÚ‚slËy&DñR´	Îq˛ÀB2›˝ˆ‹úå7K—û,ïx›‰U·Í∑ﬂÓ≥8ûÂ0ê‚&\Z\r∞o¥ÒRÎäü	|∑¶œÀªŒ)œCAo]õ¸∑Ü‹™dÖ·úhù>˘Oá\rŒÏ„∫¸EyêÀcCÊÀËw2Û2SÒ~)Ü_D:Õ4yp[∫¡o]§Ù∞∑á xxPûXﬂ)§…Mƒì’¬tà¸Ø=ﬁ)ê·?5¡R¢@¢#Ø nOüªtccG‘d¢ÀFõ£”Â•≥á,5Ô\'Íîë K¶6s ÄâoáÑÿ¸_%_Ù\0.›ÔE√0¥πÑì-É^ÕÊôÖÊ4I±Z\"\r†d6é7ö∆7W;EùÜÔ‹*,ˇ\0÷^ãzÏ˛’ôƒ˙Ïö~®/ªËqœ\0Ωƒ¢9Ì\Z‚@\'ÅP‡¥|=IÊVGe˚Näo\nÎúÎÆktG¡¡BW›˜üåÖŒÒÈ≤h<J¯PÄp—ƒŒ[p›tÀàÊç…]ÓQe‘~G$|ßñÕu;0˘^\ZÃ)≥ƒæG6k‡∆c‹E‡›(∑ZO Í´ØkÅ‰F ßÙœügØÑ∂Rò\nı˘»qDµÓ\0Ú*•Qf·¢|Ñ´/Lwa4π‹Ç-ä“◊r8s“3<ÙOâ†:ä`êTº…˜LÒP˜bÍ9;”H ¢∆çıŸZUÿ˛ô¿7,ëè·›√üvÙ*M=[9πå\rqÎ≥a¶∏¯—9‡cÒAÜÎÃ)Ç:(Õãö$◊qñ¯VÔª<_Ï0:hb,VÔ\"ø…≈-â˛”ˇ\0Ì]sHw%x≥Ào‹Û%Òc:3æÿbûÎ/Åá!VÃ÷iœvÛåÕÑ»9ÆsOÆ¡ÇﬁLçß2à{e$	’=Æ3KrÇl¢Œ`qW·á°ˇ\0ª\rÃSso4ãØo0öÔ\n¯˙è—›TƒÒ.Èï™N,\rËÍ£œdHmÕ4¯èﬁqû\Z*yaÚëâw1Sä˜8ı;yJ∑T∆∫)ƒR—£Ö≤‡¶ê^LAîä\"FÈÆO˚\\\néﬁìò◊∏5⁄âÎÛ_“SÔUÖN¢Z9¶®$ôtËò√\"e3Ö≥“j<˛Ôöp\n}S•≠6π\ZˆB#¸,ΩÂ∫J¸be¿\'{©√ëoÓáVö.pú—¿Ω»#33©ÿõ	Ó–ÂWãZﬁ•dapÔ%uç ùÍ©´ía&ãü©?50&ùC!≥|#ô⁄≤eÈÇ8|ˆGN«¶£fÿQNmˇ\0ÏQ;ˇƒ\0(\0\0\0\0\0\0\0!1AQaq Åë°±¡—Ò·0ˇ⁄\0\0?!ÅcLìÂ=0íøD¿Ì∑¢7Íù™6·[”P®Ùâà}/ÑÊ÷áKL˝kO¶ˇ\0>äÍÏmﬁÖ\0À%[∫‹ZòV7#imÓ1%|Ü¨%ª‹fbÛË«K“˘{ie.}K+¢°k∑¶◊˛˘1Ò8Y\Zí´∞B∞òFs§iíÛÙá;	ZEƒˆ£í˜1Ø}+cBB>	â\"No’_rDı_PíçoÓÑ5K∆ΩJÉ√+Dàºks#K§»‹ÄjÖL#ˆZ	Ü=NêG°ü«°\'·àJø!A\"®◊¨ë∞∂90©¶°$/\\ 	…î∂LñùI-!h«ù¥kÄ1X§0>¨ÎXy°ìvô$–ö§,≤ËdYz\ZjBì⁄—2ëç	k	CDl5b{êF˜ü,Dr,i◊tQxëW,ÏE¨≠Ω¡ó¬ÙH∫,åy64](Éó™“\Z\Z\Z>\Z7•Õ”çHß9,·Dì6˜Ω`kp$Ÿ∑gˆà”/Ö§í6Î∞à%©çb%DÖ—!k445§æ_Œî$‹Û∞ÖH’,öZÈèVÙ∫ á\"Áòè∫Ùª§R01+6êÁœ≤}#î-èv*Q\r≥a°≠Y*ŸüŸW°Ëƒcz-q˜7së€ïLÅqd˜Ü7ÀÑ/ÅBIÓ;Ñ€âFMQπD{(À”$÷§Néü÷£F#§mtì€$˝!e{e1ØzH_qJ°3Z_c9®íI,¥ ◊j Çøí&BZ Åì\Zm´\'_àBe™ˆe.OòíÈ0i©x‰…52Kt…˘˘i$ºâ2(â∏\0õ¡uqoÖO\"Qy—{ 2¿í hzL€—O∂˛è»ëh•óO∞€–Â¯3ùˇ\0Èä&;º\" √±;¶Ü∞…≈ëC(îì f∆-ÆånÊ \"•HXËca»KmÁ>A•g+≥ãí§T+,ëøÄc‘a°$]:Ã˘ˇ\0ÇBºX”N\ZÅ…=HêAhÈŸ∏/°.M¸åDÖªéñ$∫©C∂ñM\r=…âÒ√\"•Qà\\íÑ\'Eã√%˝~À4d˚ÿ@¢ ÌDNÌ…4∞¨4å4¿ÏE˙–ûo»ä=êÓﬁt‹™O∂pmÉŸºç\'˚‡€¿lÛ/»¸à‰Õä6<˝	)Ì1ú.ÜV‡¯Ø≥í=Ñ–Òk±K˛¡(2√≈î/@∆2ﬁ\nieÅ¿”ó∂0ë…ˇ\0x…%å‰zπdv\\˘B„k›ò[±,ô ^&XºV5∂HÒ$Ú%ÿ¯ àÃëv…º\rç—Íè$3‚XÑËã‡ã›\Z\n;£úì4Úâã°‡v&éf–Ç¢¢∆<OF\Zbd‰Âû	j4:ä“’Ü©Ã•±.\\üRóªddƒŒEhpQÆJ&º±˙àvÊ¯MåCÊv1∫HﬁÆ∂*ê…ê√D…´çéπ¬w¥l7[∂\Zg\"y“Ë∑uÂ	Râx Åã⁄FÜ<l´Z@‹üÉ\0‹ÒÅ‚F‚tBR‡o{˙ÿ˝®Úñ˛teà•U$±;ˇ\0¿iV[hv€#—Ù&K-ˆ∂îÉUí=ŒBn∫	`‰[°34°n¿«\'¬√‰ÇÜ\Z∏yClI¢@y\\jFÖx€BKá£çÆD-	ü“âCÀ1ë≥‡RÃÊÿÃì	◊…@ﬁl0“HTá¢H6¯ÜDå≥9ıÙ(÷õ⁄Ï)–íΩÅÚ	˝ñ˘3†HÑAçñF”Óî)X\ri\rÓtfvg`iáÜnë±îåˆ≈Û¿˛ÑK$˘1•çﬂBToΩFÑŸ\'\'”QÚXl%¶í1π;é1Íƒd˘C;Q±⁄—aÒ÷DF√D@æ\rA∂tbŸö^˝øj‰∫+(Û#l.\nzDü≈Å°ôÁDŒÜî	≤ºG\"VL˙\"∫*îƒeYrÜî!ç„0ﬁÊ	¯#[4NìïC@‹n	√µ]ÚJ+$\rC—∆≤!ËêÃ^ä	“açNæÖ‰ÿöñÿ”/\"\Z—©a(∏Z&o(a°<Òc∆fL∫\'∑Ç˙òÏö©‡ßÌ∂òëZ£\Z5XÚya¢ìéŸB¿¢\Z^L∞R9˝NZ<[9Ihƒ≤d4EÂFÑ¨Yh7X,≤d`0ÑP˘‰fU˙Q‚b¡ÿ≤\rê{F· ˜&>!·îcŸhÑWÑ≤¡ÿMHª2Ot3∆Mà∫®)Ù\\D©T&(ç \Z «Ç∂7\"yúmÜ$ucV\r7Iã¶‰bq)ÏñY`πﬂ“J´)Ûƒ˛ûƒX˝êüøÿ∫õ9…A3\rD|e&6g…ÜÔòë\"	ƒ$î§®R4ä’tXÊ©⁄K=2∑è¬&Üèj:eCØBÖí&Uæ–Ü9_+/b,∑·rP≤ﬂpfw\'KÉ≤<˛¢OË˘$a_zLdˆñ=∞77H≈èA˝ˆÜÔ!±!„@qä≈∏ê§Ü\\«	ó#äﬂE<˘\nC≤[+SCx\'—Xg\\3˚PÎ¢[#;`E–0»oÀÿöÑQpÖ7˝•ãÈTè¿Æ <◊qìü-˚ãÏ˘I@Ã17âe\'N?i∞ΩŸ2s<ãˆEKímÖ$ì.Q´≥XÀ¬\Z ®ÑNóû¨ﬂ£ ùÜå∞òÀcÉd»c`º_g,lº∂5qÂﬁÉ¯âÀÙ!ÛWÿêC…\rûÁ&˛∆3|íH\rI\r¯ˇ\0B—]\\íé∞ry (,¢‰Ä.àM˛ZÛËbJeeëÈíZeËhc<ú&ó?êñ¥’úΩ…J¢¥‰b¬ñNlË∞%≥uàáqÙJø÷gPŸ}ìÿR„tEB|â`{Ly‡∆àáÌÇ¿)[¥úµï{®DLaÅK‡öÿÚ6-π	€ë-∂Âº≥¡Ynlu®èc&π\r∑ajÀ°»ﬁ8*Mˆ¨\\.ª9>y}îè}ØoÙë˚1—0∫è⁄‰i_’∑O°9RûQâ–ä-¡%5ÑZXÑ@-¬é∑Ï∂ ^DçâπT=πÔXÖÒ?bg&¬+æMòn#(ëy&¯!∆ôITQv{	Wcy¿´x$á.%¸¢cé»±∏_‘õ2%m&E¿”)ÆDnÖfÕñ°_µÇ◊¸ôsA≠≈»Ü‰—xEœÑ+|¸Ü—f˙«?§y≠r»I∏‚m-¥eÒ±À‡ø,d9öY|È≥Ï$˜z\"Fè\'Q–C\\Kπ\Z\'gô[C-∏d≈)Eè,ct7é∆1[_!*G”˚‰˛ﬁ…˚YYº!¡]√`VQip=tÃ¶ƒHF≈∆@“…Ñ*´î{aeï¶Ø°J1…‰◊¬ï¯â„˛Ñ‡˜∑–êŸÓ«!IÌË¥íK6eÒcTBœ»Ò∞ık¥≥Rº¿óÇ•˘(R≤æ«nß0)Ëî;#»¨ßp£Ë∆ê\"–ÂïLc[ë%3@CÙ5XÅ>tOl#∏§K^á)òúñŸ·‹ˆ¬◊™\\≥yπ|ò£UÆ‡`ñ∑ó‘˚àñ…Ñ;yÏr⁄îDpóı-ü3Â…ÑÖ´th¶≈éºìﬂ°p;{∑c^Ö]9î∆ÙE\'-*X¢2Ë@ç⁄ OwMTÑ)N”\0¥Ì5¸± ªKO9iÅÕB•l!vtƒ—ä%Ô§@õ$¡ã ìíÏl ∑–‹¬ΩE\ZiNÏOŸ¬+ˇ\0ÉaÛäπYíF©¬Fx\')„‡u∞]üy;]å^ü‡ÇFâ\rÌ±∫ß	bÚˇ\0£4¢‰û”\\÷±6 7È„≥ë=ydÑ¶‘1è‰Md˜˙«3Kn†ˆwâ\nZúúΩë!°0 \'‚$aÚ\Zk:¢ÛyﬁkO`±Óª›ùÑ\'~Àî%≤M‰B2D⁄|é∏ºƒQF(pLoÈª&ÄnùÆÆD≤:D	\\H∆$È]/Ú=∏æ‹ùW+j\"]4øC¨˜¯˙¯êwñ !vJ¡†.ÁÚJÿ\\ãLÜ—PN∆42Å‡ICP ë4é∞Âyç$BtèÇ<ª0æ`…Èí5€£‡X ‚íóª‰ƒÚ;˚Ãá·n ‡Ö<ÿb6˙7Ï¢çŒﬁàRÚc∑Ç\Z‹n∆¥$;r∆Qû$èKò◊hÑ\'‹<ë\nÍH“*bí∆ŸZ.ZKz∏1¶]ÏŒí\nzjà9Ò]°Oèa\"√!Úp•\'Ñá§˛¢,≥¯áC¿è «Œ%å«ú€Ωáí“…Ù5ó+D%8\rcˆB vO»¿É8Ø}-ÿú ‡9!!èMΩ,C‰h‰nﬂÃ|ø=\nÇ™‹¸≥îenPtæ∑¡=ixq‡-í3R4FQ~Kñ&üî;.é÷rÚ\'É™ÏóQ£˙ŒlR¯#ÈzŸlâ %6 $íX∏VPŸü≤“añ\rH8\"4jñ\'¢DH\"]∆Ñ„°l¯ûƒEâ–xc»ht™Ô†è$.Ö+$5∑,∂«Ó\\ ôï8Æë≈Ï}0êø\'#◊…⁄8%∂Õıò◊d¶ñ4DlôÈÁéC~F‘/Ó4<ëy0ÜÙ∆“w}\Z•d†ü¨.Ü‡ö}„q\r‹6r4:√¿⁄jÏ‹ïpÔÚO§7¡µs.ÙbÛNûV¨£«°jÖ˘_#YßZ*FM›!HE!æt≈Ö»»y—ë8ü4!π7À—Àp»Ÿ\ri¡g(b√‰>√“ó¸NÑ®ôœÙ*ƒéÂüz<M€è,y9LO,B>˛(æE¬∞Æd†C=ı«∞îπ≥“∆{Ö\n\"2°_∞p€E¶à<¬ ﬁ£ÍfMƒÚg¨J%!)êéÖ¨t	2L≤8≥äë¥cRπÂ¿bÛT~`¢l=¥/Ã\rj—h[”Q©>ÄÊÀqU§ø	Æ(€±Ã/$\Z4ßÑ>MN¸ã™Çkjƒä¬’i6H— ËâC‡dÊrµ)|ÄÛ±\\AdÈC¸·ıìqD	œ€_&A\\naå\' $Ê](oëhÜ∆Ï)JùÚ\ZkRÂ≤;úªì\npåƒ÷Ãƒ¿ôL!ØV÷5®LÜÒæ≠â“∑Œñ‰n`æEÜE2!*ÑÏOë†€c¥”àµk˘WbÉ&˙Ú$•£Olö‘D‰Dã6∂Ÿ‘éä,Ñ∂GLw|	äy”c©W¥àKÿ|lΩR≠ÿê¥Zµ™f‘G◊ÏE-}ÿâ&Ã^àvÙÃAFcÌ≥$æ¡øz\\Un/),9D9ìK”båõ|§a;Q[.¥≤0≈*÷G=õÚ(éÅﬁv	<¬$R«¶dK—$ôñ…ËÇºπ¡Ï…“çCcû“`’P¸äSSe)≠Ùÿ≠Ip-DJü∏l‹2œyÃ\\¡ØDÚ%¢ã°ªw¢9 ÕΩWHZ\râ§ì§ÈHñ›âè+†∞ÜJÏ1Ö•ü÷)âµ¶∑\Zít°–ƒ—µ)7\Zß√Tﬂ√$™YëKAâJ+≥Òq\n‘éÚâ—ö≥§\'ÿ*¸·es°«˜Ëïû\0è‡b6 &éÒafp±çk◊òba	ªC∏6\"ºo„ˆ‡Ñk·Ri∂\Z7Ç»lí;ìai‚ΩåI2a¯Ë5â∞®vd·∏î°â›HÒà⁄±%¥d\r≤0<ÿk‚\"õ‰û˛HÅ¨ë2ã	ÉD¢Îb®-ÕbmæFì‰Z±≤’/˜∑∞∑ˇ\0∂?Y|—ñÂ	{(Å{Âô‘ø¶G8D”á\"[úÖõ»Ñ#aÂ7∞‘û8ê¿B\rè∑É{œ£±‘ÑYÿö¯1ï\rré-°;í∂$lOm[Ù%óæ;&z–ì≥y˛RG∞>ëqÙ!4]°4⁄M·˙;8ÓÑI#\"dƒéyv\"vÍ„aËM0ò◊Ã€—WJÔœHAnŸôó\\pIxu≥OÅù5s∏âƒ?Å∫ì:›ô\"∆L“»Ù!ã_\0Á ”‚[ˇ\0SÄÕ9LcC¢»0Ó¬∑ °È~WÅ$[ 1eôG	¢f˘bøcye,»ézt»iã°XÎb‹j¥ñoB\"WÏd⁄Pª$ﬁI˙%_G¸ á·’´Íâó,_˙LÔõ{\nΩØÜPœK´)\Z\Z0%H1¬N/H7\'¡q$≈	‚ˆü√€IDõA,yYpáêº	≠	?›ÚÕÀÁıC„	[z(ªÛ¢©j˝w†Å:ÛR˛M˙¯î}YWﬂ∆KÄì}ˆ8ÓÑ@◊Y|!éøËÜŸr%∑ªR,u,ÏCÖr¡R˝¯å˝Hè:°zß“ÜÎOcÌ*∏fÅ7ÚÈ¸ê˙ˆ?¿åõÈ?9aˇ\0ÜºñÌ(˛v§ﬁ!e‹Mî%∏´ÇVL⁄?R#N\r˛–µ\Zµc(ì->≈–Â\\YÄIdgèÔD6ffèÅ0~P%(«ÃKÿ¸ïﬁ°¬)ÁD@ï¥Iº	¸ê!z-ú\\ô™ü∏oÈüZ\'IØI#¥)ŸÂ#ß\'ZÏk\rr¨j≤êÈ8]M\'°»¨È1Î-%ç∂Qïâˆ∆8õ`Ã;|ˇ\0‡Ω-Q^Å!Ìì(º»>ØÑß?1A<Øê:6Ã]ˆf√¶t#÷‘S2ﬁ†Òñ∑2#Ñí˝[/J’zR+c‰MçÂåj_=Áçy1≤Q“”eŸà¨;K∑ˇ\0ívojâí∑Fﬂbü˝V®B&c8,˘πE[Ê=âXœQ2Oò)dás§ã‰*]æY “-(*∑ëÁ–»#–ä‹ﬁÃæNY3µ^à#—8ù´Bˇ\0W,Ï!4çVÙÊ∫1ÅEHà[ è#ŒÌF[#ÉMàU\nÿª\"4dâ\rÒ§jÂe/bg|\r#’zâ\n§CûbÃZ!	CV•ßÓI#Ih—(a;°•ãDO∂îg(ﬁÄîòHç	¢f0zÃ6Hê\nﬁE¢3#äy¨8£ä˝;πHkõKvﬁá£<â°h¨§¥l≠DñŒ/Cm¨BD%È%ÃíRÿ‚∫=Í3B«∏˜™¥≥àAùâ}ìcÍ∆$ TÙlI#_:*ÑKÑ7ÖÍZñÖÏ£ã8N.ﬁÚO}6E;ªÆ4/è,%\ZthBá±‰Ø·©¸â£ƒm4E√ÿP!\\îèâHU—ëÿ≥ëih¥$ìèeFX¥=rUÔ‰{Óa?‹^#€¡)2”ÀıZ≠\Zœ<è$£–±k0ËHD⁄sCÌùÀ¯—Å—Z5¢Â™BBDÇa$cÎ`K≈Ùﬂ“j:HSª§Váõúó¸Klñﬁ„è–öñâ~´Âî 0¯Ôs±≈~bå“M£ùÑ¨ﬁC,7∏Â€¸á2Ôç6ÊÖM+G!ËêÖƒLK~I◊Å÷ëÿîpƒYáÂãM¨wQéMãH\'E–[÷®.;∂$@_îzA^¡¸`‡ÿÑµé\Zv/√5∑»åRóÆ ÙL¥IÓ‰~§ïº\\≥kﬁ*M⁄À∞$æ¸$@É8di1ÉK2†,>f<Ï;AÉ.PÊÌ±àôjI¯ˇ\0É\Z\r8i« \"z\rjñ:ÛíîïÖ”≠˚M˙5åUR7w˙}zì8|âñ§™Rs“*\r’¸5÷¢C€k‰\ZU?ëæF˜º∞ÓŸ8oƒóµü…*vH«Ùí1[u\Zçö8®§1§èñH–6=¯D%6≠e22–&È¢ß;T~;° »⁄X€_œdÊ$$üâì≥6¿û1M∫°OwΩìjhbYË1\0Ù6i¨4(Ò˝ê˜YPÙS±$D‡n∆Ëy—jà°NF~˝ßﬁﬂËœΩøI≥R“±ík}Ñå=ìÜ∞e[\r£º∂\"\rë≤z_˙ÑSÉµ·ﬂÏ∆≠Íhå§í-H∫I2îNçã#W¨™.è≤60àtÅcevJ,\'D)e–ùÑ‚F`≈+)êj∂˚–&cŒïgƒã-cÙä\Z∆…ÙàíE¨Ë∞˝Í⁄3.àJ«,—+zMì¢»û#ÌªÚ&ﬂ*˚ÀˆJ\".Ï4o%r2¨}…ìÑ‹4”ç«1Fz=¥ùW• aÈ>π—Za±–{?x«§ùèz®{ìo±´f‰√kè–˛LKˆí\'Œ*Á„CSŒﬁH9R¿ËáK4øBÙØ\\ãø¸ZŒ”iÇ,{¶R®¶ıü°iú\"LfªÜƒ•LŸCCÜ√bA˙èEˇ\0å∏\"2-°å)¢`jT23_‡áËB‘8SYë˘‡cåß\'÷¥hBÙØDÜ£m?ˇ⁄\0\0\0\0\0\0∞,9‚€&”∆‡ˇ\0Ò¯∂À6Î…v§Å‰CûˆÁı?·«+}Ÿé`ôBäéû˚∆<Ì{¶µ€Êªˆ†=Œ∫}›j!õπ≥ˇ\0)Ö ~Û’/cŒl∑KjﬁvxCÏÏ:ñõ;lˇ\0îÚü˛¬‘‚é◊ŒÕkŸÑÚñºˆÔ˝ãÓ˘k‹™íÈîv˚¶˛©¸’Ü≈NsC´mœ|_;Ù;Ê^]rﬂ–r˘π˚‚.Y?oª«˘2ô¬8œ;sUÏvÉõgˆÌ’Ù/OÎ£‹À~Û˚≠·Ω|2?çÔü¥6ø∞¡≤îs˝/+Ω˚øÊ+jwﬂgü#~ˆŸl◊◊0{ˇ\0$yﬁp∏ûöÕ_ƒF¯ºﬂ5ˇ\00Ûn`ë—ò,¯|øûOüÒÔ€c≈˛˝Ù˜\'o‡ÛÖ>!≤Àíƒ≠?I4qWŒ∆ˇ\0ÌeÌﬂ˜‚˘tÒkm€%¸∫ıoÆ\'∑ŒG˜4˘”◊‘Ô¯t1^ëΩŒAÃΩ«Êæa#ZÉÊ~ï€Ù±ùa.≤Ÿ«µÈcHˆ;ııÔH˝tﬁ}Êﬁºˆﬁ@s„yÁ€§≤˚˛º»Z⁄äºÂ∞Ûﬁ;›F&;o≥„§}Ÿ‹≥ª)¨fÄ˙ˇ\06yˇ\0âÒ<˛∞ﬁ°ÅœÄ\'?∫]~˙◊…y\"]öÛÆé˙ˇ\0˜æóqúÖæqò/€«{ˇ\0ˇ\0∂Ì}6ﬂèT‘˝@w Çkö?˜¸ˇ\0€Œ˝}T∂7ﬂ.≥≈ût˝U[≥k„œ∑ˇ\0%ˇ\0¬õN˝„˝ûm„v=≤x¶÷é ˇ\0Ç–¬¢Éˆ[ç¸ºq˚?∆–¨~5–çuÔ·mÇjˆ˝áΩ{ÔCs\r´ö¯V–(≠˚ﬁπå C_π⁄ﬁ5~˜œ)ıÂ§K\'_é/‹ÿ|\0æÚa˙/>ˇƒ\0\'\0\0\0\0\0\0!1AQ aÅ0që°±—·Òˇ⁄\0?|ˇ\0öÔ‘¯|}Ó§À„	Ç?Ó^€ó¡tª¸¯¢¡¸˝›¨Ò§®…≠Ñÿ3Àìl1‡≠ŸoKfz∞e”Û‡Ê§ÛdéÔ¬Àe‘GDÂªBg◊û◊˙%≤tÉ9`ò“>‡.Zpéz[ü•Ã\\[¯o£ø˚¸⁄¯{Ô¡i*}K9c,{òjTÑùãÅ¥D3∂√¸~µìÓ\'Ã§,ÆûÆŒ‹≥˘ó{zê‰+9÷¬›À\"/^9v~ﬂ¸x&rAÁ-rŸR√Z6·0ΩÂøò´¨˜Ñ.∞«›«\ràÒ∫ÿ^Xü¬[‚D{aÍRœ†„?ü´e≠ùÔÖíiﬂé¡˙‰üfY“›Î#Çw˙ê¡Ä9ıÅırç∑g¶2|7•ÛzvHˆÿƒzæ;/`G`Cï\0N|…Ò, c∏9∑M,e{lS´áí”`ØÇ.6,ëùÉ”‚N¯>ml‡N0+æL[c$Ç∏XoÉ˘Ñˆ{<òafCã,‹¿N}B8ˆ:~Ô?s;Òoç\nÕù2Ÿj‹¯èRÿmì+È;-?µÓE¬’XlL\"¬m≥ æSÏî5∏òàË74ÀèØÎÅŸäÂÿü´öz&0ß8Hÿ¨-˝ﬁ÷ÚZeœ#”ìÄ>.Õ ÏF∂[~í{‡\0“—∆∏ü⁄,œ--Éstœ%?∏~§˚˘ëkmçÒ∂øvw[ãŸzûv,H6∂Ï„’ÏçÑÙ‰/Ø`/pÂÇ_‚…\n{∞;tΩﬁ£∆‹Æû≠9<Ï±“\n$$dÏÙse¯íˆ•¬U˛¶[‰!€é>6\r¬˚N-\"‡=€(z‰¶ñ≈∞ﬁ–˘Éó∆6ãÙZt√≤c•Î§/§˚à3Ïåz∞1ı8£n¶òxôS~%R_±âá€Ó97k·ı…›ù,ﬂÙÉÒp‰/ˆ¿\0¯béƒ‘>-d[?G∏:ÃµìæNëœ¯∞∂ŸoÔ¸Õt5]crÓ}^éZ„/˛ê7I„\'_Ë/¨qÏ?∞±„eK“Qˇ\0M˜1Ó ÙàÙb¬Y˝nﬁ€Á#∆xGÔç∑&⁄_µÕÈYˆX[	zI∞˙î¯Éıbf_aìÚâÎ∆xﬂ-ÏW|ò#F’ÂÅØæKOñ˚éc¶˜¸yÁë\rXÿ˛~›Àó√\r’˙l{Õü§~.@;ÛsèûÔ€^å3ˆ¯œ/ñˆ±–’ D∂{áˆñ_ci{`{ê`¸EÍdüÜyœ-∞Ä$ßOÊ~Y„\'¬\\Cl˛ÇŸs[ÒêX3-óÛ»O‡¡&~õ.€i«Œ˛üÄ≠F%ﬂÉ‘¯ı-<g?3P{F1NH&<eÌ;ı,bFœ«#ŸsQ›œÂ|û\0úDAÁç•øà¡∞3Os«doa2o,âdKæU∞È‰Úze\0~eæ›I˚X99Ò6IÂ|, {>;‡æÌ’˝ò^£?Ä˛Ç}œ√ˇƒ\0(\0\0\0\0\0\0\0!1AQ aqë°±—Å¡·Ò0ˇ⁄\0?9˘k<∆I˛Jóü\Zƒnv§^˚#ùìƒ3¿z÷4ˇ\0å…ïèiràm≥´H(T%∏äÊ,0&\\Ç#z	hh—˚ﬂçlîÜÃ´\\T	B…uL,AEJâ®oÇe\\>ØK(b*BØÇáFV˚£º°•*$N5+Sn?â\\%kQÃÊ]êç˛‘˙À∑ë\nÄ©ô£Ü$®ú}I·8w&W£∏.vBÆ!r√ó¶#XçDäå∏Àòﬂ\0‹ßpöÈ¨èx\'D^î™Çb»·pDpùL!S1Z jòá$ªçGQP*->s+‘Û@ç¿¨F€ÄTŒßå≤Uï‘·éÒxÏ4ÃXî*ÃP(ÃGÓMøÜÃEi,π‡§…JÒ7∏5òppGq◊\r⁄´ÜR\'∆ [SAπeôìw‹9¥!é&çäf[öFTR¯wŒJÑoòÆŸí;è.•*\ró©fHŸc†â1Ñ%‘ S+0±˛±\rµj”ƒ∞E¬E†’•∞∂Âë\ZÃ“5	qBù¿πQ3ÊxÎÎ]ü≈@®=ıcÃÀHCâÜ˛?8™\\§yE∑Sƒ\ZΩCKóìŒÑlV¶¶blb⁄„Ve¸	p0áÃv≈jìb\rÓbÑ¨\"Ö√K`˘%;`ﬂª ßÌ#∏k[Ó	u*0Ÿ6ù¿Vì(âî®ógfe“√\0£;«0¨tå–πï¯	“HÜ\0ôäà€p@@π’ÕÃ!º˛ˇ\03=¯Ã=®´,]*TﬂÔﬁ∞Û≤AÅlÄb“¸>∏ÄÌAÍZ™)öéy©Gf3∏öVòN\"4ÅÃTnãó”øπÛ_h7˚…	≠¿5îÀ\r∂·zeT|ÛRAÒâˇ\0ib≤ˇ\0h¬À±˝ûH«á∑˝ò2K9ÂûÿMfT®1Ò™wd®Ú‡Ä\0DH0ãLßâqQœ®Ø˛ÉÃƒ⁄q(õ0g0œÄb,Å*∏ñ`v¬É†çø£RÏ∏≠ÊXÆ4<A√˜%É“3◊^‰•ÉÓ%©∏RåPøå/>—íwö8£f›Eô¿Í	§(rÈæHÌñf∆H,Äò˝º|˛Ú£o»¸«–~sL∫éß8?æ§À2q„ÛÖB⁄Ã.‹‡É/‘´∫é≈Dƒa‘≥é®=üÃ~Y¶TV<°±nZ_âÊÃ5ÍæOÒ3Çûﬂà¿\"ußƒLÀ˘%éÍP7pL/Ãø∑‚$Z¡T|î(±ÄûÜ˘€ÃÀˆÓ,”∏`2√…L£¢M¬ ì˛wöÂ),ñs^å˘œûÊC◊É,ë¿-C≥wq≈`Lãgg±lùß∑Ë!…4≥∫}fPGÈ˘è3ˆKX_&√5Å¨Kæn\\\nıí¯\"kÎHeó‚S)ï+ˇ\0;î\"æ[3H{ÀóÈyyrÂDµga{ r√”~õó(ñ 8cΩ≥≤!ï5u≈ËÅÕ≈ÉtJå;°¡LxÂ&°f0há≈3¨sT|±4pó.\\5òÜ°ÁåpHòZàº±Y\rå·0™ G†Tñ511^6âV¬ÌÅ»îW¢ÓV—Ç±¡a©ñq“O	‹Øã!Á0âeVΩwõãÇ(ï1N§¿¡Ô+∫√éCÑ‚Ω	rØ“.$EB‚‡\0E+qäzBrÀ·1§’√îâ\\zS—ˇƒ\0\'\0\0\0\0\0!1AQaqÅë°±¡—· Òˇ⁄\0\0?ÀsÅ gÀößÚJ√Æ\ZÅsaz\\¯©ﬂGÙifh¨U≈Q±´÷è¡EÅ”˚Ã ‘*\0ee\\Ïbâ\0\Z\0µ¯ï—∞ø∑¯}·—\0ÄâUf‡V·+√U≈‹ÍSEµâbY\rƒ\"†´®©≈ï¯˙†sÙ∂*\n!øÉÏüÏ‚w*ÁÙõ‚é˙8˜≠•{–¿ÆÇImá*’üÇÿgË:g`˝¶ë™\"2 \rÔôV:é.U2˛-˙9˝FÖà•Â~x<u`‡âJ∑PÎHÊÖt©ÇÛc}DƒN∆·Ç—yÖ∫â..„ôI∏Ä2´ıñ&\"Jû¢…ªvãDi$ˇ\0ıà\0ïè¢ﬂå}¡˛0qo.“≈ØL˝=@mwÀO›E/ÃñΩ∫>.5#U\r◊*Ìk˜/v\nÉÏfó _)ˇ\0}¢Qu-W∑PÃ\nµÀ¡ÌïUÑ√—ÀÂÖÖÛ2Xë	4†1•èÃæDºã}»E¢l˚·ïı–È∏%âM¿€dŸ—l)Ÿ…`\"∫®úÍhæ•b$qprÀπz∫AÚ§sp}à7PlçåV]\'‹O‰¿óní≈±À‡˝ﬂk¯÷ƒ7¯á/À˙#[l†˚_ˆ1°HZ∞TG·knG_˚ÀabÂ?l,aÀÀÔËf—ï	W’ˆ*@_=«¥l‘W†Ó\Z(yÚÀo¥Ê0%\\.eà≠`8€πH“b§`ƒµÍó˜˙\r;â¨«ÑV}Ï◊ˆa]<j”GòWÄ\0\0\0Væ¥Æ—=Ë¸§J¢‰2ˆ≈´πÈ>Pw*$E¡r≤Ò‡¬ˇ\0Ñ.A(ÉÍ_ˇ\0~®ô“_˛@∞ J-P¥µàXÀ†(=ÿµuârÛ3=2∆î@V¶¶p⁄{âà´+M\0øü°f\r+ò+S	\ZQ£ÀM}¯ÖÃ@8?ﬂ2Ëπ¥ûoü«‘¿r\nx3˚®Æ‚ëb°ÿkÊ_ L@^\\’DA[‘*\"·ê^ÄUh’Ëè+\0(q|yÅ+2°F\nS&Ú©€œ®	N\0Ù∂ø≤ZKëÓ\r8‹Fcvî©_@S«–≈ä%±†¡R‡m≤Ë:ï-ED∂‚¢ÙØ@eÅıÜ\\•∂ø√Çà%QGw[amv{?Q*aM–>7˘_¥X%‹¥™ˆh2∏|G#Vtı‘@≈ÿV°‘}:°U†W¢`ê£√—Á∂ŒÛÙWsµk_pp2◊—˝b+b≠⁄⁄ƒª\"`YÎ0 ∑™ï)I®;¡\róP#Ñp`Êl˙∂ñ}8ﬂâGd¢‚≠Û-©ÄÑŒ”ﬂóÕ@∂`Ã≠@&¶“B„!·6|Sdµ+⁄ﬂˆ/–PK∏Y\0#cS\rÑ^(Ó\\\nìê´¯àõì∞[·ÓYÉaËÛ€Ò/iˇ\0´áòÇ^¸O 8‹\n@∞˘Å‚\05â¢È‡Á‹n§¶\r⁄/˜\n◊ÃIcó*Ê∆nõ¶68Xf≤âk+ í∆‘>‚¸NUÃ\n∆a	ºÃ.‡((‰)}\'‰Û6£_ET∆#¸Ç1§AoÁ“ﬁ¸W⁄Uœ{\n©Óø»Ïl·Ó ÖK…ˆãÂêècÂ§Ô¡](§E¬A.)a˜î\n10åŒ§≤Æáò·0É˝a¿—õ∫ÊUx#¬}\\∂∂•ê†°éõîÇâM©¡¯ë~eJïÙ=GN‚‹\0s¿˜PB´]–fUD™ó¡¡\n©q™e=Û6â…\0T«È0ü˜dhôëﬂ#ã‡æ‚\\eÆÉ†8°JÂ£oﬂ—\0\n7òÓz%:¸nƒqn=L©pjƒ04ﬂúπÄ^ñØÓA‡ï∞gπP1*]L  Ã†*—4‹—û•÷^ U∑∫Ú∞Üæ•≈ ö˜»IÌÒRæë¸çWæi˙#¿\0ÂLÕÓƒ¨n÷6Åã˘Ø∑∏\n°X<\'%¿ïGWë:øˆV‘rXJßÑ¬~†l’4ùK]rá„OÓQhÂÄr+¿ÖÄ∞+jµa`˚ÄKÅÀ√ß(Õ+—œπÜ$s{ÄÿÄ†ó›;Öµ≠Y∞ÄH›À8Ñ;‚;A[ûIz¢£E≠√C¢¶,hÒb˛Z€=cö¶•˙Éö‰›j”\04»éJpÆÆ£$GooÄ∏Ùd¿“˛ÒÇ´Z⁄ÃK#\n;2~b#Kª!ﬁM©êE=D\0zQ¯œ‚√¸Û,0 ˇ\0RËÉÑ∑‘£ç\0À‡∂eÎ˝A∞⁄åUa}‘,l#ßXZ¸¬Ü\' ‚w	∆œ]äëMù¡Ø~< DKô§\na\rGW22ˆ]¡Ü]¡*]E†∆ê£Ú&ApE&Hhn,»ÈCV&ÆÙŸd≠pŸ–º—Å˘ß¢,ﬁtî_6YÌ_0[¥ÏhØõÃ]Æo$…(0ÁñÓÀ©…ÚKÁ*Êoß∏`pÈ\nâ¥M“ÿ0ÜˆÖ’ÜØ©itÉ€Çl∫%#w∑_h´∆WÍ`Rû√d≤Rv8¯xâjÁ·ÊRà i5˚K±¸¡¿KåÎ”ø‹™Ô√ﬂ$3°A¥l¨be’€®-´Ò‘;,;º=D}†2•î2Îq3%ÙπK|•r3Ä+†ø‘±4óM]BA%˝Ïuvˇ\0HâáC\0úJC›˝ÉÜ+ê H±?®>¯∆ˇ\0ÿ†Uƒ!Íç¢dJÀq≥∞<\\@ãbü∏%rñç/PÂ@£=ƒô?PY≤*´Â°‰ÎÃß>æ_‰r\\ôëÏxÜ‡Ö—JæÅ˝Ça\Z‰˛¡∆«LT+¡q√€‘ –R„ñHçâƒR∏	˛Ó\"ejAÒöOºBÊÇ¬¶ÌÅvb{∆›-ÀDk⁄ÃÅ_ñ>∆&-¿/˘î¥⁄º çrZÑÖö”w∫ó@-}˛CmDYŸ◊¡»¸` ¨RË9~wPØ)a¶Ò)4Vâ`*Ùgı#=(‡RÂPñJnß%ΩAÄ\0Ê–t†¿€∏X-\'Q‘ËîM\'«2ÍÖ-GLdòop∏& Gò¢≠=xÖNºKÉóqeN^c\nÚÓ ™ƒÓ	≠°=ü¯≤ò≈ºD%ÑÚKÂ„©Åêï„˜bÏ«≤+U*œBπ6DD{è®ÕË≈X◊—◊“¬◊Dy∏âß\r˙zè`\Z\r¯A=K<ÀÓ‡ı	7¥.Ô∂àræaøù(=f\r´W\0s)n“e˚KÑË)ˇ\0zâôµ\rB:ÿøh˜\0‚÷””¸b≈\0º\0Dj<¡∏jm5bFoi€‰Ó$eR≠ßﬂ04%O‰Q•c‹∏!MR¡ôìÜPá.z{öŸÚvAá`∑ﬂ;ñYøÏv\'¥C∫É—¥/\n‡>◊eãÏƒ\Zà≥ƒ`æëbQ#™xØ•ú¨®PX•wWÛ£v<Ωˇ\0üC]~b;&N´√ßÒÁ¿ù•üyoˇ\0}}?®w9K€◊Ç.ﬂMÜæ`√Ôø¥q¿∫˚±¡ÃµÎ∑¥ÎJg‹≥^S∏∏EØV´ +l‡≥‹z÷é⁄[$òâ·áXîÿ‘ˆÜû?n-¨ØèÈ\ZåÆO#…∞XÃ¿ßí\0S\Z	tıq~Sí8Lpâ/®áì_˘BáöÃ#\"’5P)·°+Nπ\\t\0˚„(Wáq⁄Œ\"[\nRëúŒ’>»Pk2Â⁄U∆ßÕ≈©ICTÁ˚-€Ïƒ+9DS∫ä©bdN«ò∞ØP‰ä¢äVSù˛\"º*ô|ØtcÈAÚ±ˆπÖ‡ﬂGÃWj⁄…ˆÇ‡Á\0.+q4∏ö¿‰xÙÌòCB` ;e∂)É√Ã;}@n∏ïF	k¶î≥ˇ\0}‚=»AJñàÌ‘˙Ö–´I˜ˆBÇ‡Ú=_\'S>Ô‹zaeI˝ç•Ì8ˇ\0µˇ\0b\\òry\"¶–v&XEÓ√Ê•≤—ê∆<LË¶\nÚ~á§ıçÆacäÍ3‹ŸIú∫9ÀÙB@‚Ñ∏èÊ·ÙÚdÓëÓ˝ü‰πj®h¡‘b`\"€ß^!W´◊’‡2∆\0)´jΩ£ü˝úÉ7Î•!¬Ωz˚¿Ä(\'(Î6;@9{ahpw(P(\n\"5«O‡ˇ\0∫ÄN∏>\'·!∫xö^ØÛ\Z·ÖPñJØ@ÔszMü0)ò„¬@ R•4åVuƒNÎ≤\\dR©Ït∆MN\"u«˚\n∫ù\'O$§πÉ|Dh®}4¶á	»«ûƒIÆ£\0ﬂø‘ ~Aò@Q{È?Ú#€k˜~Ä4Aó®i@VÄ6∞cŸW…º^ä;Å[õ˛ÜØîâf»9åä⁄Ã≤R∂ˇ\0ìP[€	ß+Ë˛ÀÑ®5£ÊP€ñw6„÷èƒ ;ÇU§˚3è¬@∏ÓœÃOQÖ;Òà‡£5`Öêú®Bﬁk$áÍ1µô^Z†Ìø«˜\0ã(ß…¶¡ØuãÅÍ%vL†ﬂ˛˝\rÃèTj\0ÿ˙/å|e+•|äüAç`&ıù˝¨˘ÜæNpÚ≥ë!Ó¶ÿΩáÚgÉ›l˝„∞çB;a&‚êøikm^A9˜q¥\",?LEXr•˚§≠-Q@¥QJ<∑«òÓ¿((8#©iwÒ(D¯®{q*il˚†Ñ¨øñdráêÄ}„#‹_Be¸K≠|B\r··∞ÃÆT∏G˛ˇ\0qTèÊkdeò·Í2%(˛üêá}îw◊€ı	-ˆ@*‡<31òı@1}¯à !@hƒ°˚#yLh°\'›è ◊Í˝â‚yàä√r°¿eåG·;ñ™+‹&»Ã6˘¥Z∫Í÷„@˙…-!•√âp†».˚Ã©Ù\0yÅ∑˛≈\r÷	C›˛»≠zƒ%.≠Œe&8=ƒãrQˆïpAr¿HÏ(_àñ≥o«áƒ\r®‡e®·Ïö,X[Gæ>öùF∫]¯ckÉOìòW@\0Æ}ƒJ	ãr—e√v⁄Ï3”ì3n&pQP–÷ñ±Ñ0N˛Ó∞\0¶Ä∂/*z´˙ ¢\"pïEâU¢ãV•∞^Ω¬õ[∆°∑°£ñV*+çô‚\\é“ÄÂá•J˛˜ç¸ì?a•@|[ˆÄ@d\"¶¨0÷R¸G‡~Ã⁄RZ¯†?≤∏®fs`/Ãv7ÊÆë,µß˙Õı8≥â|1ˆ¯ñE÷‹¡Ëˇ\0\"WB∆\\Ä¶ì$Hj‡(/≥üqâE)®ñì)Qõﬂ #˘å{,Yrà\rW0uf©q®‘Ë;…FÉ‡¢\"†≠]JÒE ßËÊW≈vª}¡<‘r`±TéÍ¸BUA´KËˇ\0R[~E≥ k—Ä\'√\0òå’¢ˇ\0%î?1–\'`Y^op√ô∫=Ò,»‘+¿eªä‘Ìv˘\\ÃcÄ?o·+í#2æ†¯Øˆ!£ ‘™<ï˜åÀ‘\ZM	e˝C[WÙˇ\0ëZ˜DC&Àè¥)^\Zè‹á\'T¸∞Z<L@‚Ø‚\0Ω&ZÓ-Dunº£íZiØàÔ\0|¢g‘\0Ú)TåXXbfŒT˚¿™¿÷·Ïbè0∫Ã-ƒ¶·Ú„˚bX\nD‰Äabd≤¡«1oÈÜõ¬p*ÁÔèòù¬<ïÂÓ‘v+Ö2zvE¢›—]A}nÄ\0€5¡±z9x— F≈n’´≠¯˚évã—∑∂∞=πÇ’ ü`X≥-P|£È_‰÷…ØcUQÏøÚ\'‘¬Ï¯nn®=ø˘&õÓˇ\0‰¿^Ó]·O‹UZöz%±´¥5Á+‚Ræ¶„Xk√NR_L5\\IKU„c,∞K6úWç¬%≤hèÒe\\Xñçí»\nà\0µz–pïºyÈÒCAPP¿+JÚ\nˇ\0ABªe‰Ë¸çû‡ﬁæäï—Oï+ıB^ «‚TrßÁ#Â[õz∏‘B9´ƒaø?àG¨æ 1†∂®z›ÚÔÃ¥*qªhÆ9:1µóVÏ∑lf˚m>0b≠?Ñ˘RêﬁÖXJ–\"˚ˇ\08CÜk~)Ç-ÜΩNœ”˜å·ñ>ÕDr*´⁄À≤<+£Ï~cEπ#‰ﬂ*ôD=Î˚	˛ªﬁÏΩ¨Ó–†´µ¡fv–p¨Bª˙ˆQG5u‚\rP#Zt¸8âT”√f3Ó5™É2´WÛ˙\"nôko–8k∂Q”ö§Ø±‚0Ön\né∏§Cﬁ”˜Çﬂm£S\nz?∞Üñ«I@≠%¬∑XÜ\0∞ÙE ñRù∆·R‰G<ñiõå∂∞‡@ÄRÙûóàãz´Wl¢¢¡WñÖ›øpéø01WT’ËU§# ;gT~Ã\nµA>?˝éÖÑßIÑ¯r¿\0‹Ωºw~¢Œ@˚¨hSqÖ@≤QY´‡Ìcn°∫/æ⁄î\0\n >™„\0Òù±äTG$ù¬Ò…Ú?˘2¡ÑÈô◊?»\\E∆Gk~Ü\"i“A~◊˜â‚Açæb`B∑£ñ9`P&Ä~‡¢çr¿¢:ga_w˝Å~¢€‚bQ©`çzbÉP\n[uwQ\nqπ!OFèy}@•M›\0›˘•b\07b∏|ıàw—\ZFêrûP:Ω¬‡ÖQŸìâb90ÓÆ∆1¸è’à˚}…xC$y#˘T:.üÖà≤¥/™bˆe?Ø·TîfíÈäDá6f∫ˆÎÔ\0Ë\0Å†∂è¡Øüuu˜Ç¬\rØ>1dv—ÿ]v≈x\"–;\0ˇ\0?p‚¥≥à`°»,û„£3I\0Á,#@Õ8P∞|D1»˛—‡EVÉ\n—E<ólg)ÕZ…˘Ê1 Àl\Z±âüR#VÛ¯ñ£)Qµ]∞†ØAlÿ¡›A\0›&«∞∏ïÀ≥ﬁÌı<sLhE◊\Zï∑Fè}J8åMñ}¢IC-Ìi_Q§dU€∑K≥ÁaPàéDlOp)R£GKFZ¨Ü_Œ!H ’Âµ˛kõ‹∑±;OÇbê’y¯ãÒ.qihsú Á0¢∆]VË`…ºˇ\0ƒ≤¸ WVˆ)H[\\Û-f∞=#ƒ∑GDuå°œø1›iÄ∑£˙˘Å44nû˝¿E@UôqYGsüGœQY*6g˛Û∆-\'¨¿+ªh∏!îB\"4â¶$\0Äò-◊Ç”gœ1èék@r◊é2ôj6Æ•·ùGü1¥UÆà\"Å(<ù¿\\øºÍ”2›ö/ƒ¿*øœóeó\r;†c%©˜Wïpã5UOû¢^˚;\"WH•Â«t5›$∫Jî≠Ê±K¢˜\ZjväΩªØ%¬Â–€≤\Z‰Tü˛Jåzêbáµ@˜‚	Œ0ç^MqvF÷cè&ˆ9{EnÆﬂª\'∂T◊* A‡_¸é•õBZ˘˜ô\\@†_@áÍ\r¥\rΩDø±a·Z¸AÜ”B.k®Ÿza§6˜é„gÉ5Û[üƒGDÌNïüµD™·uVÈ_ñˆg8\n∏∫b‚ìfìŸƒ}fj≠Û“ÚPÉEÚÂ∑Q0í¨Îm†røÎƒ?ÌX∏z/Ä>ÓyçWCœ«è¢CíúŸs∏@˚”;ä’Ä˘á‡?La∂]v°ôSÏc”h?í Ü_ƒKÜm=˛¿eÒ8Ø6±±9G§™Ê„•∏ún™Øw®‚†\rú´Àﬂ∏_/ÿÂµ^)±)Æ–\ry!µc–˝\"ØïÍ2öMøœº≤6|ΩíH∞tº=ﬂ√(‡F çZII∫ã•&õ°@Øj∏Ò)≤Æ˝|√≤Rb∫¨JÜPÿEEJ’Ìóñ≈‹~JFì˝|@ÓƒU≠çaèΩ≈Ø¢™º|\0uMÅªd»Ÿgò-Çö\Z4ñß‘JSgpÙ+ïxï‡ã»§vk€ÒËƒJ+Ì√˘ËÒÙÄ0Œæ_ÏhuWÚBπB±S∏m•ñ\Zá–T´∂˘kíƒ1C6ßØˇ\0/Ì\n™4…ˇ\0ë3Ù/Íi>b\0u íxLèLaÅ!éL#vœ >°Â|CK(Àı	J/óÕ}Ω«v\0V[◊¸dÓ-¶ã@´xñd]∂OæD±˘Å8T41È∆⁄`e–T.8˜PDM¢˝É˛¡k)/®±a9ïùh‚§ﬂºÛÃ6Õ3J,#‹Ç’®à∏\"FÅÿ\0ÂÛc\0ÅfÅP∂8⁄Ù>ΩˆÔ‘Ø(AË˛≈dRÃΩ˚Ò+åNGó˘‚d&Zêï≠$S≤4È.\01ôØ†õIs∂ÖÄ-Ö-%R–\r[´Ë2¸w\re®lﬁ!´dˆà?aåÆ#A”w¸fa”P⁄‹6ôìtR5¶U‡¨Æåƒ¯E”W·~1A¿±vØ†c¸LPm8CîNO5	äuÃ∫¥<„π≈5au§y^û0ÒD\rŸK·óJL1î ¶\Zƒµ ßt“#◊\rÀ\r\"∫¶»+k∂5ï‹ÌqvÆÉ˙ÙyÑòa?To”ÛH‰]ó‚nÖ0U-*˙)Ó-ﬁëË9V’≠[à\Z!∞6Z2Ù$¡x˘ÕÜ ∫‡Ë!‚4òÌ◊ÔQ•ö÷™˙ƒ-[–‚RÄQ† “µ;M>Œ`à÷¡,ÊÎé5€UıiÓ¡\Z`6\\˘Kçæî£ÆpøiVµ\n\r†¡\0*òÏ*™;±/Ÿd§óUœÙ«⁄±X˘\0@<´¢#ïÒ-¥€ÄQG\n˘£ƒÆäÛQ∑p»Ü≤µ≈‚eD{v:V?≤⁄À±W·Øƒ=£\0\r:M<ò]%é—µÓdi2ôäë\"DãÌz¶≈\nøôz>úW¬ﬂ∫BâŒŒØuüªßrtn®TŒsï˚≈¯eºJÂ®S∂ÉTKîøÄ#EÜ–≈›¶  \ZÅvã ¯¡Ó\'wFRº†¿á‹…»]ÿTÖ£5}&+‘¸&i´Úáˆ_=kdö≥†˚´(kh√–∞‘%=ƒ∂v˝E€62òπŸ©äÏDh|À‹∏/â~£8¥¿–À∂“Sß| ¡,…Ò£Ô0A\Ziù¸A¸àú%ÑMà«ñ∑¬Î·ƒ∂«∏Æ«r y;öC±i¶‚$ïh£o6B≤Ä:ÇÕ]ÓÚxä∆Èt¶í¿ΩñyãL:x:~¯¢«µ*‡¥ïE7¨@Izz)ªzˇ\0#)Ú=,zZë¨ûïKéñ∂ãÁÓM\\âØ€¥≥Ñ˝\\&HPPX5k≥w\Z˘Z06≥øjúæW›ÌG/ñÿk\'j[Xs~<˜pá\"h<#Ã*qÈrø9î7©Uƒ%˘cQ˘Ø¢¨·Í\rh·N}«√I˘äOõY·á˙‚\'®ã‚}≤â\r—±|Ÿ3°ÑˆÇü{&”+vµéµ\0\Zwœ‚2ñí”C‡t¡ À-eˇ\0\"´#õ\Zt‘±iàó¢CÄ˜€éØP‰°R2/4æΩèñ°¨)KÕ†¸|ŸΩ—ßˆ_êïzWERh~_ïÍ6´5™¨¯ïÍrhx]v¡öØ‹(VË≤ªDõXŒ÷^π1˜l˝¡yî´∏√ Ò(»]Q\\‡WrÙzÍ\r+0±oLJ…§xÜ\0,K)[ŒÂÛv„xµU˝6;8zèÄ2ÁÿÚ{ôÇ√Irß2•\\bRF=~ri˚Oà≠ul ‘QúA®ØØ>N|B˝µ™æ∆ÎÃpYÓ;πáXπNWÉåsR‘˙+¢µ}æ`,ö%S¬zÏb4/!ˇ\0\'câè%ˇ\0e:∏ﬁ#ëB≤úª_˚à”J™Ω+óª:ç\0âIPº=º˚äﬁç™‹/ÃQ3.¢ V‡Ÿáüiteä⁄á˝Gò©åÏ—˛«mäòé⁄kì∏e&?áƒl\n$∞Rí≠yOE¸‘N[WQÉ^âQ.ª;HÈN†ƒ6qÎCu|á˘)\r≤Û–w\0Â=–˝&‡˛…ˇ\0Âü‰\0Zk.E˚Ö@ÎFÌ’“Í.Uáº„¸∏ºK`ØÌ∏‡ä’“iÄ“‘—õÏÏá`	Ñ]:Û˜Ó_´Ñ:∫ÉÉäÇ.GAÈFYeÈÄj±V‹:ASd4=~§\'Phˆˇ\0áÓ	Rj7Nˇ\0˜ÜÄ\0Í\nïâHÛ%≠/g…PRÃ#ΩTWr‡*ªÆŒOµƒãMﬂgΩP|˚.„ã©]ï\ZKèâ_Nz#Î1ÜJ‡Æ,Õ¯	P=Jík#§{\" &ï$∂ì`IÓ2Î‰«∏LzO¸~ÑÍÄØloÈû §Àg…AãÚ€ï;.ü¬ •´ƒ‰·èa¶4Xê]≠v€òŒCøG(¬Çv”≤˛–‘4¢tﬁ÷·PAâ⁄]1êB†≥z>_º∫©n/ìáÌ†Ÿ∑‡î∫ [€òG\ZÌN~Û\0î±c@öZWO^·) äAÎƒ[X∂±(,Yr’uØ˜ƒ∂⁄é”æc∞RÉ˜àU3\ZG-)n¬&!Ë€ˆàÎì∂æ≈}‡ùXN\Zpñ	∑æ PÅêw\r≈D“Ÿÿ¥72V0˙_éÂ≤É√E˛‚™ª]_Ú-3ÂpŸLúô%§Ü”	≈óât‹ä_¶°êQßá)Ê¢¨≠vEm∏÷‚yñ=8açõ¬ê81À˝ÇJ∑ÿ≥Øq\"–ˆD\\gM>‚®•]¨ÄWD+ÉÙ∫>&EÛg_ôóR¸ »{t}ÂxDmø•£—lyP‡hé\\≈OA˘zâ¨NåGôY√èèlA≠ä˘Yb›ïÈ…˝ñ»ﬁYúaÌÁ˛˜£Dªºœ8ÇﬂÀ3|¨˛q¯©Pº†Lw-¨IÉ>Å‰o‚\rÀÑ‘«vˇ\0Lˇ\0≠€Ï`¶i™yˇ\0åfhç$T‘T+zà°[A‡ËÀ£¢˛“Ì-Ωˆ‚Q>zeß≥í¶æ(_Ü`{£§õ√-æ^ç˝†Ü®Ó\Z†!D!j≠«ù ^Kˇ\0ƒª9Q=÷Ì\0ÖC¡◊œ⁄#2ç™⁄Ω¨D,\0µbWf5‡Ì0\0†ΩΩ±¡j∏.*ƒs\Z¥dTLÆl\nﬂû˛Ç·€1N‹≤“·˘n*ó¬˛·°Ë˙M\'5b}ë~R›Éì‰≥ÊÅ‰K≤K∏ƒäWI\0®s”ˇ\0ndaF¢ıÌÙf2ê®ryÏçrQt¥r—ÇQ¶-ê1z¯lJ¢Pò.øÿì≤ÜZ_j‹%…p`5iÁàÒxÿàëÖ√\05`(K  te¢[.∑ïZ˝@œ{¡ÓúB@YKD^–C¡Ã≤•\"wN+w≥~üg˘®›¿º9óüG1È[v€r˛â@~◊óÃmj‹U˜_àéMàû»F´˘√ËAàÅÆ,T/6¡›Ëﬂßgà\nµ#‚`G—P\\ªŸ‘m‰ÈòP±|=ë]`ÌJüfœ¥Aå*7ú&JAj<ﬂÏèVR∂=‹Å™—ïÆ∫ºM¸ÑT&Äñ®¶ö™Û;nÏR?$`ÇgãV rKz;uÚqL@ñ^.iﬁÓ)’Ö<tÉƒX∂m†—˛¿—óhe˘‹º®\0-ÆWñæ£ˆ‹Rè —Ùæ\"\0û!Ÿy|h¸FbÊ‹„™8Ñ\nSY:ç¿4wCå7ôRÕ•€îÚqÎÔ©%\0Í^⁄Ê≤äñ`◊–Œ°m‚Pƒ©¶ÀåÃ@µT\nN˝Ûı	•B4vıÅŸH[c»f©˚j•œ»E”É‡i¯É0ìÜ⁄DDMâ¶-ÒŒÜÅhÈ¡íÊ∞@¥≈è2õGÚëÀQI{ $ã±rÙ:Ï‚\"SeÓ\0Âπ\\©¸l˘!î\rb–\'…îxó—∂>N5uﬁç˛•@≠˘‹£#UjØ ¿lRœpyﬂ]∆Z6ﬁWãÂ[Ö\rÅ»5~ﬂÚRGà\r‚±q\0˛Ô5‡#”>YˆlæX‰’µXè2æÅB¢…GP«–ãC.òâ€`ÀÛ,Ó◊©ÜâKc\\eÀPc+´kø1\\@†Z^¡yï¿Ω().`µ¶üìÙ˝.ìà÷‚§Ï~S˘1ñÒ+~‹|¿ì‹_:>>Òo+µ ˚yàú^L◊i„ƒ–Û·>Ÿ<ÑBRã¢ƒ˝?1ß¿“5ˇ\00Ç⁄1vˆÃ√%¶óò¯ûó-eœ\Zè8T@ÃôM¥Ñ®≈j$ì	™ŒU¡\ZÃ•≠‹•…¯ªïäüu6Æ\Zi¸M¿Ôi_G˚–KmÛ˙ˇ\0·R„†˙!€/Ã@}\r5çeú9Ó‡ Üí≠p¯z∫OÃ\0P,¢\0\\X9’˚ãÁ0D˝1(¬◊t\0u˙X\\ïÅ,Gë\'\rí˚uÑ*KÌﬂ⁄†\n/~c.¥ã±Ö‹ËzÙ«M®¡Ω”zÏÁò¥ìÌ\'ê˚ì`\Z`ÅDsp±F7eß∏€pcnb6W‹y•>Ê˛ıD]´ÌîÄZË˛¿BÄŒtz%\r‚#ãV“ÖM∂T6Z≈6‹\ng~#£X\'˛ê¡\Z‹\Za®/,bÂ(“-‰4ÀöY`hÜãëÁœôzãlD∞X]â√Ó|∑s~k≠û±\n˚âà\"a<êÇ&„ aÉ;îÀ∞‚r%Ò†Œû‚+`ø7ÈÁO+ÊD¿Ú=Û5iØ@{B.ëL]ú3Ç-wP∫‚v˝Ö°‰¢◊Êió¸Ûh7•ˇ\0±≠¯,Qm2Ì\n¸V¢Ùwîh8ræ–ûÒ⁄œÊ¢a⁄ß\r¸ëm‚©WãÕÊV)ybßuœ¬≈4øh|g%€}¶cDÿƒñ‘Yp†∂⁄Ï–8È`\rµUª‚††@Ÿ°ËÌú∏]øóÃdzn€Ê°∑Îå∏’EÇﬂ»E–\"v&à†ÖùFAË¬˙Åtß≥Q\"Xî£Ò\nˆ-\\ˆ/Ÿ˜%’è	tö/f7∂óuÄc„®¥:Æ:ç™º-ëU*ΩGFŒ◊l\06ë:Ó*Øo)ƒ¥QÖËπó4ÏÚ≤›¿BÖ:ò>XÔ÷∑M_‹~î√Ó|<Ô¯„‘πˆ„≥≠√¯~ÑV\"t“Dzk•3^ÊÈÈîl˘à‚(Û)Í∂◊ñ6yò6\nΩ„wÈ6◊gU¨Då:	∑¿e°––‡ˇ\0ﬂ0ÑÂ/é€SÛùüj|¬îZZ« €>‘¥µ.Ì^›?kè≈ƒyáÃ‘y_òîŸzJØàÙ\0jÀ≥O˝» #…˙ëÁgò)©\n¨Bê∆µ¿îƒË=ƒE≥”™∑«˛M?•y`≥ê◊0ƒ¨Úºøı|F	\0F∞No⁄R -)ÀËeÿ\\5OÅÓ6•Zm^^_™B°%[VtöO\rë†\"ªgÔaÊãÙD!ó§±˘\"ã9%¶Ω≥ßQ#T{#»πÈ,¢ﬁ<¿ò,•†s~\"∂WCøÚEÔo†Ëö¿ÅD5Ù&0õ2=zóÅt≠\'•p∂pÒs—ÈÈ6>bO≈c*™ªØWﬂ˘/\Z‹nIîÈ¿ˇ\0= ˛Ø[±Ω∂”„OÊ,Íπf^ìr«˚.\rÀ&m˘ÄÍ’_˚Q.≈£ ‡Ä@å95¿{O‘∫jZi{|@™Äß,B˙-Ø\'“…}A;j-¢˝å,ˇ\0Ö—Ô‚ìWñpª›æ¢nB7M8’é£ò8™€·wZ”e»	Dﬁ/?\'\n&⁄†∏û(:;xÖÁÃ¨F¿vΩø‰nÂ⁄˛°F>Ç‘Úäµªé!}T⁄«§¬xIÅ˝+W€µælÚC˙Vp;`*8Im\r˘©è˙Zt c°KXNìí$K{lvW>∑d_1∂ΩÀLüx⁄‚u)˝∞¨’iÒxà9≠Æ€€´É¯’zj—Û,®≈ÆèA‡ôuòPµP^ü1?Jç4ª≈˘‘-ç√`“=\ZÊ∆F–9–Õm:‹DàqK<5\0‘◊∞mKÍ‚@ä#cy‡°CZ6?0.≈Â>ù?âJ¿Ju)P&∂/lR\"´jÛ”°Ü.!ò®∞ãZã€€Oøx}î˘ãhIg∑Ù.ºñh…∞…ÚŒâI7KUä\'RëŸ{8{˘ã´¨GJt˜Ó$Eé78YªπY{ea/t∑ÓÍ≠ÌÀ˜Ñ ≠†6≤©Z¬ÃzÜﬂ/àÁ¿†®è:6√*FÄ7 tÉOá∆◊‚à¢.°√f>œ√<€`º‹úØ¢-Éjw/óÉYòx∫†˙Ì£‚âEaOày¸JGÊ.S;ì·ŸÒ\nsˆqV’U º≈≤πrÏÇV1J∏ñ0)^úæ‰0Q1Åˆ™˛FUúøîd˚GX´†cLxê¨%èƒc∂UHñ˙É2)´€Óµ˚Ö$i2G‹¶ÁÛØº@DN»†õ\Z’Í°Ï®•k+¡µÓécQ´QU^◊1Ø˙å™¬∑ô|«ù{eç…^u◊É¡û‚”´BÒÍ>$@C+ZmÊ=+É„D©R¬\\u\0:ûüd‚âãø†Àóà)µå™˙i2T79&ıp+Ä˚èò˝\0>◊RùÇ“U’U–”ﬂpq∞“¥¸)¯Åó¯k–sÊWkL˘¥Xr¨≥}=\'fÖz~TÙ√∏îò\0∫≤\\‘Ø±\r7°ä*µ\0°E/$aâ\02kÕJ…¯\Z•ÿΩ˜_,∫.É£—¢\0JT¥Á‚XÒQ∞∑NôpnÄ7πQ*∆Û≠ƒFíôåEÉ˝1KπV}2ÅZîó(çÀO†DÃc\n∫[Ô9ÖW\ZÅ±™›${–\r©wëOî]c`5ã§GM\"V√›ixÌÇ\0«\rhHw_€.tV ´æÕÀ%V0û-Z˘£∏ã;bdòu‰ÀV‚DÌ=≥\0∑ÓBÙØ0-™W–»\'ÚcìfPâ…«©Tè˘˙å p`‹%Àäoµ%JÃØ0√80àçio[∂€,ßáÖè –P&]d∫{∏,\0ß√-/:\\3*¥ïcf± S˛}G\ZàÅ )uÍTä‚]®mw\0Zø‘™ôd\n#n[`¶îÄs/ˇ\0Ngö%.Zõy}ç˜\ZqPÿ≥ëñ˙ÉXDˆF\\πlJ ≠˝\nŸxÉ‘ ‚`îëY\rn‡Ögtc˜Hal\ZhS\\2¨,–o”<ºßÀl∏ãb)„©O˜À ^P-¨µdñ¡Aã:˜P™=¬µ\0^N\"lj\\€s%TO˛WSà¿rÓj\\ÿÛífª≈≈óÙ´ÅôuQcÈ~c.o.·ôÑEÊ\Zïx\"Æ£÷	Ü∞\'ºêÊ‰V^zÉÄZÌvÀê0«î<£j˝\néq=ÖE˘w‚ÎàVÕfƒÿ¡¬–6\Z|êpÏ¿{ñ\'±∑®∑u*£òëúøB…~£æÜÅª}˛ /UO¥óÀr¸¿‡òKÚ?â•ï D¢VaíI_Q±J}8:ã´t=µGﬁ\Z¢Æ≈ß°˛ÀŒ”o;∑sY´®\nïK3; :˝F9 Ü∑1´’—Ï‹FﬁNK€Æ9V∂bß2†∞lN\0µ∑\\ƒ©u¡%AµW1€Q3*ÂEÆ„©WXz∏*ï*Ò@˙Ê,¢D•≠gÆe®!àfTÖe5Z&x\Z6‘TXöÉAπJ)¨ÃHJ™^4ƒ-¨o ¨‹@É6:GYîÿÛ|∫öV\ZáµÆDC#Jhﬁu±ÇY[aŸ,≈Kãû`ª5tÙˇ\0ëÊ/œr†¨±⁄µ-¡≥/1Wl[Ç -}ÅEó‹	·AkV«…R®-—zÅ[˙Ç‡JÃ˙*‚+£ziñ“E(ÓQP≈¡ü¢Ë¿ÆÄµà6ÿ\Z¯X`†!\0Ú1Ö¶0Ó\Zwø1-à‰?qïÃ|¸ aüa\rEπ`k]:`Gz˚¬Ö~b≠¶	bÉÇ+hï¥¢⁄‘Ã&\\Æ˜j∆©^:˙É†pÇ\\¿Ï∂<Pé/ù«ìdU\nËº—Ê&⁄en+e^†C3TøÖúGjß»2ã®s†X§√wÀÊ‚MrÜ’[UÌb∂Xq.¢±ìmì¸ãrÕ9”ï‚,\nÓ	Äñ]ÂL¡‰≠}°T£Uc¸ãDïÜΩ√WÊ∂ÕkËÅjˆ¡ü°¨<e¸K±Sƒ[‘Rh\0U‡ ÁÀ\\\0›./ƒ∂OŒ∑(j™˙ı/QÊ+w4˙1`úœ‘ `‚ı~ﬁ5±nÿÂbä†∫ﬂL≤	H”≥\0(b(®´*.O}L2∏X\"„pPÌø¥±Ö´AçÅK€œ‘†j%õä∏\'.¢€A¨Ì~«ƒPXt∏A£›AIN÷ŸädsSKﬂƒ|m/’‘Kec&ÓP¡ò≤°7ùÀYºËD∂\"3ú¶ShÈFMˇ\0≤‡∂ªq.RB–P∞Ô0∆⁄ãÈO‰\0ü‰q+-	˚ø˘EÅGæ∏î[UÉ˙ÇuâÓ@ÜP˙De\Z®\0]≥S¶»óM‰^Ã{ï&aÓÌ‚∞>:ïw¨ZTDSçÒQ¿ï+h*Ì~©%óï–¶BËÁ6™ÃfÊÆ8.+‹\'–bP\"AE$ÙÛK(b9xä#\"À˙\0D´%‡i…,`eRÍ–∫ÊÆÍ&ˇ\0(|°cO:°—ãàïU[Uµñ?˘íY‚+P≠ﬁeë›Wµ‹°î›YE? âZ◊ˇ\0t`*Ø≠ª@∂èeÔùG[ÿCπAjqq–4/2=~M«Æ÷√öt_+Ü≥íı´à8h√”G‹*]U÷≠	g\r\\c¨j‘™´ ≠ÀsÅåƒ≤1í(Äå6@1ìN–T/Üõ<Ñ»kõËt5ÌÄî¥ÌV≥¬Bµñ§v-gp∞º+˚	‘F´è§pÏ|∆îçJMWÖ∑çÖñ`SåóaKi±63eªÛw änò•ß¸H5ioA√í∆û‹ <Í	ÌÍ Z€,ÂÇ*<Kı-ïn^	¥à[¢¿P\r∂«î¬@*+gè \\)¥0=0Æ(—÷bE;¬#ÑMéq˙¡eπFjƒ-tÒPy.Ê≈sëºfÏ1DA‹9~ÇJó0∆∫éHm∏áFôOëÏƒD‚meÑ©vÖ≠PyKÌ™}G≈¢ìUb£†/ ∆fñ∞ƒlÉﬁ!Ô»∑ÊTqÜUp/œl°q/uRÓà‚åõÚw	Pæ∞Ö»⁄§ÅÖº∑∞ºJ≠FÒê∑Ê≥ñàñdR≤#ÅÁ⁄Å¥Up`ãzŸlM†ÛVÿ¡Ûœ+è1l`≥Ø_EÍ3¢ 1Z¢è‹ïÛR¿‰a¬8√[Ê>•v«W2á<¡≠Ç´Ñ‰æúë“X÷·DRi4‡K∆S€¢EEƒ•î‹∞Eö[#Ç…c¯%I≤î∞ÔœŒÆ%¥EΩG8ekLV†VÍßu‹es-{ä9`TKr\në†Î›îtSb¡Sap’›¯‹ºe™ßkÅp™à«ös¯é´Üræùá§ïfá†5K‘ßﬂÅBä—¡n¢ã≥IŸ-…ˆW8kHñ<G§¢®±Â⁄æJÉöW*ªàÕÌ‹±Éa´z LJ¢†cØ~PõpÎ©jhZ±v#§B«òØ \0*\rª„Pãã[\r´†v÷[^•À(Ã3RÂ\nñãÁK’(+ŒS8;4]À\r¬˜≤ﬁé2&À3Vâ(Fë5(Qè–u@Iú%+Êü0iÉT®J…û ë«D5´Òπæ•¢«ﬁ˘`f∑2C&ˆ\\O\\äy¬°÷·\"]Fã–x\0esËb,±r∏°4âëÛ\0 ¿JaEñXsQGs =Ç;yäÇ‰»˘å!¬9!Xÿﬁx`\n⁄®ÓW.e6wØq∆ •⁄˝iÊ[bïÛßÏ>—À|6±{°Ô,`ú”5Z⁄◊¸h∫+Zπ^‹WØr”77!W2ë±ÏãùÉ∑∏Ì‘(ÿì…§\0Q;\n¬V≥‚7y¿.¨ )~Â©Q *%ÀÛ∫é¿YÚYÛ¯ú-OÇêoU<ìúc÷5\\ƒ∑1i∏…∂së/pRâ‹WhæÁºHŸŸ‹∏©K\ZÂ¢\"≥5rÆ:æ¨ò™`?∫æ»¿◊e1cB%ÛŸ“DÒIk∂é^ä∆2Úâòä∂6%˘ñêf\n˚`g^?ñgΩ»Õ	IN3ıJ∆9PxRW¨‚-ää`g˝ß?ìp€≠Qo⁄ÊL\rèÜﬂ%1òØ2„∏∫‹<•Àäà⁄†·èpãπZu1Q}≈xï*•„ÈòEU°›_àkjh´»˚,˘ï¢ë¥ø Ö¯N\"es_§B‚$p Õ∞Ç nPáeèU+åÕ\n÷^ΩDf∂«UíÔJ*Óú’A\r€`=Öû\n%8Qw\r†;S)ö©Wπ\ZIÊ¨*√…NÓt%/úh±Kã1^e˝pôÀ©qe¿Q¯zà†Ï‹Ö.ÙÓ>˛ï*kË h°|æáÌö=Ê]Ø√•^æ’e™<±Ó^e±fWåﬂ#†·ßÃ›l ”ª»*&ØçÆx|õ•g‡îﬂˆk>\nZ˜^¶¡.VÉêmj≥õÅrﬁX\"i+Íß¶a»t˙∏À¥4`^¥≠„©h≈åπ¥KÉp«–PKƒYr˛ôcOÃ“å/≤V>ÜbcËﬂ+ÕY˝ä(K[2≈¨	ß‹º¢mú†Ã™ÉÙQPåDFìO$yÆ@¥Xe)´Õ8∏ÀATéë…ybó,°∏∂∂+ã¡*ÿ(ÉNe ‘3Ù™ñWh?∏•Bío5Í\nŒŒ!Ü:˙tj¬5ÚB@)ÏáH?Œ¥>> ,{õEó∏≥j9¶3Ö±·òzQÆÕªRí€È0T]ÁMñ(˛H∑∏Ê$Hfháôäâxâ\Zô(ø¢«¸ß|=DXpêúD®∑?ˇŸ','Zenitsu Kimetsu no Yaiba Breath of Thunder 4K HD‚Ä¶.jpeg¬ø¬øimage/jpeg',NULL);
/*!40000 ALTER TABLE `constancias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `idestudiante` int(30) NOT NULL,
  `fechaHoraConsulta` datetime NOT NULL,
  `idPsicologo` int(30) NOT NULL,
  `consultaRemitidoPor` varchar(45) DEFAULT NULL,
  `consultaMotivo` varchar(80) NOT NULL,
  `consultaAntecedentePersonal` varchar(140) DEFAULT NULL,
  `consultaAntecedenteFamiliar` varchar(140) DEFAULT NULL,
  `consultaAntecedentesMorbidos` varchar(140) DEFAULT NULL,
  `consultaConductaObcerbada` varchar(140) DEFAULT NULL,
  `consultaProblema` varchar(250) DEFAULT NULL,
  `consultaDiagnostico` varchar(150) DEFAULT NULL,
  `consultaEvaluacionPsicologica` varchar(250) DEFAULT NULL,
  `consultaRemitir` varchar(100) DEFAULT NULL,
  `consultaExpediente` int(30) DEFAULT NULL,
  `consultaCoemntario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idestudiante`,`fechaHoraConsulta`),
  KEY `fk_consulta_2_idx` (`consultaExpediente`),
  CONSTRAINT `fk_consulta_1` FOREIGN KEY (`idestudiante`, `fechaHoraConsulta`) REFERENCES `citaPsicologia` (`estudiante`, `fechaSolicitada`) ON UPDATE CASCADE,
  CONSTRAINT `fk_consulta_2` FOREIGN KEY (`consultaExpediente`) REFERENCES `expedientePS` (`idEstudiante`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
REPLACE INTO `consulta` VALUES (16018,'2020-01-30 21:59:46',1045367088,'688664684646','84648648864646frnh','4546546546','46546','5464654646','64465464556','46546464','646456','4654654665484164','6464654',16018,'65456465464564646'),(16018,'2020-01-31 11:26:32',1045367088,'adsl','asdf','asdf','asdf','asdf','asdf','asdf','adsf','asdfs','asd',16018,'asdf');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidoLibro`
--

DROP TABLE IF EXISTS `contenidoLibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidoLibro` (
  `contenidoLibroPagina` int(30) NOT NULL,
  `contenidoLibroNombre` varchar(145) NOT NULL,
  `contenidoLibroIndice` int(30) NOT NULL AUTO_INCREMENT,
  `idLibro` int(30) NOT NULL,
  `contenidoLibroComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`contenidoLibroIndice`),
  KEY `fk_contenidoLibro_1_idx` (`idLibro`),
  CONSTRAINT `fk_contenidoLibro_1` FOREIGN KEY (`idLibro`) REFERENCES `recurso` (`idrecurso`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidoLibro`
--

LOCK TABLES `contenidoLibro` WRITE;
/*!40000 ALTER TABLE `contenidoLibro` DISABLE KEYS */;
REPLACE INTO `contenidoLibro` VALUES (49,'Di no a los vicios.',68,1,NULL),(1,'El poder del aire',69,1,NULL),(17,'Aprende a alimentarte',70,1,NULL),(65,'El poder de la comunicaci√≥n.',71,1,NULL),(33,'Recargar Fuerzas a trav√©s del descanso',72,1,NULL),(59,'Relaciones humanas efectivas.',73,1,NULL),(25,'La riqueza del agua',74,1,NULL),(9,'La importancia del ejercicio',75,1,NULL),(73,'Confianza en el Dios Todopoderoso.',76,1,NULL),(41,'Actitud mental positiva',77,1,NULL),(9,'Los hermanos de Mowgli',83,7663,NULL),(16,'Las lecciones de Mowgli',84,7663,NULL),(22,'Los Bandar-log',85,7663,NULL),(888,'TEMA1',86,766,NULL);
/*!40000 ALTER TABLE `contenidoLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribuciones`
--

DROP TABLE IF EXISTS `contribuciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contribuciones` (
  `idEstudiante` int(30) NOT NULL,
  `a√±o` int(4) NOT NULL,
  `enero` date DEFAULT NULL,
  `febrero` date DEFAULT NULL,
  `marzo` date DEFAULT NULL,
  `abril` date DEFAULT NULL,
  `mayo` date DEFAULT NULL,
  `junio` date DEFAULT NULL,
  `julio` date DEFAULT NULL,
  `agosto` date DEFAULT NULL,
  `septiembre` date DEFAULT NULL,
  `octubre` date DEFAULT NULL,
  `comentario` date DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`,`a√±o`),
  CONSTRAINT `fk_contribuciones_1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribuciones`
--

LOCK TABLES `contribuciones` WRITE;
/*!40000 ALTER TABLE `contribuciones` DISABLE KEYS */;
REPLACE INTO `contribuciones` VALUES (16018,2020,'2020-01-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16019,2020,'2020-01-29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16020,2020,'2020-01-30','2020-01-30','2020-01-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `contribuciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delagacionCargo`
--

DROP TABLE IF EXISTS `delagacionCargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delagacionCargo` (
  `iddelagacionCargo` int(30) NOT NULL,
  `idTipoPersona` int(30) NOT NULL,
  `idpersona` int(30) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `delagacionCargoComentario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddelagacionCargo`),
  KEY `fk_delagacionCargo_1` (`idpersona`),
  KEY `fk_delagacionCargo_2` (`idTipoPersona`),
  CONSTRAINT `fk_delagacionCargo_1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_delagacionCargo_2` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delagacionCargo`
--

LOCK TABLES `delagacionCargo` WRITE;
/*!40000 ALTER TABLE `delagacionCargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `delagacionCargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diasEstudio`
--

DROP TABLE IF EXISTS `diasEstudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diasEstudio` (
  `idDias` int(30) NOT NULL,
  `diasEstudioNombre` varchar(45) NOT NULL,
  `diasEstudioComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idDias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diasEstudio`
--

LOCK TABLES `diasEstudio` WRITE;
/*!40000 ALTER TABLE `diasEstudio` DISABLE KEYS */;
REPLACE INTO `diasEstudio` VALUES (1,'Lunes',NULL),(2,'Martes',''),(3,'Mi√©rcoles',NULL),(4,'Jueves',NULL),(5,'Viernes',NULL);
/*!40000 ALTER TABLE `diasEstudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentos` (
  `iddocumentos` int(30) NOT NULL,
  `estudianteDocPartida` longblob,
  `estudianteDocCertificado` longblob,
  `estudianteDocConducta` longblob,
  `estudianteDocDui` longblob,
  `estudianteDocNotas` longblob,
  `estudianteExtencionPartida` varchar(100) DEFAULT NULL,
  `estudianteExtencionCertificado` varchar(100) DEFAULT NULL,
  `estudianteExtencionConducta` varchar(100) DEFAULT NULL,
  `estudianteExtencionNotas` varchar(100) DEFAULT NULL,
  `estudianteExtencionDui` varchar(100) DEFAULT NULL,
  `documentosComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`iddocumentos`),
  CONSTRAINT `fk_documentos_1` FOREIGN KEY (`iddocumentos`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editorial` (
  `ideditorial` int(30) NOT NULL AUTO_INCREMENT,
  `editorialNombre` varchar(50) NOT NULL,
  `editorialComentarios` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`ideditorial`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
REPLACE INTO `editorial` VALUES (1,'rousoes',NULL),(2,'lessss ',NULL),(3,'Delsas',NULL),(4,'NSUM',NULL),(5,'Diakonia',NULL),(6,'Herder',NULL),(7,'UCA Editores',NULL),(8,'Alfaguara',NULL);
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorialLibro`
--

DROP TABLE IF EXISTS `editorialLibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editorialLibro` (
  `ideditorial` int(30) NOT NULL,
  `idLibro` int(30) NOT NULL,
  `editorialLibroComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`ideditorial`,`idLibro`),
  KEY `fk_editorialLibro_2_idx` (`idLibro`),
  CONSTRAINT `fk_editorialLibro_1` FOREIGN KEY (`ideditorial`) REFERENCES `editorial` (`ideditorial`) ON UPDATE CASCADE,
  CONSTRAINT `fk_editorialLibro_2` FOREIGN KEY (`idLibro`) REFERENCES `recurso` (`idrecurso`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorialLibro`
--

LOCK TABLES `editorialLibro` WRITE;
/*!40000 ALTER TABLE `editorialLibro` DISABLE KEYS */;
REPLACE INTO `editorialLibro` VALUES (1,766,''),(5,1,''),(5,1140,''),(6,1890,''),(7,98,''),(8,7663,'');
/*!40000 ALTER TABLE `editorialLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplar`
--

DROP TABLE IF EXISTS `ejemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ejemplar` (
  `idRecurso` int(30) NOT NULL,
  `ejemplarCorrelativo` int(30) NOT NULL,
  `ejemplarAnioDeIngreso` int(4) NOT NULL,
  `ejemplarActivo` bit(1) NOT NULL DEFAULT b'1',
  `ejemplarComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idRecurso`,`ejemplarCorrelativo`),
  CONSTRAINT `fk_ejemplar_1` FOREIGN KEY (`idRecurso`) REFERENCES `recurso` (`idrecurso`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplar`
--

LOCK TABLES `ejemplar` WRITE;
/*!40000 ALTER TABLE `ejemplar` DISABLE KEYS */;
REPLACE INTO `ejemplar` VALUES (1,1,2020,'',NULL),(2,566,2020,'',NULL),(2,2568,2020,'',NULL),(2,5687,2020,'',NULL),(6,236,2020,'',NULL),(6,8955,2020,'',NULL),(98,98,2020,'',NULL),(766,0,2020,'',NULL),(766,30,2020,'\0',NULL),(1140,1140,2020,'',NULL),(1890,0,2020,'',NULL),(1890,1890,2020,'',NULL),(7663,7663,2020,'',NULL);
/*!40000 ALTER TABLE `ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregaUtiles`
--

DROP TABLE IF EXISTS `entregaUtiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregaUtiles` (
  `idEstudiante` int(30) NOT NULL,
  `a√±o` int(4) NOT NULL,
  `idEntregante` int(30) NOT NULL,
  `idRepresentante` int(30) NOT NULL,
  `zapatos1` bit(1) NOT NULL DEFAULT b'0',
  `uniforme1` bit(1) NOT NULL DEFAULT b'0',
  `utiles1` bit(1) NOT NULL DEFAULT b'0',
  `zapatos2` bit(1) NOT NULL DEFAULT b'0',
  `uniforme2` bit(1) NOT NULL DEFAULT b'0',
  `utiles2` bit(1) NOT NULL DEFAULT b'0',
  `comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`,`a√±o`),
  KEY `fk_entregaUtiles_2_idx` (`idEntregante`),
  KEY `fk_entregaUtiles_3_idx` (`idRepresentante`),
  CONSTRAINT `fk_entregaUtiles_1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entregaUtiles_2` FOREIGN KEY (`idEntregante`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entregaUtiles_3` FOREIGN KEY (`idRepresentante`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregaUtiles`
--

LOCK TABLES `entregaUtiles` WRITE;
/*!40000 ALTER TABLE `entregaUtiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `entregaUtiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `idestudiante` int(30) NOT NULL,
  `estudiantePartidaNac` bit(1) NOT NULL DEFAULT b'0',
  `estudianteTipoCalle` int(1) NOT NULL,
  `estudianteRiesgoVulnerabilidad` varchar(100) DEFAULT NULL,
  `estudianteMedioTransporte` int(1) DEFAULT NULL,
  `estudianteDistanciaAlCentro` decimal(5,2) DEFAULT NULL,
  `estudianteTrabaja` bit(1) DEFAULT b'1',
  `estudianteDependenciaEconomica` varchar(45) DEFAULT NULL,
  `estudianteParvularia` bit(1) DEFAULT b'0',
  `estudianteEnfermedades` varchar(100) DEFAULT NULL,
  `estudianteMedicamentos` varchar(250) DEFAULT NULL,
  `estudianteParentescoRepresentante` varchar(45) DEFAULT NULL,
  `estudianteEsEstudiante` bit(1) NOT NULL DEFAULT b'0',
  `estudianteEscolaridad` varchar(45) NOT NULL,
  `estudianteFormaTrabajo` varchar(45) DEFAULT NULL,
  `estudianteCentroProcedencia` varchar(45) DEFAULT NULL,
  `estudianteNoPartida` varchar(45) DEFAULT NULL,
  `estudianteRepresentanteFamiliar` bit(1) DEFAULT b'0',
  `estudianteRepresentante` int(30) DEFAULT NULL,
  `estudiantePadre` int(30) DEFAULT NULL,
  `estudianteMadre` int(30) DEFAULT NULL,
  `estudianteComentario` varchar(145) DEFAULT NULL COMMENT 'Detalle de la informaci√≥n de los estudiantes y sus representates.',
  PRIMARY KEY (`idestudiante`),
  KEY `fk_estudiante1_2_idx` (`estudiantePadre`),
  KEY `fk_estudiante1_3_idx` (`estudianteMadre`),
  KEY `fk_estudiante1_4_idx` (`estudianteRepresentante`),
  CONSTRAINT `fk_estudiante1_1` FOREIGN KEY (`idestudiante`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_estudiante1_2` FOREIGN KEY (`estudiantePadre`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_estudiante1_3` FOREIGN KEY (`estudianteMadre`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_estudiante_1` FOREIGN KEY (`estudianteRepresentante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
REPLACE INTO `estudiante` VALUES (16018,'',0,'cvxbvcvbcvbxc',3,3.00,'\0','Padre#Madre#Abuelo/a#Otro¬ø yop','','','','Padre','','Noveno Grado','','Centro Escolar','','',1045367070,1045367070,1045367071,''),(16019,'',1,'',0,2.00,'\0','Padre#Madre¬ø ','\0','','','madre','','Noveno Grado','','centro escolar','','',1045367072,1045367074,1045367072,''),(16020,'',1,'',2,20.00,'\0','Padre#Madre¬ø ','\0','','','hermano','','Noveno Grado','','65c√±jxj xf o uz uhzl zllzi','','',1045367075,1045367076,1045367077,''),(16021,'',1,'no hay',1,1.00,'\0','Padre#Madre¬ø ','','NINGUNA','','PADRE','','Noveno Grado','','CE SAMAFI','','\0',1045367078,1045367078,1878979878,''),(1045367070,'',0,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'Padre','\0','6','padre',NULL,'','',NULL,NULL,NULL,''),(1045367072,'',1,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'madre','\0','5','Dom√©sticos',NULL,'','',NULL,NULL,NULL,''),(1045367075,'',0,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'hermano','\0','8','op«òfh ·πïfci',NULL,'','',NULL,NULL,NULL,''),(1045367078,'\0',0,'ADS',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'PADRE','\0','6','ADSF',NULL,'','\0',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacionMaestro`
--

DROP TABLE IF EXISTS `evaluacionMaestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacionMaestro` (
  `idMaestro` int(30) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `grado` int(30) NOT NULL,
  `seccion` enum('A','B','C') NOT NULL,
  `a√±o` int(4) NOT NULL,
  `materia` int(30) NOT NULL,
  `turno` enum('M','v') NOT NULL,
  `Estudiantes` int(30) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `unidad` varchar(45) NOT NULL,
  `objetivo` varchar(80) NOT NULL,
  `evaluador` int(30) NOT NULL,
  `faceIniciacion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `faceDesarrollo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `FaceCulminaci√≥n` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `actitudicionales` longtext NOT NULL,
  `resumen` varchar(250) DEFAULT NULL,
  `propuestaMejora` varchar(145) DEFAULT NULL,
  `evaluacionMaestroComentario` varchar(145) DEFAULT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  PRIMARY KEY (`idMaestro`,`fechaHora`,`gradoModalidad`),
  KEY `fk_evaluacionMaestro_1_idx` (`idMaestro`),
  KEY `fk_evaluacionMaestro_2` (`grado`,`seccion`,`a√±o`,`gradoModalidad`),
  CONSTRAINT `fk_evaluacionMaestro_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_evaluacionMaestro_2` FOREIGN KEY (`grado`, `seccion`, `a√±o`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoA√±o`, `gradoModalidad`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacionMaestro`
--

LOCK TABLES `evaluacionMaestro` WRITE;
/*!40000 ALTER TABLE `evaluacionMaestro` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacionMaestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expedientePS`
--

DROP TABLE IF EXISTS `expedientePS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expedientePS` (
  `idEstudiante` int(30) NOT NULL,
  `ExpedientePsPersonasVivien` varchar(300) NOT NULL,
  `expedientePSComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `fk_expedientePS_1_idx` (`idEstudiante`),
  CONSTRAINT `fk_expedientePS_1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expedientePS`
--

LOCK TABLES `expedientePS` WRITE;
/*!40000 ALTER TABLE `expedientePS` DISABLE KEYS */;
REPLACE INTO `expedientePS` VALUES (16018,'d√±sfjsjnfdlavn avsi oiva siasij vp{a sj{sdjvp',''),(16019,'aualdskf',NULL);
/*!40000 ALTER TABLE `expedientePS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financiamiento`
--

DROP TABLE IF EXISTS `financiamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financiamiento` (
  `idfinanciamiento` int(30) NOT NULL AUTO_INCREMENT,
  `financiamientoNombre` varchar(45) NOT NULL,
  `financiamientoComentario` varchar(145) DEFAULT NULL COMMENT 'Lista de las formas en las que se fiancea el pago de los cargos de los docentes.',
  PRIMARY KEY (`idfinanciamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financiamiento`
--

LOCK TABLES `financiamiento` WRITE;
/*!40000 ALTER TABLE `financiamiento` DISABLE KEYS */;
REPLACE INTO `financiamiento` VALUES (1,'MINED',NULL),(2,'CDE',NULL),(3,'Alcald√≠a',NULL),(4,'ONG2',NULL);
/*!40000 ALTER TABLE `financiamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grado` (
  `idgrado` int(30) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `gradoSeccion` enum('A','B','C') NOT NULL,
  `gradoA√±o` int(4) NOT NULL,
  `aulaGrado` int(30) NOT NULL,
  `gradoActivo` bit(1) NOT NULL,
  `gradoMaestroGuia` int(30) DEFAULT NULL,
  `gradoCoemntario` varchar(145) DEFAULT NULL COMMENT 'Historico de los grados y secciones junto a los maestros que han sido sus maestros gu√≠as.',
  PRIMARY KEY (`idgrado`,`gradoSeccion`,`gradoA√±o`,`gradoModalidad`),
  KEY `fk_grado_1` (`gradoMaestroGuia`),
  KEY `fk_grado_2` (`aulaGrado`),
  CONSTRAINT `fk_grado_1` FOREIGN KEY (`gradoMaestroGuia`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_grado_2` FOREIGN KEY (`aulaGrado`) REFERENCES `aula` (`idaula`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
REPLACE INTO `grado` VALUES (1,'C','A',2020,1,'',NULL,NULL),(1,'G','A',2020,11,'',NULL,NULL),(1,'C','B',2020,2,'',NULL,NULL),(1,'G','B',2020,10,'',NULL,NULL),(2,'C','A',2020,3,'',NULL,NULL),(2,'G','A',2020,9,'',NULL,NULL),(2,'C','B',2020,4,'',NULL,NULL),(2,'G','B',2020,8,'',NULL,NULL),(3,'C','A',2020,5,'',NULL,NULL),(3,'C','B',2020,6,'',1045367087,NULL);
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradoEvaluacion`
--

DROP TABLE IF EXISTS `gradoEvaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradoEvaluacion` (
  `idGrado` int(30) NOT NULL,
  `gradoSeccion` enum('A','B','C') NOT NULL,
  `gradoA√±o` int(4) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `fechaEvaluacion` date NOT NULL COMMENT 'hist√≥rico de evaluaciones a cada grado del instituto.',
  `evaluador` int(30) NOT NULL,
  `organizadorLimpieza` bit(1) NOT NULL,
  `organizadorClase` bit(1) NOT NULL,
  `normas` bit(1) NOT NULL,
  `mision` bit(1) NOT NULL,
  `vision` bit(1) NOT NULL,
  `mapasRiesgo` bit(1) NOT NULL,
  `comites` bit(1) NOT NULL,
  `bienvenidos` bit(1) NOT NULL,
  `valores` bit(1) NOT NULL,
  `directiva` bit(1) NOT NULL,
  `material` bit(1) NOT NULL,
  `observacionesPositivas` varchar(145) DEFAULT NULL,
  `observacioneNegativas` varchar(145) DEFAULT NULL,
  `Recomendaciones` varchar(145) DEFAULT NULL,
  `evaluacionGradoComentario` varchar(145) DEFAULT NULL COMMENT 'Historico de evaluaciones de cada grado.',
  PRIMARY KEY (`idGrado`,`gradoSeccion`,`gradoA√±o`,`gradoModalidad`),
  KEY `fk_gradoEvaluacion_2_idx` (`evaluador`),
  CONSTRAINT `fk_gradoEvaluacion_1` FOREIGN KEY (`idGrado`, `gradoSeccion`, `gradoA√±o`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoA√±o`, `gradoModalidad`) ON UPDATE CASCADE,
  CONSTRAINT `fk_gradoEvaluacion_2` FOREIGN KEY (`evaluador`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradoEvaluacion`
--

LOCK TABLES `gradoEvaluacion` WRITE;
/*!40000 ALTER TABLE `gradoEvaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradoEvaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `idhorario` int(30) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `horarioComentario` varchar(145) DEFAULT NULL COMMENT 'Listado de las horas en las que se dan clases durate la semana',
  PRIMARY KEY (`idhorario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
REPLACE INTO `horario` VALUES (1,'07:15:00','08:00:00',''),(2,'08:00:00','08:45:00',''),(3,'08:45:00','09:05:00',''),(4,'09:05:00','09:50:00',''),(5,'09:50:00','10:35:00',''),(6,'10:35:00','10:45:00',''),(7,'10:45:00','11:30:00',''),(8,'11:30:00','12:15:00',''),(9,'12:15:00','13:15:00',''),(10,'13:15:00','14:00:00',''),(11,'14:00:00','14:45:00',''),(12,'14:45:00','15:00:00',''),(13,'14:00:00','15:45:00',''),(14,'15:45:00','16:30:00',''),(15,'16:30:00','17:15:00','');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maestoCargo`
--

DROP TABLE IF EXISTS `maestoCargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maestoCargo` (
  `idMaesto` int(30) NOT NULL,
  `idCargo` int(30) NOT NULL,
  `idNombramiento` int(30) NOT NULL,
  `idFinanciamiento` int(30) NOT NULL,
  `fechaNombramiento` date NOT NULL,
  `fechaDestitucion` date DEFAULT NULL,
  `razondestitucion` varchar(145) DEFAULT NULL,
  `maestoCargoComentario` varchar(145) DEFAULT NULL COMMENT 'Hist√≥rico de los cargos que los maestros tienen o han tenido dentro de la institucion.',
  PRIMARY KEY (`idMaesto`,`idCargo`,`idNombramiento`,`idFinanciamiento`,`fechaNombramiento`),
  KEY `fk_maestoCargo_2_idx` (`idCargo`),
  KEY `fk_maestoCargo_3_idx` (`idNombramiento`),
  KEY `fk_maestoCargo_4_idx` (`idFinanciamiento`),
  CONSTRAINT `fk_maestoCargo_1` FOREIGN KEY (`idMaesto`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_maestoCargo_2` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idcargo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_maestoCargo_3` FOREIGN KEY (`idNombramiento`) REFERENCES `tipoNombramiento` (`idtipoNombramiento`) ON UPDATE CASCADE,
  CONSTRAINT `fk_maestoCargo_4` FOREIGN KEY (`idFinanciamiento`) REFERENCES `financiamiento` (`idfinanciamiento`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maestoCargo`
--

LOCK TABLES `maestoCargo` WRITE;
/*!40000 ALTER TABLE `maestoCargo` DISABLE KEYS */;
REPLACE INTO `maestoCargo` VALUES (1045367084,2,1,1,'2020-01-24',NULL,NULL,NULL),(1045367085,2,1,1,'2020-01-24',NULL,NULL,NULL);
/*!40000 ALTER TABLE `maestoCargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maestro`
--

DROP TABLE IF EXISTS `maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maestro` (
  `idmaestro` int(30) NOT NULL,
  `maestroNip` int(30) NOT NULL,
  `maestroNup` int(30) NOT NULL,
  `maestroCodigo` int(30) NOT NULL,
  `maestroPartidas` int(30) NOT NULL,
  `maestroSubnumeros` int(30) NOT NULL,
  `maestroNivel` int(30) NOT NULL,
  `maestroCategoria` int(30) NOT NULL,
  `maestroAfp` varchar(45) NOT NULL,
  `maestroBienestar` int(30) NOT NULL,
  `maestrocolTelefonoResidencia` varchar(9) NOT NULL,
  `maestroEspecialidad` int(30) NOT NULL,
  `maestroFechaMagisterio` date NOT NULL,
  `maestroFechaInstitucion` date NOT NULL,
  `maestroFechaProximoAsenso` date DEFAULT NULL,
  `maestroTurno` enum('M','V','T') NOT NULL,
  `maestroTiempoCategoria` varchar(10) NOT NULL,
  `maestroSinEscalafon` bit(1) NOT NULL DEFAULT b'1',
  `maestroTipoSalario` int(30) NOT NULL,
  `maestroUtilidadTecnologica` bit(1) NOT NULL DEFAULT b'1',
  `maestroHorasUsoTecnologia` int(30) NOT NULL DEFAULT '0',
  `maestroUsoVideoconferencias` bit(1) NOT NULL DEFAULT b'0',
  `maestroRecursosWeb` bit(1) NOT NULL DEFAULT b'1',
  `maestroCapacitacionesVirtuales` bit(1) NOT NULL DEFAULT b'1',
  `maestroComentario` varchar(45) DEFAULT NULL COMMENT 'Detalle de la informaci√≥n de todos los docentes de la instituci√≥n.',
  PRIMARY KEY (`idmaestro`),
  KEY `fk_maestro_2_idx` (`maestroTipoSalario`),
  KEY `fk_maestro_3_idx` (`maestroEspecialidad`),
  CONSTRAINT `fk_maestro_1` FOREIGN KEY (`idmaestro`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_maestro_2` FOREIGN KEY (`maestroTipoSalario`) REFERENCES `tipoSueldos` (`idtipoSueldo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_maestro_3` FOREIGN KEY (`maestroEspecialidad`) REFERENCES `tipoEspecialidades` (`idtipoEspecialidades`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maestro`
--

LOCK TABLES `maestro` WRITE;
/*!40000 ALTER TABLE `maestro` DISABLE KEYS */;
REPLACE INTO `maestro` VALUES (1045367084,124596,884545,544548,2131331,315388,2,3,'Conf√≠a',2356546,'4444-4444',1,'1986-01-24','2020-01-24',NULL,'M','2','',1,'',6,'\0','','\0',''),(1045367085,8778878,78787,78787,787,787,1,1,'Conf√≠a',784555485,'3333-3333',2,'2020-01-24','2020-01-24','2020-01-24','V','1','',1,'',5,'','','',''),(1045367086,7899646,65456456,56464,456456,65464,2,3,'Crecer',87945613,'2222-2222',7,'2020-01-24','2020-01-24','2020-01-24','T','2','',1,'',3,'\0','','\0',''),(1045367087,31132321,321312231,312123123,321231123,123312312,1,3,'Crecer',354563,'1111-1111',5,'2020-01-24','2020-01-24','2020-01-24','T','1','',2,'',15,'','','','');
/*!40000 ALTER TABLE `maestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `idmateria` int(30) NOT NULL AUTO_INCREMENT,
  `materiaNombre` varchar(60) NOT NULL,
  `materiaAbreviacion` varchar(45) NOT NULL,
  `tipoMateria` int(30) NOT NULL COMMENT 'Listado de las materias que se imparten en la institucion.',
  `materiaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idmateria`),
  UNIQUE KEY `materiaAbreviacion_UNIQUE` (`materiaAbreviacion`),
  KEY `fk_materia_1_idx` (`tipoMateria`),
  CONSTRAINT `fk_materia_1` FOREIGN KEY (`tipoMateria`) REFERENCES `tipoMateria` (`idtipoMateria`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
REPLACE INTO `materia` VALUES (1,'Matem√°tica','MAT',1,'c0d6c8'),(2,'Lenguaje','LEN',1,'bfc4de'),(3,'Ingl√©s','ING',1,'9dc4ae'),(4,'Inform√°tica','INF',1,'c4b0c4'),(5,'Estudios Sociales','EE.SS',1,'8e8cb3'),(6,'Educaci√≥n F√≠siaca','EE.FF',1,'e6ddaf'),(7,'Ciencias Naturales','CC.NN',1,'cae3cb'),(8,'Moral, Urbanidad y C√≠vica','MUC',1,''),(9,'Orientaci√≥n Para La Vida','OPV',2,'a9aed6'),(10,'Seminario','SEM',2,''),(11,'Curso de Habilidad Laboral','CHL',2,''),(12,'Tecnolog√≠a I','TG1',3,''),(13,'Tecnolog√≠a II','TG2',3,''),(14,'Tecnolog√≠a III','TG3',3,''),(15,'Pr√°ctica Profesional I','PP1',3,''),(16,'Pr√°ctica Profesional II','PP2',3,''),(17,'Pr√°ctica Profesional III','PP3',3,''),(18,'Laboratorio de Creatividad I','LC1',3,'f0b8f0'),(19,'Laboratorio de Creatividad II','LC2',3,''),(20,'Laboratorio de Creatividad III','LC3',3,''),(21,'Contadur√≠a','CTD',4,'b5c4ae'),(22,'General','GNL',4,'e8d0e8');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matricula` (
  `idmatricula` int(30) NOT NULL,
  `matriculaAnyo` int(4) NOT NULL,
  `matriculaNivel` int(30) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `matriculaSeccion` enum('A','B','C') NOT NULL DEFAULT 'A',
  `matriculaRepite` bit(1) NOT NULL,
  `matriculaComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idmatricula`,`matriculaAnyo`),
  KEY `fk_matricula_1` (`matriculaNivel`,`matriculaSeccion`,`matriculaAnyo`,`gradoModalidad`),
  CONSTRAINT `fk_matricula1_1` FOREIGN KEY (`idmatricula`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE,
  CONSTRAINT `fk_matricula_1` FOREIGN KEY (`matriculaNivel`, `matriculaSeccion`, `matriculaAnyo`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoA√±o`, `gradoModalidad`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
REPLACE INTO `matricula` VALUES (16018,2020,1,'C','A','\0','N'),(16019,2020,1,'G','A','\0','N'),(16020,2020,2,'C','A','\0','N'),(16021,2020,1,'C','A','\0','N');
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mestroHorarioMaterias`
--

DROP TABLE IF EXISTS `mestroHorarioMaterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mestroHorarioMaterias` (
  `idMaestro` int(30) NOT NULL,
  `idMateria` int(30) NOT NULL COMMENT 'Detalle de las materias y horarios que cada docente imparte en la instituci√≥n.',
  `idHorario` int(30) NOT NULL,
  `diaSemana` int(30) NOT NULL,
  `idGrado` int(30) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `seccionGrado` enum('A','B','C') NOT NULL,
  `a√±oGrado` int(4) NOT NULL,
  `mestroHorarioMateriasComentarios` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idMaestro`,`idMateria`,`idHorario`,`diaSemana`,`idGrado`,`seccionGrado`,`a√±oGrado`,`gradoModalidad`),
  KEY `fk_mestroHorarioMaterias_2_idx` (`idMateria`),
  KEY `fk_mestroHorarioMaterias_4` (`idGrado`,`seccionGrado`,`a√±oGrado`,`gradoModalidad`),
  KEY `fk_mestroHorarioMaterias_3_idx` (`idHorario`),
  KEY `fk_mestroHorarioMaterias_5_idx` (`diaSemana`),
  CONSTRAINT `fk_mestroHorarioMaterias_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idmateria`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_3` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idhorario`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_4` FOREIGN KEY (`idGrado`, `seccionGrado`, `a√±oGrado`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoA√±o`, `gradoModalidad`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_5` FOREIGN KEY (`diaSemana`) REFERENCES `diasEstudio` (`idDias`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mestroHorarioMaterias`
--

LOCK TABLES `mestroHorarioMaterias` WRITE;
/*!40000 ALTER TABLE `mestroHorarioMaterias` DISABLE KEYS */;
REPLACE INTO `mestroHorarioMaterias` VALUES (1045367084,1,1,1,2,'G','A',2020,NULL),(1045367084,2,2,1,1,'G','A',2020,NULL),(1045367084,2,4,1,1,'G','A',2020,NULL),(1045367084,2,5,1,2,'C','B',2020,NULL),(1045367084,2,7,1,2,'C','B',2020,NULL),(1045367084,2,8,1,2,'C','A',2020,NULL),(1045367084,2,10,1,2,'C','A',2020,NULL),(1045367084,2,11,1,1,'C','A',2020,NULL),(1045367084,2,13,1,1,'C','A',2020,NULL),(1045367084,2,14,1,1,'C','B',2020,NULL),(1045367084,2,15,1,1,'C','B',2020,NULL),(1045367084,5,1,2,1,'C','A',2020,NULL),(1045367084,5,2,2,1,'C','A',2020,NULL),(1045367084,5,4,2,1,'C','B',2020,NULL),(1045367084,5,5,2,1,'C','B',2020,NULL),(1045367084,14,7,2,3,'C','B',2020,NULL),(1045367084,14,8,2,3,'C','B',2020,NULL),(1045367085,1,2,1,2,'G','A',2020,NULL),(1045367085,1,4,1,2,'G','A',2020,NULL),(1045367085,1,5,1,1,'G','B',2020,NULL),(1045367085,1,7,1,1,'G','B',2020,NULL),(1045367085,1,7,2,1,'G','A',2020,NULL),(1045367085,1,8,1,2,'G','B',2020,NULL),(1045367085,1,8,2,1,'G','A',2020,NULL),(1045367085,1,10,1,2,'G','B',2020,NULL),(1045367085,1,11,1,1,'C','B',2020,NULL),(1045367085,1,13,1,1,'C','B',2020,NULL),(1045367085,1,14,1,2,'C','A',2020,NULL),(1045367085,1,15,1,2,'C','A',2020,NULL),(1045367085,2,1,1,1,'G','A',2020,NULL),(1045367085,3,4,2,1,'C','A',2020,NULL),(1045367085,3,5,2,1,'C','A',2020,NULL),(1045367085,11,1,2,2,'G','B',2020,NULL),(1045367085,11,2,2,2,'G','B',2020,NULL),(1045367086,5,7,1,1,'C','A',2020,NULL),(1045367086,5,8,1,1,'C','A',2020,NULL),(1045367086,5,10,1,1,'C','A',2020,NULL),(1045367086,6,5,1,3,'C','B',2020,NULL),(1045367086,7,1,1,1,'C','A',2020,NULL),(1045367086,7,1,2,1,'G','B',2020,NULL),(1045367086,7,2,1,1,'C','A',2020,NULL),(1045367086,7,2,2,1,'G','B',2020,NULL),(1045367086,7,4,1,2,'C','B',2020,NULL),(1045367086,9,14,1,1,'C','A',2020,NULL),(1045367086,9,15,1,1,'C','A',2020,NULL),(1045367086,21,11,1,3,'C','A',2020,NULL),(1045367086,21,13,1,3,'C','A',2020,NULL),(1045367087,1,2,5,1,'C','B',2020,NULL),(1045367087,1,15,5,1,'G','B',2020,NULL),(1045367087,4,1,1,3,'C','A',2020,NULL),(1045367087,4,2,1,3,'C','A',2020,NULL),(1045367087,4,4,1,1,'C','A',2020,NULL),(1045367087,4,5,1,1,'C','A',2020,NULL),(1045367087,5,1,5,3,'C','B',2020,NULL),(1045367087,7,11,1,1,'G','B',2020,NULL),(1045367087,7,13,1,1,'G','B',2020,NULL),(1045367087,10,7,1,1,'G','A',2020,NULL),(1045367087,10,8,1,1,'G','A',2020,NULL),(1045367087,12,1,2,1,'C','B',2020,NULL),(1045367087,12,2,2,1,'C','B',2020,NULL),(1045367087,14,10,1,3,'C','B',2020,NULL),(1045367087,22,14,1,2,'G','B',2020,NULL),(1045367087,22,15,1,2,'G','B',2020,NULL);
/*!40000 ALTER TABLE `mestroHorarioMaterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificaciones` (
  `idnotificacion` int(30) NOT NULL AUTO_INCREMENT,
  `fechaHora` datetime NOT NULL,
  `destinatario` int(30) NOT NULL,
  `remitente` int(30) NOT NULL,
  `notificacionTitulo` varchar(140) NOT NULL,
  `notificacionCuerpo` varchar(300) NOT NULL,
  `vista` bit(1) NOT NULL,
  `notificacionComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idnotificacion`),
  KEY `fk_notificaciones_1_idx` (`destinatario`,`remitente`),
  KEY `fk_notificaciones_2_idx` (`remitente`),
  CONSTRAINT `fk_notificaciones_1` FOREIGN KEY (`destinatario`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_notificaciones_2` FOREIGN KEY (`remitente`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=915 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
REPLACE INTO `notificaciones` VALUES (888,'2020-02-03 14:48:56',1045367084,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 07:15 AM - 08:05 AM Materia: Estudios Sociales. Profesor: Mar√≠a Dolores. Grado: 1¬∞ TVC Contador Secci√≥n A','',' '),(889,'2020-02-03 14:54:12',1045367085,1045367073,'Seha editado el horario','Modificaci√≥n: Mi√©rcoles 08:05 AM - 08:55 AM Materia: Inform√°tica. Profesor: Francisco Maga√±a. Grado: 3¬∞ TVC Contador Secci√≥n B','',' '),(890,'2020-02-03 14:59:25',1045367087,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 07:15 AM - 08:05 AM Materia: Tecnolog√≠a I. Profesor: Mar√≠a Pineda. Grado: 1¬∞ TVC Contador Secci√≥n B','\0',' '),(891,'2020-02-03 14:59:53',1045367087,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 08:05 AM - 08:55 AM Materia: Tecnolog√≠a I. Profesor: Mar√≠a Pineda. Grado: 1¬∞ TVC Contador Secci√≥n B','\0',' '),(892,'2020-02-03 15:00:16',1045367084,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 08:05 AM - 08:55 AM Materia: Estudios Sociales. Profesor: Mar√≠a Dolores. Grado: 1¬∞ TVC Contador Secci√≥n A','',' '),(893,'2020-02-03 15:01:01',1045367086,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 07:15 AM - 08:05 AM Materia: Ciencias Naturales. Profesor: Juan Bartanes. Grado: 1¬∞ General Secci√≥n B','\0',' '),(894,'2020-02-03 15:01:19',1045367086,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 08:05 AM - 08:55 AM Materia: Ciencias Naturales. Profesor: Juan Bartanes. Grado: 1¬∞ General Secci√≥n B','\0',' '),(895,'2020-02-03 15:05:59',1045367085,1045367083,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 07:15 AM - 08:05 AM Materia: Curso de Habilidad Laboral. Profesor: Francisco Maga√±a. Grado: 2¬∞ General Secci√≥n B','',' '),(896,'2020-02-03 15:06:43',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 08:05 AM - 08:55 AM Materia: Curso de Habilidad Laboral. Profesor: Francisco Maga√±a. Grado: 2¬∞ General Secci√≥n B','',' '),(897,'2020-02-03 15:11:07',1045367085,1045367083,'Se ha eliminado una nueva hora clase del horario','Elimnaci√≥n: Mi√©rcoles 08:05 AM - 08:55 AM. Materia: Inform√°tica. Profesor: Francisco Javier Francisco Maga√±a. Grado: 3¬∞ TVC Contador Secci√≥n B','\0',' '),(898,'2020-02-03 15:11:48',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 08:55 AM - 09:15 AM Materia: Ingl√©s. Profesor: Francisco Maga√±a. Grado: 1¬∞ TVC Contador Secci√≥n A','',' '),(899,'2020-02-03 15:13:03',1045367084,1045367083,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 08:55 AM - 09:15 AM Materia: Estudios Sociales. Profesor: Mar√≠a Dolores. Grado: 1¬∞ TVC Contador Secci√≥n B','',' '),(900,'2020-02-03 15:13:19',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 09:15 AM - 10:05 AM Materia: Ingl√©s. Profesor: Francisco Maga√±a. Grado: 1¬∞ TVC Contador Secci√≥n A','',' '),(901,'2020-02-03 15:14:15',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 10:05 AM - 11:10 PM Materia: Matem√°tica. Profesor: Francisco Maga√±a. Grado: 1¬∞ General Secci√≥n A','\0',' '),(902,'2020-02-03 15:14:25',1045367085,1045367085,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 03/02/2020 y 03/02/2020','\0',' '),(903,'2020-02-03 15:14:26',1045367083,1045367085,'Solicitud de permiso nueva','Francisco Javier Maga√±a Arriola ha solicitado un nuevo permiso.','',' '),(904,'2020-02-03 15:14:33',1045367084,1045367084,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 03/02/2020 y 03/02/2020','',' '),(905,'2020-02-03 15:14:33',1045367083,1045367084,'Solicitud de permiso nueva','Mar√≠a Pilar Dolores ALvarado ha solicitado un nuevo permiso.','',' '),(906,'2020-02-03 15:16:18',1045367085,1045367083,'Rechado de permiso','Laura Mar√≠a L√≥pez Su√±iga ha rechazado su solicitud de permiso. Motivo del rechazo: necesita una constancia','\0',' '),(907,'2020-02-03 15:16:26',1045367084,1045367084,'Cancelaci√≥n exitosa','Ha cancelado la solicitud de permiso con fechas: 03/02/2020. La raz√≥n del cancelamiento es: 4.','',' '),(908,'2020-02-03 15:17:59',1045367085,1045367085,'Modificaci√≥n de solicitud de permiso','Su permiso se ha solicitado para entre las fechas: 03/02/2020 y 03/02/2020','\0',' '),(909,'2020-02-03 15:17:59',1045367083,1045367085,'Modificaciones en una solicitud de permiso','Francisco Javier Maga√±a Arriola ha cambiado su solicitud de permiso.','',' '),(910,'2020-02-03 15:18:16',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 11:10 AM - 12:00 PM Materia: Matem√°tica. Profesor: Francisco Maga√±a. Grado: 1¬∞ General Secci√≥n A','',' '),(911,'2020-02-03 15:18:31',1045367085,1045367083,'Aceptaci√≥n de permiso','Laura Mar√≠a L√≥pez Su√±iga ha aceptado su solicitud de permiso. ','',' '),(912,'2020-02-03 15:20:44',1045367084,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 09:15 AM - 10:05 AM Materia: Estudios Sociales. Profesor: Mar√≠a Dolores. Grado: 1¬∞ TVC Contador Secci√≥n B','',' '),(913,'2020-02-03 15:21:34',1045367084,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 10:05 AM - 11:10 PM Materia: Tecnolog√≠a III. Profesor: Mar√≠a Dolores. Grado: 3¬∞ TVC Contador Secci√≥n B','\0',' '),(914,'2020-02-03 15:21:57',1045367084,1045367073,'Se ha agregado una nueva hora clase al horario','Agregaci√≥n: Martes 11:10 AM - 12:00 PM Materia: Tecnolog√≠a III. Profesor: Mar√≠a Dolores. Grado: 3¬∞ TVC Contador Secci√≥n B','\0',' ');
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idpais` int(30) NOT NULL,
  `paisNombre` varchar(50) NOT NULL,
  `paisComentarios` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
REPLACE INTO `pais` VALUES (1,'Afganist√°n',''),(2,'Islas Gland',''),(3,'Albania',''),(4,'Alemania',''),(5,'Andorra',''),(6,'Angola',''),(7,'Anguilla',''),(8,'Ant√°rtida',''),(9,'Antigua y Barbuda',''),(10,'Antillas Holandesas',''),(11,'Arabia Saud√≠',''),(12,'Argelia',''),(13,'Argentina',''),(14,'Armenia',''),(15,'Aruba',''),(16,'Australia',''),(17,'Austria',''),(18,'Azerbaiy√°n',''),(19,'Bahamas',''),(20,'Bahr√©in',''),(21,'Bangladesh',''),(22,'Barbados',''),(23,'Bielorrusia',''),(24,'B√©lgica',''),(25,'Belice',''),(26,'Benin',''),(27,'Bermudas',''),(28,'Bhut√°n',''),(29,'Bolivia',''),(30,'Bosnia y Herzegovina',''),(31,'Botsuana',''),(32,'Isla Bouvet',''),(33,'Brasil',''),(34,'Brun√©i',''),(35,'Bulgaria',''),(36,'Burkina Faso',''),(37,'Burundi',''),(38,'Cabo Verde',''),(39,'Islas Caim√°n',''),(40,'Camboya',''),(41,'Camer√∫n',''),(42,'Canad√°',''),(43,'Rep√∫blica Centroafricana',''),(44,'Chad',''),(45,'Rep√∫blica Checa',''),(46,'Chile',''),(47,'China',''),(48,'Chipre',''),(49,'Isla de Navidad',''),(50,'Ciudad del Vaticano',''),(51,'Islas Cocos',''),(52,'Colombia',''),(53,'Comoras',''),(54,'Rep√∫blica Democr√°tica del Congo',''),(55,'Congo',''),(56,'Islas Cook',''),(57,'Corea del Norte',''),(58,'Corea del Sur',''),(59,'Costa de Marfil',''),(60,'Costa Rica',''),(61,'Croacia',''),(62,'Cuba',''),(63,'Dinamarca',''),(64,'Dominica',''),(65,'Rep√∫blica Dominicana',''),(66,'Ecuador',''),(67,'Egipto',''),(68,'El Salvador',''),(69,'Emiratos √Årabes Unidos',''),(70,'Eritrea',''),(71,'Eslovaquia',''),(72,'Eslovenia',''),(73,'Espa√±a',''),(74,'Islas ultramarinas de Estados Unidos',''),(75,'Estados Unidos',''),(76,'Estonia',''),(77,'Etiop√≠a',''),(78,'Islas Feroe',''),(79,'Filipinas',''),(80,'Finlandia',''),(81,'Fiyi',''),(82,'Francia',''),(83,'Gab√≥n',''),(84,'Gambia',''),(85,'Georgia',''),(86,'Islas Georgias del Sur y Sandwich del Sur',''),(87,'Ghana',''),(88,'Gibraltar',''),(89,'Granada',''),(90,'Grecia',''),(91,'Groenlandia',''),(92,'Guadalupe',''),(93,'Guam',''),(94,'Guatemala',''),(95,'Guayana Francesa',''),(96,'Guinea',''),(97,'Guinea Ecuatorial',''),(98,'Guinea-Bissau',''),(99,'Guyana',''),(100,'Hait√≠',''),(101,'Islas Heard y McDonald',''),(102,'Honduras',''),(103,'Hong Kong',''),(104,'Hungr√≠a',''),(105,'India',''),(106,'Indonesia',''),(107,'Ir√°n',''),(108,'Iraq',''),(109,'Irlanda',''),(110,'Islandia',''),(111,'Israel',''),(112,'Italia',''),(113,'Jamaica',''),(114,'Jap√≥n',''),(115,'Jordania',''),(116,'Kazajst√°n',''),(117,'Kenia',''),(118,'Kirguist√°n',''),(119,'Kiribati',''),(120,'Kuwait',''),(121,'Laos',''),(122,'Lesotho',''),(123,'Letonia',''),(124,'L√≠bano',''),(125,'Liberia',''),(126,'Libia',''),(127,'Liechtenstein',''),(128,'Lituania',''),(129,'Luxemburgo',''),(130,'Macao',''),(131,'ARY Macedonia',''),(132,'Madagascar',''),(133,'Malasia',''),(134,'Malawi',''),(135,'Maldivas',''),(136,'Mal√≠',''),(137,'Malta',''),(138,'Islas Malvinas',''),(139,'Islas Marianas del Norte',''),(140,'Marruecos',''),(141,'Islas Marshall',''),(142,'Martinica',''),(143,'Mauricio',''),(144,'Mauritania',''),(145,'Mayotte',''),(146,'M√©xico',''),(147,'Micronesia',''),(148,'Moldavia',''),(149,'M√≥naco',''),(150,'Mongolia',''),(151,'Montserrat',''),(152,'Mozambique',''),(153,'Myanmar',''),(154,'Namibia',''),(155,'Nauru',''),(156,'Nepal',''),(157,'Nicaragua',''),(158,'N√≠ger',''),(159,'Nigeria',''),(160,'Niue',''),(161,'Isla Norfolk',''),(162,'Noruega',''),(163,'Nueva Caledonia',''),(164,'Nueva Zelanda',''),(165,'Om√°n',''),(166,'Pa√≠ses Bajos',''),(167,'Pakist√°n',''),(168,'Palau',''),(169,'Palestina',''),(170,'Panam√°',''),(171,'Pap√∫a Nueva Guinea',''),(172,'Paraguay',''),(173,'Per√∫',''),(174,'Islas Pitcairn',''),(175,'Polinesia Francesa',''),(176,'Polonia',''),(177,'Portugal',''),(178,'Puerto Rico',''),(179,'Qatar',''),(180,'Reino Unido',''),(181,'Reuni√≥n',''),(182,'Ruanda',''),(183,'Rumania',''),(184,'Rusia',''),(185,'Sahara Occidental',''),(186,'Islas Salom√≥n',''),(187,'Samoa',''),(188,'Samoa Americana',''),(189,'San Crist√≥bal y Nevis',''),(190,'San Marino',''),(191,'San Pedro y Miquel√≥n',''),(192,'San Vicente y las Granadinas',''),(193,'Santa Helena',''),(194,'Santa Luc√≠a',''),(195,'Santo Tom√© y Pr√≠ncipe',''),(196,'Senegal',''),(197,'Serbia y Montenegro',''),(198,'Seychelles',''),(199,'Sierra Leona',''),(200,'Singapur',''),(201,'Siria',''),(202,'Somalia',''),(203,'Sri Lanka',''),(204,'Suazilandia',''),(205,'Sud√°frica',''),(206,'Sud√°n',''),(207,'Suecia',''),(208,'Suiza',''),(209,'Surinam',''),(210,'Svalbard y Jan Mayen',''),(211,'Tailandia',''),(212,'Taiw√°n',''),(213,'Tanzania',''),(214,'Tayikist√°n',''),(215,'Territorio Brit√°nico del Oc√©ano √çndico',''),(216,'Territorios Australes Franceses',''),(217,'Timor Oriental',''),(218,'Togo',''),(219,'Tokelau',''),(220,'Tonga',''),(221,'Trinidad y Tobago',''),(222,'T√∫nez',''),(223,'Islas Turcas y Caicos',''),(224,'Turkmenist√°n',''),(225,'Turqu√≠a',''),(226,'Tuvalu',''),(227,'Ucrania',''),(228,'Uganda',''),(229,'Uruguay',''),(230,'Uzbekist√°n',''),(231,'Vanuatu',''),(232,'Venezuela',''),(233,'Vietnam',''),(234,'Islas V√≠rgenes Brit√°nicas',''),(235,'Islas V√≠rgenes de los Estados Unidos',''),(236,'Wallis y Futuna',''),(237,'Yemen',''),(238,'Yibuti',''),(239,'Zambia',''),(240,'Zimbabue','');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `ipPersona` int(30) NOT NULL,
  `permisoFechaSolicitud` date NOT NULL,
  `tipoPermiso` int(30) NOT NULL,
  `permisoFechaInicio` date NOT NULL,
  `permisoFechafin` date NOT NULL,
  `tipoPersona` int(30) NOT NULL,
  `permisosMotivo` varchar(250) DEFAULT NULL,
  `permisosEstado` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `permisosSolicitante` int(30) NOT NULL,
  `permisosComentario` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ipPersona`,`permisoFechaSolicitud`,`tipoPermiso`,`permisoFechaInicio`),
  KEY `fk_permisos_2_idx` (`ipPersona`),
  KEY `fk_permisos_1_idx` (`tipoPersona`),
  KEY `fk_permisos_3_idx` (`permisosSolicitante`),
  KEY `fk_permisos_4_idx` (`tipoPermiso`),
  CONSTRAINT `fk_permisos_1` FOREIGN KEY (`ipPersona`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_permisos_2` FOREIGN KEY (`tipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_permisos_3` FOREIGN KEY (`permisosSolicitante`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_permisos_4` FOREIGN KEY (`tipoPermiso`) REFERENCES `tipoPermiso` (`idtipoPermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
REPLACE INTO `permisos` VALUES (1045367084,'2020-02-03',3,'2020-02-03','2020-02-03',4,NULL,'3',1045367084,'0¬ø¬ø1¬ø¬ø¬ø¬ø4'),(1045367085,'2020-02-03',1,'2020-02-03','2020-02-03',4,NULL,'1',1045367085,'1¬ø¬ø0¬ø¬ø¬ø¬ø');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idpersona` int(30) NOT NULL,
  `PersonaNombre` varchar(45) NOT NULL,
  `personaApellido` varchar(45) NOT NULL,
  `personaNacimiento` date DEFAULT NULL,
  `personaDireccion` varchar(250) DEFAULT NULL,
  `personaTelefono` varchar(9) DEFAULT NULL,
  `personaCodigoResidencia` int(4) DEFAULT NULL,
  `personaZonaVivienda` int(1) DEFAULT NULL,
  `personaLugarNac` varchar(100) DEFAULT NULL,
  `personaContrasenya` varchar(60) DEFAULT NULL,
  `personaOCupacion` varchar(50) DEFAULT NULL,
  `tipoPersona` int(30) DEFAULT NULL,
  `personaActivo` bit(1) NOT NULL DEFAULT b'0',
  `personaNit` varchar(20) DEFAULT NULL,
  `personaSexo` bit(1) DEFAULT b'0',
  `personaEstadoFamiliar` int(1) DEFAULT NULL,
  `personaNacionalidad` varchar(45) DEFAULT NULL,
  `personaEmail` varchar(45) DEFAULT NULL,
  `personaDiscapacidades` varchar(250) DEFAULT NULL,
  `personaComentarios` varchar(250) DEFAULT NULL COMMENT 'Detalle de la informaci√≥n relevante de todo el recurso humano de la instituci√≥n.',
  PRIMARY KEY (`idpersona`),
  KEY `fk_persona_1_idx` (`tipoPersona`),
  CONSTRAINT `fk_persona_1` FOREIGN KEY (`tipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
REPLACE INTO `persona` VALUES (16018,'Francisco Antonio','Regalado Cruz','1999-01-16','Texistepeque Santa ana','7000-0001',0,1,'02#13','8d2a5f7d4afa5d0530789d3066945330','Estudiante',8,'','','\0',0,'Salvadore√±a','yopooopo@gmail.com','',''),(16019,'Rigoberto Alexander','C√°rcamo Murga','1998-08-13','santa ana texistepeque','',0,2,'02#13','5218f316b3f85b751c613a06aa18010d','',8,'','','\0',0,'Salvadore√±a','','',''),(16020,'Andrea Johana','Pleitez Alc√°ntara','2000-09-23','santa ana metap√°n','',0,2,'02#07','ac2a728f9f17b5d860b6dabd80a5162f','Estudiante',8,'','','',0,'Salvadore√±a','','',''),(16021,'ANA','GONZALEZ','1992-01-15','texis','7776-7767',0,1,'05#05','b075703bbe07a50ddcccfaac424bb6d9','',8,'','1246-545645-456-4','',0,'Salvadore√±a','gasd','NO',''),(1045367070,'Jorge Agust√≠n','Pereira cruz','1988-12-04','6666666666666666','7888-8888',0,0,'01#01','ab8a338aa2b1da6d97c11ba6e67be768','',9,'','','\0',0,'Salvadore√±a','666666666666666','',''),(1045367071,'Sandra Andaya','Cruz Fuentes',NULL,NULL,'4564-5656',NULL,NULL,NULL,'cd9187113425eae93d8116205d03bdde',NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1045367072,'Ana Lidia','C√°rcamo Flores','1975-07-15','texistepeque santa ana','6666-6666',0,1,'02#13','7845e7b45be70d2391a2b16c2ffb68e3','',9,'','','',1,'Salvadore√±a','','',''),(1045367073,'Guillermo Aldolfo','Delsas Murcia','1991-01-17',NULL,NULL,0,NULL,NULL,'02951a6cb9595ef475fed783e59c687e','Ingeniero de Sistemas Inform√°ticos',1,'','0213-170191-102-9','',NULL,'Salvadore√±a','guillermox020@gmail.com',NULL,NULL),(1045367074,'Ad√°n Rigoberto','Flores Cols√≠',NULL,'','4555-5555',0,0,' # ','630abdfb00098f16ba48450363d8d64d','',11,'\0',NULL,'',0,'Salvadore√±a',NULL,'',''),(1045367075,'Pablo Jos√©','Mart√≠nez C√≥rdova','1985-11-22','santa ana texistepeque','9999-9999',0,0,'02#13','13f93ad73a8401c8735cc30fd70c7698','',9,'','','\0',0,'Salvadore√±a','','',''),(1045367076,'Juan Sigfredo','Arriola Sagastume',NULL,'','6444-4444',0,0,' # ','ea519761c0e00b5ae877cbfce9ce697a','',11,'\0',NULL,'',0,'Salvadore√±a',NULL,'',''),(1045367077,'Venancia Mar√≠a','Rosales Mata',NULL,'','7856-4666',0,0,' # ','2161b146f79c6a1b733b60a8e0ef7175','',10,'\0',NULL,'',0,'Salvadore√±a',NULL,'',''),(1045367078,'ALGO','KJL','2020-01-09','AASDF','7676-7676',0,0,'06#03','b5f3b2cc02b99130ed22362b7af8f69f','',9,'','7989-898987-987-9','\0',1,'Salvadore√±a','ADSFADS','',''),(1045367080,'Mar√≠a Carmen','Pe√±a C√°rcamo','1990-06-20','santa ana santa ana santa ana','9999-9999',0,1,'02#10','6e80cf219e79bc8a8d83ce9a5b757f64','Licenciada en administraci√≥n de Empresas',6,'','9999-999999-999-9','',0,'Salvadore√±a','99999999999@gmail.com','',''),(1045367081,'Hugo Daniel','Flores Diaz','1989-08-12','ahuachapan ahuachapan','8888-8888',0,1,'01#01','ad9f88eb26394a8ad9f46975cf79a133','Abogado',5,'','8888-888888-888-8','\0',0,'Salvadore√±a','888888888@gmail.com','',''),(1045367082,'Jos√© Antonio','Murcia P√©rez','1979-07-15','sonsonate sonsonate','7777-7777',0,1,'03#01','5f04b909d4b1bca2e6e57dbbf7208c51','profesor',7,'','7777-777777-777-7','\0',1,'Salvadore√±a','77777777@gmail.com','',''),(1045367083,'Laura Mar√≠a','L√≥pez Su√±iga','1960-04-15','santa ana el porvenir','5555-5555',0,1,'02#05','a6ba5f99ff9616298b2212c76ea111dc','profesora',2,'','6666-666666-666-6','',1,'Salvadore√±a','555555555@gmail.com','',''),(1045367084,'Mar√≠a Pilar','Dolores ALvarado','1956-01-13','santa ana texistepeque','4444-4444',213,1,'02#13','0c979466ac54e4b96f3f5c832e126941','profesora en matem√°ticas',4,'','4444-444444-444-4','',1,'Salvadore√±a','444444444@gmail.com','',''),(1045367085,'Francisco Javier','Maga√±a Arriola','1988-05-25','santa ana coatepeque','3333-3333',206,0,'02#03','ff0c210fd0f86b21bc0497faef184c7b','profesor',4,'','3333-333333-333-3','\0',0,'Salvadore√±a','333333333@gmail.com','',''),(1045367086,'Juan Manuel','Bartanes Pilar','1990-11-15','cuscatlan monte san juan','2222-2222',780,1,'05#05','f59bc51b847690dce791fce5f7179e04','Administrador de empresas',4,'','2222-222222-222-2','\0',1,'Salvadore√±a','222222222@gmail.com','',''),(1045367087,'Mar√≠a Dolores','Pineda Mata','1983-07-15','santa ana metap√°n','1111-1111',210,1,'02#07','ee17cb731e48303aafe44cfe78c25853','profesora',4,'','1111-111111-111-1','',1,'Salvadore√±a','111111111@gmail.com','',''),(1045367088,'Laura Isabel','Pneda Rosell','1981-05-10','santa ana santa ana','0000-0000',0,1,'02#10','c95b8be4befbee1a550a06fd19ed251a','Psic√≥loga',14,'','0000-000000-000-0','',1,'Salvadore√±a','00000000@gmail.com','',''),(1045367089,'√Ålvaro Mateo','Cienfuegos Altamirano','1970-12-12','santa ana Texistepeque','4444-4444',0,0,'02#13','d5367241b0f4893393b6bc984029e999','Jornalero',15,'','4444-444444-444-4','\0',1,'Salvadore√±a','444444444@gmail.com','',''),(1045367090,'Pablo Alejandro','Mart√≠nez Santos','1960-03-01','sonsonate acajutla','9999-8888',0,0,'03#01','8912074c9b782911ff4f5585c747c132','T√©cnico en reparaci√≥n de computadoras',12,'','9999-999888-888-8','\0',1,'Salvadore√±a','999988888@gmail.com','',''),(1045367091,'Alba Luc√≠a','Aybara Campos','1988-12-30','cuscatl√°n cuscatl√°n','8888-8999',0,1,'05#02','f0ee269fcf3f4b1f8883aab03e6a7919','Secretaria',13,'','8888-888888-999-9','',1,'Salvadore√±a','888888899999999@gmail.com','',''),(1878979878,'ASD','RRR',NULL,'','6565-6556',0,0,' # ','8f6f215a557810bac37011f69ba876bf','',10,'\0',NULL,'',0,'Salvadore√±a',NULL,'','');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personasReserva`
--

DROP TABLE IF EXISTS `personasReserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personasReserva` (
  `idReserva` int(30) NOT NULL,
  `idpersona` int(30) NOT NULL,
  `personasReservaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idReserva`,`idpersona`),
  KEY `fk_personasReserva_1_idx` (`idpersona`),
  CONSTRAINT `fk_personasReserva_1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_personasReserva_2` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idreserva`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personasReserva`
--

LOCK TABLES `personasReserva` WRITE;
/*!40000 ALTER TABLE `personasReserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `personasReserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectoPedagogico`
--

DROP TABLE IF EXISTS `proyectoPedagogico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectoPedagogico` (
  `idproyectoPedagogico` int(30) NOT NULL AUTO_INCREMENT,
  `nombreProyecto` varchar(100) NOT NULL,
  `beneficiarios` varchar(300) DEFAULT NULL,
  `duracion` varchar(30) DEFAULT NULL,
  `diagnostico` text,
  `objetivoGeneral` varchar(100) NOT NULL,
  `objetivoEspecifico` varchar(100) DEFAULT NULL,
  `justificacion` text,
  `metodologia` text NOT NULL,
  `actividades` text NOT NULL,
  `recursoHumano` varchar(300) DEFAULT NULL,
  `recursoMaterial` varchar(300) DEFAULT NULL,
  `recursoFinanciero` varchar(300) DEFAULT NULL,
  `seguimiento` text,
  `productoEsperado` text,
  `proyectoPedagogicoComentario` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idproyectoPedagogico`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectoPedagogico`
--

LOCK TABLES `proyectoPedagogico` WRITE;
/*!40000 ALTER TABLE `proyectoPedagogico` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyectoPedagogico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso` (
  `idrecurso` int(30) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria` int(30) DEFAULT NULL,
  `idTipoRecurso` int(30) NOT NULL,
  `tipoCargo` int(30) NOT NULL,
  `pais` int(30) DEFAULT NULL,
  `activo` bit(1) DEFAULT NULL,
  `valorUnitario` float DEFAULT NULL,
  `estadoFisico` enum('R','B') NOT NULL,
  `tipoValor` enum('REAL','ESTIMADO') NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `recursoComentarios` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idrecurso`),
  KEY `fk_recurso_1_idx` (`idTipoRecurso`),
  KEY `fk_recurso_3_idx` (`pais`),
  KEY `fk_recurso_4_idx` (`categoria`),
  KEY `fk_recurso_2_idx` (`tipoCargo`),
  CONSTRAINT `fk_recurso_1` FOREIGN KEY (`idTipoRecurso`) REFERENCES `tipoRecurso` (`idtipoRecurso`) ON UPDATE CASCADE,
  CONSTRAINT `fk_recurso_2` FOREIGN KEY (`tipoCargo`) REFERENCES `tipoCargo` (`idtipoCargo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_recurso_3` FOREIGN KEY (`pais`) REFERENCES `pais` (`idpais`) ON UPDATE CASCADE,
  CONSTRAINT `fk_recurso_4` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`idcategoria`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
REPLACE INTO `recurso` VALUES (1,'10 pasos para una mejor calidad de vida',100,3,1,68,'',10,'B','REAL','1',NULL),(2,'Ca√±on multimedia',NULL,1,1,NULL,'',325,'B','ESTIMADO','',NULL),(6,'Microscopio',NULL,2,3,NULL,'',356,'B','ESTIMADO','',NULL),(98,'No me agarran viva',900,3,1,68,'',3,'B','REAL','10',NULL),(766,'HOLALIBRO',0,3,1,2,'\0',67.8,'B','REAL','1234',NULL),(1140,'Luciernagas en El Mozote',800,3,1,68,'',12.85,'B','REAL','11',NULL),(1890,'El Arte de amargarse la vida',100,3,1,68,'',20.9,'B','REAL','1',NULL),(7663,'El libro de la selva',700,3,3,73,'',19.99,'B','REAL','2',NULL);
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `idreserva` int(30) NOT NULL AUTO_INCREMENT,
  `reservaFecha` datetime NOT NULL,
  `reservaEntrega` datetime NOT NULL,
  `reservaDevolucion` datetime NOT NULL,
  `tipoRecurso` int(30) NOT NULL,
  `tipoReserva` int(30) NOT NULL,
  `TipoProyecto` int(30) DEFAULT NULL,
  `reservaEstado` enum('S','E','D','R','C','A') NOT NULL,
  `reservaDevuelto` datetime DEFAULT NULL,
  `docente` int(30) DEFAULT NULL,
  `maeria` int(30) DEFAULT NULL,
  `tema` varchar(45) DEFAULT NULL,
  `objetivoTema` varchar(300) DEFAULT NULL,
  `observacionEntrega` varchar(250) DEFAULT NULL,
  `observacionDevolucion` varchar(250) DEFAULT NULL,
  `entregante` int(30) DEFAULT NULL,
  `recibe` int(30) DEFAULT NULL,
  `reservaComentario` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idreserva`),
  KEY `fk_reserva_1_idx` (`tipoReserva`),
  KEY `fk_reserva_2_idx` (`docente`),
  KEY `fk_reserva_3_idx` (`maeria`),
  KEY `fk_reserva_4_idx` (`TipoProyecto`),
  KEY `fk_reserva_5_idx` (`entregante`),
  KEY `fk_reserva_6_idx` (`recibe`),
  KEY `fk_reserva_7_idx` (`tipoRecurso`),
  CONSTRAINT `fk_reserva_1` FOREIGN KEY (`tipoReserva`) REFERENCES `tipoReserva` (`idtipoReserva`) ON UPDATE CASCADE,
  CONSTRAINT `fk_reserva_2` FOREIGN KEY (`docente`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_reserva_3` FOREIGN KEY (`maeria`) REFERENCES `materia` (`idmateria`) ON UPDATE CASCADE,
  CONSTRAINT `fk_reserva_4` FOREIGN KEY (`TipoProyecto`) REFERENCES `tipoProyecto` (`idtipoProyecto`) ON UPDATE CASCADE,
  CONSTRAINT `fk_reserva_5` FOREIGN KEY (`entregante`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_reserva_6` FOREIGN KEY (`recibe`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_reserva_7` FOREIGN KEY (`tipoRecurso`) REFERENCES `tipoRecurso` (`idtipoRecurso`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservaDetalle`
--

DROP TABLE IF EXISTS `reservaDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservaDetalle` (
  `idRecurso` int(30) NOT NULL,
  `ejemplarCorrelativo` int(30) NOT NULL,
  `reservaDetalleComentario` varchar(145) DEFAULT NULL,
  `idReserva` int(30) NOT NULL,
  PRIMARY KEY (`idRecurso`,`ejemplarCorrelativo`,`idReserva`),
  KEY `fk_reservaDetalle_2_idx` (`idRecurso`,`ejemplarCorrelativo`),
  KEY `fk_reservaDetalle_1_idx` (`idReserva`),
  CONSTRAINT `fk_reservaDetalle_1` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idreserva`) ON UPDATE CASCADE,
  CONSTRAINT `fk_reservaDetalle_2` FOREIGN KEY (`idRecurso`, `ejemplarCorrelativo`) REFERENCES `ejemplar` (`idRecurso`, `ejemplarCorrelativo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaDetalle`
--

LOCK TABLES `reservaDetalle` WRITE;
/*!40000 ALTER TABLE `reservaDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservaDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservaXpedagogia`
--

DROP TABLE IF EXISTS `reservaXpedagogia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservaXpedagogia` (
  `idProyectoPedagogico` int(30) NOT NULL,
  `idReserva` int(30) NOT NULL,
  `reservaXpedagogiaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idProyectoPedagogico`,`idReserva`),
  KEY `fk_reservaXpedagogia_2_idx` (`idReserva`),
  CONSTRAINT `fk_reservaXpedagogia_1` FOREIGN KEY (`idProyectoPedagogico`) REFERENCES `proyectoPedagogico` (`idproyectoPedagogico`) ON UPDATE CASCADE,
  CONSTRAINT `fk_reservaXpedagogia_2` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idreserva`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaXpedagogia`
--

LOCK TABLES `reservaXpedagogia` WRITE;
/*!40000 ALTER TABLE `reservaXpedagogia` DISABLE KEYS */;
REPLACE INTO `reservaXpedagogia` VALUES (1,6,''),(1,7,'');
/*!40000 ALTER TABLE `reservaXpedagogia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudReserva`
--

DROP TABLE IF EXISTS `solicitudReserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudReserva` (
  `idRecurso` int(30) NOT NULL,
  `idReserva` int(30) NOT NULL,
  `solicitudReservaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idRecurso`,`idReserva`),
  KEY `fk_solicitudReserva_2_idx` (`idRecurso`),
  KEY `fk_solicitudReserva_1_idx` (`idReserva`),
  CONSTRAINT `fk_solicitudReserva_1` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idreserva`) ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitudReserva_2` FOREIGN KEY (`idRecurso`) REFERENCES `recurso` (`idrecurso`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudReserva`
--

LOCK TABLES `solicitudReserva` WRITE;
/*!40000 ALTER TABLE `solicitudReserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudReserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tema` (
  `idPersona` int(30) NOT NULL,
  `temaNombre` varchar(140) NOT NULL,
  `temaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  CONSTRAINT `fk_tema_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
REPLACE INTO `tema` VALUES (1045367073,'le-frog','');
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoCargo`
--

DROP TABLE IF EXISTS `tipoCargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoCargo` (
  `idtipoCargo` int(30) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipoCargoComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idtipoCargo`),
  UNIQUE KEY `idtipoCargo_UNIQUE` (`idtipoCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoCargo`
--

LOCK TABLES `tipoCargo` WRITE;
/*!40000 ALTER TABLE `tipoCargo` DISABLE KEYS */;
REPLACE INTO `tipoCargo` VALUES (1,'Fondos Propios',NULL),(2,'Actividades de la instituci√≥n',NULL),(3,'Donaci√≥n',NULL);
/*!40000 ALTER TABLE `tipoCargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoEspecialidades`
--

DROP TABLE IF EXISTS `tipoEspecialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoEspecialidades` (
  `idtipoEspecialidades` int(30) NOT NULL AUTO_INCREMENT,
  `tipoEspecialidadesNombre` varchar(70) NOT NULL,
  `tipoEspecialidadesComentario` varchar(145) DEFAULT '',
  PRIMARY KEY (`idtipoEspecialidades`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoEspecialidades`
--

LOCK TABLES `tipoEspecialidades` WRITE;
/*!40000 ALTER TABLE `tipoEspecialidades` DISABLE KEYS */;
REPLACE INTO `tipoEspecialidades` VALUES (1,'Matem√°ticas',''),(2,'Ciencias Naturales',''),(3,'Educaci√≥n F√≠sica',''),(4,'Ciencias de la Educaci√≥n',''),(5,'Lenguaje',''),(6,'Ciencias Sociales',''),(7,'Administraci√≥n y Ciencias Comerciales',''),(8,'Ingl√©s',''),(9,'Inform√°tica','');
/*!40000 ALTER TABLE `tipoEspecialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoMateria`
--

DROP TABLE IF EXISTS `tipoMateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoMateria` (
  `idtipoMateria` int(30) NOT NULL AUTO_INCREMENT,
  `tipoMateriaNombre` varchar(50) NOT NULL COMMENT 'Listado de los tipos de materias que se imparten en la instituci√≥n.',
  `tipoMateriaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idtipoMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoMateria`
--

LOCK TABLES `tipoMateria` WRITE;
/*!40000 ALTER TABLE `tipoMateria` DISABLE KEYS */;
REPLACE INTO `tipoMateria` VALUES (1,'√Årea B√°sica',NULL),(2,'√Årea Aplicada',NULL),(3,'√Årea T√©cnica',NULL),(4,'Modalidad y Opciones',NULL);
/*!40000 ALTER TABLE `tipoMateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoNombramiento`
--

DROP TABLE IF EXISTS `tipoNombramiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoNombramiento` (
  `idtipoNombramiento` int(30) NOT NULL AUTO_INCREMENT,
  `tipoNombramientoNombre` varchar(60) NOT NULL COMMENT 'Listado de las formas en las que se uede nombrar el cargo de un docente dentro de la instituci√≥n.',
  `tipoNombramientoCoemntario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idtipoNombramiento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoNombramiento`
--

LOCK TABLES `tipoNombramiento` WRITE;
/*!40000 ALTER TABLE `tipoNombramiento` DISABLE KEYS */;
REPLACE INTO `tipoNombramiento` VALUES (1,'Propietario',NULL),(2,'Interino',NULL),(3,'Suplente',NULL);
/*!40000 ALTER TABLE `tipoNombramiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoPermiso`
--

DROP TABLE IF EXISTS `tipoPermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoPermiso` (
  `idtipoPermiso` int(30) NOT NULL AUTO_INCREMENT,
  `tipoPermisoNombre` varchar(45) NOT NULL,
  `tipoPermisoDiasMes` int(2) NOT NULL,
  `tipoPermisoComentarios` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idtipoPermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoPermiso`
--

LOCK TABLES `tipoPermiso` WRITE;
/*!40000 ALTER TABLE `tipoPermiso` DISABLE KEYS */;
REPLACE INTO `tipoPermiso` VALUES (1,'Enfermedad',8,NULL),(2,'Materindad',0,NULL),(3,'Paternidad',0,NULL),(4,'Faltar a clases',0,NULL),(5,'Salir temporalmente de la instituci√≥n',0,NULL),(6,'Retirarse de la instituci√≥n',0,NULL),(7,'No portar uniforme',5,NULL);
/*!40000 ALTER TABLE `tipoPermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoPersona`
--

DROP TABLE IF EXISTS `tipoPersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoPersona` (
  `idtipoPersona` int(30) NOT NULL AUTO_INCREMENT,
  `tipoPersonaNombre` varchar(45) NOT NULL,
  `tipoPersonaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idtipoPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoPersona`
--

LOCK TABLES `tipoPersona` WRITE;
/*!40000 ALTER TABLE `tipoPersona` DISABLE KEYS */;
REPLACE INTO `tipoPersona` VALUES (1,'Administrador','fa fa-diamond'),(2,'Director','pi pi-circle-on'),(3,'Subdirector','pi pi-circle-off'),(4,'Maestro','fa fa-street-view'),(5,'Bibliotecario','fa fa-forumbee'),(6,'Administrador CRA','fa fa-transgender-alt'),(7,'Laboratorista','fa fa-android'),(8,'Estudiante','fa fa-child'),(9,'Representante','fa fa-user-secret'),(10,'Madre de familia',''),(11,'Padre de familia',''),(12,'Colector','fa fa-cc-mastercard'),(13,'Secretaria','fa fa-database'),(14,'Psicologo',''),(15,'Ordenanza','');
/*!40000 ALTER TABLE `tipoPersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoProyecto`
--

DROP TABLE IF EXISTS `tipoProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoProyecto` (
  `idtipoProyecto` int(30) NOT NULL AUTO_INCREMENT,
  `tipoProyectoNombre` varchar(45) NOT NULL,
  `tipoProyectoComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idtipoProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoProyecto`
--

LOCK TABLES `tipoProyecto` WRITE;
/*!40000 ALTER TABLE `tipoProyecto` DISABLE KEYS */;
REPLACE INTO `tipoProyecto` VALUES (1,'Proyecto Planificado',''),(2,'Exposici√≥n De Alumnos',''),(3,'Clase De Docente Con Tecnolog√≠a','');
/*!40000 ALTER TABLE `tipoProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoRecurso`
--

DROP TABLE IF EXISTS `tipoRecurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoRecurso` (
  `idtipoRecurso` int(30) NOT NULL AUTO_INCREMENT,
  `tipoRecursoNombre` varchar(50) NOT NULL,
  `tipoRecursoComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idtipoRecurso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoRecurso`
--

LOCK TABLES `tipoRecurso` WRITE;
/*!40000 ALTER TABLE `tipoRecurso` DISABLE KEYS */;
REPLACE INTO `tipoRecurso` VALUES (1,'Tecnol√≥gico CRA',NULL),(2,'Laboratorio de Ciencias Naturales',NULL),(3,'Bibliogr√°fico',NULL);
/*!40000 ALTER TABLE `tipoRecurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoReserva`
--

DROP TABLE IF EXISTS `tipoReserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoReserva` (
  `idtipoReserva` int(30) NOT NULL AUTO_INCREMENT,
  `tipoReservaNombre` varchar(30) NOT NULL,
  `tipoReservaComentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtipoReserva`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoReserva`
--

LOCK TABLES `tipoReserva` WRITE;
/*!40000 ALTER TABLE `tipoReserva` DISABLE KEYS */;
REPLACE INTO `tipoReserva` VALUES (1,'Uso en sala',NULL),(2,'Uso dentro de la instituci√≥n',NULL),(3,'Uso en aula',NULL),(4,'Uso fuera de la instituci√≥n',NULL);
/*!40000 ALTER TABLE `tipoReserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoReservaRecurso`
--

DROP TABLE IF EXISTS `tipoReservaRecurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoReservaRecurso` (
  `tipoReserva` int(30) NOT NULL,
  `tipoRecurso` int(30) NOT NULL,
  `tipoReservaRecursoComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`tipoReserva`,`tipoRecurso`),
  KEY `fk_tipoReservaRecurso_2_idx` (`tipoRecurso`),
  CONSTRAINT `fk_tipoReservaRecurso_1` FOREIGN KEY (`tipoReserva`) REFERENCES `tipoReserva` (`idtipoReserva`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tipoReservaRecurso_2` FOREIGN KEY (`tipoRecurso`) REFERENCES `recurso` (`idrecurso`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoReservaRecurso`
--

LOCK TABLES `tipoReservaRecurso` WRITE;
/*!40000 ALTER TABLE `tipoReservaRecurso` DISABLE KEYS */;
REPLACE INTO `tipoReservaRecurso` VALUES (1,1,''),(1,2,''),(1,6,''),(1,98,''),(1,766,''),(1,1140,''),(1,1890,''),(1,7663,''),(2,98,''),(2,766,''),(2,1140,''),(2,1890,''),(3,2,''),(3,98,''),(3,766,''),(3,1140,''),(3,1890,''),(4,98,''),(4,766,''),(4,1140,''),(4,1890,'');
/*!40000 ALTER TABLE `tipoReservaRecurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoSueldos`
--

DROP TABLE IF EXISTS `tipoSueldos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoSueldos` (
  `idtipoSueldo` int(30) NOT NULL AUTO_INCREMENT,
  `tipoSueldoNombre` varchar(50) NOT NULL,
  `tipoSueldosComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idtipoSueldo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoSueldos`
--

LOCK TABLES `tipoSueldos` WRITE;
/*!40000 ALTER TABLE `tipoSueldos` DISABLE KEYS */;
REPLACE INTO `tipoSueldos` VALUES (1,'Sueldo Base',''),(2,'Horas Clase',''),(3,'Ad Honorem','');
/*!40000 ALTER TABLE `tipoSueldos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopersonaPermiso`
--

DROP TABLE IF EXISTS `tipopersonaPermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopersonaPermiso` (
  `idtipopersona` int(30) NOT NULL,
  `idtipoPermiso` int(30) NOT NULL,
  `tipopersonaPermisoComentario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipopersona`,`idtipoPermiso`),
  KEY `fk_tipopersonaPermiso_2_idx` (`idtipoPermiso`),
  CONSTRAINT `fk_tipopersonaPermiso_1` FOREIGN KEY (`idtipopersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tipopersonaPermiso_2` FOREIGN KEY (`idtipoPermiso`) REFERENCES `tipoPermiso` (`idtipoPermiso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopersonaPermiso`
--

LOCK TABLES `tipopersonaPermiso` WRITE;
/*!40000 ALTER TABLE `tipopersonaPermiso` DISABLE KEYS */;
REPLACE INTO `tipopersonaPermiso` VALUES (1,1,''),(1,2,''),(1,3,''),(2,1,''),(2,2,''),(2,3,''),(3,1,''),(3,2,''),(3,3,''),(4,1,''),(4,2,''),(4,3,''),(5,1,''),(5,2,''),(5,3,''),(6,1,''),(6,2,''),(6,3,''),(7,1,''),(7,2,''),(7,3,''),(8,4,''),(8,5,''),(8,6,''),(8,7,''),(9,4,''),(9,5,''),(9,6,''),(9,7,''),(12,1,''),(12,2,''),(12,3,''),(13,1,''),(13,2,''),(13,3,''),(14,1,''),(14,2,''),(14,3,''),(15,1,''),(15,2,''),(15,3,'');
/*!40000 ALTER TABLE `tipopersonaPermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zona` (
  `idzona` int(30) NOT NULL AUTO_INCREMENT COMMENT 'La Identificaci√≥n de la zona geogr√°fica (1¬∞, 2¬∞ y 3¬∞) en la que est√° dividido el instituto.',
  `zonaNombre` varchar(45) NOT NULL,
  `zonaCoementario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idzona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
REPLACE INTO `zona` VALUES (1,'Zona 1',NULL),(2,'Zona 2',NULL),(3,'Zona 3',NULL),(4,'zona 4',NULL);
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'intex'
--

--
-- Dumping routines for database 'intex'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-03 22:31:24
