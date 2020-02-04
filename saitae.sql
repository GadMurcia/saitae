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
REPLACE INTO `acceso` VALUES (9,'Administración',NULL,'#','fa fa-cog'),(10,'Sistema',9,'tipopp.intex','pi pi-folder-open'),(11,'Permisos y Licencias',9,'lictp.intex','pi pi-th-large'),(12,'Académica',9,'academico.intex','fa fa-leaf'),(13,'Perfil',NULL,'#','pi pi-user'),(14,'Permisos',45,'#','pi pi-eye'),(15,'Solicitar Permiso',14,'permisoE.intex','pi pi-briefcase'),(16,'Personal',NULL,'#','pi pi-users'),(17,'Gestión de maestros',27,'agregacion.intex','pi pi-user-plus'),(18,'Gestión de administradores',16,'agAdm.intex','pi pi-plus'),(19,'Plantel Institucional',35,'plantel.intex','pi pi-table'),(20,'Inventario',23,'inventario.intex','fa fa-barcode'),(21,'Libros',23,'libros.intex','fa fa-book'),(22,'Nuevo Ingreso',36,'inscripcion.intex','pi pi-user'),(23,'Recursos',9,'#','fa fa-yelp'),(24,'Nomina de Alumnos',36,'nominaA.intex','pi pi-user'),(25,'Gestión de Recursos',23,'admRecurso.intex','fa fa-table'),(26,'Lista de Representantes',35,'listaRepresentantes.intex','pi pi-list'),(27,'Maestros',16,'#','fa fa-puzzle-piece'),(28,'Gestión de horarios',27,'horario.intex','pi pi-plus'),(29,'Gestión de permisos',14,'permiso.intex','fa fa-legal'),(30,'Solicitud de permisos',14,'permisoM.intex','fa fa-ge'),(31,'Administrador de anuncios',9,'anuncios.intex','fa fa-bell'),(32,'Matricula',36,'matricula.intex','fa fa-slideshare'),(33,'Entrega de Útiles',36,'paquetes.intex','fa fa-sliders'),(34,'Contribuciones',36,'contribuciones.intex','fa fa-money'),(35,'Listados',16,'#','fa fa-list-ul'),(36,'Alumnos',16,'#','fa fa-graduation-cap'),(37,'Reservas de Equipo',45,'#','fa fa-gamepad'),(38,'Solicitud de Reserva',37,'solicitudR.intex','fa fa-flag'),(39,'Historial de Reservas',43,'solicitudH.intex','fa fa-archive'),(40,'Gestionar Reservas de equipo',37,'srCra.intex','fa fa-certificate'),(41,'Historial de Notificaciones',43,'notifh.intex','fa fa-forumbee'),(42,'Proyecto Planificado',37,'solicitudRPP.intex','pi pi-pencil'),(43,'Historiales',13,'#','fa fa-folder-open'),(44,'Historial de permisos',43,'permisoH.intex','fa fa-database'),(45,'Solicitudes',NULL,'#','fa fa-street-view'),(46,'Área psicológica',45,'#','fa fa-ambulance'),(47,'Solicitud de cita psicológica',46,'solicitudCP.intex','pi pi-bookmark'),(48,'Adminitración citas pscológica',46,'admCitasPs.intex','pi pi-calendar'),(49,'Consulta Psicológica',46,'consultasPS.intex','pi pi-window-maximize'),(50,'Historial citas Psicológicas',43,'citasPSH.intex','fa fa-file'),(51,'Horario de clases',13,'horarioCl.intex','fa fa-calendar'),(52,'Aspecto de la aplicación',13,'temas.intex','fa fa-picture-o'),(53,'Mi usuario',13,'infoPerfil.intex','fa fa-android');
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
REPLACE INTO `anuncio` VALUES (1,'Inicio de clases','2020-01-31','las clases inicial el 20/01/2020. con uniforme desde las 08:30 am.',1045367073,NULL,NULL),(2,'CANCELACIÓN DE ENSAYO','2020-01-30','HOLA',1045367083,8,'Desabilitado por: Laura María López Suñiga'),(3,'Lorem ipsum dolor sit amet','2020-03-10','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1045367083,NULL,'Modificado por: Guillermo Aldolfo Delsas Murcia'),(4,'no hay clases','2020-02-08','el sábado XD XD :V',1045367084,NULL,NULL);
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
REPLACE INTO `autor` VALUES (1,'Rusou 1',''),(2,'loosss','8'),(3,'Delsas',''),(4,'Lic. Julio Zelada',''),(5,'Museo de la palabra y la image',''),(6,'Rudyard Kipling',''),(7,'Gabriel Alegría',''),(8,'D.J. Flakoll',''),(9,'Paul Watzlawick','');
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
  `capacitacionComentario` varchar(145) DEFAULT NULL COMMENT 'Histórico de las capacitaciones que cada maestro de la institución ha hecho.',
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
  `cargoNombre` varchar(50) NOT NULL COMMENT 'Lista de los cargos que el personal docente puede desempeñar.',
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
REPLACE INTO `cargo` VALUES (1,'Director',2,''),(2,'Subdirector',3,''),(3,'Coordinador de área bibliográfica',5,''),(4,'Coordinador de área Informática',6,''),(5,'Psicólogo',14,''),(6,'Coordinador de laboratorio de CC.NN',7,NULL);
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
REPLACE INTO `categoria` VALUES (0,'Generalidades s',NULL),(100,'Filosofías y Disciplinas afines',NULL),(300,'Ciencias Sociales',''),(400,'Leguas',''),(500,'Ciencias Puras',''),(600,'Ciencias Aplicadas',''),(700,'Bellas Artes',''),(800,' Literatura',''),(900,'Geografia e Historia','');
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
  `extención` varchar(100) NOT NULL,
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
REPLACE INTO `constancias` VALUES (1045367085,'2020-02-03',1,'2020-02-03','����\0JFIF\0\0H\0H\0\0��\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(��\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0XR\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\Z\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0�f��	�DY�]Z6����5x�����yF]��A΢R�*J��JƏ>�m<9;E ��vjS�\n!�P6�]�C@�(�2vN�E2J2ۙ�	<:��������Fw�c\\��y���ɧ�ݬ�=K��f���ћ�R�\n��\\�:��r��\ZkL�UN�\Zm5�i=��j�̜\'Y��y�r����Ԗx�Y��\r�Oc�I�PD�5h��$��Ӧ��T��m�yɝp�I���zz4B\'�6RuPi�h\r8��e%S��^e�)�y>�yK���3�<���U�\'^\ZG2M1u�׳&�\n��U�����\"Ě:g m�ON�M0]��6j\\�!\'ZC�:qi�U�q�\n��_Y�����W\"�h�����i�a��l��L��YyJ:gц�N+q��W���Jͧ��\Z9�X�A�A\'���sq��	ġW=y�CJ���_F�������[�8٬�P����M�ud13X��5#Br�:�42�[$����mW�;V*��+W��8�Ų�U�\"ƀ�\0��d\0׳YP�S{]�%�y}�D\\ۃ���<��a�^��@��0�,�jqu̷�4�8f��[X\ZUdb�����rW$�)�f+�h�6��o�MyW�b��zV���VN��W���gT*�s�ܗ]�덴�z���3ǩ�j #m�eb:�N�!PkYrO^T�H�:��)V�vsV	�E�Z���}�;v�xR�U�q@�m*�k�o�kFו�M�iG��덯�.���V�W��9�M�u�J\r�@Ҽ���^R6�QբkVig� P�f3i��8����+4\0܈�gQϫV����-=n�e�w�مγ�U\n���M)�c�B�av�CC+\\�f.ټ�$V�JΙ����P�!tu��x1nj���W��6��1|�}��ԣ!��J��d��z2Xc�6)SL$!Z��:����Ef渍�B�.��P�\\��a��#\n��V����m�UIX�j�R�l����V+�15��0��N�U5Q�A����:Z8���C�\r=L�Α�ʦ�����͜^�gb���F�9�HS��u^bM�!5`�����7h�k�)�.k�\n�s\n��lä�\'�K��@��˭f��\n�Y�:ٝ/y�^�z.�.M>kg���3E+Um0E�\r�6��]\n�Yc��+�X��O�*<wE�\Z�p�Sx��L�쑄�T)�����U4nQy���~OYѻ��hKyV��ڗ�{y`P��ԍ�Ǝ;�46z�8\Z����9�	V�������3��\Zpj�	�[E�x�T�Su5�5���L��ZOX�65���k:�#w���t4��zY7������n�K�k4vYiOd��l��`���]�4\0��k����w\Z�Z�[b�y�@r��V�[�� ��)!�t�<^�b��Z>^�se�٢J����`�c�=���U��r9泞���b�k��A�]\\�gW����>~�Uk�e;�cIM���M� �x���衛�J5���sf�\\�Wpu���w�د׏F*]\0d�!MFu��eP��P5y�w�8R���\Z�fR����<�H��)2qwq�t�ދ������d|�.j��XA�[K�+��cˏc+X�^ɸ���wZ�;���9�AD(m��ˤe�W\0n�k�-�M�q�W%I&i�5�f�]�9si��@@}�=ah���\0���S�]�%�|�ml͎��.y��\'\'��gB���&h��Q�S*�Ô�qQ�P�-������g2�]�V3A�\\�쎦��ۆPyo�ş��{9���СDz�����,�T����q�y��Q=����fo���JC��i�b\\��B��Lm^f��~�P\nM:H���E��Ϸ�I$��<HOO�y����@4kqu0t�U���ktg���Q�gh��t6�`�u�G,=mN�9�����雙�m<%.��J\rCn�\\��M�D��Id�h��2�Ij@�SX���B?o���}�Kq�{ګi�ܯ:<�[���>�ʺ�cn�,skV�.F��d�\Z��f�p#�&ɕ�A��{�9Ũ<��C�C8�\nQ�$�n��S�<�k�Z��o��<����S��J�\Z����G����p:Eƻp�|U�\nN�0ޑ��n4ݫl9�8�4��)df���bO�,PA��z���I�<�c*�<޽\Z�4�z�4GZT�X ��\\�W��͔il�)��r�!��Ӟ��Vab|�fn��L� \Z�0LwS�2Hx�4�TY�g��Ӥ�w��W��󎇓�z7�r�V�4ʤ�6ǝ�S\\�\Z��4c�����͎�4t�^\"���L�\'���ʌ��gHI&��L�I;1:@�8;;\n�o��S���.������c�9�B�+GH)Ey*Ǽ�տ*�9^�d��qE��XB=L�R�*_���<��������-���\"d�1�@�d��!��6�����nr/�݅|��L�F�:�p�J�^�d6ɻ�p-��\0z���0$�E�\'�EM ���(�)��\'fi�`����@�V���1�H�Cڮ�c]�QJ�9����\Z�5���nx��qIPA44�(Zs�S(d�	;0���L�3����(͎����D^T\'F�\rYw/^����1�b�cb3 Ӌ��$�$�i萛���\'pI�(́;�f�D�(OjoV�^޳��Z�־�Mz�������(<d�-&�ݐR�;�S�Ԉ��;������#\'pe#\0��s\\�v�$�Jp X���Ƴy�Թ��ԕ[5JE�E�v� � � ��\Z	1$�n�L�HQrNX�kj:�hV���ѿ���i5��8�q�h�s=>O�E��2����1Mɘ�)��I�I�k<���&bI�������!jS�kw��9cN�u�����k��G�!me��&��;L��P��4�}~�SY\r�ַ���ً�� ����k{�,�b=t�&@iȲ�����z/#���R6)Z��\"�~g[J��$4�H�j}\r���V�j\'G�-s0�����w�ȭ\rZ\\՞�QvksAO��~�s��e܄�t��H��3=���>ա��t�u����_C�#e]���8a��2�A��>�U�v�:�\\:���i$CT����ɒ,�M@Za(�陃 ;Q&vBIe��_���tx-dtd��ET�=Mv�7!�sߗ�ۺ�{��^aw���Ċb�PjSqɩ<S$��)BBL�%a�2W$�	�1��I�B��7�|�9����-�d���zg��c^Ǘ�cC�\\P����G��J\ZJd�Rg�i���&BI�$�D6 �i%N��$�tE�K������K�8�LN�Ni&mT�ʮ�d�4RbI�M<R�A$�I���B��$���c$���\0.\0\0\0\0! 1\"02#A3@4B$%��\0\0��{q1��,:K\'�=�%0�}��;1��?���c��h�>{���^*�sɚ���k�#w��->�o��\0��X�E��v����{�\0}�K\Z����QL5B�������Q��\0�t�?R\0{����{���U\n=�yR;1�cȧͽǴ�O�ð�����x��I�� {j��C�[h��=�͟���ىI��B�o��\'홴r��m@�+�=�h��\0��lD=�W�}��ޥ6=\n��Sv���e�8��,Q�5-����g���S����Ү�6׻\rƮq�G<W�:��+Mv�������,쟩��:�V�3]���}�5�|�s�CŁضլs{��+3\\����&�%8�{n�����J��o��x����6q�i3fr3��j�����f:p�S]�\Z������U�kII��b���{����ſ��P���a�J�]̹�1�zZ�e��Z�#˩Y��+���X>ɹ��LR�+jnndʟE~;�{�ݺZ���fm�E��9��l�3�Dk�B�4N\">��ۏ-:DŭD\Z��»�@�Ad�?r�1kԩ�����n�\rwg}N��\0`�ZY�ЂzI�*��s�k������DW�a�4޻��`5	��+~k٣M��1�t*���ǈ��ko\\�5�i�WP������7�i�E�a~^��DM�0���\rd-71�ƌjO�ѻtu�|C���JX�t�@�R�ٖ�*ę�B�S�X49y�0	U��w��\ZԴy����\'�톻���#_�c����s����a�7SmgӲ�Z%@�\Z�hl�Ie�CYd�kAH�XH2���k�8a\n����3Ɋ�P�4��}F�X�V��mWVj\n�)R����3���\Z\Z�u�6ɮ�C�?ڣ�O�mSL��S$�>����]|���K��]l]Mv���L�����(���<f,K��@[.M��ŧ��b7\0?c��vu���-ŕ���<��)ص|�F�|J\\��y/�(j�1���?V�U�H�*\nɚ�����c>H�kĿ/2F���3�R����e���\r��fx��+q^��g�\\�R=�G���\"��v�z�%y��Xt���4���dRʶ��܍�8���[��V1�E�u�m�\r���2�d������o�5.���~��M�޿��-D�S}�^@\rC࿕��l�kYZ��k���S]g�`���q�byo�Ug��;r)+��a�[���F>\"����~*>YA�R	�j-\\���3J*����k��@���߸o�sB����S}Ʈ�\0��5�5�-v@�}���s�!�~�����Vnl�e���n{j��U�ه�,p��u,MvtV������\"��3O�t��T��cf����_�ˤ?#Ϳ�}���$v��\\���������C7:��\0�/�u�W+=X�m�H��M�\r���8-�(o�\Zd�1�r4yiTj,2�ݾ�OՎ�])��w(�nv7[����;��7��g��{�Y���T�o���z���S+��)�,s���nA�yg�E�H�ʇ��\0R��f�B��)px��^\0N����{h�fq�Oa��3�ZXY���>�G�Wc7�!�X��v�g���E��\rU��@Ê}Ϗ�\\��:z�P����r=6�]ρ�t���)3�k?]����L�^b�l�I�U�>>7�\\;QS���eN�b���zr�\"bc����K:�^�A� �=�~O�W۩�\ni�Z1�Q�\0�p��=N��[F��r?C� UiH�c�k>E��\0��U/ͩ�j��^>��\0��d�ɕAV���\"m�o�R��+Q��]��r/�i�Rۨ��\'��t�-Xϕ{hv�㾧(nt7�G���J��1�_=Y�WE\0zXuz���=?=.ڂ���P3�6�6@҃�-0�L\'�5�0i���GY�LV���R���2*�},_-Ė�i��)�`���zq�g��f��Ʋױ�Y�ަ5��Fe�!��am��}��1�Z�٘u��N�F)ȴQNVKd1;�qT(o�wK��x�^I�Vu�h��ꂴv	R���^)K���j��~ߎ�PY�UA=[��U�������SJ�֮2����*kZ�8�O���)�N���Y��a��}Ji\r����uݶ(�ʴ���V���{��3�B�ZVR��f�SR�E��Ƽ�c��Ā	��M���E�\\ف�׻\nЙ�F�06-�ڞ��؈������]J��XX���/���*ý���\n���h��z\"D�FI�1l[����m����yB5+m�w4��R�1�(?�����D)�.3=/TΚ�q2�����2��Zi�m�D�喆�9M��\0Xa=���/E���O��V�n2�V�A�k��\'x�MK��1�fF$ṇ��^e�m��q�5�q�&^Y$�}��ь>O`u,�\r5���6��u=��(=@*���iq����St�+a�}J��T	�1mŷ���$i��\0]γ��b�B�׷z���C�㹌>��0���g�fF]�\rMޝ��+����4\n����6Z��o����ZмC�?w�J{9�£�|�9X�E��� ����7nZ��N���=���ѣdhcx8�!�=[�-L��w׎���CW�K�N�5݊�^�ԟ�ö?=�\'�s>{z�4�v�/�����\"gGo�?c�52pE����T�\'PQe����&5̬������nIR_isj��@�S�>\"��Ԧ�]�C+	V�S5�����^�a���z���b�c��c�Ivr��\\����x�\n��X\Z]x�_���;\0�o�`Ew�s	߰O�S�1��DF�>H��<q1O�T���ˉ����ۻ\n�VQF=����7ҬJ�!�*Kz����ks+�[X��q��Z��n�����eh�znT��ra��L��wXG����:���W�K*��oSPmͺȾbP����(\Zk��)J�%��_o�\0�4�A��>��7 C�g�Tu�2�ќ,{	퓏��q��rq�/�v�zC]Y��(���ɚ�6\'!��G��X�dU�i�FeR�je��JmbZ�g]�l�nS��zOԱ=Oo����3g��{j�ss}��[�.I\Zx�l�=;7�\0�K]�7l�E��fq=OM���=>f�8$�\\�WX�H~�`�\0OS���4gH#_����7�Yg3��v,����OY\\>;nnYX�ˇq㗍�0����]ɀl��R��~�ev��s3c܁mQXY�رv9��D�&:�����#\'�џ|��3��@ ��W��+����vCC�^��qP�v�~Rj�T�H5���lە��X���N\n��}6\'6�y�UW)[�E��t�<�55+_�;?������6�`�L����̻���!\'Ԩ^V8�r��Ǣ�\r�w�v������W�b�Ȯɩ�e��*�cGW��g)���pc>�xʳ�����F۰�2�����0�k&�Y��{�>��\"��3,�����[�|A��q͉��1(��SR�^���@k�5��I�\0\\w��K�H����\0$v�ԱbAf.���\Z����\0��W��̼u��,�d��e��]�uh��!�X~>���W-5��f�*��f��IS�\rM����W��\Z2�=Yeċ��d��5�Sz���no�8�$�[k5Y���-}��;�kB����P��7��5�	������\0�;�5�>J��)����N��/����v���Ů�ޫ�Csz���Q�e�:M�d��Q\nL�fJ�<ls��o���:��r��M�&��W32mǩ�,hȲ�/��{22q+�g�������>O��c�������W;:���&r���o���!�=��r����qh³�{D�GY�q�6��0��x_�!�\"O��ݨ�\0���aZ�����&=����}I��>�7-^!Gݨ�\0�{�m@ I��r&N�N�Z:}������7�t��0�bT7�5b\r�w�bx�*��ܧ��k���dێr)[������\nN���0�a^�4DìYs�-q�r�ی�~�S��ծ�O�9ctڨ|��R�s)ȯ�t�r.�6�b}�k�����F��N�t��YC#2�#}�~�r�(_�,���^<ksZ��j0��\r1&nk��M7�*涞��Z��J){���\"\"ΝO�n^O�x���W(��`+55\nJ6�_�x��\0�T��0��.z��[�π`�f��[|,��:FWz�6ͩ�,���s:{,�&a�\\B�p4������P����̇�\r���7\\l�>�_���,�m��o�;��>�nD�ʛԳ &>�̭�.k~��)����Z���Ίw�����7�}t� ��&�p�9W��nnn+E}�{�ݑe��c����9���vE�������J�x�W8���3+ї��=6zU޽=_ѱ�q0����I�g.E���9�����v��)���-�8�=G?�k_p����!ˣ�9=m�G�0WR�����\0�7}��3�{�h�wLF����Ե�>՝&�\0Fγ_:ޯ5���p:J�66\r\"�K�\n�e7�>ƨ��׌���/�Lk87O���oK[�+S����I�OZ���2��o�~k�͡�ȍ�N�v�Sy��`��)�����볷V�ѽ���J�dG\Z?����\0\'\0\0\0\0\0\0\0!1 A0Q\"@aBq��\0?Ζ��t�i�5H��sXecOBS��F\n\n���1��st�4��\"nL�w7���F����$1>I�K^c\'H���1�h8��f�W����7e�_���l[�x��ए�B��H�\"oqz\'�.�be�ǎ�OOj%\"�ħ��/��S�����]��-�l�$�,�r���Hj�V?T%\"�ͬ�>�E\"�H�E#S�dq��EVlc��,�lCGE����87P�\Z.�F�*���$0Փ�C��w��6�.\n��?���x�(����^�������r�>�ʡ<t\"|ē�\"�cs#+#�L��{7�\0\Zcƚ�6]!��pQ�,(�b\"5D��G!�Ap<�(�ȑ\"=b}�G���H�M�(��ٰXe����F^�F� �]\r7������^|,6���q�*��c���F��N���j�k����A)�O��{����^Z�VȪ&�\\tͿd�N1tF~�8�Z���~�����Z�����Y�%#s}�*&�r�97�}���n�	h��/���/�\Z=��9�|S;TA�5\"�2Q�l��\nc��������i�l��v��[�q}��I!�E�����}���&�c4�f�J�WG��IoV�|U�-n/ጶ��&Fyԇ7p�QE�Fӄpʯ�:��F��z�vI��p?Z?R>���U-�6Ze|1��Du��X�w�T��Օ��EХ�Z�c9G�/ɟ�~Jb�G�D��Q+�n�5&vpYӏ_ƾ*����E𯆄���\0G�+�B�,�<�X��B��΅�~�>��6�|+�r?�=����?��^��\0+\0\0\0\0\0\0\0!1 \"0AQ2@Ba#qb��\0?�.X⍲ye�[�zH�oD^�3�<.�\'7r�D~�8�f\\�,�1V�-��=C�X�#D:�굔�U�>g�W�0�J%�i&��,�������G�u�n,��9n�x�҅�Q���~Vz����nL�4���C��ᮄ֕h��/?].��V>x�J�$�+�e�6�������\Z�8���DS_�1��,b,rl���\"Nm����r��lTZ(Fщ萼��ˁE���X�(��B��t&.�����5��)vȭ�J17X��r좸�DE�X��:H]���h��=�=(�6��FGȥ����iei����Zj�4��\\�i[1�\"}��#Ѿ+I	���j�C�5�)�fɮJ1~��U+b�$��B\\y��hƉb�bb\\�)&�%��k�S�G�5�E��F�&�M�C��f֗�+����pI9rG��\'-�Sb�yկS��)�=Q{��D1��5��~k�E�B��E�z�򘤢�ܑd_<h�Y\r�n����H}O��Ȇ��X��!+_X�Ǔ��\0���d��#���\Z�$Er!B�c֫K�ʑ��QGӾ�Ɲ���f)��\\���>�* �_���G��{�G�얟s�F��	�d�3O�3F�;m��:F��%��\0/���-)��\0�Up^����\r��djKl�a�k���F�)1a�.ŉG�C�����!;���Ϗd��LŚ�٘�\0�-��M�ݛYEm6�3���d�Ӈ\\�m(��[&b�^��/Kf�U��k���O�d�<�E&m�7��1O�9_��b֬���g�3쟧�:�R(�m���C��zl{V�ϋI����(F]��x���Hx���7�1�v�ˢ��\0eZ[�~����E��-��/��1-Ym+�r7�b^^7��ܥ��|&+^��b��OF&Y~dd�ڇ����\0���)B��M�䧤|�ѱ�нρ��(\\r��bF�-M�Ҋ���I�U�GQdrp\\�\"���W-�D��(�\'���}=݊6	���c����\0=\0\0\0\0\0! \"102AQaq��#@BR�3�br��$PS��Cc����\0\0?��\r���N�o�T�q��Mx$��r\n���Tl%��[DH��hVj)7�k}v5N=\n���=��b��5KOJ\'c詈�_�*�O�\Z�T��l~*詏���28q(5�H�h��Uv5�O�\rn�]m�M��0Kθ��������E{cU\"�u���\\N�PIj���T��bv���ط��\\&z�\nn�SU_�cy3�Z���R~�{�`�4\\��Y���,�ҥ�cy�\r�LqD1�ʸ8�E���6�Pe��K�[� �-�ZF�̀�\n\'-ؠ9h�URx�ekm$z*k�p];8��%�\\���J�����.�M������Ow7as嗝�\\J�[(�$0�M��:`��s�����y�&q.?�� ��\r�rj�e�EP�\\T�b�٩T�C���dC�[\\%�p3�p��1����phZ�����uW7�%��]\nr�A�*�c\\\Z�-U0�0&��8�F�����@�jo%ǩTTSv�Uズ�%��\"��TR*㵷��n#��Tl��j����\\dKfUt��a�`m��ꪳ{��idơO\0!Lau���0K�/�ZΚ�MpUV�lz&�rBz�+���t]�Sa�X��V��)�3(�\n�*�j�(.E�ԡa�XS{���J;��<m�{���q����+�U��{�5�l+eh[ftj.6\r�tQ��Y��,�p\n��9ǎ\'OЮ++B�������U��Bw�!8�GTS��U�f5@�-�\"���\0<4+���ԇ;	oܤ7��E��r�D{�e{�����\"�{H�S���gĤ�`�q��n5�ʜgI�hR�4�W������T1���A=���\"�uB�ye��ި3�`m�Eyѿ��I=z��ɝ��ou51�L��\'8�6�*V�1&���u;�6��,�ԭ}Ӈ5z-y.B���Yp�\0��h]��?{ftW����ވ��D@3������{[��E�ɣ0�g�l��⡱��\'V�ߩ� �;)h��n�o�7\n�u��;}��/��`�	`��rZ�F,_�w�>!@�Z�!R�p(OTX�E6�n�W����\\�x�nR���\n��CR����@����):�F&;�m(v�qګ���\Z�G�|7�DԎ�W[�,�C������/�Y����_ʙP�\n�MӐ��!�\ng,1�Eu�q�d�q��K;\'wM�0�����uSl;�~�!��*��1z������\"�0�\0���v�^�i��6�$�g.EL����i��q�Pct��P��\r�0W��Џ8&ŇXn�����B�uR#���|6�q��؍��r�]��8�S_	�gz��^����*J�`����6�\r\"~�l��s<�5�U�YA7GuUc}(�/A~�	^g�7�~[��{,��u��q��1�e���#��M.r���T�7xC��P���\Z�7������w��m�\nc���SO/$�Bj�m�	(w����!:$8�i*n0�i�MŬ�c���?�b/Ԉ���ަ��CcP�f�N�H�\rM���1�����*���Cr�Q�7,oZ����tK ���W��9�Z�lz)�T������X<�j�*,�c\"N�+U�m1��N�|=�\\u��H��S��pU�0��⸭J��]w�^\\\"	>�E��:��!P��~��Љ)5�����v�4y����Xf��tG�I�W��,���5܍���~T۪�\'%q��-��$\\K���`o\0v���?(0pS��%���2�e�J����5��{�NJ�Cpdi+��hU��x�M$�]����=����Ng�l͗�dU$T�$m��W�po�TO����L�MU��-�a�k��f����cU淎��l���T�NS�+�g��x�N�ὤ}.N=K���(m/r1�O���\0e3^��,�f+�m���5u�\r�DpNˇV~֘n�}V��Z\r��OpЕ\r��TIpsN�Y!��U7������/�=�ge⼿&�j�Gf���\0��j��!��ݗ�,ɤ�\Z�fyj�V�[�^n�E�տ���O�M�JowZ��g��\r���U�B�mbօ�3��3�1���7���U�j�˨��UJYz�kǪ�\Z��������>��x��R�mm��\Z�FNj���\"�Xg���3�U���Lidԧ��5伨��N�̆3q���+.G�.¦4�O�^D�+̆5�[W�\r��e������\0������+�[�Uc0z��{0��3���7�� ,�czɹtRa�>Ҥ�\0�����tT�����.�4�S�\0\'�@emȂ�?�^������:�ʊ�~���K�C�b�Q\ZO.*��qRr-5W#f�ψW�V�E��W,Rj����6\n9\r5#a5���<��|?�W�89�R*g[\Z��VZ�C���uW��$������W\0�ޜT����k�]ya�R\n�+МZU�<�}��dl�hW#��d\n��;�	�~��\0PN%WU>�����������7m�^GN\n^%�O6�Bpx邫��[h��iݫ���F��OZ�Te�O��Ѡ��r+s�f�AY���4ڲ=��n�U�\r����B$ԛez�Nn�W5J*�����U���ٯ��0� �WMftV�\n�����$���\0�y����n�M�_\r͜�I�\0!���O�\rPE@\'�C�|B{��n���T�~�mr��C��sl�y&D�R�	�q��B2���ܜ�7K��,�x��U����8��0��&\Z\r�o��R늟	|������)�CAo]������d��h�>�O�\r����Ey��cC���w2�2S�~)�_D:�4yp[��o]������xxP�X�)��Mē��t���=�)��?5�R�@�#��nO��tccG�d��F���女�,5�\'ꔑ K�6s ��o����_%_�\0.��E�0����-�^�晅�4I�Z\"\r�d6�7��7W;E����*,�\0�^�z��ՙ���~�/��q�\0�Ģ9�\Z�@\'�P�|=I�VGe�N�o\n��ktG��BW��������h<J�P�p���[p�tˈ��]�Qe�~G$|���u;0�^\Z�)�ľG6k��c�E��(�ZO ꫯk��F ��ϟg���R�\n���qD��\0�*�Qf�|��/Lwa4�܂-���r8s�3<�O��:�`�T���L�P�b�9;�H �ƍ��ZU����7,����ßv�*M=[9��\rq�a����9�c�A���)�:(͋�$�q��V�<_�0:hb,V�\"���-����\0�]sHw%x��o��%�c:3��b��/��!V��i�v�̈́�9�sO����L��2�{e$	�=�3Kr�l��`qW����\0�\r�Sso4��o0��\n������T��.镪N�,\r���dHm�4���q�\Z*ya�w1S��8�;yJ�Tƺ)�Rѣ����^LA��\"F�O�\\\n����׸5ډ��_�S�U�N�Z9��$�t��\"e3���j<��p\n}S��6�\Z�B#�,��J�be�\'{�Ño�V�.p�����#33���	���W�Zޥdap�%u� �ꩫ�a&���?50&�C!�|#�ڲe�8|�GN���f�QNm�\0�Q;��\0(\0\0\0\0\0\0\0!1AQaq ���������0��\0\0?!�cL��=0��D��7��6�[�P��}/��ևKL�kO��\0>���mޅ\0�%[��Z�V7#im�1%|��%��fb���K��{ie.}K+��k�����1�8Y\Z���B��Fs�i���;	ZE�����1�}+cBB>	�\"No�_rD�_P��o�5KƽJ��+D��ks#K��܀j�L#�Z	�=N�G��ǡ\'�J��!A\"�׬���90���$/\\�	���L��I-!hǝ�k�1�X�0>��Xy��v�$К�,��dYz\ZjB���2���	k	CDl5b{�F��,Dr,i�tQx�W,�E�������H�,�y64](����\Z\Z\Z>\Z7��ӍH�9,�D�6��`kp$ٷg���/���6밈%��b%D��!k445��_Δ$��H�,�Z�V��ʇ\"瘏����R01+6����}#�-�v*Q\r�a��Y*ٟ�W���cz-q�7s�ەL�qd��7��/�BI�;�ۉFMQ�D{(��$֤N��֣F#�mt��$�!e{e1�zH_qJ�3Z_c9��I,� �j ���&BZ ��\Zm�\'_�Be��e.O���0i�x��52Kt���i$��2(��\0��uqo�O\"Qy�{�2�� hzL��O���ȑh��O�����3���\0�&;�\"�ñ;����őC(���f�-��n� \"�HX�ca�Km�>A�g+����T+,���c�a�$]:���\0�B�X�N\Z��=H�Ah�ٸ/�.M��D����$��C��M\r=ɉ��\"�Q�\\��\'E��%�~�4d��@� �DN��4��4�4��E�ОoȊ=���tܪO�pm�ټ�\'����l�/����͊6<�	)�1�.�V�����=���k�K��(2���/@�2�\nie��ӗ�0���\0x�%��z�dv\\�B�k��[�,��^&X�V5�H�$�%��ʈ̑vɼ\r���$3�X�����\Z\n;���4򉋡�v&�fЂ���<OF\Zbd��	j4:�����̥�.\\��R��dd��EhpQ�J&����v��M�C�v1�Hޮ�*�ɐ�Dɫ����w�l7[�\Zg\"y��u�	R�x ���F�<l�Z@ܟ�\0����F�tBR��o{������te���U$�;�\0�iV[hv�#��&K-����U�=�Bn�	`�[�34�n��\'��䂆\Z�yClI�@y\\jF�x�BK����D-	�҉C�1���R���̓	��@�l0�HT��H6��D��9��(֛��)В���	���3�H�A��F��)X\ri\r�tfvg`i��n����������K$�1���BTo��F��\'\'�Q��Xl%��1�;�1��d�C�;Q���a��DF�D@�\rA�tbٚ^��j�+(�#l.\nzD�Ł���DΆ�	��G\"VL�\"�*��eYr��!��0��	�#[4N��C@�n	��]�J+$\rC�Ʋ!��^�	�a�N���ؚ���/\"\Zѩa(�Z&o(a�<�c�fL��\'����용���Z�\Z5X�ya����B��\Z^L�R9�NZ<[9IhĲd4E�F��Yh7X,�d`0�P��fU�Q�b�ز\r�{F� �&>!��c�h�W����MH�2Ot3�M���)�\\D�T&(��\Z ǂ�7\"y�m�$ucV\r7I���bq)�Y`���J�)�����X����غ�9�A3\rD|e&6gɆ��\"	�$���R4��tX��K=2���&��j:eC�B��&U�І9_+/b,��rP��pfw\'K��<��O��$a_zLd��=�77HŏA����!�!�@q�Ÿ���\\�	�#��E<�\nC�[+SCx\'�Xg\\3�P�[#;`E�0�o�ؚ�Qp��7����T����<�q��-����I@�17�e\'N?i���2s<��EK�m�$�.Q��X��\Z ��N���ߣʝ�����c�d�c`�_g,l��5q�������!�WؐC�\r��&��3|�H\rI\r��\0B�]\\���ry�(,��.�M�Z��bJee��Ze�hc<��&�?���՜��J���b��Nl�%�u��q�J��gP�}��R�tEB|�`{Ly�ƈ���)[����{�DLa�K����6-�	ۑ-�弳�Ynlu��c&�\r�ajˡ��8*M��\\.�9>y}��}�o���1�0����i_շO�9R�Q�Њ-��%5�ZX�@-���� ^D���T=��X��?bg&�+�M�n#(�y&�!ƙITQv{	Wcy��x$�.%��c�ȱ�_ԛ2%m&E��)�Dn�f͖�_�����sA��Ȇ��xEτ+|���f��?�y�r�I��m-�e���,d9�Y|��$�z\"F�\'Q�C\\K�\Z\'g�[�C-�d�)E�,ct7��1[_!*G�������YY�!�]�`VQip=ț�HF���@�Ʉ*���{ae����J1�����������А���!I�贒K6e�cTB����k��R������(R���n�0)�;#Ȭ�p��Ɛ\"��Lc[�%3@C�5X�>tOl#��K^�)��������ת\\�y�|��U��`�������Ʉ;y�rڔDp��-�3�Ʉ���th�Ŏ��ߡp;�{�c^�]9���E\'-*X�2�@�� OwMT�)N�\0��5�� �KO9i��B�l!vt���%�@�$������l ���½E\ZiN�O��+�\0�a�Y�F��Fx\')��u�]�y;]�^���F�\r��	b��\0��4���\\ֱ6 7�㳑=yd���1��Md���3Kn��w�\nZ����!�0�\'�$a�\Zk:��y�kO`������\'~˔%�M�B2D�|����QF(pLo�&�n���D�:D	\\H�$�]/�=��ܝW�+j\"]4�C������w� !vJ��.��J�\\�L��PN�42��ICP �4���y�$Bt��<�0�`��5ۣ�X�⒗����;�̇�n ��<�b6�7좍�ވR�c��\Z�n��$;r�Q�$�K��h�\'�<�\n�H�*b���Z.ZKz�1�]�Β\nzj�9�]�O�a\"�!�p�\'�����,���C�����%�ǜ۽�����5�+D%8\rc�B vO���8�}-؜ �9!!�M�,C�h�n��|�=\n������enPt���=ixq�-�3R4FQ~K�&��;.��r�\'���Q���lR�#�z�l� %6�$�X�VPٟ��a�\rH8\"4j�\'�DH\"]Ƅ�l���E��xc�ht�$.�+$5�,���\\ʙ�8����}0��\'#���8%�����d��4Dl���C~F�/�4<�y0����w}\Z�d���.���}�q\r�6r4:���j�ܕp��O�7��s.�b�N�V��ǡj��_#Y�Z*FM�!HE!�tŅ���y���8�4!�7���p��\ri�g(b��>�җ�N�����*Ď�z<M��,y9LO,B>�(�E°�d�C=�ǰ�����{�\n\"2�_�p�E��<��ޣ�fM��g�J%!)����t	2L�8����cR���b�T~`�l=�/�\rj�h[�Q�>���qU��	�(۱�/$\Z4��>MN����kjĊ��i6�H���C�d�r�)|��\\Ad�C����qD	��_&A\\na�\'�$�](o�h���)J��\ZkR�;���\np�������L!�V�5�L�񾭉ҷΖ�n`�E�E2!*��O���c�ӈ�k�Wb�&��$��Ol��D�D��6��Ԏ�,��GLw|	�y�c�W��K�|l�R�ؐ�Z��f�G��E-}؉&�^�v��AFc�$���z\\Un/),9D9�K�b��|�a;Q[.��0�*�G=��(���v	<�$RǦdK�$���肼����ҍCc��`�P��SSe)����Ip-DJ��l�2�y�\\��D�%����w�9 ͽW�HZ\r�����H�݉�+���J�1����)����\Z�t���ѵ)7\Z��T��$�Y�KA�J+��q\nԎ�њ��\'�*��es�����\0��b6�&��afp��k��ba	�C�6\"�o����k�Ri�\Z7��l�;�ai⽌I2a��5���vdḔ���H����%�d\r�0<�k�\"����H���2�	�D��b�-�bm�F��Z���/�����\0�?Y|і�	{(�{��Կ�G8DӇ\"[���Ȅ#a�7�Ԟ8��B\r���{ϣ�ԄYؚ�1�\rr�-�;��$lOm[�%��;&zГ�y�RG�>�q�!4]�4�M��;8�I#\"dĎyv\"v��a�M0�����WJ��HAn���\\pIxu�O��5s���?���:ݙ\"�L���!�_\0����[�\0S��9LcC��0�· ��~W�$[ 1e�G	�f�b�cye,Ȏzt�i��X�b�j��oB\"W�d�P�$�I�%_G�ʇ�իꉗ,_�L�{\n���P�K�)\Z\Z0%H1�N/H7\'�q$�	�����ID�A,yY�p���	�	?������C�	[z(���j�w��:�R�M���}YW��K��}�8�@�Y|!����r%��R,u,�C�r�R����H�:�z�҆�Oc�*�f�7������?����?�9a�\0����(�v��!e�M�%���VL�?R#N\r�е\Z�c(�->���\\Y�Idg��D6ff��0~P%(��K���ޡ�)�D@��I�	��!z-�\\����o�Z\'I�I#�)��#�\'Z�k\rr�j���8]M\'�Ȭ�1�-%��Q����8�`�;|�\0�-Q^�!�(��>���?1A<��:6�]�f�æt#��S2ޠ�2#���[/J�zR+c�M��j_=�y1�Q��eو�;K��\0�voj���F�b��V�B&c8,��E[�=�X�Q2O�)d�s���*]�Y �-(*�����#Њ��̾NY3�^�#�8��B�\0W,�!4�V��1�EH�[ʏ#��F[#�M�U\nػ\"4d�\r�j�e/bg|\r#�z�\n�C�b�Z!	CV���I#Ih�(a;���DO��g(ހ��H�	�f0z�6H�\n�E�3#�y�8���;�Hk�Kvއ�<��h���l�D��/Cm�BD%�%̒R��=�3BǸ�����A��}�c��$ T�lI#_:*�K�7��Z��죋8N.��O}6E;��4/�,%\ZthB��������m4E��P!\\���HUёس�ih�$��eFX�=rU��{�a?�^#��)2���Z�\Z�<�$�бk0�HD�sC����с�Z5��BBD�a$c�`K����j:HS��V�����Kl���К��~���0��s��~b��M�����C,7�����2�6�M+G!萅�LK~Iׁ֑��p�Y��M�wQ�M�H\'E�[֨.;�$@_�zA^��`�؄��\Zv/�5�ȌR����L�I��~���\\�k�*M�˰$��$@�8di1�K2�,>f<�;A�.P���jI��\0�\Z\r8i��\"z\rj�:�����ӭ�M�5�UR7w�}z�8|����Rs�*\r��5֢C�k�\ZU?��F�����8oė���*vH���1[u\Z��8��1���H�6=�D%6�e22�&颧;T~;� ��X�_��d�$$����6��1M��Ow��jhbY�1\0�6i�4(����YP�S�$D�n��y�j��NF~��������I�R���k}��=���e[\r���\"\r��z_��S�����ƭ�h���-H�I2�N��#W��.��60�t�cevJ,\'D)eН��F`�+)�j���&c��gċ-c�\Z���E�����3.�J�,�+zM��Ȟ#��&�*���J\".�4o%r2�}ɓ��4Ӎ�1Fz=��W� a�>��Za��{?xǤ��z�{�o��f��k���LK��\'�*���CS��H9R��K4�B��\\���Z��i�,{�R�����i�\"Lf��ĥL�CC��bA��E�\0��\"2-��)�`jT23_���B�8SY���c��\'ִhB��D��m?��\0\0\0\0\0\0�,9��&����\0����6��v���C����?��+}َ`�B�����<�{������=κ}�j!����\0)��~��/c�l�Kj�vxC��:��;l�\0����������kل�������kܪ��v�����Ն�NsC�m�|_;�;�^]r��r����.Y?o���2��8�;sU�v��g����/O���~����|2?�6�����s�/+����+jw�g�#~��l��0{�\0$y�p����_�F���5�\00�n`�ј,�|��O����c�����\'o��>!�˒ĭ?I4qW���\0�e�����t�km�%���o�\'��G�4������t1^���A̽��a#Z��~�����a.�����cH�;���H�t�}�޼��@s�y�ۤ�����Zڊ�����;�F&;o��}�ܳ�)�f���\06y�\0��<�����π\'?�]~���y\"]����\0���q���q�/��{�\0�\0��}6ߏT��@wʂk�?���\0���}T�7�.�Şt�U[�k����\0%�\0N����m�v=�x�֎ �\0��¢��[���q�?���~5Ѝu��m�j����{�Cs\r���V�(��޹��C_���5~��)��K\'_�/��|\0��a�/>��\0\'\0\0\0\0\0\0!1AQ a�0q���������\0?|�\0����|}���	�?�^ۗ�t����������ɭ��3˓l1��oKfz�e�����d����e�GD�Bgמ��%�t�9`��>�.Zp�z[���\\[�o������{��i*}K9c,{�jT������D3���~���\'̤,����ܳ��{z��+9����\"/^9v~��x&rA�-r�R�Z6�0�忘����.����\r����^X��[�D{a�RϠ�?��e��i�����fY���#�w����9���r��g�2|7��zvH���z�;/`G`C�\0N|��, c�9�M,e{lS����`��.6,�����N�>ml�N0+�L[c$��Xo����{<�afC�,��N}B8�:~�?s;�o�\n͝2�j���R�m�+�;-?��E��XlL\"�m� �S�5����74ˏ���ي�؟��z&0�8Hج-����Ze�#ӓ�>.� �F�[~�{�\0������,�--�st�%?�~����km��vw[��z�v,H6����썄��/�`/p�_��\n{�;t�ޣ�����9<���\n$$d��se�����U��[�!ێ>6\r��N-\"�=�(z䦖Ű������6��Ztòc��/���3�z�1�8�n��x�S~%R_�����97k���ݝ,�����p�/��\0�b���>-d[?G�:̵��N������o���t5]cr�}^�Z�/��7I�\'_�/�q�?���eK�Q�\0M�1� ��b�Y�n���#�xG&�_���Y�X[	zI������bf_a�����x�-�W|�#F�偯�KO���c���y�\rX��~�˗�\r��l{͟�~.@;�s����^�3���/������D�{���_ci{`{�`�E�d��y�-��$�O�~Y�\'�\\Cl���s[�X3-���O��&~�.�i������F%�����-<g?3P{F1NH&<e�;��,bF��#�sQ���|�\0�DA�獥����3Os�doa2o,�dK�U����ze\0~e��I�X99�6I�|, {>;������^�?���}����\0(\0\0\0\0\0\0\0!1AQ aq���������0��\0?9�k<�I�J��\Z�nv�^�#���3�z�4�\0�ɕ�ir�m��H(T%���,0&\\�#z	hh����l��̫\\T	B�uL,AEJ��o�e\\>�K(b*B���FV�����*$N5+Sn?�\\%kQ��]�����˷�\n�����$��}I�8w&W��.vB�!r���#X�D����˘�\0ܧp����x\'D^���b��pDp�L!S1Z j��$��GQP*->s+��@���FۀTΧ��U����x�4�X�*�P(�G�M���Ei,���J�7�5�ppGq�\rګ�R\'� [SA�e��w�9�!�&��f[�FTR�w�J�o��ْ;�.�*\r��fH�c��1�%��S+0���\r�j�İE�E�ե����\Z��5	qB���Q3�x��]��@�=�c��HC���?8�\\�yE�S�\Z�CK��΄lV��blb��Ve�	p0��v�j�b\r�b��\"��K`�%;`߻ʧ�#�k[�	u*0�6��V�(����gfe��\0�;�0�t�й��	�H�\0����p@@����!���\03=��=��,]*T������A�l�b��>���A�Z�)��y�G�f3��V�N\"4��Tn��ӿ��_h7��	��5��\r��zeT|�RA��\0ib��\0h�˱��HǇ���2K9��MfT�1��wd����\0DH0�L��qQϨ������q(�0g0��b,�*��`v����R츭�X�4<A��%��3�^䥃�%��R�P��/>��w�8�f�E���	�(r�H�f�H,����|��o����~sL���8?���2q���B��.���/�����D�aԳ��=��~Y�TV<��nZ_���5�O�3��߈�\"u��L���%��P7pL/����$Z�T|�(����������,Ӹ`2��L��M�ʓ�w��),�s^��Ϟ�C׃,��-C�wq�`L�gg�l����!�4��}fPG���3�KX_&�5��K�n\\\n���\"k�He��S)�+�\0;�\"�[3H{˗�yyr�D�ga{�r��~��(��8c���!�5u���ŃtJ�;��Lx�&�f0h��3�sT|�4p�.\\5�����pH�Z���Y\r��0� G�T�511^6�V����W��Vт��a��q�O	ܯ�!�0�eV�w���(�1N����+�ÎC��	r��.$EB��\0E+q�zBr��1��Ô�\\zS���\0\'\0\0\0\0\0!1AQaq�������� ���\0\0?�s��g����J��\Z�saz\\���G�ifh�U�Q��֏�E���� �*\0ee\\�b�\0\Z\0���Ѱ���}��\0��Uf�V�+�U���SE��bY\r�\"����ŕ���s��*\n!�����w*�����8���{����Im�*՟��g�:g`����\"2�\r�V:�.U2�-�9�F����~x<u`��J�P�H�t���c}D�N����y���..�I��2���&\"J��ɻv�Di$�\0��\0���ߌ}��0qo.�ůL�=@mw�O�E/̖��>.5#U\r�*�k�/v\n��f��_)�\0}�Qu-W�P�\n����U�������2X�	4�1��̾D��}�E��l������%�M��d��l)��`\"����h��b$qpr˹z�A��sp}�7Pl��V]\'�O���n�ű����k���7��/��#[l��_�1�HZ�TG�knG_��ab�?l,a����fѕ	W��*@_=Ǵl�W��\Z(y��o��0%\\.e��`8۹H�b�`ĵ���\r;��ǄV}���a]<j�G�W�\0\0\0V����=���J��2�����>Pw*$E�r�����\0�.A(��_�\0~���_�@��J-P���Xˠ(=صu�r�3=2��@V��p�{���+M\0���f\r+�+S	\ZQ��M}���@8?�2蹴�o����r\nx3����b��k�_ L@^\\�DA[�*\"�^�Uh��+\0(q|y�+2�F\nS&��Ϩ	N\0����ZK��\r8�Fcv��_@S��Ŋ%���R�m��:�-ED����@e���\\���Â�%QGw[amv{?Q*aM�>7�_�X%ܴ��h2�|G#Vt��@��V��}:�U�W�`��������Ws�k_pp2���b+b���Ļ\"`Y�0����)I�;�\r�P#�p`�l���}8߉Gd���-�����ߗ�@�`̭@&��B�!�6|Sd�+���/�PK�Y\0#cS\r�^(�\\\n��������[��Y�a����/i�\0����^�O�8�\n@����\05������n��\r�/�\n��Ic�*��n��68Xf��k+ ���>��NU�\n�a	��.�((�)}\'��6�_ET�#��1�Ao����W�U�{\n����l��ʅK���吏c���](�E�A.)a��\n10�Τ�����0��a�ћ��Ux#�}\\�����������M����~eJ��=GN��\0s��PB�]�fUD����\n�q�e=�6��\0T��0��dh���#����\\e���8�J�o��\0\n7��z%:�n�qn=L�pj�04ߜ��^���A���g�P1*]L  ̠*�4�ў��^ U������ʚ��I��R����W�i�#�\0�L��Ĭn�6�������\n�X<\'%��GW�:��V�rXJ���~�l�4�K]r��O�Qh�r+����+j�a`��K����(�+�Ϲ�$s{�؀���;���Y��H��8�;�;A[�Iz��E��C��,h�b�Z�=c��������j�\04ȎJp���$Goo���d����Z��K#\n;2~b#K�!�M��E=D\0zQ������,0��\0R胄�ԣ�\0��e��A�ڌUa}�,l#�XZ�\' �w	��]��M���~<�DK��\na\rGW22�]��]�*]E�Ɛ��&ApE&Hhn,��CV&���d�p�мс���,�t�_6Y�_0[��h���]�o$�(0��˩��K�*�o��`p�\n��M��0���Ն��it�ۂl�%#w�_h��W�`R��d�Rv8�x�j���R� i5�K����K��ӿ�����$3�A�l�be�ۨ-���;,;�=D}�2��2�q3%��K|�r3�+��Ա4�M]BA%��uv�\0H��C\0�JC����+� H�?�>���\0ؠU�!��dJ�q��<\\@�b��%r��/P�@�=ę?PY�*�����̧>�_�r\\���x����J����a\Z�����LT+�q��� �R�H���R�	��\"ejA��O�B�¦�vb{��-�Dk�́_�>�&-�/���ڼʍrZ����w��@-}�CmDY�����` �R�9~wP�)a��)4V�`*�g�#=(�R�P�Jn�%�A�\0��t��۸X-\'Q��M\'�2�-GLd�op�&�G���=x�N�K��qeN^c\n�� ���	��=������D%��K��������b�ǲ+U*�B�6DD{�����X������Dy���\r�z�`\Z\r�A=K<����	7�.ﶈr�a��(=f\r�W\0s)n�e�K��)�\0z���\rB:ؿh�\0�����b�\0�\0Dj<��jm5bFoi���$eR���04%O�Q�cܸ!MR����P�.z{���vA�`��;�Y��v\'�C��Ѵ/\n�>�e���\Z���`��bQ#�x�����PX�wW��v<��\0�C]~b;&N�ç������yo�\0}}?�w9K�ׂ.�M��`�￴q�����̵������Jgܳ^S��E�V� +l���z֎�[$���X������?n-����\Z��O#��X����\0S\Z	t�q~S�8Lp�/���_�B���#\"�5P)�+N�\\t\0��(W�q��\"[\nR����>�Pk2��U�����ICT��-���+9DS���bdNǘ��P䊢�VS��\"�*�|�tc�A������G�Wj������\0.+q4����x��CB` ;e�)���;}@n��F	k����\0}�=�AJ������ЫI��B���=_\'S>��zaeI����8�\0��\0b\\�ry\"��v&XE��楲ѐ�<L�\n�~�����ac��3��I��9��B@ℸ�����d�����j�h��b`\"ۧ^!W����2�\0)�j������7�!��z���(\'(�6;@9{ahpw(P(\n\"5�O��\0��N�>\'�!�x�^��\Z�P�J�@�szM�0)���@�R�4�Vu�N�\\dR��t�MN\"u��\n��\'O$���|Dh�}4��	�Ǟ�I��\0߿��~A�@Q{�?�#�k�~�4A��i@V�6�c�W��^�;�[������f�9���̲R��\0�P[�	�+��˄�5��P��w6�֏��;�U��3��@����OQ�;��5`����B�k$��1��^Z����\0�(�����u���%vL����\ȑTj\0��/�|e+�|��A�`&�������Np�!�ؽ��g��l�㰍B;a&␿ikm^A9�q�\",?LEXr����-Q@�QJ<�ǘ��((8#�iw�(D��{q*il������dr���}�#�_Be�K�|B\r��̮T�G��\0qT��kde���2%(����}�w���	-�@*�<31��@1}���!@hġ�#yLh�\'ݏ������y���r��e�G�;��+�&��6��Z����@��-!���p��.�̩�\0y����\r�	C��ȭz�%.��e&8=ċrQ��pAr�H�(_���oǇ�\r��e���,X[G�>��F�]�ck�O��W@\0�}�J	�r�e�v��3��3n&pQP�֖��0N���\0���/*z�� �\"p�E�U��V��^�[ơ����V*+���\\�Ҁ凥J�����?a�@|[��@d\"��0�R�G�~��RZ��?���fs`/�v7���,�����8��|1���E�����\0\"WB�\\���$Hj�(/��q�E)���)Q�� #��{,Yr�\rW0uf�q���;�F��\"��]J�Eʧ��W�v�}�<�r`�T���BUA�K��\0R[~E��k��\'�\0��բ�\0%�?1�\'`Y^opÙ�=�,��+�e����v�\\�c�?o�+�#2�����!� Ԫ<�����\ZM	�e�C[W��\0�Z�DC&ˏ�)^\Z�܇\'T��Z<L@��\0�&Z�-Dun���Zi���\0|�g�\0�)T�XXbf�T�������b�0��-������bX\nD�abd���1o醛�p*���<����v+�2zvE���]A}n�\0�5��z9x��F�nի����v�ѷ��=���ʟ`X�-P|��_��ɯcUQ��\'����nn�=��&���\0��^�]�O�UZ�z%���5�+�R���Xk�NR_L5\\IKU�c,�K6�W��%�h��e\\X����\n�\0�z�p��y��CAPP�+J�\n�\0AB�e������޾���O�+�B^���Tr��#�[�z��B9��a�?�G�� 1���z���̴*q�h�9:1��V��lf�m>0b�?��R�ޅXJ�\"��\08C�k~)�-��N�����>�Dr*����<+��~cE�#��*�D=��	���콬�Р���fv�p�B���QG5u�\rP#Zt�8�T��f3�5��2�W��\"n�ko�8k�QӚ����0�n\n���C�����m�S\nz?����I@�%·X�\0��E �R���R�G<�i�����@�R�����z�Wl���W��ݿp��01WT��U�#�;gT~�\n�A>?�����I��r�\0ܽ�w~��@��hSq�@�QY���cn��/�ڔ\0\n >��\0���TG$�����?�2����?�\\E�Gk~�\"i�A~����A��b`B���9`P&�~ࢍr��:ga_w��~���bQ�`�zb�P\n[uwQ\nq�!OF�y}@�M�\0���b\07b�|��w�\ZF�r�P:����Q���b90��1��Ո�}�xC$y#�T:.�����/�b�e?��T�f��D�6f����\0�\0�������uu���\r�>1dv��]v�x\"�;\0�\0?pⴳ�`��,��3I\0�,#@�8P�|D1����EV�\n�E<�lg)�Z���1 �l\Z���R#V����)Q�]���Al���A\0�&���������<sLhE�\Z��F�}J8�M�}�IC-�i_Q�dU۷K��aP��DlOp)R�GK�FZ��_�!H ���k�ܷ�;O�b��y���.qihs���0��]V�`����\0Ĳ� WV�)H[\\�-f�=#ķGDu��Ͽ1�i������44n���E@U�qYGs�G�QY*6g���-\'��+�h�!�B\"4��$\0��-ׂ�g�1��k@r׎2�j6���G�1�U��\"�(<��\\����2��/��*�ϗe�\r;�c%��W�p�5UO��^�;\"WH���t5�$�J���K��\Zjv�𽻯%�����\Z�T��J�z�b��@��	�0�^MqvF�c�&�9{En�߻\'�T�*�A�_����BZ���\\@�_@��\r�\r�D��a�Z�A��B�.k��za�6���g�5�[��GD�N���D��uV�_��g8\n��b�f���}fj����P�E��Q0���m�r���?�X�z/�>�y�WC�Ǐ�C���s�@��;�Հ���?La�]v��S�c�h?� �_�K�m=��e�8�6��9G��㥸�n��w��\r���߸_/���^)�)��\ry!�c��\"���2�M�ϼ�6|��H�t�=��(�FʍZII���&��@�j��)���|òRb��J�P�EEJ�헖��~JF��|@��U��a��ů���|\0uM��d��g�-��\Z4���JSgp�+�x���Ȥvk����J+�������0ξ_�huW�B�B�S�m��\Z��T���k��1C6���\0/�\n�4��\0�3�/�i>b\0u �xL�La�!�L#v� >��|CK(��	J/��}��v\0V[��d�-��@�x�d]�O�D���8T41���`e�T.8�PDM�����k)/��a9��h�߼��6�3J,#܂ը��\"F��\0��c\0�f�P�8��>���ԯ(A���dR̽��+�NG���d&Z���$S�4�.\01����Is���-�-%R�\r[��2�w\re�l�!�d��?a��#A�w�fa�P��6��tR5�Uମ���E�W�~1A��v��c�LPm8C�NO5	�u̺�<���5au�y^�0�D\r�K�JL1�ʦ\Zĵ �t�#�\r�\r\"���+k�5���qv����y��a?To��H�]��n�0U-*�)�-ޑ�9Vխ[�\Z!�6Z2�$�x��� �����!�4����Q��֪��-[��R�Q� ҵ;M>�`���,��5�U�i��\Z`6\\�K�����p�iV�\n\r��\0*��*�;�/�d��U�����X�\0@<��#��-�ۀQG\n��Į��Q�pȆ����eD{v:V?��˱W��=�\0\r:M<�]%�ѵ�di2���\"D��z��\n��z>�W�ߺB��ίu���rtn�T�s����e�J�S��TK���#E���ݦ��\Z�v�����\'wFR�������]�T��5}&+��&i���_=kd�����(kh�а�%=��v�E�62��٩��Dh|�ܸ/�~�8���˶�S�|��,���0A\Zi��A���%�M�������ĶǸ��r�y;�C�i��$�h�o6B��:��]��x���t�����y�L:x:~��ǵ*കE7�@Izz)�z�\0#)�=,zZ����K������M\\�������\\&HPPX5k�w\Z�Z06��j��W��G/��k\'j[Xs~<�p�\"h<#�*q�r�9�7�U�%�cQ������\rh�N}��I��O�Y���\'���}��\rѱ|�3�����{&�+v���\0\Zw��2���C�t� �-e�\0\"�#�\ZtԱi���C��ێ�P�R2/4������)K͠�|ٽѧ�_��zWERh~_��6�5�����rhx]v����(V���D�X��^�1�l��y���� �(�]Q\\�Wr�z�\r+0�oLJɤx�\0,K)[���v�x�U�6;8z��2���{���Ir�2�\\bRF=~ri�O��ul �Q�A���>N|B�������pY�;��X�NW��sR��+��}�`,�%S�z�b4/!�\0\'c��%�\0e:��#�B���_���J��+��:�\0�IP�=���ލ��/�Q3.��V�ه�ite�ڇ�G�������m����k��e&?��l\n$�R��yOE��N[WQ�^�Q.�;H�N��6q�Cu|��)\r���w\0�=��&����\0��\0Zk.E��@�F����.U������K`������i���ћ��`	�]:���_��:�����.GA�FYe�j�V�:ASd4=~�\'Ph��\0��	Rj7N�\0���\0�\n��H�%�/g�PR�#�TWr�*���O�ċM�g�P|�.㋩]�\ZK��_Nz#�1�J�,��	P=J�k#�{\"�&�$��`I�2��ǸLzO�~���lo� ��g�A����;.��ʥ����a�4X�]�vۘ�C�G(vӲ���4�t���PA��]1�B��z>_���n/����ٷ����[ۘG\Z�N~�\0��c@�ZWO^�) �A��[X��(,Yr�u��ĶڎӾc�R���U3\ZG-)n�&!���������}��XN\Zp�	�� P��w\r�D��ش72V0��_�岃�E�⪻]_�-3�p�L��%���	ŗ�t܊_���Q��)���vEm���y�=8a��81���J�س�q\"��D\\gM>⨥]��WD+���>&E�g_��R���{t}�xDm����lyP�h�\\�OA�z��N�G�YÏ�lA���Ybݕ������Y�a�����D���8���3|��q��P��Lw-�I�>��o�\r˄��v�\0L�\0���`�i�y�\0�fh�$T�T+z��[A��ˣ����-���Q>ze�����(_�`{����-�^������\Z�!D!j�ǝ�^K�\0��9Q=��\0�C����#2��ڽ��D,\0�bWf5��0\0�����j�.*�s\Z�dTL�l\nߞ����1Nܲ���n*������M\'5b}�~R݃�����K�K�ĊWI\0�s��\0ndaF����f2��ry�rQt�rтQ�-�1z�lJ�P�.�ؓ��Z_j�%�p`5i��x؈���\05`(K  te�[.��Z�@�{��B@YKD^�C�̲�\"wN+w�~�g�����9��G1�[v��r��@~ח�mj�U�_��M���F����A���,T/6���ߧg�\n�#�`G�P\\���m��P�|=�]`�J�fϴA�*7�&JAj<��VR�=܁�ѕ���M��T&�������;n�R?$`�g�V�rKz;u�qL@�^.i��)Յ<t��X�m����їhe�ܼ�\0-�W�����R�����\"\0�!�y|h�Fb���8�\nSY:��4wC�7�Rͥ۔�q���%\0�^�����`��Ρm�Pĩ�ˌ�@�T\nN���	�B4v���H[c�f��j���EӃ�i��0���DDM��-�Ά�h����@���2�G���QI{ $��r�:��\"Se�\0�\\��l�!�\rb�\'��x�Ѷ>N5uލ��@��ܣ#Uj���lR�py�]�Z6�W��[�\r��5~��RG�\r�q\0��5�#�>Y�l�X�յX�2��B��GP�ЋC.���`��,�����Kc\\e�Pc+�k�1\\@�Z^�y���().`������.�����~S�1��+~�|���_:>>�o+���y��^L�i�����>�<�BR����?1���5�\00��1v���%������-e�\Z�8T@̙M����j$�	��U�\Z̥�ܥ������u6�\Zi�M��i_G��Km���\0�R��!�/�@}\r5�e�9�� ���p�z�O�\0P,�\0\\X9����0D�1(��t\0u�X\\��,G�\'\r��u�*K��ڠ\n/~c.������z��M����z�瘴��\'���`\Z`�Dsp�F7e���pcnb6W�y�>����D]�픀Z���B��tz%\r�#�V҅M�T6Z�6�\ng~#�X\'���\Z�\Za�/,b�(�-�4˚Y`h����ϙz�lD�X]���|�s~k���\n���\"a<��&� a�;�˰�r%��Ξ�+`�7��O+�D��=�5i�@{B.�L]�3�-wP��v������i���h7��\0���,Qm2�\n�V��w�h8r�О����aڧ\r��m�W���V)yb�u���4�h|g%�}�cD����Yp�����8�`\r�U�⠠@١�휸]���dzn�桷����E���E�\"v&����FA����t��Q\"X���\n�-\\�/��%Տ	t�/f7��u�c㨴:�:���-�U*�GF��l\06�:�*�o)ĴQ�蹗4�����B�:�>X���M_�~���|<���Թ�㳭��~�V\"t�Dzk�3^���l���(�)��ז6y�6\n��w�6�gU�D�:	��e�����\0�0��/��S�j|ZZ���>Դ�.�^�?k���y���y_���zJ���\0j˳O���#����g�)�\n�B�Ƶ����=�E������M?�y`���0Ĭ��|F	\0F�No�R -)��e�\\5O��6�Zm^^_�B�%[Vt�O\r��\"�g�a��D!����\"�9%����Q#T{#ȹ�,��<��,��s~\"�WC��E�o����D5�&0�2=z��t�\'�p�p�s���6>bO�c*���W��/\Z�nI����\0= ��[�����O�,�f^�r��.\r�&m����_�Q.ţ ��@�95�{OԺjZi{|@���,B�-�\'��}A;j-���,�\0����W�p�ݾ�nB7M8Վ��8���wZ�e�	D�/?\'\n&ڠ��(:;x��̬F�v���n����F>�����!}T�Ǥ�xI��+W۵�l�C�Vp;`*8Im\r����Zt�c�KXN��$K{lvW>�d_1���L�x��u)����i�x�9���۫���zj��,�Ů�A��u�P�P^�1?J�4����-��`�=\Z��F�9��m:�D�qK<5\0�װmK��@�#cy�CZ6?0.��>�?�J�Ju)P&�/lR\"�j����.!����Z���O�x}���hIg��.��hɰ��ΉI7KU�\'R��{8{�����GJt��$E�78Y��Y{ea/t�������� ��6��Z��z��/������:6�*F�7 t�O������.��f>��<�`�ܜ��-�jw/��Y�x�����EaO�y�JG�.S;����\ns�qV�Uʼ���r�V1J��0)^���0Q1����FU���d�GX��cLx��%��c�UH���2)�����$i2Gܦ��@DNȠ�\Z��쨥k+���cQ�QU^�1����·�|ǝ{�e��^u׃���ӫB��>$@C+Zm�=�+��D�R�\\u\0:��d�����˗�)����i2T79&�p+�����\0>�R���U�U���pq�Ҵ�)����k�s�WkL��Xr��}=\'f�z~T�ø��\0��\\ԯ�\r7��*�\0�E/$a�\02k�J��\Z�ؽ�_,�.��Ѣ\0JT���X�Q��N�pn�7�Q*���F���E��1K�V}2�Z��(��O�D�c\n�[�9�W\Z����${�\r�w�O�]c`5��GM\"V���ix�\0�\rhHw_�.tV ����%V0�-Z����;bd�u��V��D�=�\0��B��0-�W��\'�c�fP��ǩT���� p`�%ˊo�%J��0�80��io[��,������P&]d�{�,\0��-/:\\3*��cf��S�}G\Z���)u�T��]�mw\0Z����d\n#n[`���s/�\0Ng�%.Z�y�}��\ZqP�����XD�F\\�lJ ��\n�x����`��Y\rn��gtc�Hal\ZhS\\2�,�o�<���l��b)�O�� ^P-��d��A�:�P�=µ\0^N\"lj\\�s%TO�WS���r�j\\���f��ŗ����uQc�~c.o.ᙄE�\Z�x\"���	��\'����V^z��Z�vː0��<�j�\n�q=�E�w��V�f�����6\Z|�p��{�\'����u*�����B�~�����}� /UO���r����K�?��� D�Va�I_Q�J}8:��t=�G�\Z��ŧ�����o;�sY��\n�K3;�:�F9 ��1�����F�NKۮ9V�b�2��lN\0��\\ĩu�%A�W1�Q3*�E��WXz�*�*�@��,�D��g�e�!�fT��e5Z&x\Z6�TX��A�J)��HJ�^4�-�oʬ�@�6:GY���|��V\Z���DC#Jh�u��Y[a�,�K��`�5t��\0��/�r���ڵ-��/1Wl[� -}�E��	�AkV��R�-�z�[���J��*�+�zi��E(�QP����������6�\Z�X`�!\0�1��0�\Zw�1-��?q��|��a�a\rE�`k]:`Gz�~b��	b��+h������&\\��jƩ^:���p�\\��<P�/�ǓdU\n���&�en+e^�C3T���Gj��2��s�X��w���Mr��[U�b�Xq.���m���r�9���,\n�	��]�L���}�T�Uc��D����W���k�j�����<e�K�S�[�Rh\0U� ��\\\0�./ĶOη(j���/Q�+w4�1`��� `��~�5�n��b����L�	H��\0(b(��*.O}L2�X\"�pP����A��K����j%���\'.��A��~��PXt�A��AIN�يdsSK��|m/��Kec&�P����7��Y��D�\"3��Sh�FM�\0�රq.RB�P��0�ڋ�O�\0��q+-	���E�G���[U���u��@�P�De\Z�\0]�S�ȗM�^�{�&a���>:�w�ZTDS��Q��+h*�~�%��ЦB���6��f�8.+�\'�bP\"AE$���K(b9x�#\"��\0D�%�i�,`eR�к��&�\0(|�cO:�ы��U[U��?��Y�+P��e��W�ܡ��YE? �Z��\0t`*���@��e�G[�C�Ajqq�4/2=~MǮ�Út_+������8h��G�*]U֭	g\r\\c�jԪ�ʭ�s��Ĳ1�(��6@1�N�T/��<��k��t5����V��B���v-gp��+�	�F���p�|���JMW�����`S��aKi�63e��w �n����H5ioAÒƞ� <�	�� Z�,�*<K�-�n^	��[��P\r�ǔ�@*+g��\\)�0=0�(��bE;�#�M�q��e�Fj�-t�Py.��s��f�1DA�9~�J�0ƺ�Hm���F�O���D�me��v��PyK�}GŢ�Ub��/��f���l��!�ȷ�Tq�Up/�l�q/uR�⌛�w	P����ڤ������J�F������dR�#��ځ�Up`�z�lM��V����+�1l`��_E�3� 1Z��ܕ�R��a�8�[�>�v�W2�<�����侜��X��DRi4�K�SۢEEĥ�ܰE�[#��c�%I�����ή%�E�G8ekLV�V��u�es-{�9`TKr\n���ݔtSb�Sap���ܼe��k�p��ǚs����r�����f��5Kԧ߁B���n���I�-��W8kH�<G�����ھJ��W*����ܱ�a�z LJ��c�~P�p�jhZ�v#�Bǘ� \0*\r��P��[�\r��v�[^��(�3R�\n���K�(+�S8;4]�\r���ގ2&�3V�(F�5(Q��u@I�%+�0i�T�J�� ��D5�񹾥����`f�2C&�\\O\\�y����\"]F��x\0es�b,�r��4���\0 �JaE�XsQGs =�;y������!�9!X��x`\nڨ�W.e6w�q� ���i�[b���>��|6�{��,`��5Z���h�+Z�^�W�r�77!W2���������(ؓɤ\0Q;\n�V��7y�.��)~�Q�*%���Y�Y���-O��oU<��c�5\\ķ1i�ɶs�/pR��Wh��H�����K\Z�\"�5r�:����`?�����e1cB%���D�Ik��^��2򉘊�6%���f\n�`g^?�g���	IN3�J�9PxRW��-��`g��?�pۭQo��L\r���%1��2㸺�<�ˊ����p��Zu1Q}�x�*���EU��_�kjh���,������ ��N\"es_�B�$p�Ͱ��nP�e�U+��\n�^�Df��U��J*��A\r�`=��\n%8Qw\r�;S)��W�\ZI�*��N�t%/�h�K�1^e�p�˩qe�Q�z�����.��>��*k��h�|���=�]�å^��e�<��^e�fW��#�����l�ӻ�*&���x|��g����k>\nZ�^��.V��mj���r�X\"i+����a�t��˴4`^���hŌ��K�p��PK�Yr��cO�Ҍ/�V>�bc��+�Y��(K[2Ŭ	�ܼ�m��̪��QP�DF�O$y�@�Xe)��8��AT���yb�,����+��*�(�Ne �3����Wh?��B�o5�\n��!�:�tj�5�B@)�H?δ>> ,{�E���j9�3���zQ���R���0T]�M�(�H���$Hfh����x�\Z�(�����|=DXp��D��?��','Zenitsu Kimetsu no Yaiba Breath of Thunder 4K HD….jpeg¿¿image/jpeg',NULL);
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
REPLACE INTO `contenidoLibro` VALUES (49,'Di no a los vicios.',68,1,NULL),(1,'El poder del aire',69,1,NULL),(17,'Aprende a alimentarte',70,1,NULL),(65,'El poder de la comunicación.',71,1,NULL),(33,'Recargar Fuerzas a través del descanso',72,1,NULL),(59,'Relaciones humanas efectivas.',73,1,NULL),(25,'La riqueza del agua',74,1,NULL),(9,'La importancia del ejercicio',75,1,NULL),(73,'Confianza en el Dios Todopoderoso.',76,1,NULL),(41,'Actitud mental positiva',77,1,NULL),(9,'Los hermanos de Mowgli',83,7663,NULL),(16,'Las lecciones de Mowgli',84,7663,NULL),(22,'Los Bandar-log',85,7663,NULL),(888,'TEMA1',86,766,NULL);
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
  `año` int(4) NOT NULL,
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
  PRIMARY KEY (`idEstudiante`,`año`),
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
REPLACE INTO `diasEstudio` VALUES (1,'Lunes',NULL),(2,'Martes',''),(3,'Miércoles',NULL),(4,'Jueves',NULL),(5,'Viernes',NULL);
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
  `año` int(4) NOT NULL,
  `idEntregante` int(30) NOT NULL,
  `idRepresentante` int(30) NOT NULL,
  `zapatos1` bit(1) NOT NULL DEFAULT b'0',
  `uniforme1` bit(1) NOT NULL DEFAULT b'0',
  `utiles1` bit(1) NOT NULL DEFAULT b'0',
  `zapatos2` bit(1) NOT NULL DEFAULT b'0',
  `uniforme2` bit(1) NOT NULL DEFAULT b'0',
  `utiles2` bit(1) NOT NULL DEFAULT b'0',
  `comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`,`año`),
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
  `estudianteComentario` varchar(145) DEFAULT NULL COMMENT 'Detalle de la información de los estudiantes y sus representates.',
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
REPLACE INTO `estudiante` VALUES (16018,'',0,'cvxbvcvbcvbxc',3,3.00,'\0','Padre#Madre#Abuelo/a#Otro¿ yop','','','','Padre','','Noveno Grado','','Centro Escolar','','',1045367070,1045367070,1045367071,''),(16019,'',1,'',0,2.00,'\0','Padre#Madre¿ ','\0','','','madre','','Noveno Grado','','centro escolar','','',1045367072,1045367074,1045367072,''),(16020,'',1,'',2,20.00,'\0','Padre#Madre¿ ','\0','','','hermano','','Noveno Grado','','65cñjxj xf o uz uhzl zllzi','','',1045367075,1045367076,1045367077,''),(16021,'',1,'no hay',1,1.00,'\0','Padre#Madre¿ ','','NINGUNA','','PADRE','','Noveno Grado','','CE SAMAFI','','\0',1045367078,1045367078,1878979878,''),(1045367070,'',0,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'Padre','\0','6','padre',NULL,'','',NULL,NULL,NULL,''),(1045367072,'',1,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'madre','\0','5','Domésticos',NULL,'','',NULL,NULL,NULL,''),(1045367075,'',0,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'hermano','\0','8','opǘfh ṕfci',NULL,'','',NULL,NULL,NULL,''),(1045367078,'\0',0,'ADS',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'PADRE','\0','6','ADSF',NULL,'','\0',NULL,NULL,NULL,'');
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
  `año` int(4) NOT NULL,
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
  `FaceCulminación` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `actitudicionales` longtext NOT NULL,
  `resumen` varchar(250) DEFAULT NULL,
  `propuestaMejora` varchar(145) DEFAULT NULL,
  `evaluacionMaestroComentario` varchar(145) DEFAULT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  PRIMARY KEY (`idMaestro`,`fechaHora`,`gradoModalidad`),
  KEY `fk_evaluacionMaestro_1_idx` (`idMaestro`),
  KEY `fk_evaluacionMaestro_2` (`grado`,`seccion`,`año`,`gradoModalidad`),
  CONSTRAINT `fk_evaluacionMaestro_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_evaluacionMaestro_2` FOREIGN KEY (`grado`, `seccion`, `año`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoAño`, `gradoModalidad`) ON UPDATE CASCADE
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
REPLACE INTO `expedientePS` VALUES (16018,'dñsfjsjnfdlavn avsi oiva siasij vp{a sj{sdjvp',''),(16019,'aualdskf',NULL);
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
REPLACE INTO `financiamiento` VALUES (1,'MINED',NULL),(2,'CDE',NULL),(3,'Alcaldía',NULL),(4,'ONG2',NULL);
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
  `gradoAño` int(4) NOT NULL,
  `aulaGrado` int(30) NOT NULL,
  `gradoActivo` bit(1) NOT NULL,
  `gradoMaestroGuia` int(30) DEFAULT NULL,
  `gradoCoemntario` varchar(145) DEFAULT NULL COMMENT 'Historico de los grados y secciones junto a los maestros que han sido sus maestros guías.',
  PRIMARY KEY (`idgrado`,`gradoSeccion`,`gradoAño`,`gradoModalidad`),
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
  `gradoAño` int(4) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `fechaEvaluacion` date NOT NULL COMMENT 'histórico de evaluaciones a cada grado del instituto.',
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
  PRIMARY KEY (`idGrado`,`gradoSeccion`,`gradoAño`,`gradoModalidad`),
  KEY `fk_gradoEvaluacion_2_idx` (`evaluador`),
  CONSTRAINT `fk_gradoEvaluacion_1` FOREIGN KEY (`idGrado`, `gradoSeccion`, `gradoAño`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoAño`, `gradoModalidad`) ON UPDATE CASCADE,
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
  `maestoCargoComentario` varchar(145) DEFAULT NULL COMMENT 'Histórico de los cargos que los maestros tienen o han tenido dentro de la institucion.',
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
  `maestroComentario` varchar(45) DEFAULT NULL COMMENT 'Detalle de la información de todos los docentes de la institución.',
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
REPLACE INTO `maestro` VALUES (1045367084,124596,884545,544548,2131331,315388,2,3,'Confía',2356546,'4444-4444',1,'1986-01-24','2020-01-24',NULL,'M','2','',1,'',6,'\0','','\0',''),(1045367085,8778878,78787,78787,787,787,1,1,'Confía',784555485,'3333-3333',2,'2020-01-24','2020-01-24','2020-01-24','V','1','',1,'',5,'','','',''),(1045367086,7899646,65456456,56464,456456,65464,2,3,'Crecer',87945613,'2222-2222',7,'2020-01-24','2020-01-24','2020-01-24','T','2','',1,'',3,'\0','','\0',''),(1045367087,31132321,321312231,312123123,321231123,123312312,1,3,'Crecer',354563,'1111-1111',5,'2020-01-24','2020-01-24','2020-01-24','T','1','',2,'',15,'','','','');
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
REPLACE INTO `materia` VALUES (1,'Matemática','MAT',1,'c0d6c8'),(2,'Lenguaje','LEN',1,'bfc4de'),(3,'Inglés','ING',1,'9dc4ae'),(4,'Informática','INF',1,'c4b0c4'),(5,'Estudios Sociales','EE.SS',1,'8e8cb3'),(6,'Educación Físiaca','EE.FF',1,'e6ddaf'),(7,'Ciencias Naturales','CC.NN',1,'cae3cb'),(8,'Moral, Urbanidad y Cívica','MUC',1,''),(9,'Orientación Para La Vida','OPV',2,'a9aed6'),(10,'Seminario','SEM',2,''),(11,'Curso de Habilidad Laboral','CHL',2,''),(12,'Tecnología I','TG1',3,''),(13,'Tecnología II','TG2',3,''),(14,'Tecnología III','TG3',3,''),(15,'Práctica Profesional I','PP1',3,''),(16,'Práctica Profesional II','PP2',3,''),(17,'Práctica Profesional III','PP3',3,''),(18,'Laboratorio de Creatividad I','LC1',3,'f0b8f0'),(19,'Laboratorio de Creatividad II','LC2',3,''),(20,'Laboratorio de Creatividad III','LC3',3,''),(21,'Contaduría','CTD',4,'b5c4ae'),(22,'General','GNL',4,'e8d0e8');
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
  CONSTRAINT `fk_matricula_1` FOREIGN KEY (`matriculaNivel`, `matriculaSeccion`, `matriculaAnyo`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoAño`, `gradoModalidad`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `idMateria` int(30) NOT NULL COMMENT 'Detalle de las materias y horarios que cada docente imparte en la institución.',
  `idHorario` int(30) NOT NULL,
  `diaSemana` int(30) NOT NULL,
  `idGrado` int(30) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `seccionGrado` enum('A','B','C') NOT NULL,
  `añoGrado` int(4) NOT NULL,
  `mestroHorarioMateriasComentarios` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idMaestro`,`idMateria`,`idHorario`,`diaSemana`,`idGrado`,`seccionGrado`,`añoGrado`,`gradoModalidad`),
  KEY `fk_mestroHorarioMaterias_2_idx` (`idMateria`),
  KEY `fk_mestroHorarioMaterias_4` (`idGrado`,`seccionGrado`,`añoGrado`,`gradoModalidad`),
  KEY `fk_mestroHorarioMaterias_3_idx` (`idHorario`),
  KEY `fk_mestroHorarioMaterias_5_idx` (`diaSemana`),
  CONSTRAINT `fk_mestroHorarioMaterias_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idmateria`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_3` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idhorario`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_4` FOREIGN KEY (`idGrado`, `seccionGrado`, `añoGrado`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoAño`, `gradoModalidad`) ON UPDATE CASCADE,
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
REPLACE INTO `notificaciones` VALUES (888,'2020-02-03 14:48:56',1045367084,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 07:15 AM - 08:05 AM Materia: Estudios Sociales. Profesor: María Dolores. Grado: 1° TVC Contador Sección A','',' '),(889,'2020-02-03 14:54:12',1045367085,1045367073,'Seha editado el horario','Modificación: Miércoles 08:05 AM - 08:55 AM Materia: Informática. Profesor: Francisco Magaña. Grado: 3° TVC Contador Sección B','',' '),(890,'2020-02-03 14:59:25',1045367087,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 07:15 AM - 08:05 AM Materia: Tecnología I. Profesor: María Pineda. Grado: 1° TVC Contador Sección B','\0',' '),(891,'2020-02-03 14:59:53',1045367087,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 08:05 AM - 08:55 AM Materia: Tecnología I. Profesor: María Pineda. Grado: 1° TVC Contador Sección B','\0',' '),(892,'2020-02-03 15:00:16',1045367084,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 08:05 AM - 08:55 AM Materia: Estudios Sociales. Profesor: María Dolores. Grado: 1° TVC Contador Sección A','',' '),(893,'2020-02-03 15:01:01',1045367086,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 07:15 AM - 08:05 AM Materia: Ciencias Naturales. Profesor: Juan Bartanes. Grado: 1° General Sección B','\0',' '),(894,'2020-02-03 15:01:19',1045367086,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 08:05 AM - 08:55 AM Materia: Ciencias Naturales. Profesor: Juan Bartanes. Grado: 1° General Sección B','\0',' '),(895,'2020-02-03 15:05:59',1045367085,1045367083,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 07:15 AM - 08:05 AM Materia: Curso de Habilidad Laboral. Profesor: Francisco Magaña. Grado: 2° General Sección B','',' '),(896,'2020-02-03 15:06:43',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 08:05 AM - 08:55 AM Materia: Curso de Habilidad Laboral. Profesor: Francisco Magaña. Grado: 2° General Sección B','',' '),(897,'2020-02-03 15:11:07',1045367085,1045367083,'Se ha eliminado una nueva hora clase del horario','Elimnación: Miércoles 08:05 AM - 08:55 AM. Materia: Informática. Profesor: Francisco Javier Francisco Magaña. Grado: 3° TVC Contador Sección B','\0',' '),(898,'2020-02-03 15:11:48',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 08:55 AM - 09:15 AM Materia: Inglés. Profesor: Francisco Magaña. Grado: 1° TVC Contador Sección A','',' '),(899,'2020-02-03 15:13:03',1045367084,1045367083,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 08:55 AM - 09:15 AM Materia: Estudios Sociales. Profesor: María Dolores. Grado: 1° TVC Contador Sección B','',' '),(900,'2020-02-03 15:13:19',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 09:15 AM - 10:05 AM Materia: Inglés. Profesor: Francisco Magaña. Grado: 1° TVC Contador Sección A','',' '),(901,'2020-02-03 15:14:15',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 10:05 AM - 11:10 PM Materia: Matemática. Profesor: Francisco Magaña. Grado: 1° General Sección A','\0',' '),(902,'2020-02-03 15:14:25',1045367085,1045367085,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 03/02/2020 y 03/02/2020','\0',' '),(903,'2020-02-03 15:14:26',1045367083,1045367085,'Solicitud de permiso nueva','Francisco Javier Magaña Arriola ha solicitado un nuevo permiso.','',' '),(904,'2020-02-03 15:14:33',1045367084,1045367084,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 03/02/2020 y 03/02/2020','',' '),(905,'2020-02-03 15:14:33',1045367083,1045367084,'Solicitud de permiso nueva','María Pilar Dolores ALvarado ha solicitado un nuevo permiso.','',' '),(906,'2020-02-03 15:16:18',1045367085,1045367083,'Rechado de permiso','Laura María López Suñiga ha rechazado su solicitud de permiso. Motivo del rechazo: necesita una constancia','\0',' '),(907,'2020-02-03 15:16:26',1045367084,1045367084,'Cancelación exitosa','Ha cancelado la solicitud de permiso con fechas: 03/02/2020. La razón del cancelamiento es: 4.','',' '),(908,'2020-02-03 15:17:59',1045367085,1045367085,'Modificación de solicitud de permiso','Su permiso se ha solicitado para entre las fechas: 03/02/2020 y 03/02/2020','\0',' '),(909,'2020-02-03 15:17:59',1045367083,1045367085,'Modificaciones en una solicitud de permiso','Francisco Javier Magaña Arriola ha cambiado su solicitud de permiso.','',' '),(910,'2020-02-03 15:18:16',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 11:10 AM - 12:00 PM Materia: Matemática. Profesor: Francisco Magaña. Grado: 1° General Sección A','',' '),(911,'2020-02-03 15:18:31',1045367085,1045367083,'Aceptación de permiso','Laura María López Suñiga ha aceptado su solicitud de permiso. ','',' '),(912,'2020-02-03 15:20:44',1045367084,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 09:15 AM - 10:05 AM Materia: Estudios Sociales. Profesor: María Dolores. Grado: 1° TVC Contador Sección B','',' '),(913,'2020-02-03 15:21:34',1045367084,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 10:05 AM - 11:10 PM Materia: Tecnología III. Profesor: María Dolores. Grado: 3° TVC Contador Sección B','\0',' '),(914,'2020-02-03 15:21:57',1045367084,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Martes 11:10 AM - 12:00 PM Materia: Tecnología III. Profesor: María Dolores. Grado: 3° TVC Contador Sección B','\0',' ');
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
REPLACE INTO `pais` VALUES (1,'Afganistán',''),(2,'Islas Gland',''),(3,'Albania',''),(4,'Alemania',''),(5,'Andorra',''),(6,'Angola',''),(7,'Anguilla',''),(8,'Antártida',''),(9,'Antigua y Barbuda',''),(10,'Antillas Holandesas',''),(11,'Arabia Saudí',''),(12,'Argelia',''),(13,'Argentina',''),(14,'Armenia',''),(15,'Aruba',''),(16,'Australia',''),(17,'Austria',''),(18,'Azerbaiyán',''),(19,'Bahamas',''),(20,'Bahréin',''),(21,'Bangladesh',''),(22,'Barbados',''),(23,'Bielorrusia',''),(24,'Bélgica',''),(25,'Belice',''),(26,'Benin',''),(27,'Bermudas',''),(28,'Bhután',''),(29,'Bolivia',''),(30,'Bosnia y Herzegovina',''),(31,'Botsuana',''),(32,'Isla Bouvet',''),(33,'Brasil',''),(34,'Brunéi',''),(35,'Bulgaria',''),(36,'Burkina Faso',''),(37,'Burundi',''),(38,'Cabo Verde',''),(39,'Islas Caimán',''),(40,'Camboya',''),(41,'Camerún',''),(42,'Canadá',''),(43,'República Centroafricana',''),(44,'Chad',''),(45,'República Checa',''),(46,'Chile',''),(47,'China',''),(48,'Chipre',''),(49,'Isla de Navidad',''),(50,'Ciudad del Vaticano',''),(51,'Islas Cocos',''),(52,'Colombia',''),(53,'Comoras',''),(54,'República Democrática del Congo',''),(55,'Congo',''),(56,'Islas Cook',''),(57,'Corea del Norte',''),(58,'Corea del Sur',''),(59,'Costa de Marfil',''),(60,'Costa Rica',''),(61,'Croacia',''),(62,'Cuba',''),(63,'Dinamarca',''),(64,'Dominica',''),(65,'República Dominicana',''),(66,'Ecuador',''),(67,'Egipto',''),(68,'El Salvador',''),(69,'Emiratos Árabes Unidos',''),(70,'Eritrea',''),(71,'Eslovaquia',''),(72,'Eslovenia',''),(73,'España',''),(74,'Islas ultramarinas de Estados Unidos',''),(75,'Estados Unidos',''),(76,'Estonia',''),(77,'Etiopía',''),(78,'Islas Feroe',''),(79,'Filipinas',''),(80,'Finlandia',''),(81,'Fiyi',''),(82,'Francia',''),(83,'Gabón',''),(84,'Gambia',''),(85,'Georgia',''),(86,'Islas Georgias del Sur y Sandwich del Sur',''),(87,'Ghana',''),(88,'Gibraltar',''),(89,'Granada',''),(90,'Grecia',''),(91,'Groenlandia',''),(92,'Guadalupe',''),(93,'Guam',''),(94,'Guatemala',''),(95,'Guayana Francesa',''),(96,'Guinea',''),(97,'Guinea Ecuatorial',''),(98,'Guinea-Bissau',''),(99,'Guyana',''),(100,'Haití',''),(101,'Islas Heard y McDonald',''),(102,'Honduras',''),(103,'Hong Kong',''),(104,'Hungría',''),(105,'India',''),(106,'Indonesia',''),(107,'Irán',''),(108,'Iraq',''),(109,'Irlanda',''),(110,'Islandia',''),(111,'Israel',''),(112,'Italia',''),(113,'Jamaica',''),(114,'Japón',''),(115,'Jordania',''),(116,'Kazajstán',''),(117,'Kenia',''),(118,'Kirguistán',''),(119,'Kiribati',''),(120,'Kuwait',''),(121,'Laos',''),(122,'Lesotho',''),(123,'Letonia',''),(124,'Líbano',''),(125,'Liberia',''),(126,'Libia',''),(127,'Liechtenstein',''),(128,'Lituania',''),(129,'Luxemburgo',''),(130,'Macao',''),(131,'ARY Macedonia',''),(132,'Madagascar',''),(133,'Malasia',''),(134,'Malawi',''),(135,'Maldivas',''),(136,'Malí',''),(137,'Malta',''),(138,'Islas Malvinas',''),(139,'Islas Marianas del Norte',''),(140,'Marruecos',''),(141,'Islas Marshall',''),(142,'Martinica',''),(143,'Mauricio',''),(144,'Mauritania',''),(145,'Mayotte',''),(146,'México',''),(147,'Micronesia',''),(148,'Moldavia',''),(149,'Mónaco',''),(150,'Mongolia',''),(151,'Montserrat',''),(152,'Mozambique',''),(153,'Myanmar',''),(154,'Namibia',''),(155,'Nauru',''),(156,'Nepal',''),(157,'Nicaragua',''),(158,'Níger',''),(159,'Nigeria',''),(160,'Niue',''),(161,'Isla Norfolk',''),(162,'Noruega',''),(163,'Nueva Caledonia',''),(164,'Nueva Zelanda',''),(165,'Omán',''),(166,'Países Bajos',''),(167,'Pakistán',''),(168,'Palau',''),(169,'Palestina',''),(170,'Panamá',''),(171,'Papúa Nueva Guinea',''),(172,'Paraguay',''),(173,'Perú',''),(174,'Islas Pitcairn',''),(175,'Polinesia Francesa',''),(176,'Polonia',''),(177,'Portugal',''),(178,'Puerto Rico',''),(179,'Qatar',''),(180,'Reino Unido',''),(181,'Reunión',''),(182,'Ruanda',''),(183,'Rumania',''),(184,'Rusia',''),(185,'Sahara Occidental',''),(186,'Islas Salomón',''),(187,'Samoa',''),(188,'Samoa Americana',''),(189,'San Cristóbal y Nevis',''),(190,'San Marino',''),(191,'San Pedro y Miquelón',''),(192,'San Vicente y las Granadinas',''),(193,'Santa Helena',''),(194,'Santa Lucía',''),(195,'Santo Tomé y Príncipe',''),(196,'Senegal',''),(197,'Serbia y Montenegro',''),(198,'Seychelles',''),(199,'Sierra Leona',''),(200,'Singapur',''),(201,'Siria',''),(202,'Somalia',''),(203,'Sri Lanka',''),(204,'Suazilandia',''),(205,'Sudáfrica',''),(206,'Sudán',''),(207,'Suecia',''),(208,'Suiza',''),(209,'Surinam',''),(210,'Svalbard y Jan Mayen',''),(211,'Tailandia',''),(212,'Taiwán',''),(213,'Tanzania',''),(214,'Tayikistán',''),(215,'Territorio Británico del Océano Índico',''),(216,'Territorios Australes Franceses',''),(217,'Timor Oriental',''),(218,'Togo',''),(219,'Tokelau',''),(220,'Tonga',''),(221,'Trinidad y Tobago',''),(222,'Túnez',''),(223,'Islas Turcas y Caicos',''),(224,'Turkmenistán',''),(225,'Turquía',''),(226,'Tuvalu',''),(227,'Ucrania',''),(228,'Uganda',''),(229,'Uruguay',''),(230,'Uzbekistán',''),(231,'Vanuatu',''),(232,'Venezuela',''),(233,'Vietnam',''),(234,'Islas Vírgenes Británicas',''),(235,'Islas Vírgenes de los Estados Unidos',''),(236,'Wallis y Futuna',''),(237,'Yemen',''),(238,'Yibuti',''),(239,'Zambia',''),(240,'Zimbabue','');
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
REPLACE INTO `permisos` VALUES (1045367084,'2020-02-03',3,'2020-02-03','2020-02-03',4,NULL,'3',1045367084,'0¿¿1¿¿¿¿4'),(1045367085,'2020-02-03',1,'2020-02-03','2020-02-03',4,NULL,'1',1045367085,'1¿¿0¿¿¿¿');
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
  `personaComentarios` varchar(250) DEFAULT NULL COMMENT 'Detalle de la información relevante de todo el recurso humano de la institución.',
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
REPLACE INTO `persona` VALUES (16018,'Francisco Antonio','Regalado Cruz','1999-01-16','Texistepeque Santa ana','7000-0001',0,1,'02#13','8d2a5f7d4afa5d0530789d3066945330','Estudiante',8,'','','\0',0,'Salvadoreña','yopooopo@gmail.com','',''),(16019,'Rigoberto Alexander','Cárcamo Murga','1998-08-13','santa ana texistepeque','',0,2,'02#13','5218f316b3f85b751c613a06aa18010d','',8,'','','\0',0,'Salvadoreña','','',''),(16020,'Andrea Johana','Pleitez Alcántara','2000-09-23','santa ana metapán','',0,2,'02#07','ac2a728f9f17b5d860b6dabd80a5162f','Estudiante',8,'','','',0,'Salvadoreña','','',''),(16021,'ANA','GONZALEZ','1992-01-15','texis','7776-7767',0,1,'05#05','b075703bbe07a50ddcccfaac424bb6d9','',8,'','1246-545645-456-4','',0,'Salvadoreña','gasd','NO',''),(1045367070,'Jorge Agustín','Pereira cruz','1988-12-04','6666666666666666','7888-8888',0,0,'01#01','ab8a338aa2b1da6d97c11ba6e67be768','',9,'','','\0',0,'Salvadoreña','666666666666666','',''),(1045367071,'Sandra Andaya','Cruz Fuentes',NULL,NULL,'4564-5656',NULL,NULL,NULL,'cd9187113425eae93d8116205d03bdde',NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1045367072,'Ana Lidia','Cárcamo Flores','1975-07-15','texistepeque santa ana','6666-6666',0,1,'02#13','7845e7b45be70d2391a2b16c2ffb68e3','',9,'','','',1,'Salvadoreña','','',''),(1045367073,'Guillermo Aldolfo','Delsas Murcia','1991-01-17',NULL,NULL,0,NULL,NULL,'02951a6cb9595ef475fed783e59c687e','Ingeniero de Sistemas Informáticos',1,'','0213-170191-102-9','',NULL,'Salvadoreña','guillermox020@gmail.com',NULL,NULL),(1045367074,'Adán Rigoberto','Flores Colsí',NULL,'','4555-5555',0,0,' # ','630abdfb00098f16ba48450363d8d64d','',11,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367075,'Pablo José','Martínez Córdova','1985-11-22','santa ana texistepeque','9999-9999',0,0,'02#13','13f93ad73a8401c8735cc30fd70c7698','',9,'','','\0',0,'Salvadoreña','','',''),(1045367076,'Juan Sigfredo','Arriola Sagastume',NULL,'','6444-4444',0,0,' # ','ea519761c0e00b5ae877cbfce9ce697a','',11,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367077,'Venancia María','Rosales Mata',NULL,'','7856-4666',0,0,' # ','2161b146f79c6a1b733b60a8e0ef7175','',10,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367078,'ALGO','KJL','2020-01-09','AASDF','7676-7676',0,0,'06#03','b5f3b2cc02b99130ed22362b7af8f69f','',9,'','7989-898987-987-9','\0',1,'Salvadoreña','ADSFADS','',''),(1045367080,'María Carmen','Peña Cárcamo','1990-06-20','santa ana santa ana santa ana','9999-9999',0,1,'02#10','6e80cf219e79bc8a8d83ce9a5b757f64','Licenciada en administración de Empresas',6,'','9999-999999-999-9','',0,'Salvadoreña','99999999999@gmail.com','',''),(1045367081,'Hugo Daniel','Flores Diaz','1989-08-12','ahuachapan ahuachapan','8888-8888',0,1,'01#01','ad9f88eb26394a8ad9f46975cf79a133','Abogado',5,'','8888-888888-888-8','\0',0,'Salvadoreña','888888888@gmail.com','',''),(1045367082,'José Antonio','Murcia Pérez','1979-07-15','sonsonate sonsonate','7777-7777',0,1,'03#01','5f04b909d4b1bca2e6e57dbbf7208c51','profesor',7,'','7777-777777-777-7','\0',1,'Salvadoreña','77777777@gmail.com','',''),(1045367083,'Laura María','López Suñiga','1960-04-15','santa ana el porvenir','5555-5555',0,1,'02#05','a6ba5f99ff9616298b2212c76ea111dc','profesora',2,'','6666-666666-666-6','',1,'Salvadoreña','555555555@gmail.com','',''),(1045367084,'María Pilar','Dolores ALvarado','1956-01-13','santa ana texistepeque','4444-4444',213,1,'02#13','0c979466ac54e4b96f3f5c832e126941','profesora en matemáticas',4,'','4444-444444-444-4','',1,'Salvadoreña','444444444@gmail.com','',''),(1045367085,'Francisco Javier','Magaña Arriola','1988-05-25','santa ana coatepeque','3333-3333',206,0,'02#03','ff0c210fd0f86b21bc0497faef184c7b','profesor',4,'','3333-333333-333-3','\0',0,'Salvadoreña','333333333@gmail.com','',''),(1045367086,'Juan Manuel','Bartanes Pilar','1990-11-15','cuscatlan monte san juan','2222-2222',780,1,'05#05','f59bc51b847690dce791fce5f7179e04','Administrador de empresas',4,'','2222-222222-222-2','\0',1,'Salvadoreña','222222222@gmail.com','',''),(1045367087,'María Dolores','Pineda Mata','1983-07-15','santa ana metapán','1111-1111',210,1,'02#07','ee17cb731e48303aafe44cfe78c25853','profesora',4,'','1111-111111-111-1','',1,'Salvadoreña','111111111@gmail.com','',''),(1045367088,'Laura Isabel','Pneda Rosell','1981-05-10','santa ana santa ana','0000-0000',0,1,'02#10','c95b8be4befbee1a550a06fd19ed251a','Psicóloga',14,'','0000-000000-000-0','',1,'Salvadoreña','00000000@gmail.com','',''),(1045367089,'Álvaro Mateo','Cienfuegos Altamirano','1970-12-12','santa ana Texistepeque','4444-4444',0,0,'02#13','d5367241b0f4893393b6bc984029e999','Jornalero',15,'','4444-444444-444-4','\0',1,'Salvadoreña','444444444@gmail.com','',''),(1045367090,'Pablo Alejandro','Martínez Santos','1960-03-01','sonsonate acajutla','9999-8888',0,0,'03#01','8912074c9b782911ff4f5585c747c132','Técnico en reparación de computadoras',12,'','9999-999888-888-8','\0',1,'Salvadoreña','999988888@gmail.com','',''),(1045367091,'Alba Lucía','Aybara Campos','1988-12-30','cuscatlán cuscatlán','8888-8999',0,1,'05#02','f0ee269fcf3f4b1f8883aab03e6a7919','Secretaria',13,'','8888-888888-999-9','',1,'Salvadoreña','888888899999999@gmail.com','',''),(1878979878,'ASD','RRR',NULL,'','6565-6556',0,0,' # ','8f6f215a557810bac37011f69ba876bf','',10,'\0',NULL,'',0,'Salvadoreña',NULL,'','');
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
REPLACE INTO `recurso` VALUES (1,'10 pasos para una mejor calidad de vida',100,3,1,68,'',10,'B','REAL','1',NULL),(2,'Cañon multimedia',NULL,1,1,NULL,'',325,'B','ESTIMADO','',NULL),(6,'Microscopio',NULL,2,3,NULL,'',356,'B','ESTIMADO','',NULL),(98,'No me agarran viva',900,3,1,68,'',3,'B','REAL','10',NULL),(766,'HOLALIBRO',0,3,1,2,'\0',67.8,'B','REAL','1234',NULL),(1140,'Luciernagas en El Mozote',800,3,1,68,'',12.85,'B','REAL','11',NULL),(1890,'El Arte de amargarse la vida',100,3,1,68,'',20.9,'B','REAL','1',NULL),(7663,'El libro de la selva',700,3,3,73,'',19.99,'B','REAL','2',NULL);
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
REPLACE INTO `tipoCargo` VALUES (1,'Fondos Propios',NULL),(2,'Actividades de la institución',NULL),(3,'Donación',NULL);
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
REPLACE INTO `tipoEspecialidades` VALUES (1,'Matemáticas',''),(2,'Ciencias Naturales',''),(3,'Educación Física',''),(4,'Ciencias de la Educación',''),(5,'Lenguaje',''),(6,'Ciencias Sociales',''),(7,'Administración y Ciencias Comerciales',''),(8,'Inglés',''),(9,'Informática','');
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
  `tipoMateriaNombre` varchar(50) NOT NULL COMMENT 'Listado de los tipos de materias que se imparten en la institución.',
  `tipoMateriaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idtipoMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoMateria`
--

LOCK TABLES `tipoMateria` WRITE;
/*!40000 ALTER TABLE `tipoMateria` DISABLE KEYS */;
REPLACE INTO `tipoMateria` VALUES (1,'Área Básica',NULL),(2,'Área Aplicada',NULL),(3,'Área Técnica',NULL),(4,'Modalidad y Opciones',NULL);
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
  `tipoNombramientoNombre` varchar(60) NOT NULL COMMENT 'Listado de las formas en las que se uede nombrar el cargo de un docente dentro de la institución.',
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
REPLACE INTO `tipoPermiso` VALUES (1,'Enfermedad',8,NULL),(2,'Materindad',0,NULL),(3,'Paternidad',0,NULL),(4,'Faltar a clases',0,NULL),(5,'Salir temporalmente de la institución',0,NULL),(6,'Retirarse de la institución',0,NULL),(7,'No portar uniforme',5,NULL);
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
REPLACE INTO `tipoProyecto` VALUES (1,'Proyecto Planificado',''),(2,'Exposición De Alumnos',''),(3,'Clase De Docente Con Tecnología','');
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
REPLACE INTO `tipoRecurso` VALUES (1,'Tecnológico CRA',NULL),(2,'Laboratorio de Ciencias Naturales',NULL),(3,'Bibliográfico',NULL);
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
REPLACE INTO `tipoReserva` VALUES (1,'Uso en sala',NULL),(2,'Uso dentro de la institución',NULL),(3,'Uso en aula',NULL),(4,'Uso fuera de la institución',NULL);
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
  `idzona` int(30) NOT NULL AUTO_INCREMENT COMMENT 'La Identificación de la zona geográfica (1°, 2° y 3°) en la que está dividido el instituto.',
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
