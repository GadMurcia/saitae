CREATE DATABASE  IF NOT EXISTS `intex` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `intex`;
-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: intex
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB-0+deb9u1

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
REPLACE INTO `acceso` VALUES (9,'AdministraciÃ³n',NULL,'#','fa fa-cog'),(10,'Sistema',9,'tipopp.intex','pi pi-folder-open'),(11,'Permisos y Licencias',9,'lictp.intex','pi pi-th-large'),(12,'AcadÃ©mica',9,'academico.intex','fa fa-leaf'),(13,'Perfil',NULL,'#','pi pi-user'),(14,'Permisos',45,'#','pi pi-eye'),(15,'Solicitar Permiso',14,'permisoE.intex','pi pi-briefcase'),(16,'Personal',NULL,'#','pi pi-users'),(17,'GestiÃ³n de maestros',27,'agregacion.intex','pi pi-user-plus'),(18,'GestiÃ³n de administradores',16,'agAdm.intex','pi pi-plus'),(19,'Plantel Institucional',35,'plantel.intex','pi pi-table'),(20,'Inventario',23,'inventario.intex','fa fa-barcode'),(21,'Libros',23,'libros.intex','fa fa-book'),(22,'Nuevo Ingreso',36,'inscripcion.intex','pi pi-user'),(23,'Recursos',9,'#','fa fa-yelp'),(24,'Nomina de Alumnos',36,'nominaA.intex','pi pi-user'),(25,'GestiÃ³n de Recursos',23,'admRecurso.intex','fa fa-table'),(26,'Lista de Representantes',35,'listaRepresentantes.intex','pi pi-list'),(27,'Maestros',16,'#','fa fa-puzzle-piece'),(28,'GestiÃ³n de horarios',27,'horario.intex','pi pi-plus'),(29,'GestiÃ³n de permisos',14,'permiso.intex','fa fa-legal'),(30,'Solicitud de permisos',14,'permisoM.intex','fa fa-ge'),(31,'Administrador de anuncios',9,'anuncios.intex','fa fa-bell'),(32,'Matricula',36,'matricula.intex','fa fa-slideshare'),(33,'Entrega de Ãštiles',36,'paquetes.intex','fa fa-sliders'),(34,'Contribuciones',36,'contribuciones.intex','fa fa-money'),(35,'Listados',16,'#','fa fa-list-ul'),(36,'Alumnos',16,'#','fa fa-graduation-cap'),(37,'Reservas de Equipo',45,'#','fa fa-gamepad'),(38,'Solicitud de Reserva',37,'solicitudR.intex','fa fa-flag'),(39,'Historial de Reservas',43,'solicitudH.intex','fa fa-archive'),(40,'Gestionar Reservas de equipo',37,'srCra.intex','fa fa-certificate'),(41,'Historial de Notificaciones',43,'notifh.intex','fa fa-forumbee'),(42,'Proyecto Planificado',37,'solicitudRPP.intex','pi pi-pencil'),(43,'Historiales',13,'#','fa fa-folder-open'),(44,'Historial de permisos',43,'permisoH.intex','fa fa-database'),(45,'Solicitudes',NULL,'#','fa fa-street-view'),(46,'Ãrea psicolÃ³gica',45,'#','fa fa-ambulance'),(47,'Solicitud de cita psicolÃ³gica',46,'solicitudCP.intex','pi pi-bookmark'),(48,'AdminitraciÃ³n citas pscolÃ³gica',46,'admCitasPs.intex','pi pi-calendar'),(49,'Consulta PsicolÃ³gica',46,'consultasPS.intex','pi pi-window-maximize'),(50,'Historial citas PsicolÃ³gicas',43,'citasPSH.intex','fa fa-file'),(51,'Horario de clases',13,'horarioCl.intex','fa fa-calendar'),(52,'Aspecto de la aplicaciÃ³n',13,'temas.intex','fa fa-picture-o');
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
REPLACE INTO `accesoTipoPersona` VALUES (9,1,''),(9,2,''),(9,3,''),(9,5,''),(9,6,''),(9,7,''),(10,1,''),(10,2,''),(11,1,''),(11,2,''),(11,3,''),(12,1,''),(12,2,''),(13,1,''),(13,2,''),(13,3,''),(13,4,''),(13,5,''),(13,6,''),(13,7,''),(13,8,''),(13,9,''),(13,12,''),(13,13,''),(13,14,''),(13,15,''),(14,1,''),(14,2,''),(14,3,''),(14,4,''),(14,5,''),(14,6,''),(14,7,''),(14,8,''),(14,9,''),(14,12,''),(14,13,''),(14,14,''),(14,15,''),(15,8,''),(15,9,''),(16,1,''),(16,2,''),(16,3,''),(16,4,''),(16,12,''),(16,13,''),(17,1,''),(17,2,''),(18,1,''),(18,2,''),(19,1,''),(19,2,''),(19,3,''),(19,13,''),(20,1,''),(20,2,''),(20,5,''),(20,6,''),(20,7,''),(21,1,''),(21,2,''),(21,5,''),(22,1,''),(22,2,''),(22,3,''),(22,4,''),(22,13,''),(23,1,''),(23,2,''),(23,5,''),(23,6,''),(23,7,''),(24,1,''),(24,2,''),(24,3,''),(24,4,''),(24,13,''),(25,1,''),(25,2,''),(25,5,''),(25,6,''),(25,7,''),(26,1,''),(26,2,''),(26,3,''),(26,4,''),(26,13,''),(27,1,''),(27,2,''),(28,1,''),(28,2,''),(29,1,''),(29,2,''),(29,3,''),(30,1,''),(30,2,''),(30,3,''),(30,4,''),(30,5,''),(30,6,''),(30,7,''),(30,12,''),(30,13,''),(30,14,''),(30,15,''),(31,1,''),(31,2,''),(31,3,''),(31,4,''),(31,5,''),(31,6,''),(31,7,''),(31,13,''),(32,1,''),(32,2,''),(32,13,''),(33,1,''),(33,2,''),(33,12,''),(34,1,''),(34,2,''),(34,12,''),(35,1,''),(35,2,''),(35,3,''),(35,4,''),(35,13,''),(36,1,''),(36,2,''),(36,3,''),(36,4,''),(36,13,''),(37,1,''),(37,2,''),(37,3,''),(37,4,''),(37,5,''),(37,6,''),(37,7,''),(37,8,''),(37,13,''),(38,1,''),(38,2,''),(38,3,''),(38,4,''),(38,5,''),(38,6,''),(38,7,''),(38,8,''),(39,1,''),(39,2,''),(39,3,''),(39,4,''),(39,5,''),(39,6,''),(39,7,''),(39,8,''),(40,1,''),(40,2,''),(40,5,''),(40,6,''),(40,7,''),(41,1,''),(41,2,''),(41,3,''),(41,4,''),(41,5,''),(41,6,''),(41,7,''),(41,8,''),(41,9,''),(41,12,''),(41,14,''),(41,15,''),(42,1,''),(42,2,''),(42,4,''),(43,1,''),(43,2,''),(43,3,''),(43,4,''),(43,5,''),(43,6,''),(43,7,''),(43,8,''),(43,9,''),(43,12,''),(43,13,''),(43,14,''),(43,15,''),(44,1,''),(44,2,''),(44,3,''),(44,4,''),(44,5,''),(44,6,''),(44,7,''),(44,8,''),(44,9,''),(44,12,''),(44,13,''),(44,14,''),(44,15,''),(45,1,''),(45,2,''),(45,3,''),(45,4,''),(45,5,''),(45,6,''),(45,7,''),(45,8,''),(45,9,''),(45,12,''),(45,13,''),(45,14,''),(45,15,''),(46,1,''),(46,8,''),(46,14,''),(47,8,''),(48,1,''),(48,14,''),(49,1,''),(49,14,''),(50,8,''),(51,4,''),(51,8,''),(51,9,''),(52,1,''),(52,2,''),(52,3,''),(52,4,''),(52,5,''),(52,6,''),(52,7,''),(52,8,''),(52,9,''),(52,12,''),(52,13,''),(52,14,''),(52,15,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
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
REPLACE INTO `autor` VALUES (1,'Rusou 1',''),(2,'loosss','8'),(3,'Delsas',''),(4,'Lic. Julio Zelada',''),(5,'Museo de la palabra y la image',''),(6,'Rudyard Kipling',''),(7,'Gabriel AlegrÃ­a',''),(8,'D.J. Flakoll',''),(9,'Paul Watzlawick','');
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
REPLACE INTO `autorLibro` VALUES (4,1,''),(5,1140,''),(6,7663,''),(7,98,''),(8,98,''),(9,1890,'');
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
  `capacitacionComentario` varchar(145) DEFAULT NULL COMMENT 'HistÃ³rico de las capacitaciones que cada maestro de la instituciÃ³n ha hecho.',
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
  `cargoNombre` varchar(50) NOT NULL COMMENT 'Lista de los cargos que el personal docente puede desempeÃ±ar.',
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
REPLACE INTO `cargo` VALUES (1,'Director',2,''),(2,'Subdirector',3,''),(3,'Coordinador de Ã¡rea bibliogrÃ¡fica',5,''),(4,'Coordinador de Ã¡rea InformÃ¡tica',6,''),(5,'PsicÃ³logo',14,''),(6,'Coordinador de laboratorio de CC.NN',7,NULL);
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
REPLACE INTO `categoria` VALUES (0,'Generalidades s',NULL),(100,'FilosofÃ­as y Disciplinas afines',NULL),(300,'Ciencias Sociales',''),(400,'Leguas',''),(500,'Ciencias Puras',''),(600,'Ciencias Aplicadas',''),(700,'Bellas Artes',''),(800,' Literatura',''),(900,'Geografia e Historia','');
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
  `extenciÃ³n` varchar(100) NOT NULL,
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
REPLACE INTO `constancias` VALUES (16020,'2020-01-27',4,'2020-01-27','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Š\0\0e\0\0\0]fÓÛ\0\0\0sBIT|dˆ\0\0\0tEXtSoftware\0gnome-screenshotï¿>\0\0 \0IDATxœìÝw\\S×ûðOØ{‰€UPÄ½\'Ñ*Šâf¸°¸îªÕŽ_­£Uk[Zë–:p€Šj_g¸Å\"¸p\"@@òûˆ	ÜÜÜ„„xÞ¯W_…Ü“sž3’ï½yàI$	8HKO‡›«k©Ÿ+‚ŠoU@sBÔAë†îèõRu¤¥§#\'ÏDî±u5R·Fj!„B!•m	!„B#Ú(B!„F´Q$„B!Œh£H!„BÑF‘B!„0¢\"!„BaDEB!„Âˆ7`ô\rN	·	!„Bˆ~Z4G>Áö×K24R¯‘‰Ñg\Z©ˆB!„”¿¼ü¥ÓÔþŽ.=B!„T`hïâ0m	!„B#Ú(B!„F´Q$„B!Œh£H!„Bé:\0RZÌ\ZG¹ßßfIpùŽ»ö	+0–)\0¯2p)YŒ}ñBˆ…Ÿnlµ°5@ßÞø¼©1ì­\rñ.«\0’Åˆ?(‚ˆ_ÀØn~ñ®\0n‰qèˆPÚ®l¹ð	oã–}Üá3„ô¶D«úÆ01âáÙ›$œÍÆÿNå(ìo±’õ+*ÿ±\0xÇÿˆ+wó±w¿P®O<\0¿-®G[Þ\n0iÎ;H\näëS%FÙ˜xÀˆáVèái†³Éb¬ÿƒ­¿Ucà>\0`fe€žæðjn\n\'D¹<yñ‡Ne#ù_±Â6!„M bPÍ†‡€¦016lä3–1à.öèãc+sž´œ©?Ì°ÃgŽŸN;Ù ·Z70Æ7K3å6•ÅŒ€šŽÐÕžMñí²L¹Í\"¶Ž†X<ÝÖŸÚ®û™!&\r¶‚™)IÇ²UªOC º­!;¢š\r¿®Ê’s«oG[rÄØ[À½¡1ßÍ+sŒFÆ<Œm\r¯f&8q)›·\nJm@™¨2¦V<ü0Ëµª*kkÁC´ð0ÆZ[!Î$if	!„&´QÔcáÞ€g\0¸74Æ“mÑ¾©160”\0# AS|;ÖF®\\ ¿>s4À‹·XÃÇÓÔ|Ôªc„ÉC­áêdˆ\0Äï–ªÓÄŒ÷ÆjW\'Cø÷(]N™ @X[à~Z>ÖlàCÖGøv6GPgS|VýÓÒ+îƒ¢3•lãSÜ÷úMLðÝ84÷0–+Ó¾\0`ÿß9ó7‡g+S¹\"×e™˜ó0u‚\rZycß?9Ø»KÀ91*óÑ+Àµª ã}Öîâ#õa>LLyèÖÍ[™ÂÑî!„¢]ôI£ï\n\0ÃÂóóÙ‹—ËÎýôX‡f&\0€?bx|7âl	ßÍÃ†½\0€WsÆºÄ9Ü¿)ÆúØÂrZ0—cÓ¦Aá¦mó~^¿È‡X(Á‰#\"L™ûÛ·3ŸUWq©oåOëulaAŽG‰ È‘ cSðÊ£…­æM³E+cl;\"B¬\n›D@µùèÐÜTZöÁÍÂ²‚ÌÄíbÆ7ï°?Vµ;!„¢*:£¨ÇJÞ‹÷¿ä<¥e\0`ïÉO—#k]âüï‘üsSî:k(9+õ¸¨œ³½êÿ¦¨nW¸%{‘öQåçrQ²ïž}DôŽO—kÕ5‚‹½þ¹ž‹¼	®Ü£KkS¸Ö7BÚÃ|µbünš-\\ñò}N¨qé\\•ùpv(ŒíÑƒÒóN!„”:£XdçJpâRöÝcóó¾Ü}kÅ÷Íñx<¹rÅ¿J”œ+>KYÀPN¶FÃJ’”úA»\\ª ZuCéïíÛž‘»|«ðK—oþ¿]KSiUc42äaËaœí1ÜJåÕ™™²1kåþ#„B´‰Î(ê1.÷ê—		³B°j:âºÌñçoPÇÅõ\Z\ZÉ}K¶nýÂ©úšýõ^š}&S.ÿ£F†<Ø8\ZâÃ›Â3qN…;EqÞ§ÎË·pu2DÚ†xr_Éus5ÈÞ£Ø¨…	æ²ÁÈ¾V˜~ù\0 c‹Â\ráÌaÖÀ0kéó:µ4Å¾¢Ë¶ªÆ8wÉ{ˆ…˜šðêgŽÿ|ü­Â™EUæãù›Ôv6„G#Ü¾Jßp&„RþèŒb%qüo\n$@__s˜Z~:uþFácÔ\0+x41†‰9u\ZcÔ€Â³açnä2ÖghÔkbŒQýK—K/ÚÌîkskXÙ`èÀÂr)Ï>]Â½\\ô¥‘ˆ~V¨æb\0sü-°ôÿÐ§Ÿ¥¦º\0((jÖÁª°ï.µ\rQÓ‘yy×¨f€\ZuÕŠ±øÉã„¸r/‘},Q¯‰q©rŠ¨2ç‹Î„Žh…zÍŒadÂCÄŒ·˜³\"“s{„BHYÐÅJâýË\\º#F‡¦&èÞÍ‡ãE\0€cÇEðnmW\'C,˜d+÷œÇÏ?âäñÒgÃJ^ÒüïåG$ÉÜ÷x I„iáÖèÚÆ]ÛÈ\\Æ•\0{Ž‰¤¿9*‚okS4t3ÂÊoäêÌrÈ%£Ó¥×·7WžEßvŽ9‘Cû?}é#°†X }k3Ä§\nÕŽQR\0¬ÝÄÇÂ9v˜aÙK?àÃëO›ä’±ŸýTe>ŽÁ»¥)jU7ÀäËÀÿ4––B‘Eg+‘CE÷&ÊžUgKðýò8ô¿¼ù A~Aabî}ÿä`ÁŠLä‹™oÎ“H\n}ÇŸÍÁ‚_>@œó©Üå³¹øe÷Óó!Ê‘ KP€òðÃº,Ü»ñé©ðC¾Yž‰®ç‚/*@®X‚”g±\"F€STu\'?p:·ÞÇÙ±è[Úÿ^Ë‘+{­èŒ]ññ²Ä˜Í/À²?>ÀÌ”‡cl`dÂc-¨6¹B	¾_–‰ø39Èx_€ü€/*Àµ‡yøõ/Ñ™EB!ZÆÿºœ¾j@!„B4Mœÿ‹æ8Ë=öý2C¥UCg	!„B#Ú(B!„F´Q$„B!Œh£H!„Båå¿Ðu„B!DM<”Îº¡©ýO\"QöGÜ\n¥¥§ÃÍÕµÔÏAE‹·* 9!ê uCwôz©:ÒÒÓ‘“g\"÷XƒºÎ\nJ«†.=B!„F´Q$„B!Œh£H!„BÑF‘B!„0¢\"!„BaDEB!„Âˆ6Š„B!„m	!„B#Ú(B!„F´Q$„B!Œh£H!„BÑF‘B!„0¢\"!„BaDEB!„Âˆ6Š„B!„m	!„B#Ú(B!„F´Q$„B!Œh£H!„Bñž¤¥I¸¬íæ¦íX!„Bˆ\Zî§¼”ûÝÌX¬‘zÜ\\]9îÔ}-\0àÜÉñÒŸ+‚ŠoU@sB!ÚuþäTxuÿU×arpîäøR©²¿cc¤JaxŒ?W-Þª€æ„B´‹ÞgIYÑ=Š„B!„m	!„B\0€Œ×‹ê:½AEB!„\0óæuƒ±±!æÍ?ªëPô†J÷(B!„TVLÔuz‡6Š„BÁ™c÷ñ[\0°u°ÀèHOxµ­…jvæÈÉÍÇÕÛ/±jý<O}Ï©Žâã%eç!°ßf|,\0ÇCÂþXYšÈ•\0CØ=ö6fŠò4x+òsóåÚòòuÇ¨!íP§¦-ÞffãPâlÛ|’	c\0P¯‰ÆôDóFN\0€ë·_bíæKH½÷¦ÔøÌ\\pO§*¬K×ñP¥ÎòFEB!„H)Ú üø}´jìŒ¹‹OââÙT|î]ßLõÅÄÑŸcÞ¼£rÏUu³can÷Õr÷5j×wnKjãå\n{3<}™…Z.6ø¼£ÎýýXz¼EûZøi^œ¾ø“fÄaìèÖà[ÿ¼ÌXgÕ°ni¤gd!tÔnðx<üº¸\'6,FÄ”}xšò^®|hßÒMWÊÆA:ËÝ£H!„¥šx8\0®^yŠ<ñGœMJŸÒM¢ºró>B(£eËÏ\0\0-Z|¾ bñÇRe¿h\0\0øiå\0@@ÑïÅÂ´\0lÝu\rÙ|1¶Æ\\ÃË×B8Øš+lÿË!í`bbˆU/â}†\0ï^ò±zÓE˜š\Zadx[¹²BQjºXÃµ^µ2õYÛujm	!„¢Tòƒ×\0€UËû _HKÔiP\ršHÓhld€«·_¢]‹Âb›f5píÎK˜˜Ê•3³0o‡Ú¸ûè\r®_zŠ{)oàÝÞ6¦Ò2õÜ\0\0iE—Âß½äcPøvüúËi…í·jæ\0¸—üJúØä\0@ÛæŸÉ•µ07Fìá;Ô·™ºÝ-Eujm	!„\"uæÄX¹ÿŠ}ûãI$üý5]¬1}Tl[=1[ÂP¯‰S™Ú3àñpùú3´iêC´i^®<-UÎ»‹;L\rqâLá¥æã§ÃÈÐ\0>¾u¥elÍ\0\0¹¢<ÎíÛXn4Eü\\écÅ?ÛÉlB€ÇßƒŸw]XµÅ…¢1-Kå…îQ$„è0zl¸»Ùãë¯è:\ZBª,E÷Ó}x+ÄâEIøÉÐ\0õ\ZWGH¿æèÑÙó¦ùbäè=ejóâ¥tLí…ÎÝ<`oc†‹WÒK•éYt™9j¤\'¢FzJìZÇÞ\0¼y/ÂgÎÖ053FŽˆÛß:~Ÿ•G;sXÙ˜\"ë}6\0ÀÊºpÃö63»TyAf6N]LEÏ^!‘nô”Qv¢:u–:£HÑ”¿ŒŠ¡àc$g`éòÂË¹Ÿ9[—¹Îç©ïñâ•\0!ÁÍþ\"¯Ò?È·w²DÛ5ú,>~ë¤ÿ=yömšÕ€½³\0 ù~áåc·ºö\0\0§š6Ø¾9Ã#Û+lûòõg\0€¦-\\¤5næ\0¸Xt¬¤ØÉÔ¢lîg.•ÑFš@EBˆ^Xøc\"Ö¬<\'MaAÑ/ß}×GãFÂË×F&†ðò©\0¸tã¹Fê?w%\rÍ\Z8áÜ•´RÇº}Q<Žÿ“\"÷øÉ³ÁãÝºÖ\0lÛs$Ö\ZæÖ&Ö\ZµkÚ¢€å}eKÌ5äääcâÈÏáø™5ì­0a¤\'DÙyØ\Zsñ9)w_ãÍ{!,-ŒËÐcí×©	zqéÙÂÖ›V÷GÈÐXÙ™cãêþ<d‡®Ã’*y?Á›Ìl\\½ù«Ö_Àûc¾ ×ïfà×ÕçðêY–\\us7©R·ìsB1®Ýy‰?¶\\Æ÷ßÈÕ¥,\'×z;.ã¨‰f\0÷bÅT]O\0ók@•¶Ë;™ºc®jŠUÆVQ›\0àÑ¤:Æü\\:&Wo¿ÄúM—c—}ž²ySÔ?.ñª“÷NÝxØæ™ËøqYSD±’c\\<¶k7\\\0otÌ™ìÛ¹¦ÈŠ‘pêV­ýŸFÚ=9{6Á†ËÎ_Ô\0œ:óŸÜã§N§ 2¤5¿¨Ø×‘zï\r¦wã#ÚãÐÎáxó^„5Û.cç6æ\r\0<ûïÆÎŠÇ„QŸã¯uƒQ\0	®ß~‰ù‹ñ2-SáóvÅ\'£ÙÌ/8õMÑ˜–¥Îò¢Å¦Íœqó^á7Œ\Z5sÂ»/u3¿uàðàÝÍ‹¾ê†jö˜:=¾Tð\0¯Îîøy~XÏ2Áä©qŒõ©š»I•ºeŸãâf‡ÅßøáåÁørZÒ~z³T–“Šk=„.ãX–fªäSw=)z\rèsþ2uÇ\\]\\ÆVQ›nõ±nY0ÒŸ}ŽÉŠ…=±~Y0FLÞ\'÷•â)c¼%qÍ{§N<ló¬l¯êš\"Ÿ(›—WÏ²ðý÷ÇËTWÉÇe¿t6UîwÙŸ#Ç0ß™úàm©:¯^HÃè¥ÏJ²ÅöøÞkÌœyHás˜žwêØCø{¨Òs4QgyÓé¥ç\ZµípæÄXüò}\0|ëáÌ‰±Xñ]áÏá#Ú*¯@$\\ø§ð_4ë9*(\\9_¸Hy((Õr7©Z·¬—i™X³ùRQ½mäŽ)ËIÅµÂºãÈ%‡™Ê9ÄÔXOŠ^úœ¿L\'kW±€‘ám`jlˆ5›/}\Z“Íaff„C´»\nñª’÷NUeÍ)§Öû*!D!n_<)¼)õúí—ørÚéÏÃ&ïEÌ–ušB<Þ_x\0\0þM~¡°\\ûŽµ\0·î¿RXF•ÜMªÖ]RòÍÂXÛ¶¨!}ŒKN*.õÕ©3Ž\\r˜©“CLÕõ¤è5 ïùËt±vÕy­¶i^8&woËŒÉ­Â1ißRñû‚&p—kÞ;u”užÕ}_%„0Óù¥gCxÔ¶ÇÞHN{øN×a1*¾ÔñA‹ÄsÿaÅÊs\nË\0À•›ÏñÃOI\nëS%w“ªu—”+*¼ïÐZæòSNªFŽðñ­+M5À¥¢:¶qTt/Ë·?žÄ„±Ÿ£‹WLÕ\0þ\"ß.IÄ£;…ŠªäSg=±½Ê+ÙžÍ¡X÷ÇEÎmSgÌÕÅelµÉ4&ÙÂ¢1±V/Çš²þ©ºŠóÞÒVš÷îíÿ¢³gí2ÇSÖyVõ}•ÂNçE·úHyòùâ¨ÓÈŸf¢àc®ÃbÄåÃÃÇoŒLp$v2³r‘ùZ¨°¬ª¹›T©»$+ûÂz33s¤qÉIÅ¥¢:¶q,K3Urˆ©³žØ^úš¿¬˜:c®..c«¨Í·ï³áìhÉ8&oÞ‰¤åJõ¿èçIéowr¹OJÕµÀ%ï[{lÊ2Ïª®)B;^zÚÛV@«¦.8sb,¶­€–œqæÄX¸Õç~O¾ÉÏÍÇé+iø¢S8Õ´QXNÜM\\ë.©I“Âz/Ý,¬—kN*eõõ”eÙr˜©šCLÝõÄDßó—•÷ÚUwlo?(G¦1¹vûÓ¥þ×ï\n7sÅÉÁÖÁ\0ðâÕ§o¡k3^eyïÊJÝyVgMBÓéFq×ö«8yö?Ì\\p>~ëpüt\nf/<¿uþµ§Î<†‡ý›+,£Nî&®uË²w¶Â˜aí““-EõrÍI¥¬¢:uÇ‘K3urˆ©ºžÑçüeºZ»êŒíÎý·ð±@RjLrrò±m×§Øcî\0\0ú÷oSKc„…µ\0lÛ{£ÜâeË{WVêæ”S÷}•ÂLç—ž›7rÂ¯+Ï\0Z4vÁªuçu‘f\\º˜±ø#‚{4ÄæÍWäî—)¦nî&.u;sb,ró>âæ,üå”4µ×œTÊê!ªá2ŽeÉa¦N1UÖ}Î_¦î˜s=®ÛØ*ªóîõ˜·ä$¢\";`ÿ–p\0@òƒWˆšX.µË®×a``€>Ý`Ä€–x–!À’5gqøÀm•ûÇ%^&lyïØh3§œºkŠ”?.¹@Íå”çæš¯¶*áI$7´0äñàÝ=\Z\0pöä8éÏAE‹·* 9!D¹[Báö™-‚‡ÅàÝK¾®Ã!ÌÿNNAÇî¿é:…¸lë4¨†?WôCzF¦ÍMæÅü¬º•\\^L¹çÉä½~û¥\\NÐvÞµ±â»\0iîà9‹NÈå^ù{_Æ|µWn=—KE¦oÎž‡û)ò9¨ÔuÖHÝô\'ü!DOÅ¿\0Ð·)éíšT=šÎ7¬,w0—|µU\r½óBˆžÚ¿ç&\'=Äà^Mq8vD©¼™„TvšÌ7Ì%w0—|µUÎïQ$„Â,OüK\'a‰®!D‹ýýn@³ù†¹äæ’¯¶ª¡\"!„Bt†éÅbšÌ7Ì%w0—|µU\r]z&„Bˆ^ÒT¾aUs³å«­jh£H!„½¤©|Ã\\ssÉW[ÕÐF‘B!z©8/æË7üµn0vnŒ|ŒžÏ9ß°…µ)kî`àSnáµ.àÂµg˜3Ù\'ã¿Ä´1^H8õ?¯øGK=Ôt\"!„BÊS¢u¦Çß{™3©TW®0Ýzmþ9†ùþÂÔoåžûêY¾ÿþ8k[U\rQ$„B!Œh£H!„BÑF‘B!„0¢\"!„BaÄ{’–&áR°¶››¶c!„B!j¸ŸòRîw3c±Fê5rsuå\\8ï\0Æ?—þ\\T´x«šBÑ.Ë.>ž:£ë0H90îøy©ÇTÙß±Q)=Çcü¹\"¨hñV4\'„¢]ô>KÊŠîQ$„B!Œh£H!„BÑF‘B!„0¢\"!ZÄ	áèýûtŠVTöþBHU§Å˜´|)œ{ú£iX’þ½¢õ63ù|ôž55‚Ñ{Öt|äŽÿuò8,|½•Öcäå‰c/0;{óŒ¼<5/“‡âaäå‰èûã*0mŠÖbÐ¶~é3¦¹ž¸l)¾‹qýúë \"ÅdcåºFË£Ú|½hSE{RY(ú¬ÖÅ¾¢²Ò‹âq`inŽ{;÷à»Q£ðý†?´Þæ’m[Ð±yÜß‹N-ZâçÛ¤ÇÎÞ¼[A,VžƒÈÆÊ\nÑûöB\")ŽråžÝ°³±ÑhÜ²6ÆÇ#*,Æ±–ûïù3­Å \r\\û¥oòÏ_*õØÖo¿G¯Žt\rwLqs-WúW*ÚkŒÊ€í³ZûŠÊJ/6Š»“Nbˆ\0ìml0¸›N¯]§õ6]¼ˆ]»ÂÆÒ}}»à¸ÌYÁËwï`Ñ¸	œêÉàæâ‚½§’äO8ÿ?8ÙÛ#3+KúXÉ³%F^žxŸ•…¦a!È.±Ð…99h\Z‚÷2Ï—uåÞ]ð³EøyRÄyy8Ÿ|‹±\\çqc’–#/O|³n-\0 ñÊe´ŽêþÝÑrX¸Â3¢º ¬_÷ÓÓÐrX8jöé…-GÃ)À‰Ùb1\\ûaÁ¦?áà\0xþæ\rzNŸ\nçÀð‹š„L>_i=\0ûø¼ÎÌDðW3ààÏÈ\\º{GzLv~Ÿ¾z¿¨Ipé€/&O@êË\0€±nÁAØz4uú£v¿>Øqüh©qPg]°õ÷î“T´9n}{ãàYù¼j²q—Wÿ¸ÄÅÖY9b1jöé…ÇÂ½0Ü‚ƒ°ýØl8‡:ýƒáÖ··\\lóËÖfìß‰h>$ŽþÝÑfÄ0œºv@é×ÓZT4^lõBØ±}Vëb_QYéÅFñÁ“4Üýï1êôÆç‘¸û$Uëm>•šN.\0\0W\'g¤gdHM	S©®ñbáæÍÈ/(\0\0H$ü¸éON—ãìmlÐ£ClM8,÷øš½{àå{g$×íß‡ñÁÈÀ\0Âz—iOG¯Px6hÁØñ\0€Y+ÇcÆ\"ý`¦„„bÚŠ_8÷UÛ”õkîêUèçÛwbváò;dgƒÇãÁÌØ¢œlH\n\n\Zw\00cå¯hâîŽG{÷£]ãÆ˜¿>Zi=\0ûøÌ^½Mëz eßÌ>QË—2öãëè5h×¸1îÙïæ-0/z\r\0ÀÔØ‘É))¸µ=Ë&GáÇMK=_uÁÖßo¢×¢·7nÇìÄµ÷ŽyõK\\lý‘ejl¡P„[áæö,Ÿ2sW¯Æ½ÔTÜÚƒåQSäb`›_¶6§ÿö+þœÿ-ž>Š™C‡bîšU\0J¿Æ˜Ö¢¢ñb«—ÂŽí³ZûŠÊJ/6Š|·RãÖözuÄŒß~Õz›¢Ü\\˜›˜\0\0ÌLL ÌÎV»®FnµQÇÅ[\n?ö$Du;;4u¯ËéùSBB½ŸôŒ– [„õöcJ(ó‹ “ÏÇéë×0<°\'\0`X`OœO¾…·\nÎ>–tuË6ôêØ	f&&âˆzòâÒ¯+wï`Ü€°µ²ÂäÁ!ÒK<ø|ŒîÛ¦¦\0€s×¯cFøPX[XbjH¯\\VZÀ>>Iÿ^Á”Á¡°¶°Dß®¸°ac_ÎÝ¸)¡a°¶°ÄÄƒq19Y\Zg–@€YC†ÁÚÂ}||ñTæ)²T]lý½|ï.ÆõkKDöfž€rîŸ²¸Øú#‹ÇãA JËöññÅ‹×¯0gxclóËÖ¦£­üs\nÏß¼F¸Ÿ?ÎÿÁ¼f\\‹\nÆK•z	!Üéb_QY©ô—Y´ÅÊÊ\nÃzö„µ…%¦…†£Qè ­·iaf†l±¦¦ÈÎÍ•¹y™ê‹\n	ÅøŸ— ÔÏ7oÂŠ©Ó9?·ŽK\r4uwÇÓÿ Ÿo¬Ù·Þ-[ÁÍÉ™±üæ„CHIKƒM¹Ç·$ÂôÐp¥íý}õ_Ì^‹”gO‘]†\r²¦qéW–@ˆj6¶\0\07g—Ru¸88HˆDp\r\n”þ.{¿([=lã“ÅçÃÁÖVi_2ùYp´µ\0T³³+u©¸º]á1Scc…s êº`ë/_ ž…t,j›IyöOY\\lýa\"Û&\08õ£dlóËÖfì’ŸðÓÖ-è2aœíí±tR:·n£0ÙµÈ6^ªÖKQNûŠÊJ/6Š5«W_(PxÙÖØÐPëmº:» ýU\Zºº!-#µkÔ(S}]Û´…ƒ\r¾Zõ;,ÌÌðEÛv¥Ê˜››CœŸ##¼|ÿNîØôð!è?ç+x·l…è}{·t¹Â¶6:ˆ›íB“:îÒÇî§§aÐÜÙ˜¦ôO6E.\\€ÆŒE°Og\0€}·®ªtUk¸ôËÊÒ8ÚÚâÙ«Ògªdûîhg‡\'qamaYª[=lãcoc‹—ïÞÂµºk_lmñ63Îx›™ÉióÅD•u¡¬¿ï³²àdoŒkOVy÷-.¶þ”Ûü²µ€Éz\0\0 \0IDATY·ÆgX7{.$	¶;‚Q‹âÁî½\nÛ‘]‹lã¥j½„åt±¯¨¬ôâÒsooüuü>øm÷NthÞBëmvè€Ø¤Dd	…ˆMJD@¯2×9iÐ`lŒÃäÁ!ŒÇ]ªUÃ¡3§Á	±|ÇvXÉ|µiÐj×Á ysÐÜÃÍëz0Ö‘xå2¬Ì-ä6S\0ÐÐÕ\rvVÖŒ—çÜkÕÂ£§éÈÍË\0xÔ¬…†nµ‘›—å1;PÓÅž¦«ÛmàÚ¯æØ\0YB!~ß½‹µÎ®íÚcyÌsr°á`ü§FI±ÕÃ6>ÝÚ·Ç²íÛÉçcOÒI´ÎØ¶O«ÖXµgÙ\"¬Øï–­T€ûºPÖßVõëcCüðEBlŒƒIÑm%•wÿØâbëOY°Í/[›ÇÅîÄÈûøî5kÉe:(ù\Z+‰m¼Øê%„¨GûŠÊJ/6ŠÓBÃðßóç¨?°N]»Š¥“5óÀfÖÐá¸|\rCâÚýû˜>DzÌÈËSú\rOÙŸ•ôEw|Þ¼9}Ññø¼‘_bêo+Ð4<-êÕƒ•¥¥Ü‡ÂÔPœ½zÓÂ†0>\0ÖÇ@Hw?Æc!ÝýðG|é”2{-A¿Ù³PPá—kO˜ˆ~³¿‚Ï¸ÑèÔ²¾êN£#9õQ[¸öë‡1c±ýHš\rƒwË–¬u.37>„Ç€¾X‹ù#¥ÇØêaŸEã\'\"åÙSÔØK¶nÅª™³¶}þv2ê\rìëâÇ¢/©ƒËºPÖßcÇcwR\"š†… uÃF°27gÜ”wÿØâbëOY°Í/[›ó\"FbáæM¨ÑÓ~Z,w{IÉ×X©~²Œ[½„ÅØ>«u±¯¨¬xŽÿ|åñxÒ<jF^žœs¯éƒŠïîÄXµgô[”•™&æ$ãÝ;´‰†gñ‡•.‡z´¥*­BˆæXøzCôÏY]‡AÊ‘—\'î§¼”{¬A]æûÙU¥g«º¼qæú5Ì^½\nß£ëpôÚ ysWtù~YÌv´nÐ@§õh­B!º¦_f©ê\\{ š­-¾Åø%òID¯ Ì^õ;^½{‡&X7çkÖ£M´.!„è\ZmõÀÛã‰º¡ÂèÕ±“Fþdœ¦êÑ&Z„Bt.=B!„F¼\'iiœ¾ÌRÛÍMšºB,+L¯¡*Z¼UÍ	!„h½ÏVb±¸Ô—YÌŒÅ\nJ«†¾õLt‚æ„B´‹¾õ\\uÐ·ž	!„BH¹£\"!„BaDEB!„Âˆ6Š„B!„m	Ñ\"¾HÏÈDïß§ëP´¢²÷è­/BtO/6ŠÅÌ[ö?mËäóÑ{ÖtÔ\nDïYÓñA ;þ×Éã°ðõVZ‘—\'Ž]¼ÀxììÍZíËÆCñ0òòDôýŒq˜6Ek1h[¿ôÓ\\O\\¶ßEŽÆ¸~ýu‘b²±r]£åÑ¿²¾^TY;ê¶U–ñb¢É×gy¼wª¢¬ñèëë‡èEŸÕ_<‡_Ô$8÷ôGû/GàÂídDW9èÅF1ÿü%é«¾šƒA=zh½Í%Û¶ có¸¿+Z´ÄÏ;¶I½y·=‚X¬<‘•¢÷íS–¡•{vÃÎÆF£qËÚ¨°pl<ÇZî¿çÏ´ƒ6pí—¾aJ÷³õÛïõþ/ÀpMSTúWk§,ãÅ¤¢½>Ë“¾­/¢_Ø>«Ç-YŒ®mÛâñ¾8Œî‡¨_–é ÂÊA/6ŠÅÞfeá÷];±l’öÏ€»x»v…¥%úúvÁq™³‚—ïÞÁ¢q8Õ“%ÀÍÅ{O%É=žpþp²·GfV–ô±’ÿº6òòÄû¬,4\rAv‰….ÌÉAÓ°¼—y¾¬+÷î‚Ÿ-ÂÏ“¢ ÎËÃùä[Œå:ƒ”´4yyâ›uk\0‰W.£mÄpT÷ïŽ–ÃÂžÕeýºŸž†–ÃÂQ³O/l9rN~H$È‹áÚ\'6ý	§\0?\0Àó7oÐsúT8ö€_Ô$dòùJëØÇçuf&‚¿š§\0?xFFàÒÝ;Òc²óûôÕ+øEM‚K¯\0|1yR_¾\0\0äˆÅpÂÖ£	¨Ó?µûõÁŽãGKƒ:ë‚­¿wŸ¤¢ÝÈpëÛÏž‘{žlÜåÕ?.q±õ‡‰²µ£¨­±5ûôÂŽãGáÞ?nÁAØ~ì6ŒCþÁpëÛ[®Åã ¬¯²ãûw\"š	…£w´1§®]PúõÉ´ŽÙÖ#Ûø)š#U_+Šbg¢©ùTÔgUc×ç÷:RvlŸÕ!~~˜6–ffóóÃ“/Ê9ºÊC¯6Š¿íŒAˆŸjV¯®õ¶ž¿Ê@M\'\0€«“3Ò32¤Ç¦…„©T×ø±pófä\0\0$	~Üô\'§Ë%ö66èÑ¡¶&–{|ÍÞ=ðò‚½‚3’ëöïÃøƒ`d`€	a½‚Km§£×(<»±`ìx\0À¬•¿ã‡1c‘~0SBB1mÅ/œûªmÊú5wõ*ôóí‚;1»pùÎ²³Áãñ`flQN6$H;\0˜±òW4qwÇ£½ûÑ®qcÌ_­´€}|f¯^‰¦u=²ï\0æ¨åKûñuô\Z´kÜ÷ì…wó˜½\0`jlH„ä”ÜÚƒe“£ðã¦¥ž¯Îº`ëï7ÑkÑÇÛ·cvâÚƒû\nÇ¿¼úÇ%.¶þ0Q¶vµejl¡P„[áæö,Ÿ2sW¯Æ½ÔTÜÚƒåQSû J_§ÿö+þœÿ-ž>Š™C‡bîšU\0J¿>™Ö1Ûzd?Es¤êkEQìL45ŸŠú¬jìúü^GÊŽí³:2¨ÌŠþ*Í‰Ë—Ðºa£ò\n«ÒÑ›¢ [„Ø¤$LZ.í‰rsa^´ˆÌLL ÌÎV»®FnµQÇÅ[\nß¸ö$Du;;4u¯ËéùSBB½ŸôŒ– [„õöcJ(ó‹ “ÏÇéë×0<°\'\0`X`OœO¾…·\nÎ>–tuË6ôêØ	f&&âˆOR9=OÛ¸ôëÊÝ;7` l­¬0ypˆô’ÇÃ>£ûö‡…©)\0àÜõë˜>Ö–˜\Z†Ä+—•Ö°OÒ¿W0ep(¬-,Ñß·+.lØÄØ—s7n`Jh¬-,1qà`\\LN–Æ™%`Öa°¶°D_<•ùGŠ,U×[/ß»‹qýÂÚÂ‘½ƒ™\' œû§,.¶þ”Äeí(j‹ÇãA JÛêãã‹¯_aÎðÖ>¨ÒWG[;øçž¿yp?œÿƒyCÉ´ŽÙÖ#ëø±Ì‘*¯®±+G…ùTÔgUc××÷:R~î>IÅ¼èµX2a¢®C©°Œt@±ÃçÎâófÍ`gm].íY˜™![,†…©)²ss`en^¦ú¢BB1þç%õóÇÂÍ›°bêtÎÏ­ãRMÝÝqàô?èçÛköí…wËVpsbþó;›!%-\r6]|äß’pÓCÃ•¶÷÷Õ1?z-Rž=Ev6ÈšÆ¥_Y!ªÙØ\0Üœ]JÕáâà ýY Á5(Pú»ìý¢lõ°OŸ[[¥}ÉägÁÑÖ\0PÍÎ®Ô¥âêv…ÇLÎªë‚­¿|@zÒ±¨m&åÙ?eq±õ§$.kGÙÈÆ\0ŽEã ¬\\ú\Z»ä\'ü´uºLg{{,…Î­Û(¬Sv³­G¶>)›#®¯Ub×Ô|*{â\Z»¾¾×‘òq3åÏ›‹_¦LC«ú\rtN…¥7ÅCçÎ¡¯¯o¹µçêì‚ôWhèê†´ŒÔ®Q£LõumÓ66øjÕï°03ÃmÛ•*cnnq~>LŒŒðòý;¹cÓÃ‡ ÿœ¯àÝ²¢÷íEÜÒå\nÛÚtè nþµMê¸K»Ÿž†AsgcZH˜ôª\"‘à‡1cìÓ\0`ß­«*]Õ\Z.ý²²´Ä\0Ž¶¶xöŠù,O1G;;<‰;kËRåØêa{[¼|÷®ÕXûâ`k‹·™™pvpÀÛÌLN›/&ª¬eý}Ÿ•\'{{d”X{²Ê»lq±õ§$®k‡ËhCÝ\ZŸaÝì¹H$Ø~ìF-^ˆ»÷*,/»ŽÙÖ#[Ÿ”Í××Š*±kj>•½Gq]_ßëˆö={ý\Zƒ¾žƒåQSÑÓ«£®Ã©ÐôæÒó­Ç)hæQ¯ÜÚìÐ±I‰È\n›”ˆ€^e®sÒ ÁØ‡ÉƒC»T«†CgNƒ/bùŽí°’yckÓ !\ZÕ®ƒAóæ ¹‡š×õ`¬#ñÊeX™[È} @CW7ØYY3^Îq¯Už¦#7/\0àQ³\ZºÕFn^>–Çì@M<zš®n·5‚k¿š{x`Cüd	…ø}÷.Ö:»¶kå1; ÌÉÁ†ƒqðŸ\Z%=ÆVÛøtkßË¶oC&Ÿ=I\'Ñ6b8cÛ>­ZcÕž]d‹°bg¼[¶RyL\0îëBY[Õ¯\rñÀ	±1>&E·]”TÞýc‹‹­?²¸®®c \rÇÅîÄÈûøî5kÉeI(ùú,‰m=²õI•9bk¶ØKÒÄ|*ë³*±ëã{)sÖ¬BH·îê¤<Ía§7ÅŒ7oðYµjåÖÞ¬¡Ãq!ù\Z†Äµû÷1#|ˆô˜l.GUò:ú¢;>oÞƒ¾èÎx|ÞÈ/1õ·h\ZŠõêÁÊÒRîMwjH(Î^½ŠiaCŸ\0ëã ¤»ã±î~ø#¾tZ=‹– ßìY¨?¨ðË5‹\'LD¿Ù_ÁgÜhtjÙ\n_õF§Ñ‘œú¨-\\ûõÃ˜±Ø~$Í‡†Á»eKÖ:Œ‡Âc@_¬ŽÅüˆ‘Òclõ°Ï¢ñ‘òì)ê\rì‡%[·bÕÌY\nÛ>;õöÇõ‡ñcÑ‰ÔÁe](ëï‚±ã±;)MÃBÐºa#X™›3~à—wÿØâbë,®k‡ëhÃ¼ˆ‘X¸yjôôÇ„ŸËÝšRòõYÛzT6~\\çˆm¬Ùb/UæSYŸU‰]ßëˆæ°}VïMJÄ¢Måò3Ó?ÔÃ“p|§äñxÒ¼`F^žœs„éƒŠïîÄXµgô›•™&æ$ãÝ;´‰†gñ‡•.‡z´¥*­BˆæXøzCôÏY]‡AÊ‘—\'î§¼”{¬A]æûÙU¥7g«²¼qæú5Ì^½\nß£ëpôÚ ysWtù~YÌv´n Þ\rÊšªG›h]BÑ5½ù2KUæØÕlmñmä(Æ/ÁO\"zaöªßñêÝ;4ñðÀº9_ë´m¢uA!D×h£¨ÞOÔuF¯Ž4ò\'½4U6Ñº „¢kté™B!„0â=IKãôe–ÚnnÒTb±¸\\SK”UE‹·* 9!„í¢÷ÙªC,—ú2‹™±XAiÕÐ·ž‰NÐœBˆvÑ·ž«úÖ3!„B)w´Q$„B!Œh£H!„BÑF‘B!„0¢\"!ZÆ	áèýût\n!„¢½Ø(^ø\0>cGÃ¹§?|ÆŽÆµ‡´Þf&ŸÞ³¦£FP zÏšŽôØãÏá5	Î=ýÑþË¸p;Yi}ÅÃÈËÑö—:&û‡Ê¦MÑL*©„óÿCÇ1‘pôï·à žÿ5Ò^eè:,ÎdçºØÄeKñ]ähŒë×_km¨ZNö×úÊ²v¹¶¡©zÔmOqª2N\\çHS±hã½HSs««úIå³õh­\rÒ‹â¸ŸcdïÞx¼/Ã{õÂ„Ÿ—h½Í%Û¶ có¸¿+Z´ÄÏ;¶}ŠgÉbtmÛ÷Åatp?Dý²Li}ããŽãXËý÷üY™c¯¬Î\\¿†q?-Æ¬!Ãðô`.nÜ‚Fnn˜úËr]‡ÆSÊŸ­ß~¯×†kš\"Z»Ühjœ4‘>ªd,²uêSœ„hŠD\"Áö#GtF¥¢ÅÇOŸ\"¼G\0,ÍÌ0<°RÒÓµÞæ±‹1°kWØXZ¢¯o¿xAz,ÄÏÓÃ†ÀÒÌa~~xòâk]WîÝ?[„Ÿ\'EAœ—‡óÉ·Ëu7)ii0òòÄ7ëÖ\0¯\\FÛˆá¨îß-‡…ã˜LUÍ/Åàëˆ/ÑÏ·ÌLLP£Z5ü0fö-ùY®Üó7oÐsúT8ö€_Ô$dòù\0€±nÁAØz4uú£v¿>Øqü¨Òçe‹Åpí„›þ„S€\0öyy™‰à¯fÀ)Àž‘¸t÷Žô˜ì¿bŸ¾z¿¨Ipé€/&O@êËœâ,éî“T´9n}{ãàÙ3œÆB²1ÇþˆæCBáèßmFÃ©kW¨¾vÙbV4.åÑ÷¼áÒ+\0»O FP š†…àÖãÆ²ŠúÇ6Lã¤îÏ‹²õ¢Êœ×Év¬dû€ö×<½M‰?{m\Z6Ôu•Š^l=›5Ãæ„Ãd‹°ãØxµh¡õ6Ÿ¿Ê@M\'\0€«“3Ò3>]ÞŒê³¢lö\'._Bë†XëZ·Æ#L0ë.?Àéèõ\0\nÿ¾`ìx\0À¬•¿ã‡1c‘~0SBB1mÅ/eî[Eu\'õ?ôîä­´ÜŒ•¿¢‰»;íÝvcþúh\0€©±1\"’SRpk{–MŽÂ›6*}ž™±1D9Ù 5î\0öy™½z%šÖõ@Ê¾˜3|¢–/eŒóëè5h×¸1îÙïæ-0/z\r§8Kú&z-úx{ãvÌN\\{pŸÓX¨kúo¿âÏùßâùá£˜9t(æ®Y@õµË³¢q)¾\ZB˜[áÁîX„tïŽù\nÚWÔ?¶ùc\Z§²Î‘²õ¢Êœc;ÆDÛkžÞ‰¦¬Øƒ1\ZºÍ‡Ò‹âò)Ó°hóFØ}Ñßoø?MŠÒz›¢Ü\\˜mÍLL ÌÎ.Uæî“TÌ‹^‹%&*¬\'“ÏÇéë×0<°\'\0`X`OœO¾…·YYœâ¸ºezuì3ñÄƒ\'©ªw¦’xýîªÙÚJ7òò”û¯Ø¹ë×1#|(¬-,15$‰W.(üëAYf\rkKôññÅS™\0°=ïŸÑ}ûÃÂÔ\0û¼$ý{S‡ÂÚÂý}»âÂ†MŒý9wã¦„†ÁÚÂÆÅädNq–tùÞ]Œë?Ö–ˆì,ß†‚>©ËÑÖþ9…ço^#ÜÏçÿP¼e#Ö˜Œmô=;;†µ…%Æõˆk÷ï3–SÔ?Uç¯¬s¤¬=UæL]Ú^óô>H4áï«ÿÂÎÒ\nuk|¦ëP*#]\0\0S~YŽy_bˆ¿?vž<IË~ÆÉßWkµM33d‹Å°05Evn¬ÌÍåŽßLy„Áóæâ—)ÓÐª~…õlN8„”´4Øtñ‘{|KÂ!L\rW\ZÇßWÿÅüèµHyöÙ›ÕªÄÞÆO2^¢¡«\0ù{Ÿd7Š‘®AÒßílläê©ng ð,†ì˜*{ž‹ƒƒôg¶yÉâóá ³¡U$“ŸGÛÂXªÙÙá}‰<(Š³$¾@\0û¢X‹žÃµOªŠ]ò~Úº]&Œƒ³½=–NŠBçÖmË²[ÌÊÆ…k=eé{u{{\0€½\r\"ce¯M®ó§©9RÔž*s¦.m¯yz$š°<f;&¤ë0*½Ø(þ{ç6öÿ´æEÿšüzõ*­·éêì‚ôWhèê†´ŒÔ®QCzìÙë×ôõ,šŠž^YëÙtè nþµMê¸K»Ÿž†AsgcZHx<ëó#.ÀcÆ\"Ø§3\0À¾[×2ôªbóiÕ\n›Äâñògp?Èýîhg‡\'qama©RýÊž\';Wlóboc‹—ïÞÂµºk{¶¶x›™	g¼ÍÌäôAËÄÊÒï³²àdoŒ÷ïTê“ªêÖøëfÏ-¼!üØŒZ¼vïe,Ë6Fl1«2.Úêû›™p±wÀû¬,XY2?_S¯MMÏQIªÌsssˆóóabd„—%ÆZÛkžÞ‰&=wGÏ“þnäå‰.íÛkýÄSe§—žëÔ¬‰íG ÊÍEÌñ£¨[«–ÖÛìÐ±I‰È\n›”ˆ€^ÒcsÖ¬BH·îRr¿\\â•Ë°2·Û$@CW7ØYY3^br¯Už¦#7/\0àQ³\ZºÕFn^>–Çì@M<zªý/óè£o¾ŒÄŽcGñãæx™‰l±ç“o¡ßì™X8q’´\\×ví±<f„99Øp0þS¹Ýª ÊóØæ¥[ûöX¶}2ù|ìI:‰¶ÃëðiÕ\Z«öì‚ [„;càÝ²•\n£ñI«úõ±!þ\0ø\"!6ÆÇÁ¤è–	UûÄEçñc±;ñò>~„{ÍZH$Òcª¬]¶˜UmôÝÄÄë÷ï_$Dô¾X´oÔ˜±œº¯Í’ã¤é9*I•9c‹Ó¥Z5:s\Z|‘Ëwl‡•ÌÆVÛkžÞ‰&äŸ¿$ý¯øwÚ$–^l×~5ÆÇ¡Npþ8°«f~¥õ6g\rŽÉ·Ð0¤ð¥áC¤Çö&%bÑ¦r÷Ç1½i­;€î~Œõ‡t÷Ãñ¥SåìY´ýfÏBýA…7Û.ž0ýfŸq£Ñ©e+|ÔFGj¨—‹GÍZ8öÛJÜxø­‡…kïž˜°ôgtoÿ9fýôÁ´`Ì8Üxøúbul,æGŒäT¿*Ïc›—Eã\'\"åÙSÔØK¶nÅª™³¶wþv2ê\rìëâG_\Z`¬gìxìNJDÓ°´nØVææÒÍ€ºc¡È¼ˆ‘X¸yjôôÇ„ŸcÅÔéÒcª¬]e1smõ½iÝºh:{’±PÁ=Èê¾6KŽ“¦ç¨$UæŒ-Îy#¿ÄÔßV ix(ZÔ«+KKéXk{ÍÓû !ú‹\'‘ýç\'[AOºK7òò¬P¹³*Z¼UÍ	ÑZ{¤ª°ðõ†èŸ³ºƒ”#/OÜOy)÷XƒºÎ\Z©[/Î(B!„ýCEB!„Âˆ6Š„*….;Bw´Q$„B!ŒxOÒÒ8}™¥¶››45…X,–KS¡ï*Z¼UÍ	!„h½ÏVb±¸Ô—YÌŒÅ\Z©›¾õLt‚æ„B´‹¾õ\\uÐ·ž	!„BH¹£\"!„BaDEB!„Âˆ6Š„B!„m	Ñ¾HÏÈDïß§ëP!„µÐF‘è‡âaäå‰èûUzž‘—§–\"R¯í‰Ë–â»ÈÑ×¯¿ÖÚÐæóÊBSmj#v]®eô96uL›¢ë!e@E¢w6ÆÇ#*,Æ©ô<]¦Ûaj{ë·ß£WÇN:ˆF÷(õ)ößógºR´Q$zåÊ½»àg‹ðó¤(ˆóòp>ù–ÜñØ¿Ñ|H(ý»£Íˆa8uíªô˜ìÙ˜ûéih9,5ûôÂ–#‡áà‰D‚±nÁAØz4uú£v¿>Øqü¨ôy‰W.£mÄpT÷ïŽ–ÃÂqìâé±×™™þjœüàKwï0¶ýôÕ+øEM‚K¯\0|1yR_¾\0\0¥m—t÷I*Ú·¾½qðì¹cÏß¼AÏéSáØ~Q“Éç+¬ÇÜÜÛŽ&À­ooÔÐ1\'Ž)5[,†kŸ ,Øô\'œüXÇ†©,—ñÐfŸÙæJÛ|³­5Ubakƒ\rÛ¸±Å&+G,FÍ>½°ãøQ¸÷†[p¶;‚\rãP§0Üúöæ¼þÙú¬(žÎãÆ %-\rF^žøfÝZÆµRÖ~¾ÏÊBÓ°d‹å“srÐ4,ï³²87!„m‰^Y·Æ#L0ëK\\~žþÛ¯øsþ·x~ø(fŠ¹kV1Ö3wõ*ôóí‚;1»pùÎ²³Áãñ`jlH„ä”ÜÚƒe“£ðã¦ÒçÍZù;~3é0%$ÓVü\"=6{õJ4­ë”}0gøD-_ÊØö×ÑkÐ®qc<Ü³ÞÍ[`^ô\Z\0PÚvIßD¯EooÜŽÙ‰kîË›±òW4qwÇ£½ûÑ®qcÌ_­°Cž’?FòŽøyÒdüðç¥±šC”“\rIARã±Ž\rSY.ã¡Í>s+¶ùf[kªÄÂÖ¶qãú:056†P(Â­Gps{–O™Š¹«Wã^j*nmÁò¨)œ×?[ŸÅs:z=€Â3ÌÆŽg\\+eí§½\rztè€­	‡å_³w¼¼`ocÃi¼	!Ìh£HôF&ŸÓ×¯ax`O\0À°Àž8Ÿ|oeÎ8ÚÚáÀ?§ðüÍk„ûùãüÌ­+wï`Ü€°µ²ÂäÁ!màñxÈ0kÈ0X[X¢/žfdHŸwuË6ôêØ	f&&âˆOR¥Ç’þ½‚)ƒCama‰þ¾]qaÃ&Æ¶ÏÝ¸)¡a°¶°ÄÄƒq19™SÛ%]¾wãú„µ…%\"{Ë·qý:f„…µ…%¦†„!ñÊe…õDBÌ\Z26––îÜÏ^½âë>£ûö‡…©)ëØ0•å2Úì3×¹b›o¶µ¦J,lm°a7®¯H(µ/^¼~…9Ã#T^ÿl}V%ž’kEýœŠèýûPü‡ÆÙ\"¬?°SBÃ”Œ2!DÚ(½±9áRÒÒ`ÓÅF^ž°öõÆ£\'O°%áÓYªØ%?áí‡è2a>ŒÀi—Ü²BT³±\0¸9»”:^ÝÎ@á—ììléã_ýÆŒ‚K¯\08ùw—¯“Ï‡ƒ­­Ò~dò³žZ^\0\0\0 \0IDATàh[X5;»R—¾µ]_ ž\rq,zN1H× @yy¢f¯\0¼~÷Ž5&Ç¢¸\r\råÚT«‹ƒƒôg¶±)YV–²6diªÏ\\çŠ­OlkM•X”›\"lãÆõuPLvÍŸÖƒ*ëŸ­ÏªÆ#»V4ÑÏ:.5ÐÔÝNÿ\0X³o/¼[¶‚›“fþ„!U™‘® ¤Ø¦Cqó¯]hRÇ]úØýô4š;ÓBÂÀãñP·ÆgX7{.$	¶;‚Q‹âÁî½¥ê²²´Ä\0Ž¶¶xöJñY»’\".ÀcÆ\"Ø§3\0À¾[Wé1{[¼|÷®ÕXëp°µÅÛÌL8;8àmf&§\r+KK¼ÏÊ‚“½=2ÞËoDíìð$î ¬-,Õª›k¬<Oú3ÛØ”,«J²4Õg®sÅÖ\'¶µ¦J,ÊÆM¶qãú:P[¬l}V5Ùµ¢©~N‚þs¾‚wËVˆÞ·qK—«ÜBHitF‘è…Ä+—aen!·I€†®n°³²–^æê<~,v\'ž@ÞÇp¯YKz©©¤æØ\0YB!~ß½‹s5k¡¡[mäæåcyÌÔtqÁ£§é\0€níÛcÙömÈäó±\'é$ÚFg¬Ã§Uk¬Ú³‚lVìŒwËVœÛ—Õª~}lˆ?\0¾Hˆñq011‘ëÚ®=–Çì€0\'ÆÁj”Zm¨+ÛØhª\rMõ™ë\\±õ‰m­©‹6Æëë@Ul±²õ™-÷Zµðèi:róò´ÚÏ6\r\Z¢Qí:4oš{x y]²!z²QL}ù~Q“àØA3§!K(Ôz›™|>zÏšŽ\ZAè=k:>Òc_</Œ§§?Ú9n+¾§ª[î?Ùo€RN1fëã ¤»ã±î~ø#¾0UÎ¼ˆ‘X¸yjôôÇ„ŸcÅÔéŒÏùaÌXl?’€æCÃàÝ²%ç8O˜ˆ~³¿‚Ï¸ÑèÔ²¾êN£#\0‹ÆODÊ³§¨7°–lÝŠU3g1Ö±`Ì8œ¿ŒzûãúÃ‡øqìxÎíËÕ3v<v\'%¢iXZ7l+sséå‚1ãpãáCxè‹Õ±±˜1R½6Tˆ•ml4Õ†¦úÌu®ØúÄ¶ÖT‰EãÆõu *¶XÙúÌÏžEKÐoö,ÔÄœOT“ýœ\ZŠ³W¯bZØ²© ¸|Vo=šP)ó“–\'ž„ã?Ey<ž47š‘—§Fó¤õýj&Z5h€i¡áøm÷NsrðÓ„I\Z«Ÿ)Þ9kVÁÖÊ\nÂš}±à‹DXXôÕcÊdtiÓSBÂ°ãØQlˆ?€KnfmÃ{Ì(x6k†³7®—*+Û~Ã¸¿+Vc}«¨4½†Ød¼{‡6Ãð,þ°òÂ„\nkwâ	¬Ú³GúmëªÎÂ×¢Îê:­QöY-‘Hà?5\nI—.VúÜ®F^ž¸ŸòRî±u5s®^œQ¼t÷¦…†ÃÖÊ\nAÞ>8~ñ¢ÖÛ<vñ\"ví\nKKôõí‚ã2ùÂBüü0=l,ÍÌæç‡\'/ç}”çþ+V2§ ~Ž5ÂnÐ¼¹ˆ;s\Z|‘Ëb¶£uƒº‰¢%y?âÌõk˜½z¾=F×ár¢ì³:þì´iØPGÑUzóe–â››ÍLLð\\…/¨ëù«Ôt*ü6¬«“3ÒeRDDõ‘þ|âò%´nØˆµ.¦Ü^Íš—*w:z}©3i³VþŽcÇ¡[»öˆ9~ÓVü‚;;w—µ{U^D¯ Ì^õ;^½{‡&X7çk]‡DÑ—À¨fk‹o#Gá‹¶ít)\'Ê>«WìŒÁÆùßbÙ¶­åZ¥¢Åv\Zá×1˜Ž?â€/i½MQn.Ì‹n”731!MÉÝ\'©˜½ýð£ÂzŠsÿý6}&€ÂÜ¿üµo³²PC¢×«[¶Iâˆ1·E¸ëÕ±S•ýóy„T5o\'ê:¢CLŸÕ_ýv–V¨[ã3FV9èÅ¥ç¥QSqèçÐ84Î°03Óz›ffÒ?ù”›+ss¹ã7S¡ßìYX5­ê+¾lÉ%÷us¬B!U¢Ïêå1Û1¶ó¨ˆjôb£ØÐÕ\r—þÜŒ§ñ‡Ð­]{µóÎ©ÂÕÙéE—¸Ó22P»F\ré±g¯_cÐ×s°lòôôêÈZOqî¿üó—¤ÿÝÞ‹Í‡rJY¹pÆ€‡{öâé¡„²uŠB©\"Ø>«ž;‡ÞÓ§J¿ñläå‰îQuf…§Å£FbßßIÈäó±ãØQyûh½ÍÀ›”ˆ,¡±I‰èà%=6gÍ*„tëŽ NÞ¬upÍý\'«dN1us¬ýÆ	áèýût\n!„TJlŸÕ²\'oŠ?ùûêò±RÐ‹âÿ‹¹ÑkÐpð\0äˆs±x¼öwý³†Ç…ä[h2×îßÇŒðOy·ö&%bÑ¦0òò”þÇ´yãšûOVÉœbêæX#úƒ)G×ÄeKñ]ähŒÓÐ¥®yÀØÊé\"—˜¦ÚÔFìå=šh¯dVmähÕö¸PN;¢)\\?«IÙèEEm«hñV4\'ªá:^lå*ò˜k#öŠ8lyX+JŽÖŠ8îUeÏ£H>©ôy	\nÿ®sËaá¨Ù§¶9§\0?é}žÏß¼AÏéSáØ~Q“Éç\0rÄb¸aëÑÔéŒÚýú`Çñ£Ò:å©Ì‹áÚ\'6ý	§\0?Ö²\0ð:3Á_Í€S€<##péîé1Ù3$O_½‚_Ô$¸ô\nÀ“\' õåNq–t÷I*Ú·¾½qðì¹cŠÆBsssl;š\0·¾½Qw@_Äœ8¦4nUÆ‰©,—±ÑfÿÙæMÛÜÇþˆæCBáèßmFÃ©kWÕŠ¥x,”­Eí1åa-®“íXÉö•‹&Ö3å‡%¤ò \"ÑsW¯B?ß.¸³—ïÜ ;[š_sÆÊ_ÑÄÝöîG»Æ1}4\0ÀÔØ‘ÉÿÏÞ}ÇUUÿ™Hì­ (îvi–&æ,QA·¨¨ˆ÷H­_n3s›)åú†¨¸WjÚ0Wešæ œ˜‚\\†^×ïézïõN†€¼Ÿ‡Çå|Îù|ÞŸqàã9÷|Nb\"\'V®fæà!|º|™*ÏQs¿à“~ý¹¼yÑa6û3\0¬Ê•#ûv<àÂÆ-÷3.¯Ö¨IâúÆöèÉY3tÖáƒExûå—9·v_ƒñ‹˜§¶‰‹Ø¸1®þ¿=£‘¦¯-Œ)[æ9Nþý7\'WýéƒóÉWKÆmN;éÚ×”¶)Ìú›Úo†ú~øœÏùjÂ‡$mÝÁÈnÝ·`^žbù±± ¯¼ÿÞ6rïàa&i½ÑPZ~Ú%¯ãÙP{\n!J™(ŠbãèéSD¶ÅÑÎŽÁÃPæ._ðÓï¿3¢K7ìml\ZÖYõ P™2eÈÈÌdT×îØÛØØ¤WÔOÿõëø7z+KKº¶nÃÙ‹TÇ¥+ôm‚ÍóÏÜ`ï±£Dwì„½-!ÍZðËÒå:ëðÓñãDwêŒ½-C;rèäI“âÔvä¯ÓD†„bocKŸ¶Ašeèic2³³Õµ;¶¶5mÎÕ7LŠÛÔvÒµ¯)mS˜õ7µßõ½›£	û¿\')%™.>­9øåã	Q^úÂØX0T^A)ìñl¨=…%K±Xp[€ŒÌ,\\-äåî¡‘–™M•€6ªŸ´3/ïä<ºÒ‘£¶xú¾_1aÑB¯^ÑØþ“öÍP(LZ¶)M‘›ã£X\\œ¸•‘aRœÚ™™8çÖÑ-÷˜ÿkCÜrëP®lYòÅmj;iï«ÎXê\nªþ¦ö›¡:ÅOÆ´o¾¦yT$îÎÎÌ4„¦oÖ3;múÆ‚¡ò\nJagccDQrÈDQv¶¶¤gfâæèÈU­×8º99qqãfìmlÍÊ³OÌ$>é×Ÿ &Mp~¿…Fú·¶íëìàÈ¿©7©R¾‚Áò\\¹™–†»‹7ÓÒò¼&¨­-·22¨àìÌõ[©\ZiymCŒÅmj;iïkNê\nªþ¦ö›¡:Õ¨X‰ÅcÆñðáCVîÜNÄ”ÎÆ­3;S*ÏÖÖÖ(ïÝÃÒÂ‚µÚ°°Ç³±1\"„(9äÖ³(6^¯Y“¥›ÈÈÊâ‹¸o5ÒZ¼]ŸY«W‘uû6K7o¤õÐ!&åiÎ:•†ö}¿~}f®\\AšBÁÚ½ßñVxy4©û&óÖ~KfN6³ÿ·šÆuêšÑÕ­]›¥›Pdg±lÓF,s_7	yoCÌ‰;¯kšSFAÕßÔ~3T§¦ú·g7wïß§ºge…ô£/•§½«:í4WW¶üp\0Ev³V­ÄNm2[ØãYÖ‡âÙ!EQl|Ò¯?+·oãõni\\§ŽFÚ¤~‘?wŽšíÛ1?>ž	á½LÊÓœu*\rí;yÀ@¯^¡Vh0S¿ù†y#GéÌcR¿Hþy’Z¡!ü~îŸšð`Î|ú nï^íÆ›/¾„µµjÂ×¶0XžqçuíOsÊ(¨ú›Úo†ê4>¼1±Ë©è×š¨iS˜=t¸F\nº/•§½«:í´ñ½z3tÎl^íÒ‰7jÕÂÎÖVÕ†…=že}X!ž²Ž¢(Æúäzj*õÂ»suÓÖ§•B<;dÅÒCÖQ¥B‡ñãØ˜{«læê•¼ùÂÆB!D¡‘‡YD±îÀ˜y_p#5•WjÖdñØŠ:$!„¢T“‰¢(6ü½‹£w‹:!„Bä’[ÏB!„B§2/]2éa–ª^^ª%*”J¥ÆrÅ]I‹·4>BˆÂ%¿gK¥RùÄÃ,Vå”zö6<õ,Š„ô‰B.yê¹ô§ž…B!ÄS\'E!„B¡“L…B!„N2QB!„:ÉDQ(²³hÐ\'œEÖu(B<U2ö…(Ýd¢(Š•íÆ»ooÜZ·¤jp ½c&qãÖ­§\Zƒ…wƒ\'¶\rœ9ƒúô%28¤ÐÊ(Ly-ÏÔã|‡Eç)ÿÂô´Û8¯å÷¶+è±ŸŸX„OŸLE±ñÃï¿ÑwÊdFtéÊ•ÍÛøañ—ØÛØ0añÂ§\Z‡®e{¾ùðÿJå[cL]ÂèŸ¤«…IÉó¬´]iûBˆGd¢(ŠÏÖ¬fL÷„¶x+KK¼*¸3gØ–ä¾ó9G©¤J`\0“–E_\0’RRð>÷6­ð2ˆ4…B•ßž£Gx+¼å[·¤N÷.ì<ô‹*-9- Ñ#¨àëCƒ>á>}J•¦~ãÊø„‡¿/ï\rŽâÂ¿×\0¸­TâÀ7;¶Q-$ˆªÁ¬ÚµCoÝN_¼ÀÛ½zâÕ®-›üA#ÍP´ÅïÛÃë];áÖº%õzvçûß~Õ·®Ÿ×ïÛ‹g ?u{vãÄß‰fç©o¿¦‘ýH¼t	ïLÌÔë«Óm¥Ï@VíÚAõ ¼‚X¹s;K7o¤ZH^íÚj´£¡>,Œ66wŒ¹|‰:Ý»àèÏ×Û·RÁ×‡ÿ–¦ÍKÛé*_ßÔÅP»›3^ÕýWcyäõ\\ÔVýh,VCçŠ®2®Ü¸M³ÆÜÌÈ\0 =3û÷šq59Ù¬þ¢$’‰¢(6N]ø‡ fÍô¦[•+Göí>xÀ…[\01÷s^©^óë6ðöË/3aÉ\"Õþ£æ~Á\'ýúsyó6¢Ã:1lögª´1óçòjš$®O`lž™5Cg™,ZÀÛ/¿Ì¹µëhüúŒ_´\0€çË•#3;›“‰‰œX¹š™ƒ‡ðéòezcŸ¸h!óçêÿñÛÙ3\Zi†ê møœÏùjÂ‡$mÝÁÈnÝ·`žÞ}ÕYZZòÛÙ3œ^Gûæ-˜¸èñUZSóÔ·ßEK€GWÐ&õ`°NÏ—+GVV6\'ÎŸç•«™=”qóçó×…œX¹šYC¢5ÚÑPj+ˆ66wŒ›?àfÍ9µú[Žœ:EfNeÊ”ÉsÛé*_ßÔÅP»›3^u1–G^ÏEmÑù©¯®2*W¨Àëµjq4÷?”GNŸâµš5ñ,_Þ¬þ¢$’‰¢(6RÓÒ¨àä¬7½L™2¤+ôm‚ÍóÏðÓï¿3¢K7ìml\ZÖ™=G¨öÿõëø7z+KKº¶nÃÙ‹Ti{%ºc\'ìml	iÖ‚_–.×YæOÇÝ©3ö6¶íÈ¡“\'U±ddf2ªkwìml	lÒŒ+×¯ëýÈ_§‰	ÅÞÆ–>mƒ4Ë0PmnŽN$ìÿž¤”dºø´æà—¦ýñS*•D†„â`kK¿ `~;wÖì<Í)[_Ê”)Cfv–*-°I3®%ß`lpíh¨µD›;ÆŽž>EdûPíìÜ1¥R÷+³Lm;åëƒºjwsÆ«¾Øå‘×sQ[Aõc^ë«¯ŒÖï4äØ_§8væ/Z¿ÓðÑþfô%‘EQ ÄÊ;»p5%™š•<\rîçáâ¢úœ™M•€6ªŸTŸ÷ýzŒ	‹’xõ\n999\Zyd(¸8:\Z)M‘›£\0®NNÜÊ½õ¤ŠÙéQÚóåÊ=Q†:Ef&Î¹±¹åcJ´ÅOÆ´o¾¦yT$îÎÎÌ4„¦oÖ3Z€òÎ&áÎdfe™§9e«“z»¸åö…v;\ZêCmÕÆ`úËÈÌÂÕáQì^îzó3·ßÔË76Õ™ÓîÆÚS}yäõ\\ÔVý˜—úê+ÃïÝÆÌ\\µ€cýÅÈ®Ý\0óúGˆ’H&Š¢Ø¨÷ÒK¬Ýóc»÷4¸Ÿú­=7\'\'.nÜŒ½íûõ‰™Ä\'ýúÔ¤)\0Îï·P¥9;8òoêMª”¯`°,GGn¦¥áîâÂÍ´4“&—ºØÙÚr+#ƒ\nÎÎ\\¿•ª‘f¨ÚjT¬Äâ1ãxøð!+wn\'bJgãÖ`mmòÞ=,-,øW«€TEÎ.ÜLOÇÁÎÎ¤<M-[›9u2ÄPj+¨6ÓÇ˜­-é™™¸9:rõ†þ+Væ´vùæŒÁ‚j÷¼Èë¹¨­ ûQCçŠ¾2ÞyåU.]ÿ—«ÉÉ\\¾þ/õ_z(¸ßBWrëY#»vcÎ·ÿcÅŽmä(•Ü¸u‹i+¿¡ã„ôÓâíúÌZ½Š¬Û·Yºy#­‡Q¥Õô¬Ì‹^U¹s÷³V¯ÂÓÃƒóW.ð~ýúÌ\\¹‚4…‚µ{¿ã­ð:óoR÷Mæ­ý–Ìœlfÿo5ëÔÍSÝêÖ®ÍÒM	(²³X¶i#–––&ÕA[Óý‰Û³›»÷ïSÝ³²êÁ	\0WW¶üp\0Ev³V­ÄNíµµ5_&l@‘ÅW›7òVî9cyšZvõÊ•9å2wîÞ5»N†êCmÕÆÚûzÍš,Ý”@FV_Ä}«7sÚN›9c° Ú=/òz.j+¬~Tgè\\ÑWF™2ex½f-úMáµ\Z5U“ù‚ú!DqU¤Å5ßíÂ¦Yã\'¶§)´5œŠmh;j8é™™^¶¡2þ¾–„ÏA¸ûµ¦~ïžüò§ñïœ,Û²	ï,JØðDšúuÅqÍ´â¢níX>áCæÇ¯¥J[?\Zô	çÌÅ‹Ì>Rï1“úErüÜ9j¶oÇüøx&„÷R¥M‰\ZHð˜Ñ4‰ìË»uêÒ; -ïöíÀäI¼z…Z¡ÁLýææ¥7ÿƒž¤Vh¿Ÿ;Ç§¹k˜kRÿÄíÝÃ«ÃxóÅ—°³¶VMÕAÛøð^ÄÄ.§¢_k¢¦MaöÐáÓzõfèœÙ¼Ú¥oÔª…­->äîýûØZ[ój\Z¼Ô©#¾ÿžIý#MÊÓÔ²×NžJð˜QÔîbv1Ô‡Ú\nªŸÈ×À±ŸôëÏÊíÛx½[g\Z×©£7sÚNWù¦ŽÁ‚j÷¼Èë¹øD>…Ôêô+ÆÊð÷nÄÎŸ¦M£F\Zõ.ˆßÂ|g._¢ùÀHÜÛ´¢aD/Õ+~?w–&ýûâî×š&ýûj|/[˜§ÌC}—´w,SFµ.˜…w“×ÓçÇ?Ž³íçŸ˜þuìy]0G;;¶ïÀ‚õñ(²³‰ÉÇÉ§+^Ce´ŠLózõˆëÌª;Xº)Ã_Å\Z,£q¿\Z¼ö\Z?ÿý‰}ÕË1,”3ßÆç¹.ÏŠ‚CB\'×SS©Þ«›¶u(B\0`Ó¬1Ùû,ê0\nÍûCâçÝˆÈàö¬Ø±¥8ºük\0\ZFô¢_»`ÂZ¶bõ®,Û¼Éä‡ÿJ\"ïœIüWcÛ5Ü$ï\"»¢xäô)&GFéLÛyè¡-Zà`kK»fÍÙe`Í­¼2TF˜Ã;wÅÖÊŠÎ>>\\¼fx]¬£F‘“ÍôACPÞ½ËÁ“\'tî§k½9sÖB/Æccî-Ì™«Wòæ/uHB”\Zá~þî†­•ÝZ·æÒµ$UÚßW®Ð¥•/¶VVôhãOâeÝ_uÆÙDqXXg½iI7®ãYáÑ„U*¸sÙÌeLa¨Œ>Xå~/f÷‘Ã¼ùâKóZ¼a=ÚwÀâ¹çˆjß%:n?ƒîõæÌY_LQ¼„û0~á|j†´ãÈéSÌŠVÔ!	Qjt÷õÃÒÂ‚{ðõÖ­4zãñ×?\Z¼ö\Z±Û¶’™“ÍªÛñ~ã\"Œ´d+–O=gß¹ƒuîDÍÊÒ’¬<.ãß2N_¼ÀøEYóÉ§zóIS(8ðûoÌÉý]÷6~|¶f732p5²t<Z_ì?][·¡_Œþ²„Å‹£wåõvB1«wR½re¶Ïž£Ú6+z>ƒ2hÚ*¹»³ëÓ^N žT,Ÿz¶±²\"\'wáÚœ;·±³¶~êeü‘xžà1£˜5d(ukë¿»m‰—.áÐ¼	Þ\r°oÖ˜ó/òõ¶-&Å±ï×c¼Û/_*´n™÷\n	!„¥PÎÖ©ý¦MQm‹þlãÃ{“¶÷{>ìÁ ™Ó‹0Â’­XN«¸{p9wM²K×¯SµbÅ§ZÆÕäd:|0–™ƒ£ñón¤/\0–oÙÌk¾åÞÁÃªÆÅ»e³ÞeFÔõ‰™Ä€öí9·vW¶lË_¥„BˆRbæê•ÜV*)W¶,=üü8yîœ*íØ©?éáçµ\r][·á³òÔs^Ë‰b›†\r‰ß»‡Œ¬,â÷îÁ·¡÷S-cì‚y„½ß’€wŸ\\ºGÝž£G°³¶á•jÕ5¶¿XÅ\';{¯—Ò^3ÍœõÅ„BñÈ¶ƒ?3\'îdÝ¾ÍÊ;¨åå¥J«æéÉÊÛÈ¾s‡Õ»vP£rå\"Œ´d+²‰¢…wÕú‚êŸFuëÁ/\'OðbX(¿9Ãˆ.]¼|Ce¬Û»‡ÉË—©â²ðn sò¶dca-}tæÖÒ‡/7m|b»öšiæ¬/ö¬SB!„!FaÛÏ?Q#8e[6ñù°ª´…£ÇòÕ¦T\nàË„\rÌ9º#-ÙŠlÅ§©¤Å[\ZHŸ!DázÖ×Q=“ë(\n¡í¿+Š·•J¼‚øfÇ6ª…Q58U»v¨ö;sùuºwÁ3ÐŸ¯·o¥‚¯>$G©¤J`\0“–EßGWz“RRð>÷6­ð2ˆ4…B•Oü¾=¼Þµn­[R¯gw¾ÿíWUÚ•7ð2_ÞÅ…\r¯¥)„B<‹d¢(ŠçË•#3;›“‰‰œX¹š™ƒ‡ðéòÇ+ê›?àfÍ9µú[Žœ:EfNeÊ”Áª\\9²oçððÁ.l|ôÔùˆ¹ŸóJõêœ_··_~™	K©ò>çs¾šð!I[w0²[7Æ-x¼|Â‹ðöË/sní:\Z¿þã-xz\r „B2QÅN™2eÈÈÌdT×îØÛØØ¤WÔD?zú‘íCq´³cpÇ0”¹Ë•)S†t…‚¾íB°yþy\0~úýwFté†½-CÃ:k<`äæèDÂþïIJI¦‹Ok×;ýtü8Ñ:cocËÀÐŽ:iü}ßB!Ä³F&Š¢Ø*ïä<ºÂ˜£¶ zFf®Ž\0x¹{<qœ‡‹‹êsfv6UÚ`áÝ\0O_’SSUiñS§q3=æQ‘¼Ó\'œj·žÓ¸9>*ßÕÉ‰[Z7!„¢$(–ofÂ;[[Ò33qstäê\'_ïX¦LÕg7\'\'.nÜŒ½íûÕ¨X‰ÅcÆñðáCVîÜNÄ”ÎÆ­ÀÅÑ‘›ii¸»¸p3-\rGÇÂ«BQLÉEQâ¼^³&K7%‘•Åqß\ZÜ·ÅÛõ™µzY·o³tóFZ¢Jk: ?q{vs÷þ}ª{VÖX ½IÝ7™·ö[2s²™ý¿Õ4®S·Ðê#„BW2Q%Î\'ýú³rû6^ïÖ™ÆuêÜwR¿HŽŸ;GÍöí˜Ï„ð^ª´ñá½ˆ‰]NE¿ÖDM›Âì¡Ã5Ž;øçIj…†ðû¹s|Ú@¡ÕG!„(®dEQ$\nªO®§¦R/¼;W7m-€¨„âÙ!ë(–²Ž¢j:ŒÇÆ ÈÎbæê•¼ùÂE’BñL’‡YD‰îÀ˜y_p#5•WjÖdñØŠ:$!„â™$EQâø7zÿFïuB!Ä3On=!„BÊ\\¼tÉ¤‡Yªzyaii	€R©T}.	JZ¼¥ô‰B.ù=[z(•Ê\'f±*§,¼å©gQ$¤O„¢pÉSÏ¥‡<õ,„B!ž:™(\n!„Bd¢(„B!t’‰¢B!„ÐI&ŠB!„B\'™(ŠbåâõéñÉÿá€{›V4îAÂýE\Z“…wƒ\'¶)²³x+¼ƒ?›ùTøk\0\0 \0IDATÊ{\ZòSnQÅ\\Ò‡¾65†‚ŽÕÜüJò+É±!EQl\\OMÅX4¯Ö¨ÁÑØüõm<Ýýü‰ˆ™Äú}{‹,.]ËøDÍ˜Î°Î™;|dDTü˜ºÔ‘ï°èBŽD˜ËÔ¾SßOúÑ<²˜(Éä~¢Ø˜±j}‚Ú1,¬³j[ÿvÁ¤f¤³÷ØQBZ¼W„ÑiZñÑÇEB‰ôOÒÕ¢A\0éG!J¹¢(Š]‡~¡UƒwžØ>®G8óFŽ@yïÕC‚Ø~ðg^ë†k«÷G·‚£¦O¥jp ý}‰š>•;wïªòøíÜYZEÆ3Ð_šŒäðéSªôä´4‚F ‚¯\rú„k¤©ß6ÊÈÊ\"bJÕB‚ðj×–îÄ­Œ\0îÞ¿OÕà@¾;r˜·Â{P¾uKêöèÊ®Ã‡ôÖ99-öcGSÑß——;wdýþ}\ZéÆê¥-~ß^ïÚ	·Ö-©×³;ßÿö«ÎzèÛ¶~ß^^îÜ_G\r\')%Åì¼õíW§{/]ÂÂ»½c&­ßÝû÷©Àª];¨„WÐ£ÏË·nVµÿª];Tå\ZëcuwïßÇÃß—õû÷ñbX(®­Þ\'`ä0®§¦š”Ÿ¾qhNÚÌ=ÖP\Z§ÚÔûÎ”ó@W?\Z[ÆÆ¹¶‚</LékCùéêksÇ¦)çï7CÇ\nQXd¢(Š¤äd¼Ü\r¯$oiaAvNk÷îaËgŸsmÛN\0Æ-˜‡«+ÇbWpví:<\\]™»Lu\\Ôô©tkÓ†³që8·v>\rÞ¡ß”Uú˜ùsyµFM×\'0¶GO†Ìš¡³ü‰KáloÏ±ØœX¹†*îîLX¼€reË’™•Åò­›‰›<…·Ð/(˜sfë­Ï„Å©S»6§ÖÄ±gî68 ñÊ-cõÒ6|Îç|5áC’¶î`d·nŒ[0Ï`{ª³¶¶fýþïÙ=gýo-î.®|°p¾ÙyëÛïøŠÕÀ£ÛpËÆO4Z¿reË’“Í‰óçùcåjfEeÜ‚ùœúçN¬\\Í¬!Ñ|ºÜô>VW®lY²rrHØ¿Ÿ½ór>~Þ¯¿ÁXµ:ÊOß84\'mæk¨?SCL9tõ£1ÆÆ¹¹û›s^˜Ò×†òÓÕ×æŽMuùé·üœßBä•LE±òàñ7JÞLKc|x/ªyTÄÒâÑ·\'¶þü½Ûáæèˆ½-ƒ;„i<sðËeôðõÃÖÊ\n{[†wîÊÙ‹Ué{%ºc\'ìml	iÖ‚_–.×YöŽ_Õ>Wíìˆ\n	e÷‘Çß?JW(˜5ˆš•<±µ²¢wÛ@.\\»¦·.{!2$g*¹¹ñaŸ”ÊÇïç4V/mnŽN$ìÿž¤”dºø´æà—ú\'•Úrrr˜Ø\'‚Ê*àdoÏ„Þ}øñøïfçmNÆê—‘™Éˆ.Ý°·±%°I3’®_gL÷žªŸ¯\\¿®Ú×XëªïG}ñ,_gzù·e¿Ú\Zcùé\Z‡æÆ ÎÜc\rµ³±qª©ç¹Œss÷7÷¼0Ö×ÆòÓÕ×æŒMuùé·üœßBä•|GQU<*òÏµ$êÖ~Áè¾Õ*VÒø9#3“jA\ZÛ\\UŸO]ø‡‰‹òëÙ3(²²¸s÷®Æž…Bc}n¦¥áY¾‚êg77RÓÓ5öñªðøª¨•¥%999zóKMOÇÙÁAõ³§[y³ê¥-~ê4¦}ó5Í£\"qwvfÆ !4}³žáJ©©êî¡úìîìBšBavÞæÄ`JýÊ;9ð|¹r\0¸å¦?_®œFÛ\Zëc]ª¨õ•›“éjõ5%?íq˜—òz¬¡v6eœêbêy`.cãÜÜýÍ=/Àp_›’Ÿv_ƒécS]~ú-¿ç·y!EQlø6lÈ¦<1QÜüã¬Ø±¸O\'«¶•}Nób¸‡«çã7hüqQ2v4‘Á!|1bnNNÜQ*qiÙB•îìàÈ¿©7©¢öKZ—ò..¤¤¥QÉÍ\r€SR(ïâbV=Õ9Ù;‘•…knÜ¯k¾ÔÝX½´Õ¨X‰ÅcÆñðáCVîÜNÄ”ÎÆ­ÝZ¾­Tb•{ïÒ\'¯x\\MI¦f%O\0®ßJÕøci(oScÐfný1ÖÇº\\I¾AÜ	@ò­[\Zq˜’Ÿö8ÌKy=ÖP;çuœšzh36¶Œsm}^€á¾6%?í¾Î«üô›9ç–En=‹bcd×îÄ}·›	‹‘”’‚\";‹Õ»wÒÚü\Z52xlÛ&MX²)[(²³˜µf#‡©Ò³srxû•WqutäìåK|´t	^•*‘xõ\n\0ï×¯ÏÌ•+HS(X»÷;Þ\nï¡³œ6ÞøvÏn2s²IÏÌdn|m¼\rÇfH“ºuYº)4…‚¤”b–/Óø.–±zik: ?q{vs÷þ}ª{VæáÃÇ·ò«zx»u·•Jþ¾–Ä¸óp´·W¥[[[3åëX®Ý¼‰\";‹¯·læ½·ß6)oScpvpàü•ËÜÎ½Rfný1ÖÇÚ,--™»œk7o’¦P»mï½]?Ïùåõ˜¼k¨ó:NM=´ûÑØØ26Îµôya¬¯r\Z“Ÿ~3õ¢ éDqÍw»°iÖØì´‚¦PÐvÔp*´¡í¨á¤gfªÒþ¾–„ÏA¸ûµ¦~ïžüòçI£ù-Û²	ï,JØðDšúo²þ˜~®lŸ3—Ë7®Ó°O8µÚ³0>žù#Gî`ðØ‰½#HJN¦~ïžÔîÐží&&2J•>uÐ`zOú˜*mý<kA„ûÐ(¢7\0“$ñêj…3õ›o˜7r”Îr>ŽèËÉÄD^éÔ‘7ºwáVFGôÍs\'ÈOÇç¥Nh10’ ¦M±³¶æþƒ&ÕKÛøð^ÄÄ.§¢_k¢¦MaöÐáª´™C†²p}<•Ûú2v4½üÛbgk‹òÞ=îÞ¿­µ5~\r½i10’ÚÚóû¹s|Ò7Ò¤¼Má‹Q£ñ2ˆ:¶ÏSý1ÖÇÚ”J%~\r½yoÐ\0j…säÏ?™5(Ïùåõ˜¼k¨ó:NM=´ûÑÐØú/_Cã\\Wy^ëë‚‡Æä§ßL=K}s…û0hÖÜýZójç0ö;ZÑ=Ê<4ñ¿$eÊ”Q-\ZjáÝ ßˆþøÇq¶ýüÓ¿Ž}\"/Ciy¡+Þ±æáhgÇÀöX°>Ev61ý\0Ð*z0ÍëÕ#:¬3«vî`é¦k°ŒÆý\"hðÚküxü÷\'öU/ÿÅ°PÎ|Ÿï:•t1†„Èƒ¥Giík›fÉÞÿcQ‡QhÍmXÏ?×’Û­»b^|<..¢HŸ…wÎ$j~Eã…\Z†W1U‘]Q<rú“õüÍPZAÙyè¡-Zà`kK»fÍÙuèUZ˜Ã;wÅÖÊŠÎ>>\\4ðÔ*ÀÑ¿N£ÈÉfú !(ïÞåàÉ:÷k\ZÙOµþØÄÜ%ö=¢Zs¯N÷.ìT‹C!„ºš+ÄíýŽ®­}qvp ãû>Ïô$±°ÙDQýíæ¤”¤×ñ¬ðè	Ï*Ü¹¬¶”AŸ€@Õ—²w9Ì›/¾d0¯ÅÖ3 },ž{Ž¨öX¢ãö3ÀEK€GëMÊ½z9jî|Ò¯?—7o#:¬Ãf–ïº	!„Ï:Cs…³/qúŸ¿©Ä;}Â9}ñÂS‹ëYSjfÉ¾sëÜÉ •¥%Y:–28}ñã-djÔ@½ù¤)øý7z´ñ {?ž<ÁM=oAÐöë×+ðoô.V––tmÝ†³2˜…x*Jã­ÈÒJúºôQd*8‘ø7\'V®¦w#FÌù¼¨C*±Jíò86VVä(•Ø<ÿ<9wncgm­‘þGây:ŽÇgÑÃ®ë»m‰—.áÐ¼‰Æö¯·max§.FãØ÷ë1&,ZHâÕ+×ÛB!„iìììèîç‡½-Ã:uá¥NŠ:¤«Ô^Q¬âîÁåÜµ¾.]¿NÕŠUiW““éðÁXfŽÆÏÈ’Ë·læ5ßrïàaÕ¿?ãâ‰Ý²Ù¤¥úÄLb@ûöœ[»Ž+[¶å¯RB!„À³|yYY\0<|øreËqD%W©(¶iØø½{ÈÈÊ\"~ï|z«ÒÆ.˜GØû-	x×ðò<{ŽÁÎÚ†WªU×Øþb/œììÙsôÈÇT¯\\™óW.«^8_Ó³2/zUåÎÝ{ÌZ½\nOÎ_¹\\\05B!J§¶›°f×NÒ33™÷?\Z¾þFQ‡TbÙDÑÂ»j}AõÏÆÒ\nÊ¨n=øåä	^å·3gÑ¥«*mÝÞ=L^¾LU¶…w“·%ké£3ÿ°–>|¹iãÛ×NžJð˜QÔîÀ”¨M“È¾¼[§.½Úònß>TË’/?}_ã¦8Ð>W„¢424WÖ©3ÿ$%Q;4˜ïû•ƒ‡U˜%^‘­£ø4•´xKSû$?}WûÝwX4;fÏÉW…U¯‚ˆMQ|<ëë(ŠÇžÉu…(þIºZÔ!èUœcBQ4d¢(Šä´4ÚME_^îÜ‘õû÷i¤+²³ˆš>•ªÁTô÷%júTÕw=ÉÈÊ\"bJÕB‚ðj×–îÄ-µ%Œâ÷íáõ®pkÝ’z=»óýo¿êÍËXúòªÓ½‹jÁõÞ1“\0Ý·ŽÕ·kõ};w–VÑƒñôÇÃß—æ#9|ú\0wïß§jp ß9¬Zà½n®ì:|Holy­§Bˆg‡LE±1añBêÔ®Í©5qì™»€`™»Ö%À¸óñpuåXì\nÎ®]‡‡«+“c—™”÷Ä%‹p¶·çXì\nN¬\\Cww&ä¾`øœÏùjÂ‡$mÝÁÈnÝ·`žÞ¼ŒÅ¡/¯ã+VÖt[6~b´‰º¨éSéÖ¦\rgãÖqní:|\Z¼C¿)1\0”+[–Ì¬,–oÝLÜä)\\Ø¸…~AÁŒ˜3[oly­§Bˆg‡LE±±÷è\"CBqvp ’›ö‰@©TªÒ·þü½Ûáæèˆ½-ƒ;„‘p`¿Iyïøå QíCqupÀÑÎŽ¨Pvyü=?7G\'öORJ2]|ZsðKýPcq˜“—1ÆÚDÝÁ/—ÑÃ×[++ìmlÞ¹+g/^T¥§+L‰\ZDÍJžØZYÑ»m ¼žòiÖS!DñTjÜÅOjz:ÎªŸ=ÝÊk¤gdfR-(@c›‹££IyßLKÃ³|ÕÏnn¤¦§«~ŽŸ:iß|Mó¨HÜ™1hMß¬§3/cq˜“—1ÆÚDÝ©ÿ0qÑB~={EVwîÞ}bRéUáñ—›­,-\r.òþ4ë)„¢x’‰¢(6œìÈÈÊÂ5wbtñºæ\\®nœß 1q2UyRÒÒ¨äæÀ¿))”wqQ¥×¨X‰ÅcÆñðáCVîÜNÄ”ÎÆ­Ó™—±8ÌÉËÚÚšÛJ¥êÝâ—n\\×H7Ö&êBÆŽ&28„/FŒÂÍÉ‰;J%.-[èÝß˜‚¬§Bˆ’In=‹b£IÝº,Ý”@šBARJ\n1Ë—i|¯m“&,Ù”À­ŒÙYÌZ³Š€‘ÃLÊ»w#¾Ý³›ÌœlÒ33™Gµ·î4ÐŸ¸=»¹{ÿ>Õ=+|«Ž±8ååìàÀù+—¹{¥¯ª‡±[·p[©äïkIŒ[0G{{“ÛD]vNo¿ò*®ŽŽœ½|‰–.Á«R%¯^1©´cËO=…B<d¢(ŠÉòÓñßy©SZŒ$¨iSì¬­¹ÿà\0{G”œLýÞ=©Ý¡=ÛþLLd”IyÑ—“‰‰¼Ò©#otïÂ­Œ>Žè«JÞ‹˜ØåTôkMÔ´)Ì:\\o^Æâ0”×£Fã3d/tlÀÌ!CY¸>žÊmý;š^þm±³µEyïžIm¢nê Áôžô1UÚú1xÖ\"ƒ÷ QDo“ÚH;¶üÔS!Ä³AÜEBúD!\n—,¸]zÈ‚ÛB!„â©“‰¢B!„ÐI&ŠB!„B\'™(\n!„BÊ\\¼tÉ¤‡Yªzyv,B!„\"´f±*§û-^æ²ðªRÅäå©gQP¤O„¢pÉSÏ¥‡…wƒ\'¶™3¿3Dn=!„Bd¢(„B!t’‰¢B!„ÐI&ŠB!„B\'™(\n!„Bd¢(Š•‹×ÿ¥Ç\'ÿ‡WP\0îmZÑ¸_	öiLºž&SdgñVx6ó©”÷4ŽÍ‹‹×ÿåÝ~”oÝò©–[\\<íö.*OûxH›‰g…LE±q=5ÿaÑ¼Z£GcWð×·ñt÷ó\'\"fë÷í-²¸t-ã5c:Ã:wfîð‘E‘~æ,9ä;,:ßåIÌ€(®nÝ‘ï¼DñU’Îü(ˆsâ?¥¥ÍÄ³Ï¢¨â?3V­ OP;†…uVmëß.˜ÔŒtö;JH‹÷Š0:M+>ú¸¨CÈ·’®æ;ŒÌLš¿Y¯\0¢%Í³ph+ˆsÂg±ÍÄ³O®(Šbc×¡_hÕà\'¶ëÎ¼‘£PÞ»Gõ ¶ü™×º„áÚê}àÑ-¨éS©\ZHE_¢¦OåÎÝ»ª<~;w–VÑƒñôÇÃß—æ#9|ú”*=9- Ñ#¨àëCƒ>á\Ziê·2²²ˆ˜Cµ ¼Úµ¥ûÇq+#€»÷ïS58ïŽæ­ð”oÝ’º=º²ëð!½uNNK£ýØÑTô÷ååÎY¿ŸFº±ziû/Vc±ÔéÞ…ÄK—°ðn@ï˜IFËÒÕîÞ\r¸””„…wU¹ùigsêz÷þ}<ü}Y¿/†…âÚê}FãzjªjC±èGÆâ7Äœcó:ŽóÚ~¦´WQæ¶caµ®s¢¸ýÞ¸™‘AÕà@RÒÓ5¶§gfR£};UžB$™(Šb#)9/wwƒûXZX“ÃÚ½{ØòÙç\\Û¶€qæãáêÊ±Øœ]»WW&Ç.S5}*ÝÚ´álÜ:Î­]‡Oƒwè7%F•>fþ\\^­Q“Äõ	ŒíÑ“!³fè,â’E8ÛÛs,v\'V®¡Š»;/ \\Ù²dfe±|ëfâ&OáÂÆ-ô\nfÄœÙzë3añBêÔ®Í©5qì™»€`ii©J7V/}ŒÅr|ÅjàÑí±eã\'\Z-KW»ÿwkíÞÁÃªÏùigsêZ®lY²rrHØ¿Ÿ½ór>~Þ¯¿ÁØóTûŠEß82¿!æ›×qœ×ö3¥½Šê0·«\rtÅí÷†«ƒAMš²8a½Æöe[7Ó®YsœLng!LUæáÃ‡&½ë¹L™2ò\n?Q`tõ‰[ë–$®KÀÑÎÎè±gâ×SÓ³²j[õ ~Xô%•+T\0àVFÍFª~ùkËQ*qõyOõz«j!AZºwƒ±¾ÊŽÏ¿ zÅJ\0\\¹qƒ÷\ràlÜ:Õ¾oÜŒW…GÞÛJ%å}}PìÕý@Ní!ü´ä+*8;˜t•Û«Ê3·^ê±\Z‹E»Œ•¥«Ý[æ´s^êzfÝjVò )%…Æý#ø{]‚I±èª±ctÅ ¯þ¦kî8ÎOûk¯¢:Œ)È1d¬\r\nr<V›%&]Å7z0\'WËóåÊqÿÁêõìÆÆ³¨æQQc_y…_éaáÝà‰w=¿PÃð…“ó.\\„(\0U<*òÏµ$êÖ~Áè¾Õráþ\'#3“jA\ZÛ\\UŸO]ø‡‰‹òëÙ3(²²¸s÷.Jåã¦g(\Zûës3-\rÏòT?{¸¹‘ªuè¿_ö\0V––äääèÍ/5=]ã*€§[y³êeŒ9±˜R–v»kËO;ç¥®UÔêçæäDºBar,ºêcÊ1úäåXsÇq~ÛÏP{Õ9 ­°Ç¡6(ÈXÔd›Õ¬äÉ›/¾ÄÊÛéÈ¶ŸâZµŸ˜$\nQPd¢(Š\rß†\rÙôÃ\'&Š›ü;¶÷édÕ¶²Ïi~kÂÃÕóñôÞz	;šÈà¾1\n7\'\'î(•¸´l¡JwvpäßÔ›TQûe®KyRÒÒ¨äæÀ¿))”×q5ÁTNöddeáš÷Åëšÿ#4V¯‚dJYÚí®-?íœ—º^I¾AÜÉVò­[\ZÇ\Z‹EW}L9&¯u×ÅÜqœßö3Ô^Euh+ì1d¨\r\n2uÝfÑa;š÷Þz›aŸFÜä©yÎKcä;Š¢ØÙµ;qßífÂâE$¥¤ ÈÎbõîôŸ6¿FÛ¶I–lJàVFŠì,f­YEÀÈaªôìœÞ~åU\\9{ù-]‚W¥J$^½Àûõë3så\nÒ\nÖîýŽ·Â{è,§w#¾Ý³›ÌœlÒ33™GoÃ±Ò¤n]–nJ M¡ )%…˜åË4¾£h¬^ùáìàÀù+—¹{…¤ ÊÊO;›[¾¥¥%“c—síæMÒ\nb·má½·ë›K^âÏOÝMa¬\ròÓ~ÆÚ«¨Îm…9†Œµö9Q\\o¼ûú¼Pµ*¡ãÆR»Šõ^x1Ïy	aL‘N×|·›fŸØþ÷µ$|†ÂÝ¯5õ{÷ä—?OxÙi\nmG\r§b@ÚŽ\ZNzff¾Ê_¶eÞ\rX”°á‰4õ§ß\nr®g«ƒÛçÌåòë4ìN­öÁ,ŒgþÈÑ„û<vbï’’“©ß»\'µ;´gûÁŸ‰‰ŒR¥O4˜Þ“>¦J[?ÏšAD`áþ4Šè\rÀäI¼z…Z¡ÁLýææ¥³œ#úr21‘W:uäî]¸•‘ÁÇ}ó\\çÉòÓñßy©SZŒ$¨iSì¬­¹ÿàIõÊ/FÆgÈ ^èØ¾ÀÊÊO;›[¾R©Ä¯¡7ï\r\Z@­Ð`Žüù\'S¢™K^âÏOÝMa¬\ròÓ~ÆÚëiž†*/Ì1d¬\r´Ï‰âú{ ºCÇÏüÅÐNïü+ÊyDiQd³üøÇq¶ýüÓ¿Ž}\"¯VÑƒi^¯ÑaYµsK7%pø«Ø<—¥+Þ±æáhgÇÀöX°>Ev61ýä¹üÆý\"hðÚküxü÷\'öÕþRó™oãó\\—g…<`$òKÆyŠK{%¥¤ðv¯$mÞöÔË..mP–mÙÄâ\rë9dàoÓ³þ0ËÓœGw…ù0K‘]Q<rú“õ\\-óñaxç®ØZYÑÙÇ‡‹×®xù;\"´Elmi×¬9»ý’çòþu\ZEN6Ó\rAy÷.OžÐ¹_ÓÈ~ªuº&æ.°çèÕÚYuºwa§ZBñ¬=ï>íYÔa”XÊ{÷Ø{ì(ÿ÷å>ŠèWÔá©¢žG”Eö0‹úÛ7´õ	T}Þ}ä0o¾øR—Ÿtã:ž<€GOÁ]¾~=Ïå/Þ°ží;`ñÜsDµïÀ’„\rx¿öúûX´ä‰ÿÑŽšû“úGòþÛõY½kÃfÆ©ÿÅå·zBQ,­ü¿OŠ:„­¢_k\\™Ð;¿ünhITÔóˆÒ¢X?õ|úâÆ/ZÈšO>-ð¼³ïÜÁ:÷¡+KK²t,E`Jùi\n~ÿ9¹ïîìÞÆÏÖ¬âfF†êIVC~ýz…ês×ÖmèSðuâYô¬ÜB|Z¤½ž6¸¹kOQ‡P¢æ<¢´(¶Å?ÏÓqü8>‹fÒºzæ²±²\"G©ÄæùçÉ¹s;kë<•»m‰—.áÐ¼‰Æö¯·max§.FãØ÷ë1&,ZHâÕ+f­5&„Bý\n{QZËåq®&\'Óáƒ±Ì]h—Ö«¸{pùÆ£ÛÍ—®_§jÅÇ‹•šSþò-›ùcÍ·ª×˜Ý;x˜?ãâ‰Ý²Sžê3‰íÛsní:®lyú_îB!ž5OcQZË‰âØó{¿%ï>ùÈ{AiÓ°!ñ{÷‘•EüÞ=ø6ô6»ü=G`gmÃ+Õªkl±ŠNvöì9zä‰cªW®Ìù+—U/ª¯éY™½ªrçî=f­^…§‡ç¯\\.€\Z\n!„¥ÓÓ˜G”E6Q´ðn ZKKý3Àº½{˜¼|™j»…wƒŸ<êÖƒ_NžàÅ°P~;s†]ºš]þ’	„µôÑ™XK¾Ü´ñ‰ík\'O%xÌ(jw`JÔ@‚ÇŒ¦Id_Þ­S—Þmy·oŸªeéfh­¶¢Vœc+-¤„(ÙŠzQZÙ:ŠOSI‹·4x\Z}Rœû½8Ç&„x6<ëë(ŠÇžÉu…B!Dñ&EQ,(ïÝ£zHÛþÌk]Âpmõ>\0Šì,¢¦O¥jp ý}‰š>UõýN€ä´4‚F ‚¯\rú„søô)Uš-{¥nÏn¸ø¼ÇÝ:óÝ‘ÇWñ~;w–VÑƒñôÇÃß—æ#UÇŒ¦qËBý¶FFVSb¨„W»¶tÿø#nedè­[rZ\ZíÇŽ¦¢¿//wîÈúýû4ÒÕQÝÝû÷©\ZÈwG«j¯Û£+»Rí£ë–ªú6}åÝÌÈÀ«][Ò\ncÓ33ñj×–›Fë¿o¯wí„[ë–ÔëÙïûUo=<ü}Y¿/†…âÚê}FãzjªIí¢k¼Ü½ŸÊ¬Úµƒê!Ax=ú¼|ëfU¼«víÐÙ&†â.¨:!DI$EQ,XZX“ÃÚ½{ØòÙç\\Û¶€qæãáêÊ±Øœ]»WW&Ç.S7fþ\\^­Q“Äõ	ŒíÑ“!³f¨Òž{®Ë·lfÝ”i\\Þ¼ÈàöŸ3[•5}*ÝÚ´álÜ:Î­]‡Oƒwè7%€-3g«žb¿µgÞoÔá£~ý˜¸dÎ¨tJ±\0\0 \0IDATöö‹]Á‰•k¨âîÎ„Ü7íè2añBêÔ®Í©5qì™»€`™»†§)uTW®lY2³²X¾u3q“§paãú3B­^Æè+ÏÕÁ¿FˆÝ¶EcÿØ­[ðkÔW£u>çs¾šð!I[w0²[7Æ-˜§·Y99$ìßÏÞy9¿ï×ß`¬Úþ†ÚE×x)W¶,Ù9Ùœ8ž?V®fVôPÆ-˜Ï©þáÄÊÕÌ\ZÍ§Ëu·«¡¸ªÎBQÉDQ7ÓÒÞ‹j±´x´ÄçÖŸ¢wÛ Ü±·±ep‡0ìW³÷ØQ¢;vÂÞÆ–f-øeérUZFf&S¤f%Ol­¬èÝ6’’Té¿\\F_?l­¬°·±exç®œ½xQ#¦;wïÒqüø7nÌÄ^2ÚñËA¢Ú‡âêà€£Q!¡ì>¢ÿû†{!2$g*¹¹ñaŸ”J¥*ÝXµ¥+L‰\Z¤Q¯f¼žÊPyƒ:„±ló&¥–oÝÌÀÐŽ&ÕÝÍÑ‰„ýß“”’LŸÖüR÷Ä \'\'‡\"úâY¾<ÎôòoË~µ«qÆÚE×xÉÈÌdD—nØÛØØ¤I×¯3¦{OÕÏWÔÞÀ¤ÎPÜYg!„(iŠí‚Û¢tªV±’ÆÏ™™T\nÐØæâèø8]¡ÐøY[å\nTŸ­,-55?uá&.ZÈ¯gÏ ÈÊâÎÝ»\Z¸ûÐã“ÿÃçw4O¿™–†gùÇùz¸¹‘šž®7†ÔôtœÕÞÒãéVÞ¬:êâUáñ—”µëeŒ¡ò^«^ƒJå+°ëð!Z¿ÓïŽÆÝÅ•×kÔŒ×=~ê4¦}ó5Í£\"qwvfÆ !4}³žÞXª¨ÕÃÍÉ‰tµÛÞ¦´‹öx(ïäÀóåÊ=Ê7÷˜çË•ÓÛN†â.è:!DI\"EQ¬”}Nó\"·‡«çã7hL´Ô9;8òoêMª¨ý!7UÈØÑD‡ðÅˆQ¸99qG©Ä¥eUúà™ÓiüFwè¨q\\yRÒÒ¨äæÀ¿))”wqÑ[Ž“½YYªW:^¼®ùdš±:šËÚÚšÛJ%V¹··/ÝÐ¼Šf¬¼¨öÌ\\µ’¦oÖcÖêUi¯J3V÷\Z+±xÌ8>|ÈÊÛ‰˜ÃÙ¸uzc½’|ƒ\Z¹“½ä[·4b2¥]´ÇK^Š» ë,„%‰ÜzÅZÛ&MX²)[(²³˜µf#‡©Òß¯_Ÿ™+W¦P°vïw¼ÞÃä¼³srxû•WqutäìåK|´t	^•*‘xõ\n/âÚ/<1IhãÝˆo÷ì&3\'›ôÌLæÆÇÑÆÀÊÿMêÖeé¦Ò\n’RRˆY¾Lã;ŠÆêh®ªÄnÝÂm¥’¿¯%1nÁ<ííM.ÏÿÝÆ\\KIfÐÌé\\¼v¶¿žÒXÝ›èOÜžÝÜ½Ÿêž•\r¾ÈÒÒ’É±Ë¹vó&i\n±Û¶ðÞÛõ­]1wAÖY!J\Z¹¢(Šµ‰½#ø`á|ê÷îIfN¯Õ¬É¬!CUé“$|ÒÿQ+4˜ª+1oä(“óž:h0½\'}Ì­ôt^­U‹ù#GãloO£ˆÞÜLK`Ðô©\ZÇlÿbGôeèç³y¥SGÊ<÷­ßiÈ¬!ÑzË™<` ‘Ó&3{Íjíì˜< Š?ÿÄý(ûÜsFëh®™C†2fþ\\&,Z@ef\ZÂÇ£¼wK£å•}î9ú3âóÏ˜6$Zãª±ºïÅèy_0`ÚT<+T`öÐázãT*•ø5ôæ½AHNM¥qº|5áCUzA·‹!†â.È:!DI#n‹\"!}\"dQ¸dÁíÒCÜB!„OL…B!„N2QB	¹í,„ÅŸL…B!„Ne.^ºdÒÃ,U½¼\n;!„B‘Ú³X•SêÙÓ<^Uª˜¼³<õ,\nŠô‰B.yê¹ô°ðnðÄ6sæw†È­g!„B¡“L…B!„N2QB!„:ÉDQ!„Bè$E!„B¡“LE±rñú¿ôøäÿð\n\nÀ½M+\Z÷‹ áÀþ\"I×ÓdŠì,Þ\nïÁàÏf>•òž†ü”[T1—tÅ¡¯M¡ c57¿’<ÆJrìBÈDQ×SSñÍ«5jp4v}Ow?\"b&±~ßÞ\"‹K×2>Q3¦3¬sgæY?¦.uä;,º#æ2µïÔ÷“~4,&J2‹¢@ˆÿÌXµ‚>AíÖYµ­»`R3ÒÙ{ì(!-Þ+Âè4­øèã¢¡Dú\'éjQ‡ \n€ô£¥‡\\QÅÆ®C¿ÐªÁ;Ol×#œy#G ¼wê!Al?ø3¯u	ÃµÕûÀ£[ÁQÓ§R58Šþ¾DMŸÊ»wUyüvî,­¢ãè‡¿/ÍFrøô)UzrZ\ZA£GPÁ×‡}Â5ÒÔoede1%†j!AxµkK÷?âVF\0wïß§jp ß9Ì[á=(ßº%u{te×áCzëœœ–Fû±£©èïËË;²~ÿ>tcõÒ¿o¯wí„[ë–ÔëÙïûUg=ôm[¿o//wîˆ‡¿/£†“”’bvÞúö«Ó½‰—.aáÝ€Þ1“ŒÖïîýûT`Õ®T	Â+èÑçå[7«ÚÕ®ªrõ±º»÷ïãáïËúýûx1,×Vï0r×SSMÊOß84\'mæk¨?Smê}gÊy «-cã\\[Až¦ôµ¡ütõµ¹cÓ”óŒ÷›¡c…(,2QÅFRr2^îî÷±´° ;\'‡µ{÷°å³Ï¹¶m\'\0ãÌÇÃÕ•c±+8»v®®LŽ]¦:.júTºµiÃÙ¸uœ[»ŸïÐoJŒ*}Ìü¹¼Z£&‰ëÛ£\'CfÍÐYþÄ%‹p¶·çXì\nN¬\\Cww&,^@¹²eÉÌÊbùÖÍÄMžÂ…[èÌˆ9³õÖgÂâ…Ô©]›SkâØ3wÀÒÒR•n¬^Ú†Ïùœ¯&|HÒÖŒìÖqælOuÖÖÖ¬ßÿ=»çÌã¯ÿ­ÅÝÅ•Î7;o}û_±\ZxtnÙø‰FëW®lY²s²9qþ<¬\\Í¬è¡Œ[0ŸSÿüÃ‰•«™5$šO—›ÞÇêÊ•-KVN	û÷³wÞBÎÇoÀûõ7«V\'Cùé‡æÄ ÍÜc\rõ‡¡qjˆ)ç®~4ÆØ87wsÎSúÚP~ºúÚÜ±©.?ý–Ÿó[ˆ¼’‰¢(V<0þêñ›iiŒïE5ŠXZ<úöÄÖŸ¢wÛ Ü±·±ep‡0‡`~¹Œ¾~ØZYaocËðÎ]9{ñ¢*}ï±£Dwì„½-!ÍZðËÒå:ËÞñËA¢Ú‡âêà€£Q!¡ì>òøûGé\nS¢Q³’\'¶VVônÈ…k×ôÖeïÑ#D†„âìà@%77>ìRùøýœÆê¥ÍÍÑ‰„ýß“”’LŸÖüRÿ¤R[NNûDP¹Bœìí™Ð»?ÿÝì¼Í‰ÁXý223Ñ¥ö6¶6iFÒõëŒéÞSõó•ë×Uû\Zëc]õý(¢/žåËãìà@/ÿ¶ìW»Bc,?]ãÐÜÔ™{¬¡v66Nõ1õ<0—±qnîþæžÆúÚX~ºúÚœ±©.?ý–Ÿó[ˆ¼’ï(Šb£ŠGEþ¹–DÝÚ/Ý·ZÅJ\Z?gdfR-(@c›‹££êó©ÿ0qÑB~={EVwîÞÕøÃ“¡Phì¯ÏÍ´4<ËWPýìáæFjzºÆ>^_µ²´$\'\'Go~©éé8;8¨~öt+oV½´ÅOÆ´o¾¦yT$îÎÎÌ4„¦oÖ3\\)5UÝ=TŸÝ]HS(ÌÎÛœL©_y\'\'\0ž/W\0·ÜôçË•Óh[c}¬Kµ¾rsr\"]­¾¦ä§=óC^5ÔÎ¦ŒS]L=Ìelœ›»¿¹çîkSòÓîk0}lªËO¿å÷ü\"/d¢(Š\rß†\rÙôÃ\'&Š›ü;¶÷édÕ¶²Ïi^÷puã|ü?.êBÆŽ&28„/FŒÂÍÉ‰;J%.-[¨Òù7õ&UÔ~IëRÞÅ…”´4*¹¹ðoJ\nå]\\Ìª§:\'{2²²pÍûâõÍª—¶\Z+±xÌ8>|ÈÊÛ‰˜ÃÙ¸uÀ£[Ë·•J¬roá]ºñä«)ÉÔ¬ä	Àõ[©\Z,\råmjÚÌ­Ÿ!ÆúX—+É7¨‘;H¾uK#SòÓ‡y‰!¯Ç\Zjç¼ŽSSÏmÆÆ–±q®­ Ï0Ü×¦ä§Ý×y•Ÿ~3çÜ¢ È­gQlŒìÚ¸ïv3añ\"’RRPdg±z÷NúO›‚_£FmÛ¤	K6%p+#Ev³Ö¬\"`ä0UzvNo¿ò*®ŽŽœ½|‰–.Á«R%¯^àýúõ™¹ri\nk÷~Ç[á=t–ÓÆ»ßîÙMfN6é™™Ì£·áØiR·.K7%¦P”’BÌòe\ZßÅ2V/mMô\'nÏnîÞ¿OuÏÊ<|øøV~Ub·ná¶RÉß×’·`Žööªtkkk¦|Ëµ›7Qdgñõ–Í¼÷öÛ&åmjÎœ¿r™Û¹WÊÌ­Ÿ!ÆúX›¥¥%“c—síæMÒ\nb·má½·ëç9¿¼“×c\rµs^Ç©©çv?\Z[ÆÆ¹¶‚>/ŒõuAŽCcòÓo¦žƒB¤\"(®ùn6Í\Z?±ýïkIø„»_kê÷îÉ/ž,ð²Ó\nÚŽ\ZNÅ€6´5œôÌÌ|•¿lË&,¼°(aÃiêO¼Éúcú¹:8°}Î\\.ß¸NÃ>áÔjÌÂøxæM¸_€Ác\'öŽ )9™ú½{R»C{¶ü™˜È(UúÔAƒé=écª´õcð¬Dî@£ˆÞ\0L0Ä«W¨\ZÌÔo¾aÞÈQ:Ëù8¢/\'y¥SGÞèÞ…[|Ñ7Ïuž<` ?ÿ—:u ÅÀH‚š6ÅÎÚšû˜T/mãÃ{»œŠ~­‰š6…ÙC‡«ÒfÊÂõñTnëGÈØÑôòo‹­-Ê{÷¸{ÿ>¶ÖÖø5ô¦ÅÀHjwhÏïçÎñIßH“ò65†/FÆgÈ ^èØ>Oõ3ÄXkS*•ø5ôæ½A¨\ZÌ‘?ÿdJÔ <ç—×còz¬¡vÎë85õ<ÐîGCcë¿|\rs]qäya¬¯r\Z“Ÿ~3õ,MŠrQZ”yhâIÊ”)£Z4ÔÂ»A¾ýñãlûù\'¦ûD^­¢Ó¼^=¢Ã:³jç–nJàðW±y.KW¼cÌÃÑÎŽí;°`}<ŠìlbúÈsùûEÐàµ×øñøïOì«^þ‹a¡œù6>ÏuyVÄ\"?d–¥µ¯mš5&{ÿEF¡yšóˆâÎÂ»g5¿¢ñB\rÃ«ˆ˜ªÈ®(9}ŠÉzþÇæãÃðÎ]±µ²¢³\r<5šW;\"´Elmi×¬9»ý’çòþu\ZEN6Ó\rAy÷.OžÐ¹_ÓÈ~ªõÇ&þ?{wÕÔµþ\rü«•0$Ì\nÎvr¨[çAGD¤AªÖúó28 ÖÔZÁ:½E@p‹·ÕÖ¡½Ö[{E¨3ˆ†„\r¢ïjLB’“ žÏZ®EröÙûÙÏÞ¶çäœ¼~äAÎ•Ëâgîõ™5§$â „Bˆ|Ú^G´Z[(J~û†¬¹ãÝÅŠ>sù>éù~ƒ·_ô¸v–¯îðìhi…û2P·ýGÒ1Òdè·n I“±KÎåg\08¿c€WÏ[óúìåÒ­[ðó¾ÄýÌãõ™Š°M5î!„ÒÜi{ÑRèôÍ,ß½ƒå;´ Áë®~öF¯\'QCCä<Ê@•ö¹|>ÎÿçøŽs\0Ì\ZçŠ‹ÿ½Žrß‚ ë÷½ûà6ø3´14ÄçqÈ¿{GýÎBÔÖ/E¶T4Ö-Wc®#Z\n}<ÎŸ…˜²<\nCÃTz®žºÚ¶i¡H„¶ï½á³§hodT¯ö“g¡ðÞ=°†‘zïñ,,ž:1Žs¿_ÅŠ‰(|ø@éóö!„¢ºÆ^G´:yFñai)&‰\rCáªÁ£G”éheû¯Ÿõu¯¤66õj?)+úÏ/^ÿû+%ÉY™*=º`nô\ZÌŸ4	·§áAÖqÍ:E!„&YG´:¹PŒLØŸQ£1þ³º·¼7”qƒ!57<\0©¹9pä¤vû9W.£½Q[|Ø©³Ôû=;ÚÃ´½1r®\\®³OçPðà¾øç»Úu@O{<«yŽøƒ`gm‚÷ ‡„BHËÔëˆ–BkE}\'Gñó%€´ÜÄ$í¿¯ïäØà‹§¥3}ñë¯£§7þ¸yK¦ÏP»ý]G3à3zŒÜú}FÁwÇŽÖyÿpL<—-E÷É^\0€Ø ð\\!_à³>}á?~>ûbnõòÝ\'9/t±>¢[te¾¨³Ÿ6ç$ä]¦íuDK¡µç(6¥w-Þ–@Õ1iè±Ó•¹àŠ“›¾ÕvÍNs/@ÃÌšw-KsŽ\"y«Y>G‘–ìvÑCm‡@Þ1\r1ghÞBÔEE¢3J¹\\LŠŒ€›>˜6éyç¤¶ó«ZOwØ¸¹ h]œø³žõ©\'  6\Z¼<`?qf­^…\'5*årá±–.cà8×—þ¾¡R,5µµpðtÇÙË—ÄSïë;§/ý\0è3kºøÁëþÑkTê[ê¹ôš1çÑè7{~úã÷:ý-çñààéŽ²ÊJ©÷+«ªÐeÒD©¾½‰ÓÚÍéyçÐÓÇì±£0><%*õSôü9:{yàÄÅøxºØcG1Æª,çLy€?nåclèBØ¹»ÁÚÍÃJ‹2Lû*›/5µµèà>NŸDg/Ø{¼ú9);SÜ—§OŠË¿¹¦JŸ$/—)ÊìœQ”{e}”7ïôQÎãÁ~âpù|©|UVUÁ~â”óxŒÇ\n!¤ù¢…\"Ñ+v&¢O÷î¸q(9[pôüy¾~Ö%\0D%l‡5›«Éû8\rÖl6b’÷Ô»¾•»vÀÌØW“÷áúþCèhe…¯¿1\0–mßŠºtEaz\"}g#$~½J±èé¡J @Rv&RbbqçhæyxbÉ·›\0\0×öðêÙn{–¯T©o‹¿ÝŒïW|¢ì“Ÿ9Q	Ûêô—ÍbÁcÈPìÌH—zOv&&3Kê}==„Bdäå!w[\"\nRÀ©WoDJÔ­,.C}}T…8œ›ƒ¬›Q|üc¬ÊrÎ”7\0Z‡™ãÆ!?%\r·§aŒã§˜­`HcÚWÙ|1ÐÓCµ°\Z×\nðçþƒˆ]„¨„í¸qû6®ï?ˆøPü+©î\\T¥O’åNvÎ(Ê½²>Ê›wÀ«yã:x0’gIÅ’œ×ÁƒÁf±BHóEE¢3r¯\\F —7ÌX,Ør8øzn\0D\"‘x{ö…_à?Á·m‡…“}q>¯Þõüõ\"‚&yƒÍbÁ¤}{yyãÌå·ŸGË½z¡S¦Â¸m;x\r_w\'©K%ŸØ `tµµC»6mà?Áw”|…S}Sdäý„¢²RLãŒ‹ßÉ_ ‡N†ä¬LñY¿Ú/œ•‰)>rË…B¬\nøv0c±0Çmò$Î\02ÅUÎåb¹ßt²¶¡¾>c¬L9gÊÛÅïöÀ×ÅíÚ´qÛvX<mòïÞU˜WILû2Í^U–LŸ	ã¶íà>dŠJJ°lÖlñëßî$I¹ ê8òs_ßüOöÁžÌcRôJÊÎÄï)\0˜ÇÒ|éì·IËSQY)uÖËŽc!µWU…Nã¥Þ371©w}å\\.ì,,Å¯­9TH\\¶åñù\nëW%{Ë·$nch¨ôêLõ¥Æ­ÅÚöbxP ¬ÌÌ°>8C?éW§ž®¶vø¤çûØêæŽwÇñ¿ w·îèdmS§ì%âä˜š¢Râ¤*ýìdc+õZY¬L9”çíÆÛX¹#¿çß_ À³š\Z©Åœ2Lû2Í\0°05\0¼g`\0\0à¼ÎÅ{JÇWÕ¹ ê8¿!›ûúæçãÎ]`ka‰Ó—~ƒó§ƒpöò%X™³Ñ«KW\0ª!¤y¢…\"Ñ¦Æ,ð°_ÿ±¾[\"}—5›ƒ‚Ô#u.¡Ö·>ss”q¹°åp\0\0ÊÊ`an.ÞnÆ2Á£Šrt”øYßX˜0Õ×ÅÆ;—EáåË—Øêb£‘Ÿ’&·l¨ÏTxGF`dÿÛ¼)1qJÛ~Pú]^/8JŸ<‘ŠA•~êµ–¾0¡,V¦œ3ñŠŒ@ §¶,Y\nŽ©)ž‰D0=¢Aöeš/MAqêæ^“üyMÂ†û1ô“~ˆ?x\0ó½&‰·i:n„w]z&:cHß¾Ø},\\>EeeˆNÚ#õ™Â	C†`×±<áñÀ¯ þÐŒ«w}ãœãÇœ3¨V£²ª\n[SS0Nâ	þ£Ä†ýûÀåóq8÷,úûùÖ;Yf,\nÜÇÓ×g{˜ê:ÿK¤äœAMm-:ÛuPú­?ŸõêðŽŠD÷Žöè×£§Â²†††ˆINBqy9¸|>’gaä€\ZõSY¬L9gR-bÀ‡mb‚üû÷°j÷.ØÛÚ¢ðá÷eš/MAYîdçŒ<L}TV‡ÛgŸ£¸¬ÁÖánq1&|þökI57BÈ»‹ŠDgÄÌ_€_®ýïOŒá1t(Ú¡öÅ\0ÀJÿ\0•–b ÿltŸ<	\'.^@t`P½ë[ðþ[Xˆ§NAïYÓñ„ÇÃê€/¤ö/|ø\0Ý¼=÷ÃØ¾T¼MÝXdmY\Z1!Áè1e’Jõ-÷›ƒèä$Ø¸:#hm,6-Z¬´þÐÉ>¸vóX4ušÒr\"‘®ƒœ02x>ºy{âò_!6(X£~*‹•)çLâ‚ÂÍjtœàŠ…ñëàî?·ñà¯ñ¾Ló¥)(Ëìœ‘‡©ÊêÐkÝ\Z_xxboæ1Ìõð:[©é¸BÞ]ôÀm¢4&kOÖ1ì<’Žß¾OVZŽÆæ‹¸ÝrÐ·	!*=ŽÜ«WðÍw»°*`ž¶Ã!„òŽ£›YiFl\\Á61Á\nÿ\0¸ÒgÈ!„hˆŠ„4#å§sÔ*O—	!„(C—ž	!„Bˆ\\­îÞ»§ÒÍ,öö!„B©Ù›YÚ¨öeLôí;vT¹0ÝõL\Z\n	!„4.ºë¹åÐwr¬óž:ë;eèÒ3!„B‘‹Š„B!D.Z(B!„¹h¡H!„Bä¢…\"!„B‘‹ŠD§Ü-yßÿûöãa5n,>Ÿ€ŒóyZIÞÝdüjúûùbáÆ\rMÒžªî–<Âgó`á<º#’O“85i‹©]MãjÊ~éšw¹ïêÆþ.÷•¦DE¢3J**àŠºtÁ•ä}øß©˜åê†€è5H?—«µ¸ä=Æ\'hý:„M›†­‹Ãµ‘báˆž„‡Ù\'½-m=Þˆ«Ôü¸„…j;Bˆô~Dg¬?°s=&\"Ìgšø½/\'z¢‚W‰Ü«Wà5b¤£“¶oÕjm‡ ¯ª\nÃ?é§í0QËí¢‡Ú¢\0Q$:ãôo¿b¬ã§uÞòõÃ¶ð\0€èùstöòÀ‰‹ðñt°ÇŽðêRpÐº88xºÃÆÍAëâð¬¦F\\Ç·ò16t!ìÜÝ`íæ‚áqéïâí¥\\.<\"–ÀÒeçúIm“¼DÅN^°Ÿ8³V¯Â\0PS[Owœ½|	ýý|aá<\Z}}gàô¥ßö¹”ËÅ¤ÈØ¸¹àƒiSžwNj;S¿ÞŠDÐwrÄ½¢\"è;9Šc–wyíÍ{ªÄÛTya\Zyñ«’?UÆ]“ü§žËA¯SÁq~³gá§?~—sMm-¬Ý\\žw=}¼Á;\nãÃÃPRQ¡R¬Šæ½:yS¥?Ê(›šŒŸYÓQxïôá½Fa_•µ¡Jì\rqœ½é&c	\0e••ð\\¶çÑè5c*N_ú\r–.cPûâ…Æ}%¤¡ÑB‘èŒ¢ÒRØ[Y)-c¨¯j¡‡ssµq3ŠŸ\0D%l‡5›«Éû8\rÖl6b’÷ˆ÷Z‡™ãÆ!?%\r·§aŒã§˜-Þ¾lûV|Ô¥+\nÓ3é;!ñëå¶¿r×˜ãjò>\\ß­¬°bg\"\0À@OU’²3‘‹;G³0ÏÃK¾Ý¤°?+v&¢O÷î¸q(9[pôüy\Z\ZŠ·3õë\r#CCñ%Ùç/©tyV•x›*/LãSßü1Õ«iþ»ß¯ø\ZEÙ\'>s&¢¶)Ìµ@(DF^r·%¢ õœzõF¤Dye±*š÷êæMÕù$²¹ Éø_ÛwÀ«y»gùJ…}UÖ“†:ÎÞôG“±€È„mèÛ£nNÇÑ\r‘˜–Š*¡z­[kÜWB\ZZ«—/_ªô]Ï­Zµ¢¯ð#\rFÞ˜pœG£0-&íÛ3î{35]í:ˆßëìåïø,-\0Ox<_(þ#$K(=f¤øë­:yyà·ÝI°27W\ZkOoœÜ¼ml\0?ÆÈàùÈOI—ýçh&ì-_-xŸŠD°p~®ürºOöÂ/»¾‡¥™\0 °è!zNò·§n¿dó*/Ï’ï1Å«­¼ÈŽlÌo~fÊS½šæ¿ßìYpqrÂ¼‰žèdm#6WIH\0\0 \0IDAT·MÉ|ÝL;‚®¶v\0€¢²2|þe\0þIËP9²óžiYLýQö»RÙ\\ÐtüåÍ[Ù¾ªÒ†¢Øã8Ód,»NòÄ…ï¾çòÊÿþÆ 9³U>žTE_á×rè;9Öù®ç]”ŸxQ¹î©…ÐÑÚ·‹‹Ð·{Æ²^ÿ}ƒWU…Nã¥Þ371ÿ|ãÎm¬Ü‘ˆßóo‚/àYM\rD¢·_˜Îãó¥Ê+RÎåÂÎÂRüÚšÃAEe¥T™7 ¡!„B¡Âú**+aÆb‰_Ûq,ÔêWCPoSå…i|aÊS½šæ?5n-Öþ°Ãƒaef†õÁ!ªä3¢%rÀ15E%Ÿ¯r¬@Ýy¯nÞ4™OÊæBC@Ý¾ªÒ†\"qœi2–OxÒñ¼ïà U·&}%¤¡ÑB‘è—Aƒpìßçë,3þ7ö<”Åˆß{s‰æ\rk6©G¤~ùJòŠŒ@ §¶,Y\nŽ©)ž‰D0=B¼ÝŒe‚Gåè(ñËYss”q¹°åp\0\0ÊÊ`!ç‹ªLYà	`¿Žûn‰ôÿ™úÅÄÈÈOE\"´y}™íÞãµöoª¼0\"LùcªWÓüw±±ÅÎeQxùò%öŸ:€Øh¥g}”>F—× Ò\'O¤êU%²ó^Ý¼i2Ÿ”Í…†>.€º}Õ¤Æ8Î4Kãöíñ¸¢B|óÖƒ\rÖWB\Z\Z}F‘èŒð³röVìÜ¢²2ð«8xæ¾\\×Áƒ•î;aÈì:–\'<øÕÄ:€ñáaâíÕB!|øØ&&È¿«vï‚½­-\n¾ú=jà@lØ¿\\>‡sÏ¢¿Ÿ¯ÜvÆ9\rÆ9gP%¬FeU¶¦¦`œ“òØ”Ò·/vË\0—ÏGQY¢“öH}vŠ©_L¬­‘œ…§\"þ).BTÂ6˜«¼Så…i|aÊS½šæèü/‘’s5µµèl×Ê>Échhˆ˜ä$——ƒËç#ùxF¨QÔÝG“ù¤l.h:þf,\nÜÇS%gC5i£¡3MÇrpïÞˆÝ›„Êª*=DìÞäë+!\rŠDg°Y,œøv+î?.Á ¹~è6É‰©©Ø?×ñJ÷]é€¢ÒRôŸî“\'áÄÅˆo^ÿ5«Ñq‚+Æ¯G€»üÜÆcp€?\0 fþ>|€nÞžˆûál_*·Õ_à¿……øpêôž5Ox<¬ø¢Þ}Ž™¿\0¿\\ûÞŸ:#ÂcèP´72ßýÈÔ/&B!1=&¸Â+2sÜ& }»v=®r|M‘¦ñQŸ²ü©2îšä¹ßD\'\'ÁÆÕAkc±iÑb…±ŠD\"¸rÂÈàùèæí‰Ëý…Ø `r î>šÌ\'esAÓñß²4cB‚ÑcÊ$…e4i£¡3MÇrí‚…(xø=¦LÂä¨HOòn°¾ÒÐèf¢4&¤¥¡9ß|4ôX——ãÓ¹~¸—‘Ù`ut3KKÒ˜7³ÐEB!¤	\r_ˆÄô4ž>Å£\'Ø‘žŠÁ½{k;,Bä¢…\"!„Ò„6-ZŒÃçrÐÅÓŽsf#ÿÁ}l[¢í°‘‹îz&„&@—›MÇò“î=»5¡¢!¤qÑEB!„\"-	!„Bˆ\\´P$„B!rÑB‘è4}\'G­ì«m’±7f?äÕÍ¯ ¿Ÿ/nÜÐhí6mÍ¦\Z?¢\Z\ZƒæëÐÙÓh;ìó:ïÿS\\„1!Á°ruÆ@ÿÙøõ¯ÿj!ºæŠ„41—°PÆ2Muãƒ¼v‚Ö¯CØ´iØº8¼Ibhî´u‹*óŒwÙÏ^Ãõ‚¹ßo‹ýûãŸô£øÂÃ!Íà?¾ÚBEBšØí¢‡ÚA©}«Vc¦ó8m‡A4¤ëóŒM]þûb|ƒŽÏ˜1X<mÚµiƒicÆànqqG×|ÐB‘èŒR.“\"#`ãæ‚¦MAzÞ9©íüj‚ÖÅÁÁÓ6n.Z‡g55*ÕýÇ­|Œ\r];w7X»¹`ø‚@\\úû†ÒX<\"–ÀÒeçúI•å	ˆF\'/ØOœ€Y«Wá	\0¨©­…ƒ§;Î^¾„þ~¾°p¾¾3púÒo\0€>³¦£ðÞ=è;9Â?z\rDÏŸ£³—N\\¼€§û€=v€º—ÊÒÏåâƒiS`íæ÷¥‹QTV&Þ&ï²šä{Êú\"YN“~Éª©­…µ›ÒóÎ¡§7ØcGa|xJ**T\ZEyQw%)ë\0¤žËA¯SÁq~³gá§?~WX—:q¼ÉqMm-:¸ÇÓ\'ÑÙËö¯~NÊÎÇtàôIñ~Êæ»ºó¬¡ú_ÎãÁÁÓe••RïWVU¡Ë¤‰Rõ½‰S×æ&ûÝæ3Má¶¹ãÝÑæõ÷yŸ¹|	Ÿô|¿©Âjvh¡HtÆŠ‰èÓ½;nJAÎÖ=†¯t\0ˆJØk6W“÷!ÿp\Z¬ÙlÄ$ïQ©î uq˜9nòSÒpëp\ZÆ8~Šy±Ñ\nË/Û¾uéŠÂôDúÎFHüzñ¶•»vÀÌØW“÷áúþCèhe…;\0zz¨”‰”˜XÜ9š…yžXòí&\0Àµ}¼º¹gùJêë£Z(ÄáÜdmÜŒâã§êÄbdd„ô¼ŸpæÛmøßÿ;+s6¾JÜ®R¿™ú\"I“~É2ÐÓƒ@(DF^r·%¢ õœzõFdÂ6qec¢(/êŽ£ªý€ÅßnÆ÷+¾FQöI„Ïœ‰(‰XeÕ\'==T«q½ \0î?ˆøÐEˆJØŽ·oãúþƒˆ	Å¿’ÞÎgeó]ÝyÖPýg³Xð2;3Ò¥Þß“‰‰Ã†ÃŒÅªÓg]›šìKÞ=ß½ƒå;´@Û¡¼³è»ž‰VÈ“î“½ðË®ïaif\0(,zˆž“<Åå:{yàß;¾CKK\0ÀÃŠÿ(ªÒÆB‘ì1#~j\'/ü¶;	Vææu¶õôñÆÉÍ[ÐÙÆ\0ðàñcŒžü”4q»ÿÍ„½å«ïÙ|*ÁÂeø¹yrãÒwrÄÍÔttµë 7v}\'Gü•’Šží\0wKaÔ‚ù(H=¢°Ÿ’ï)ë‹d9Mû%¯î›iGÐÕÖ\0PTV†Ï¿À?irËËŽ‰¼¼0í£IÿúÍž\'\'Ì›è‰NÖ6\nÛT5vy¿/õQ|â4,LMñ¬¦í†~†G\'Ï€cb‚g55à8ç“i¾«;Ï\Zªÿ…Eáºÿ=ø#Þ30@í‹è7{&Ž®—»Ÿ®Íu÷}—µ”ïzV4¾`Êò(l\rƒ«Ó`-DÖt\Zó»žé›YˆÎ¨¨¬”:#aÇ±ÚÎ«ªB\'ñRï™›˜¨T÷;·±rG\"~Ï¿	¾@€g55r?\0-n‹ÏWXw9—;Kñkk2—âÞüñ€6††\n…Jãëôú·\"VÖâŸ­ÌÌÁåó•–—¤¬/’\Z£_%ÊsLMQ)·*c\"›uÇQþ¥Æ­ÅÚöbxP ¬ÌÌ°>8C?é\'·.Mâ°05\0¼g`\0\0à¼›÷¤ò©Ê|Wg<\Zªÿ]míðIÏ÷±ÿÔ	ÌïŽã~AïnÝ•..uih²/yw<,-Åä¯\"²¨Ù/]z&:ÃÔ˜ž@ ~}·DúGÖlJOÅó‹—ÄÿŸ<£RÝ^‘òÉ\'øyçn<Ì:‡™Ç•–7c™àQE¹Ümææ(ãrÅ¯••ÁBÎÙ:uèµV~(>,+ÿ\\ò¤BjÁ`dd„§èî=.‘ÚWY_$5F¿”>ÿ\\úä‰ÔTÙ¼¨;Ž’˜ú×ÅÆ;—EávZ‚\'OA€’Ë‘šÄ¡*Mæ»<\rÙÿPŸ©X‘˜€ÛÅEÛ¼aÓ¦+m[—æASŒÑ¾È„mð5\Zã?«ûè¢Z(1¤o_ì>–.Ÿ¢²2D\'í‘úŒâ„!C°ëXžðxàWè\0Æ‡‡©TwµPˆ~¶‰	òïßÃªÝ»`ok‹Â‡ä–5p 6ìß.ŸÃ¹gÑßÏW¼mœÓ`ü˜sUÂjTVUakj\nÆ©ñ?V3îK-î”122BìÞd——ƒ_-ÀÞ¬LŒ0@¼ÝÁÚ\ZÉÙYx*áŸâ\"D%lƒ‰±±J}‘¤i¿d\Z\Z\"&9	ÅååàòùH>ž…‘Š·«;&õÝGÕþ\rÿ%RrÎ ¦¶í:@Ù§r4‰CUšÌw î<kÈþÖ«7z88À;*Ý;Ú£_ž\nËêÚ<hŠ±#MCßÉQ|³˜äÏ\0–›ƒ˜¤=â÷õQðà¾¶B}§Ñ¥g¢3bæ/@àÚl:t&íÛ#f~N^øµ/^@¯uk¬ôÀW‰Û1Ð6ª„B|Üµ+âC©Tw\\ðBø¯Y\'••ø¨[7l€™±1ø£äÄi¹±ø­ùÝ¼=á`c‹máKÅÛV|E›7áÃ©SÐªuk8:ñ!ª?³nËÒŒ		Fí‹¸—‘©´lMm-ÚÁuF,—ÏÇà^½±cY”¸Ì†EX¶}+VìH@kklÁÏ×®Aôü9õõ•öE’¦ý’%‰à:È	#ƒç£´¢Ÿ÷é‹ïW|-Þ®î˜ÔwUû·Üo\"¶mÁüµq°³´Ä¦E‹Ö¥IªÒd¾uçYCö\0B\'û`ÊW‘ÈÞ¼Ei9]›M1v¤i(»÷ %|6³©ÐÍ,D+hLš?\ZãæmOÖ1ì<’Žß¾OVZŽæö´”›YHãÞÌB—ž	!„¨Lôü9r¯^Á7ßíÂª€yÚ‡ÒÈèÒ3!„•Ù¸:ƒmb‚þt7)!-\0-	!‚.76Oå§sÔ*Oó€w]z&„B!rÑB‘B!„ÈEEB!„\"-	ib’…ÕfÛwKá³y°p­µxHó¤Í9NiX´P$Í†KXýÝRHÞXàŽèùAx˜}R‹š·„]Fw=“fãvÑCm‡ðNáUUaø\'ý´F‹Gó–¢ËèŒ\"Ñüj‚ÖÅÁÁÓ6n.Z‡g55\0^}•ƒ§;Î^¾„þ~¾°p¾¾3púÒo\0€>³¦£ðÞ=è;9Â?z\rDÏŸ£³—N\\¼€§û€=vc\0PVY	ÏeKÁq^3¦âô¥ß`é2µ/^\0\0þ¸•±¡açîk7_ˆKßPØ§R.“\"#`ãæ‚¦MAzÞ9•û,¼KzoÞcÊÑ›²B‘úNŽ¸WT$õý¨<\0±Ñèäåû‰0kõ*<áñ\0@n>kjkÑÁ}<œ>‰Î^°÷xõsRv¦¸Ž§ßž­dêkê¹ôš1çÑè7{~úã÷:}-çñààéŽ²ÊJ©÷+«ªÐeÒDq¼oÔÔÖÂÚÍéyçÐÓÇì±£0><%â2LcZgÏåÂÂy4DÏŸ3Ž	S¿eçmCå©!r^ÊåÂ#b	,]ÆÀq®ŸTN”ÍYÊò[ßãTB4CE¢3¢¶ÃšÍÆÕä}È?œk61É{\0\0zz¨”‰”˜XÜ9š…yžXòí&\0Àµ}¼º´ºgùJêë£Z(ÄáÜdmÜŒâã§Û\0€È„mèÛ£nNÇÑ\r‘˜–Š*¡z­_*Aëâ0sÜ8ä§¤áÖá4Œqüób£öiÅÎDôéÞ7¥ gkŽž?CCC•ú¬.¦½adh(¾ýüâ%ñÏ+wí€™±1®&ïÃõý‡ÐÑÊ\n+v&€Ü|\Zèé¡ZXëøsÿAÄ‡.BTÂvÜ¸}×÷D|H(þ•ô¶/L}]üíf|¿âkeŸDøÌ™ˆJØV§lC†bgFºÔû{²31qØp˜±Xur\"\n‘‘—‡Üm‰(H=§^½)Q7Ó˜®Ø™ˆÞÝ»ã¿‡RpvËvdüû<OŸÂP_µ2Êú-;o*Oª´ÍT×²í[ñQ—®(LÏ@¤ïl„Ä¯oS6Wd)Ëo}Sur@Ñ-‰ÎÈ¾ðü\'x€cbã¶í°p²2Îç‰·Wòùˆ\r\nFW[;´kÓþÜq§¸Xa}å\\.–ûÍA\'kñu¦6Î]¹‚@ÏI`³Xèbc‹åsü!‰ÄÛ/~·¾.®h×¦\rŒÛ¶Ãâi3÷®Âr¯\\F —7ÌX,Ør8øzn€T}Lñ¨KÝI:ùëEMò›Å‚IûöòòÆ™Ëo?Ó(/Ÿ¼ª*,™>ÆmÛÁ}È0•”`Ù¬Ùâ×JJTî+ÇÄy?¡¨¬ÓÇ8ãâwòÌ¡S§!9+S|†©öÅ$ge\"dŠÜòB¡«¾€…ÌX,Ìq›€<‰3PLcš{å²xNØYX`åœ9RcÈDÝ1n¨<iZWîÕ+2ÆmÛÁkØüº;I¼i®HbÊo}ŽSur@Ñ}F‘è^U:yŒ—zÏÜÄDêµ½åÛ/9och¡P¨´ÎN6¶jµñ„W)uVê}©²7îÜÆÊ‰ø=ÿ&øžÕÔ(]4TTJ×gÇ±P+žúP7Go”s¹°³°¿¶æpP!s‰W6Ÿ\0`aj\n\0xÏÀ\0\0Àyÿ{Rm3õ55n-Öþ°Ãƒaef†õÁ!*ç3”]míðIÏ÷±ÿÔ	ÌïŽã~AïnÝÑÉÚFaß:Jä„cjŠJ>_üšiL+*+¥â´·®›eÔã†Ê“¦uñø|…qª2WÞPå˜Q÷8U\'„ÍÐB‘èk6©Gê\\>ÔÄ›KÆª¶aÜ¾=WT ƒå«?‚·<Úî@O/lY²SS<‰`>z„ÂöMYà	`¿nïnÉ#µâ‘edd„§\"Ú¼¾|}ïq	Ãª³07G—[\0ð¨¬ææRedó©¦¾v±±ÅÎeQxùò%öŸ:€Øhä§¤É-ê3Þ‘Ù\0Â6oDJLœÒ¶”>F—×‹‘Ò\'O¤b`\ZSÙ1| “s¦1QwŒ2OšÔeÆ2Á£Šrt”X¾¡Ê\\yC•cFÝãTB4C—ž‰Î˜0dvËÀüjâÀøð0•÷7c±Pðà>ž*9ÃÇÔÆàÞ½»7	•UU(,zˆØ½ÉRûW…ðáG`›˜ ÿþ=¬Ú½ö¶¶(|ø\0òéÛ»e€Ëç£¨¬ÑI{¤>£¨nŸ¬­‘œ…§\"þ).BTÂ6˜«˜!åÆ9\rÆ9gP%¬FeU¶¦¦`œÓà©`îëÐù_\"%çjjkÑÙ®^¾|©°®ÏzõFxGE¢{G{ôëÑSaYCCCÄ$\'¡¸¼\\>ÉÇ³0rÀ@ñv¦1Ò·/ve¤ƒËçãai)VìÚ###ñþLcÂÔoÙyÛyÒ¤®QbÃþ}àòù8œ{ýý|ÅÛÔ™+ê3\rBˆfh¡HtÆJÿ\0•–b ÿltŸ<	\'.^@t`ÊûoY\Z1!Áè1eR½ÛX»`!\n>D)“09*Á“¼¥ö^ÿ5«Ñq‚+Æ¯G€»üÜÆcp€¿Üöbæ/À/×þƒ÷§NÆˆð:íŒÄwQ«Ûç\r!‹˜žŠ\\á9nÐ¾];ñ¸šXðþ[Xˆ§NAïYÓñ„ÇÃê€/4®÷\r¦¾.÷›ƒèä$Ø¸:#hm,6-Z¬´¾ÐÉ>¸vóX4ušÒr\"‘®ƒœ02x>ºy{âò_!6(X¼iLcæ/ÀÅëŠÇÐ{ÄH©KêLcÂÔoÙyÛyÒ¤®˜ùPøðºy{\"î‡°-|©x›:sEÝc¦!r@ü&¤á´z©âÅZµj%¾;RßÉQêÁ½ºî]‹·%xWÆ¤¸¼ŸÎõÃ½ŒLm‡BdìÉ:†GÒñÛ÷ÉJË5Æ\\{Wæ/iÙÚûÕy?k;Òôq³Pú£M=ºX)(­:£Hˆ„á‘˜žÁÓ§xô¤;ÒS1¸wom‡E$ˆž?GîÕ+øæ»]X0OÛáBH³F7³\"aÓ¢ÅX²e3¾ùn\'Þ{ï=|Ö§6‡-ÑvXD‚«3Ø&&Xá\0×ü%!„ºh¡Hˆ„Oº÷@îÖm‡A”(?£VùÆ¸DL—	!-]z&„B!rµº{ïžJ7³8ØÛ7v,„B!¤dofic ú7H)£oß±£Ê…k.ü\00ü©øçwÁ»oK@cB!«Ýð!üôom‡Aš€ÁàOë¼§ÎúNµ>£ØªU+¹?¿Þµx[\ZBi\\ô{–hŠ>£H!„Bä¢…\"!„B‘‹Š„B!D.Z(B!„¹h¡HtÊÝ’Gðý¿o`ï1VãÆâóyÈ8Ÿ§Õ˜ôë¼Ç¯ ¿Ÿ/nÜÐ$í5MÚÕVÌõñ.æ—\"ß¡³§ÑvØçuÞw^}\'Gñ¿Æø]ÝRÐ7³QRQ·°PÌruÃ†…¡0ÐÓCJn¢×àEm-¼FŒÔJ\\ò¾…#hý:„M›†™Îã´‘î‘Ì‘KX(NnúV‹Ñè&ú6B\ZÖÏ^Ãõ‚ˆDuŸÈTáfÚtµµÓBdÍ-‰ÎX`æzLD˜Ï4ñ{_NôD¯¹W¯hm¡(Ï¾U«µ‚Îº]ôPÛ!BZ€Ëß@L`ÖíM®³W%€y{ã¦ª¢KÏDgœþíWŒu¬ûÐÐ(_?l\0\0ˆž?Gg/œ¸xO÷{ì(\0¯.­‹ƒƒ§;lÜ\\´.ÏjjÄuüq+cCÂÎÝ\rÖn.¾ —þ¾!Þ^ÊåÂ#b	,]ÆÀq®ŸÔ6ÉK†<\0±Ñèäåû‰0kõ*<áñ\0\05µµpðtÇÙË—ÐßÏÎ£Ñ×wN_Rü`ñR.“\"#`ãæ‚¦MAzÞ9©íLý’•z.½fLÇy4úÍž…Ÿþø]n?½—~.L›k7¸/]Œ¢²2µêî3k:\nïÝƒ¾“#ü£×0ö¡¦¶ÜÇãÀé“èìå{W?\'egŠs|àôIq;LãØØùUÔ~9û‰Àåó¥ÊWVUÁ~â”óxR¹V–KesŒi_BZÉ“\n²xf®þ\Z6n.Œ»%–%ÊÑB‘èŒ¢ÒRØ[Y)-c¨¯j¡‡ssµq3ŠŸ\0D%l‡5›«Éû8\rÖl6b’÷ˆ÷Z‡™ãÆ!?%\r·§aŒã§˜-Þ¾lûV|Ô¥+\nÓ3é;!ñëå¶¿r×˜ãjò>\\ß­¬°bg\"\0À@OU’²3‘‹;G³0ÏÃK¾Ý¤°?+v&¢O÷î¸q(9[pôüy\Z\ZŠ·3õKÖâo7ãû_£(û$ÂgÎDTÂ6¥ù”ddd„ô¼ŸpæÛmøßÿ;+s6¾JÜ®VÝ×öðê2ëžå+û` §‡ja5®àÏýºQ	Ûqãöm\\ßñ!¡øW’êã(«¡ó«¨}6‹×Áƒ‘|<Kª|rv\\›Å’z_Y.•Í1UÇ–nÄ€X2}&ò§¡W·nX¼i£¶CzgÑB‘è”/˜¿z¼œËÅr¿9èdmCýWŸžÈ¾ðü\'x€cbã¶í°p²ÔM0¿Û_W´kÓÆmÛañ´È¿{W¼=÷ê„N™\nã¶íà5l~Ý$·í“¿^DÐ$o°Y,˜´o /oœ¹üö³g•|>bƒ‚ÑÕÖíÚ´ÿwÜ).VØ—Ü+—èå\r3¶¾ž õy¦~Éâ˜˜\"#ï\'••búg\\üNñ¢G–P(ÄÊ¹è`i	Scc¬ðŸ‹Ÿ¯ýGãº™úÀ«ªÂ’é3aÜ¶Ü‡CQI	–Íš-~ý ¤D\\–ie5t~•µ<Ù{2áåË·s8);¼§Ô©GY.™æ˜&cLHKñÃ×ß`dÿ0nÛËýüqñ¯ÿj;¤w}F‘èŒŽÖ6¸]\\„¾Ý{0–ídc+õšWU…Nã¥Þ371ÿ|ãÎm¬Ü‘ˆßóo‚/àYMÔ‚ÇçK•W¤œË……¥øµ5‡ƒŠÊJ©2ö–oÏŠ¶14„P(TX_Ee%Ì$Î6Ùq,Ôê—¬Ô¸µXûÃ^\n„•™Ö‡`è\'ý”wJ‚ƒ•µøg+3s©K©õ­[•>X˜š\0Þ30\0\0p^oÏÀ@*Lã(«¡ó«¬ý;w­…%N_ú\rÎŸÂÙË—`eÎF¯.]ëÔ£,—LsLÓ1&¤%øãV>zwí½Ö­ñâÅ¾þÝBÔGE¢3\\\rÂ±Ÿ¯³PÌüùßØwòRþ#~O¯µôÉpk6©G¤’¼\"#èé…-K–‚cjŠg\"ÌGo7c™àQE9:Jü–ÇÂÜe\\.l9\0À£²2X˜›«ÕOI¦Æ,ðñ¥IÙÏÑ0õKV[ì\\…—/_bÿ©ˆF~J\Z€W—–ŸŠDhóúÒë½Ç%uöXV*¾K°äI…Ô¢IYÝÊ¨Ûe˜ÆQVCç—©ý ¯IØp`?†~Òñ`¾×$¹õ(Ë%Ó«ï8Ò’¯_‡ic1ÛÕk÷íÅç½ûh;¤w]z&:#|Æ,¤œ=ƒ;w ¨¬üjž9…/×ÆÂuð`¥ûN2»Žeà	~µ\0ñ‡`|x˜x{µPˆ~¶‰	òïßÃªÝ»`ok‹Â‡\0\0£Ä†ýûÀåóq8÷,úûùÊmgœÓ`ü˜sUÂjTVUakj\nÆ9)M™!}ûb÷±pù|••!:iÔgè˜ú%kèü/‘’s5µµèl×Aê2¨ƒµ5’³³ðT$Â?ÅEˆJØã·w\Zº:\n\0\0 \0IDAT!vo2ŠËËÁ¯`oV&F RÝ’ÌX,<¸§¯Ï´©Ûe˜ÆQVCç—©}·Ï>GqY)‚7¬ÃÝâbLø|ˆÜz”å’iŽ©:„4wož‘(û3\0l\r_ŠNd£›·þ¾së‚C´æ;Î(Áf±pâÛ­X±#ƒæúá™H„öØÏaÃ•î»Ò?\0_%nÇ@ÿÙ¨\nñq×®ˆY$Þ¼þkVãIe%>êÖ\rÛÃ#`flŒÁþ(9q\Z1óÀoÍ7èæí	[l_*·Õ_`ÑæMøpê´jÝ\ZÎŸB|Hh½û3×Æ`Ó¡ƒ0iß1óƒpòÂ/¨}ñz­[3öKÖr¿9ˆØ¶ó×ÆÁÎÒ›-oÛ²Ë¶oÅŠ	è`m\rÁ!øùÚ5ˆž?G«V­ÐÎÈ®ƒœ0bA ¸|>÷êË¢Tª[Ò–¥ŒÚ/p/#Sí>(Ã4Ž_¦öõZ·ÆžX²y#Ö†„Ö9ó­J.™æÓ8è;9Ò3I‹ lž÷ëÑ—¾Onº`š±V/Uüïh«V­Äƒò®ý\"z×âm	hL!¤qµö9ªó~Öv¤	è;9âf¡ôGkztQþUÑ¥gB!„\"-	!„Bˆ\\´P$„B!rÑB‘B!„ÈÕêî½{*ÝÌâ`oßØ±B!„z½™¥â/#P‡¾}ÇŽ*¦»žIC¡1!„ÆEw=·’Ï|Cõ2té™B!„ÈEEB!„\"-	!„Bˆ\\´P$„B!rÑB‘B!„ÈEE¢Sî–<‚ïÿ}{ñ°\Z7ŸÏ@Æù<­Æ$ïn2~µ\0ýý|±pã†&i¯)hÒ®¶bnhÍ¥Í!ÚGE¢3J**àŠºtÁ•ä}øß©˜åê†€è5H?—«µ¸ä=Æ\'hý:„M›†­‹Ãµ‘îQõQG.a¡	yƒrMiúÚ€7ÖØ‡¹æ3MüÞ—=QÁ«DîÕ+ð\Z1R‹ÑIÛ·jµ¶Cx\'Ý.z¨íZÊ5!¤!ÐE¢3Nÿö+Æ:~Zçý(_?l\0\0ˆž?Gg/œ¸xO÷{ì(\0¯.­‹ƒƒ§;lÜ\\´.ÏjjÄuüq+cCÂÎÝ\rÖn.¾ —þ¾!Þ^ÊåÂ#b	,]ÆÀq®ŸÔ6ÉË_<\0±Ñèäåû‰0kõ*<áñ\0\05µµpðtÇÙË—ÐßÏÎ£Ñ×wN_úMaŸK¹\\LŠŒ€›>˜6éyç¤¶3õKVê¹ôš1çÑè7{~úãw¹ýPô^ú¹\\|0m\n¬Ý\\à¾t1ŠÊÊÔ®[Q¹>³¦£ðÞ=è;9Â?z\rcÿjjkÑÁ}<œ>‰Î^°÷xõsRv¦8ÿNŸ·Ë4ÆÚÌ=Ó¼±vsAzÞ9ôôñ{ì(ŒCIE…JûË;&ÔÍµ,UbR–oEÇ©ºc$I“}	!õGE¢3ŠJKaoe¥´Œ¡¾>ª…BÎÍAÖÆÍ(>~\n\0•°Öl6®&ïCþá4X³ÙˆIÞ#Þ/h]fŽ‡ü”4Ü:œ†1ŽŸb^l´xû²í[ñQ—®(LÏ@¤ïl„Ä¯—ÛþÊ];`flŒ«Éûp}ÿ!t´²ÂŠ‰\0\0==T	HÊÎDJL,îÍÂ<O,ùv“Âþ¬Ø™ˆ>Ý»ãÆ¡älMÀÑóçahh(ÞÎÔ/Y‹¿ÝŒïW|¢ì“Ÿ9Q	Û”æS’‘‘Òó~Â™o·áÿï0¬ÌÙø*q»Úu+*wmßA\0¯.SïY¾’±zz¨VãzAþÜñ¡‹•°7nßÆõýŠ%©>Æ²š2÷LóF \"#/¹ÛQzN½z#RÅýåêæZ–*1)Ë·¢ãTÝ1’¤É¾„ú£…\"Ñ)/^0õx9—‹å~sÐÉÚ†ú¯>=‘}áøOð\0ÇÄÆmÛaád©›`.~·¾.®h×¦\rŒÛ¶Ãâi3÷®x{îÕ+2ÆmÛÁkØüº;InÛ\'½ˆ IÞ`³X0ißA^Þ8sùíçó*ù|Ä£«­Úµiÿ	î¸S\\¬°/¹W.#ÐËf,l9|=7\0\"ÑÛïçdê—,Ž‰)2ò~BQY)¦qÆÅï/ld	…B¬œ€––056Æ\nÿ¹øùÚÔ®[˜úÇ«ªÂ’é3aÜ¶Ü‡CQI	–Íš-~ý ¤D\\–iŒe5eî™æP(Äª€/`ga3sÜ& OâŒ$ÓþòŽ	us-‹)&¦|Ë‹IÝ1’¤É¾„ú£Ï(ÑÑÚ·‹‹Ð·{Æ²ll¥^óªªÐÉc¼Ô{æ&&âŸoÜ¹•;ñ{þMð<«©‘Zðø|©òŠ”s¹°³°¿¶æpPQY)UÆÞòíYÑ6††\n…\në«¨¬„‹%~mÇ±P«_²RãÖbí{1<(VffX‚¡ŸôSÞ)	VÖâŸ­ÌÌÁåóÕ®[TéŸ…©)\0à=\0\0çõö÷¤rË4Æ²š2÷ªÌ›Žó†cjŠJ‰Ü«²¿ì1!KÝþ0Å¤J¾ecRwŒ\Zj_BHýÑB‘è—Aƒpìßçë,3þ7ö<”ÅˆßÓk-}2ÜšÍAAê©?ü’¼\"#èé…-K–‚cjŠg\"ÌGo7c™àQE9:Jü1–ÇÂÜe\\.l9\0À£²2X˜›«ÕOI¦Æ,ð°_Ç}·ä‘Zý’ÕÅÆ;—EáåË—Øêb£‘Ÿ’àÕ¥å§\"Ú¼¾¼zïqIý–•¢«­\0 äI…ÔBBYÝªÆ KÝþ)Ã4Æ²š2÷ªÌ›¥ÑåõÂªôÉ©vUÙ_ö˜UŸ\\+‹I•|ËÆ¤î5Ô¾„ú£KÏDg„Ï˜…”³g°bç••_-ÀÁ3§ðåÚX¸¬tß	C†`×±<áñÀ¯ þÐŒo¯\n1àÃÀ61Aþý{Xµ{ìmmQøð\0`ÔÀØ°¸|>çžE?_¹íŒs\ZŒsÎ JXÊª*lMMÁ8\'å±)3¤o_ì>–.Ÿ¢²2D\'í‘úœS¿d\rÿ%RrÎ ¦¶í:àåË·—ò¬­‘œ…§\"þ).BTÂ6˜‹·!vo2ŠËËÁ¯`oV&F RÝªÆ`Æb¡àÁ}<}}&HÝþ)Ã4Æ²š2÷LóÆÐÐ1ÉI(./—ÏGòñ,Œ0PåýåÑ4×L1©›ïúîÓûBêÎ(Áf±pâÛ­X±#ƒæúá™H„öØÏaÃ•î»Ò?\0_%nÇ@ÿÙ¨\nñq×®ˆY$Þ¼þkVãIe%>êÖ\rÛÃ#`flŒÁþ(9q\Z1óÀoÍ7èæí	[l_*·Õ_`ÑæMøpê´jÝ\ZÎŸB|HýŸW3×Æ`Ó¡ƒ0iß1óƒpòÂ/¨}ñz­[3öKÖr¿9ˆØ¶ó×ÆÁÎÒ›-oÛ²Ë¶oÅŠ	è`m\rÁ!øùÚ5ˆž?G«V­ÐÎÈ®ƒœ0bA ¸|>÷êË¢Tª[Õ¶,À˜`Ô¾x{™j÷O¦1–Õ”¹gš7\"‘®ƒœ02x>J+*ðyŸ¾ø~Å×*ï/¦¹fŠIÝ|×wŸ†Ø—R­^*:- [°U+ñCuõU~À®.x×âm	hLyK]Œ‰¨§í°ÏQ÷³¶Ã M@ßÉ7¥?>Ó£‹ò§ˆ¨Š.=B!„¹h¡H!„Bä¢…\"!„h™.^âÕÅ˜!MŠ„B!D.Z(B!„¹h¡H!„Bä¢…\"i±ôµBºÓ»J^.ùÕô÷óÅÂ´Ñ[M5Î’í´ä¹Õ’ûÞÜ:{\Zm‡}^çýÿÜÊÇ/¿€•«3†|ùþ¸•¯…èšZ(’KÕë»„ÕÿÚê¢\ZŽ¼\\­_‡°iÓ°uq¸\"Ò®–4·dÙ–Ô÷–äç?¯ázAÜïü\\‹9&àŸô£ðusCÐº8-DØ<ÐB‘·‹j;Ò@ö­Z™Îã´idtÌ¶—ÿ¾˜À ¹Ûþyð\0ÓÇº ]›6ðç†Âû÷›8ºæƒŠD\'ÔÔÖÂÚÍéyçÐÓÇì±£0><%â2üj‚ÖÅÁÁÓ6n.Z‡g55\0\0Ñóçèìå/àãé>`\0H=—ƒ^3¦‚ã<\ZýfÏÂOü.®Oòr”¢r}fMGá½{Ðwr„ô\ZÆ8jjkáàéŽ³—/¡¿Ÿ/,œG£¯ïœ¾ô›¸­R.K`é2ŽsýpéïrcúãV>Æ†.„»¬Ý\\0|A TYeåCYìêÄ&û^cST—\'  6\Z¼<`?qf­^…\'<ž8v¦1{£œÇƒƒ§;Ê*+¥Þ¯¬ªB—IÅuJ*år1)26n.ø`Ú¤ç“ÚÎ4&Šæ¦*9—7Vª´YVY	ÏeKÁq^3¦âô¥ß`é2µ/^Ô©«>õËÒô˜’$ï˜U5¶šÚZtp§O¢³—ì=^ýœ”)ž;NŸT9ÿÊæÑ\\˜Ï4…Û?þÉÇ³Q%¬ÆS\'àÔ»wFÖ¼ÐB‘è==„Bdäå!w[\"\nRÀ©WoD&l—‰JØk6W“÷!ÿp\Z¬ÙlÄ$ï\0êë£Z(ÄáÜdmÜŒâã§\0\0‹¿ÝŒïW|¢ì“Ÿ9QõIRTîÚ¾ƒ\0^]ºÚ³|%czz¨”‰”˜XÜ9š…yžXòí&q[Ë¶oÅG]º¢0=‘¾³¿^nLAëâ0sÜ8ä§¤áÖá4Œqüób£UÊ§¢|(‹]Ød5Öø1å@ÕxWîÚ3cc\\MÞ‡ëû¡£•VìLÇÎ4fo°Y,xŠéRïïÉÎÄÄaÃaÆbÕÙgÅÎDôéÞ7¥ gkŽž?CCC•ò(ž›ªä\\¦6#¶¡o¸y8G7lDbZ*ª„BèµVíOSýê”Wg|\0ùÇ¬:mU«q½ \0î?ˆøÐEˆJØŽ·oãúþƒˆ	Å¿’Þ–eÊ¿²yG\ZW|hb’÷Àtäp|³û;¬\rÑvHï,Z(!\n±*àØYXÀŒÅÂ·	È“8˜}áøOð\0ÇÄÆmÛaáddœÏo/çr±Üo:YÛÀP_\0À11EFÞO(*+Åô1Î¸øü?Vª–S%ŽJ>±AÁèjk‡vmÚÀ‚;î‹·ç^½‚Ð)SaÜ¶¼†À¯»“ä¶sñ»=ðuqE»6m`Ü¶O›ü»wUK¦‚|0Å®jlò4Æø1å@ÕxOþzA“¼Áf±`Ò¾=‚¼¼qæòÛÏ­1™¤Ð©Óœ•)>Uûâ’³22ÅGnùÜ+—èå\r3¶¾ž õ™*¦¼(››L9W„©ÍsW® ÐsØ,ºØØbù¹Ÿ«oýê–Wg|4WU…%ÓgÂ¸m;¸†¢’,›5[üúAI‰¸,Sþ™æi<¡ã±ÜÏÜÜŸðõÜ\0oX§íÞYúÚ€I-ß~‰9ÇÔ•|¾ø5¯ª\n<ÆK•771‘zÝÉÆVêujÜZ¬ýa/†ÂÊÌëƒC0ô“~uÚUµœªqØKô£¡!„BáÛýùü:åå¹qç6VîHÄïù7Áð¬¦F­?Ö@Ý|0Å®jlŠ4ôø1å@ÕxË¹\\ØYXŠ_[s8¨¹|¬lÌ$uµµÃ\'=ßÇþS\'0w¼;Ž_ø½»uG\'k¹å+*+¥Î4Úq,¤¶3å…in*Ë¹\"Lm>áIÇü¾ƒcêÔ_ŸòªŽOCÄfaj\n\0xÏÀ\0\0Ày½ý=ƒ:í*Ë¿*óŽ4Ž«7þÂ‘µëadhˆÎãðÕvæ3íD>Z(ò ô1º¼^,”>y\"õÇÊšÍAAê¹—÷Þ½4ÖÅÆ;—EáåË—Øêb£‘Ÿ’Vg?UË©\Z‡2f,<ª(GG‰? òxEF ÐÓ[–,ÇÔÏD\"˜¡V[²ù`Š]YlFFFx*¡ÍëË¦÷—Ô)ÓÐãÇ”UsianŽ2.¶\0àQY,ÌÍ•î£L¨ÏTxGF`dÿÛ¼)1Šï¨45f\'€ýºßwKImgÊÓÜT–sE˜Ú4nß+*ÐÁòU^o=x µi.¨{ŒhzL©£¡ÛR–ÿ†žwDuìì°ÿäqÌp‡CgN¡K‡ÚéE—ž‰Î044DLrŠËËÁåó‘|<#oŸ0dvËÀüjâÀøð0¥uÿ%RrÎ ¦¶í:àåË—j—3c±Pðà>ž¾>“UŸ8$\Z8öï—ÏÇáÜ³èïç+·\\µPˆ~¶‰	òïßÃªÝ»`ok‹Â‡ä–WSìÊbs°¶FrvžŠDø§¸Q	Û`bl,ÞÞãÇ”Us9Îi0~Ì9ƒ*a5*«ª°55ãœ×+‡\0ðY¯Þèáà\0ï¨Htïh~=z*,;¤o_ì>–.Ÿ¢²2D\'í‘úŒ\"S^”ÍM¦œ+ÂÔæàÞ½»7	•UU(,zˆØ½ÉRû3ÍuÇZÓcJ–ì1ÛXm1å¿¡ç‘¦ïä(¾QIòg\0HŒˆÄ÷ÇŽ¢“Çx|—qÛÂ#´æ;Î(!‰à:È	#ƒç£´¢Ÿ÷é‹ïW|-Þ¾Ò?\0_%nÇ@ÿÙ¨\nñq×®ˆY¤´Îå~s±mæ¯ƒ¥%6-Z¬v¹-K#0&$µ/^à^Ff½â3üÖ|ƒnÞžp°±Å¶ð¥rËÅ/„ÿšÕxRY‰ºuÃöð˜cp€?JNœðê—£:ÏˆcŠ]YlBaÙö­X±#¬­±!8?_»Ñóç0Ô×o”ñcÊª¹\\ðmÞ„§NA«Ö­áüé Ä‡hö|ÌÐÉ>˜òU$²7oQZ.fþ®Á¦CaÒ¾=bæáä…_PûâôZ·fÌ‹²¹É”sE˜Ú\\»`!¾ˆ‰F)“`ga‰Í‹ÂžsV¼i.¨;ÖšS²dÙÆj‹)ÿ1ïÈ[Ê~÷\rxÿµ>cMkõRÑ)Ù‚­Z‰EÝ?NÚö®ÅÛÈ\Z\'õ••aÀ_e×v(\0ZÞøíÉ:†GÒñÛ÷ÉZ‹¡©r^\\^ŽOçúÕYtµtº>çÛûÕy?k;Òôq³Púc-=ºX)(­ºôLÈ;*bÛüëË@m‡Ñâˆž?GîÕ+øæ»]X0OÛá4Šá‘˜žÁÓ§xô¤;ÒS1˜žCGH‹D—ž	yGíÿæÿ´B‹dãê¶‰	VøÀµ™~ÞlÓ¢ÅX²e3¾ùn\'Þ{ï=|Ö§6‡-ÑvX„- …\"Ñº|	‡0k)ãW~:GÛ!ˆ5VÎ?éÞ¹[\Z¥îæ¤¥ÌyÒ²Ñ¥gB!„\"-	!„Bˆ\\´P$„B!rÑB‘4k’`mŒò\rµoS’ŒónÉ#|6/\0Î£ëlkŠöu:±Ö·_ïR>!--	iæ\\Â¤ð+ù|ˆpDÏÂÃì“u¶5º@šªùGBi\nt×3!ÍÜí¢‡\n·ñªª0ü“~M\r©/eãH!…Î( zþ½<pââ|<Ýì±£\0\0üj‚ÖÅÁÁÓ6n.Z‡g55âýþ¸•±¡açîk7_ˆKßP©ÍR.“\"#`ãæ‚¦MAzÞ9©íLm+ÃWê¹ôš1çÑè7{~úãw¹õÔÔÖÂÁÓg/_B?_X8F_ß8}é7qž@€€ØÿßÞ½ÇEYå\0ÿá`^ÐfP¼àÏ\\+Q„Pó‚e7­5)Mó[¨x×Ò²Ò5ÍJs¥ò÷ËÌèºÚîª¥bµæênZº²j #—ä\"  Îùý¡ÌÃ3Ï\\¸Ÿ÷ë5/ç™ó<ç|Ï93ðõyž3¼‚ñãÐí±˜ôÒr—–\0\"&=ŽL½ÞwÄÓ¯¬pãRç•êjxß=úœœ:/Õr|Æ¥ÌA—‘ñ8%±Vüöú\'w¬er±;Òw{säè8×ÄÜXï¹8,ÇÃÖ~Ró(ÏÕë×”0íÝãÇ¡Û¸Ï?øË.óX´w·¹Ýú|ŽˆÈ³1Q¤fAéíŠ+Wðéþ}øúõÈýë\0ÀÂï ÀÏÿÚú!Î|ú9üü°jëûæãf®~\r¿¿ÿ~œIûg?ýñ‡i¯¾âP›K6oBDh(N}œ†}omÄŸ¿ûJ¥Ò\\n¯m9öâJ~s=Þ[²9Ù¹¿ÿ=n|[²ž6·Ü‚²òr|ð—]H[õ*ÎÿùkL÷ æ¼¹Î¼ÏÒ?½UÇŽø×ÖqbÛÇö÷Ç’Í›\0\0?¸ÀË›ï/^j>æV¥Ò|ÉóÚG$/Îç-ôëÙ™_|…ONFÒÚ5÷OîXKr±;Òw{säè8û~p4[ûIÍ£\\<mn¹W*pâ×_ñË¶íXû‡ç±pã;8uîNlÛŽµIÀË4Ìçˆˆ<Ej6\n/_ÆâÄ§ÐJïwEüåÐßñôØqÐtê„ŽíÚã¹GÃWß4óã–÷ñäÈQhß¶-:¶kä‰OàÌ…µ·ÿŸGñìø‡¡òõ…N£Á²)SQ]]m.·×¶{qi:uÆWÓ‘Sp	ÇÀ[l\'%F#^9½thß¶-ž›€ó¹¹æòÝ‡ÄÌ‡†Ÿ¯/:uè€™ãÆ7Gëàþýxt:¶kñC‡ápê÷OîXKöb·×w{säÌ87æûÁÑ8œ‰×^<¥ee˜óøïÑ±]{$DEN~>æOšlÞ6äç›÷­Ïçˆˆ<ïQ¤f%¤«®ÖviYBÆ©õšºS\'óóSçÏaé»›ðÓ™Ó0–—£êêÕZ¿Üå•”@åëkÞÔhj[Ž½¸>{íu¼þÿ‹˜™ÏÂ_¥ÂšÙI\"s¯`·.ÿýãîm•J\\¹rÅ¼]xù2µ]ÌÛ\Z\rŠJJŠSN©Ñh³¿öú\'w¬%Gb—ë»½9rfœóýàhÎÄëH<ÚÎ\0>mÚ\0\047Ë}Ú´©5Žõù‘gc¢HÍÊ-^µOrøiðëg_Öúniü‚<ûàxl˜3šÎQU]\rõ}Ãj«sG_”–—ÃïfÝòóœj[Ž½¸zvÕaóü…B`Ûž¿aê«¯àLÚçN·\0Zµ\Z—/C§Ñ\0\0ò\n\n U«]ªË’Ê·òŠ\nl‘ÈÕ°×?¹c2v{säÌ87æûÁÑ8œ‰·>ñX«Ïçˆˆ</=S³66:\ZÚùŠKKa¬(ÇÚ?Â˜¹/˜Ë+®\\ATX?øuê„3Ùz,OýºétÈ¼h°[wtd$Rw~…ËF#r\n\nðÊï×º\'Í^ÛrìÅ5dÆt¤íûW¯_GÀ !œ™ÿºÿî{ðÉ¾oPv¥%eexë³4Ü÷=ær•¯/~5d£ÒÉ3DqwÝ…?nû—F|ºÿ[Ü™ø¤Ãý“;Ö™Øí±7GÎŒsc¾Cn?ëy¬O<Öêó9\"\"ÏÆ3ŠÔ¬-}z*mzw==eW® ¼W/¬MzÞ\\þÚìçðôÊ—P\\R‚~½{ã¹)Puìˆ{¦>ü¿í•­{ÕŒYxöõUX÷ñvtêÐ«fÌÄîCÇu“	·xyÙm[Ž½¸\'>…”·7`Æë¯!°K¬{>Ùå1ziê3x~ý:„Mx\n//ŒøÝ ¬Múïwîm˜—‚ø¤Ù¸n2AÿÕ.‡ë]5cW¾ˆÞ?ˆî]ux{î<‡û\'w¬3±ÛcoŽœçÆ|?8\Z‡Ü~ÖóXŸx¬9ò9ò¾{ ¿“¨ROe(\nó‰–ö£¥ÅÛ\ZpNˆˆ\ZW»¡ƒQqðw‡AMÀûî8Yûv™>=ýmìí^z&\"\"\"\"IL‰ˆˆˆHE\"\"\"\"’ÄD‘ˆˆˆˆ$).èõ-féÞ­[cÇBDDDD.°^ÌÒ¶MÃ|i¾w·à`‡w®Ïw½QÓñññAUU•»Ã & P(ê¼æL~\'‡—ž‰ˆˆˆHE\"\"\"\"’ÄD‘ˆˆˆˆ$1Q$\"\"\"\"IL‰ˆˆˆHE\"\"¢¦P(ì>\Zº=OvõêUÌ™3>>>’}µ7Æ………˜4i¡Óé°páÂ¦¿Ec¢HDDÔÀ„µ¶^³eøðáMf‹1bÄ|þùç¨®ví»ŸþylÛ¶\r999ÈÍÍÅk¯½†>ø £ôLL‰ˆˆš™¬¬,w‡Ð¬„„„àèÑ£6Ë-ð3gÎ@¥Rá‘G1—8p\0\0ðÏþÓüüã?nÜ =E\"\"¢&VRRŠ§Ÿ~\ZÁÁÁ\n\nÂO<¢¢\"\0@xx8233¡P(˜˜\08vìî»ï>@«ÕbÈ!8räˆ{Ð´Þÿ}hµZ‡ö1c\0`õêÕæ×®^½\n\00™LèÐ¡\0 ##££ôLL‰ˆˆšØÒ¥K R©püøqœ<ùocñâÅ\0€“\'O¸q–lëÖ­\0€éÓ§cÒ¤IÈÊÊBVV†Ž)S¦¸+üf+--\rûöíÃSO=…óëwÞ\08p îºë.\0ÀåË—Ýb‹£þ]>…BÁ?áGDDäëß¡½{÷Æ7ß|ƒ=z\0\0bbbðë¯¿Jîo­²²:u2ÿ‰>©ý=ñOøÕ,P‘\Z›ë×¯#22/^DFFüýýÍegÏžEbb\"222ðè£âoûJKKQ\\\\Üd±7&…BQço=÷ééocoçðŒ\"Q+,,DÍ¡3V\0\0qIDATPPy»k×®(,,´¹ÿ©S§ðÀ [·nP©TP«Õ./ìðTß~û-Nž<‰øøøZI\"\0„††âïÿ;ŠŠŠ°nÝ:C£Ñ¸)Ò–…‰\"QÓjµ¸té’y;77Wö¼qãÆaèÐ¡øñÇ‘ŸŸÜÜ<›û¶V5‹SÆW§,!!HOOGjj*ŒF#ÐÔ!¶HL‰ˆˆšØ¨Q£±cÇ”——ãòå¼ùæ›5j´¹\\¥RáìÙ³æKÇ8p 4\Z\rNŸ>åË—¡[·næKÕžÎú{¥¾‹òÇ\0DFFÖ9^§Ó!\'\'Ã†\rCRR”J¥yÑÉóvw\0DDD­ÍÊ•+””„>}úÀËË#FŒÀºuëÌåo¿ý6âââ`2™`0°zõjLž<EEEÇ¦M› R©ð»ßýNö’uk’—wã,kppp²U«V!??ßÿ=:wîŒE‹!&&¦‰#l™¸˜…ˆˆÈyâb’ÆÅ,DDDDÔä˜(‘$&ŠDDDD$‰‰\"IòÖgg;¼³õRt\"\"\"j¾ø{»õr&¿“ãðªg}v6ºÝ\\rnù¼%hiñ¶œrß7DŽãç¥õÐgg£òª²Ök\\õLDDDDŠ‰\"Ib¢HDDDD’˜(‘$&ŠDDDD$‰‰\"Ib¢HDDDD’˜(‘$&ŠDDDD$‰‰\"Ib¢HDDDD’˜(‘$&ŠDDDD$‰‰\"Ib¢HDDDD’˜(‘$&ŠDDDD$‰‰\"Ib¢HDDDD’ôzáî ˆˆì1™Lèâî0ˆˆš¥Ó™yµ¶Û¶©nz½»;´£>;5ûZ>o	ZZ¼­ç„œ%„¨õ/ÉóññAUU•»Ã & P(ê¼ÖP¿cyé™ˆˆˆˆ$1Q$\"\"\"\"IL‰ˆˆˆHE\"\"\"\"’ÄD‘ˆˆˆˆ$1Q$¢Ij•ŸÜëÍ3±YîÛœûT\rÕ¯æ<>\r1Í¹Í‰ÉdÂ¬Y³ ÑhÐ·o_ìß¿ßÝ!y&ŠDDÍ¿ˆÈ¾Í›7£]»v8sæ^|ñE,[¶ÌÝ!y&ŠDä±âââ ÕjƒóçÏ\0*++¡Óé°bÅ\n¨Õj\0À¾}ûÐ¿¨Õj„‡‡cÏž=æzÒÒÒ•J…ÈÈH¤§§ÛlS®90`\0‚‚‚°sç®Ze–g”­ÿÚµkÐjµØ±cüýýÑ·o_œ8qÂ¥±±véÒ%Œ3jµ\ZQQQ8räˆCñÉõÑ™q“«\'\'\'#GŽ„ŸŸâââP\\\\l.“›G[í[‡ÔøØ\ZK9®ŽS}æÍÓ}òÉ\'˜4iÔj5&L˜€~øÁÝ!y&ŠDä±,X€¨¨(deeaðàÁX´h€_D\\^^“É„‹/\0æÌ™ƒ•+_Fnn.’““‘””d®\'99[·nÅo¿ý†yóæ!%%Åf›rõÈY´h‘‘cÇ~ªwýÞÞÞ(//Ç‰\'ðë¯¿bÂ„	X¸p¡KccmÞ¼y‡^¯ÇÂ…1kÖ,‡â“ë£3ã&WOrr2ÂÂÂpáÂDEEaÉ’%µÊlÍ£­ö­ÇCj|l¥WÇ©>óæéNŸ>ÿûßFTT222Ü’gº ×K>o	ZZ¼­ç„œe2™„å,\065ºwï.rss…Bäåå‰ZÇçääH¶UUUU«žˆˆ1þ|qîÜ9§b¶®GîGnPPÈÏÏBa0:Îº~k–}ÌÏÏ:Î\\æêØÔÄš——g³ÜV|r}t¦_rõèt:sìyyy\"44Ô\\æè<JÍ›åxXoÛK©çríÉõÏ™yS*•²ýô4íÛ·.¥¥¥béÒ¥bÄˆî©É\0§3ój=\Z\nÏ(Q‹%„¨ó°T\\\\­V\0Ðh4(**ªU`~~àÀ\Z4Z­¶Î¥»/¾ø………ˆŽŽFTTÒÓÚŒI®9%%%æýkbnˆú»té\0P«Õ0\Zæ×©XýüüœŽO®ÎôK®£ÑN…B€€\0\\ºtÉ\\&7öÚ·Ëm{c)ÅÕqªÏ¼yº:`òäÉèØ±#’“çàØ±cîÉ#0Q$\"åçç‡‚‚\0@AAAäÆòÞ¿ÄÄDÌš5YYYÈËË«µ_Ïž=±eËèõz$%%aêÔ)6Û”«GŽ¯¯¯ù—¾ÜqÎÖ_“(Á×××üº3ccM­V#77×éøäúèL¿äêÑjµ(--5ÿÇÁòE¹y´×¾õxXnÛK)®ŽS}æÍÓ™ÿ3$„	ÞÞÞnŽÈ30Q$\"5dÈlØ°åååX»v-¢££mîÛ»woôíÛUUUX½z5‚‚‚pöìY\0ÀàÁƒ±cÇ\\»v\r½zõ‚Édr©9Ø²eÊÊÊšš\n¥RYïú•J%6oÞ£Ñˆ7\"**Ê¥±±vß}÷aÍš5(..Æ\'Ÿ|‚þýû;Ÿ\\é—\\=±±±X³f\r***ššŠøøxs™Ü<º:o€kcéê8ÕgÞ<]BB>úè#\\¾\\‚õë×ãž{îqwHžÁÑkÔ¼G‘\Zç„œ%u¢Ë×\rƒ6l˜Ðh4\">>^›Ç=zTˆÐÐP±wï^±lÙ2¡V«…BìÞ½[ôë×OøúúŠ°°0±sç.›qÊÕ#÷#÷øñãâöÛo:N|ùå—B¥R	“ÉTç8¹ú­)•J‘––&üýýÅm·Ý&222\\\Zk—.]÷ß¿èÜ¹³ˆŒŒ‡r(>¹>:Ó/¹zòóóÅØ±c…F£wÜq‡HO?h>Nn™7ëmGÇÒÑy”ëŸ3óÖÚîQ,++			B¥R‰!C†ˆóçÏ»;¤&ƒF¼GQq³»ôÙÙè\\çyKÐÒâm\r8\'ä,!¼¼¼ø‚NP(¯VÌÇÇUUUîƒš€B¡ÀéÌÚ·)ôééß uóÒ3Ib¢HDDDD’˜(y(^v&¢úb¢HDDDD’ôzþ—“ˆš=“É„!!îƒˆ¨Y²^ÌÒ¶MuƒÔëíèÊS®z¦†Ä9!gÕ\\FååT\"ÇpÕsë!õEë\rõ;–—ž‰ˆˆˆHE\"\"\"\"’ÄD‘ˆˆˆˆ$1Q$\"\"\"\"IL‰ˆˆˆHE\"¢fH¡P˜xè¡‡ðóÏ?»;,Y–+/¥Va:[‘3²²²Fƒ;ï¼‡vwH‰\"Q3%„Àõë×ñý÷ß#<<#FŒÀ‰\'ÜQ³4mÚ4ÄÆÆB¯×cúôé˜={¶»CòL‰ˆš1///ôìÙ/½ôfÌ˜•+WšËrrr0räHøùù!..ÅÅÅæ²´´4„……A¥R!22éééæ²}ûö¡ÿþP«ÕÇž={\0\0•••ÐétX±bÔjum\00ˆ‹‹ƒV«ELLÎŸ?o·¶Ú€ŒŒ0\0AAAØ¹sW­ãlµ%—«cAžcâÄ‰˜;w.Úµk‡‰\':ôÞ$û˜(µÏ<ó:dÞNNNFXX.\\¸€¨¨(,Y²¤VÙÖ­[ñÛo¿aÞ¼yHII1—Í™3+W¾ŒÜÜ\\$\'\'#))	À/h.//‡ÉdÂÅ‹ëlÀ‚…¬¬,<‹-²·­ö\0`Ñ¢EHHH@FFŽû©Öq¶Ú’ŠËÕ± Ï1eÊøøø\0\0öîÝ‹¸9\"!tA¯—|Þ´´x[Î	9Ëd2	\'~dµxR}½råŠèØ±£y[§Ó‰œœ!„yyy\"44Ô\\!æÏŸ/Î;\'ÛNUUU­¶\0˜ë”ÚîÞ½»ÈÍÍ5·\"³­¹²n/((Häçç!„0µÊìµeWCŒ…§Q*•îÁ-N:%BCCÅ±cÇÜJ“ NgæÕz4žQ$\"j!233¡ÑhÌÛF£:\n…¸té’¹ì‹/¾@aa!¢££…ôôƒæ²`Ð AÐjµæK·–lnC«Õ\04\Z\rŠŠŠìÆ-×^II‰ùµšzmË2.WÇ‚<Ë/¿ü‚„„¬[·‘‘‘îÇ#0Q$\"j!Þÿ}:Ô¼­ÕjQZZ\n!„µîËëÙ³\'¶lÙ½^¤¤$L:Å\\–˜˜ˆY³f!++yyyuÚ±^yl¹íçç‡‚‚\0@AAüüüìÆ-×ž¯¯¯9´.³×–e\\®ŽyŽ‹/büøñxãu=z”»ÃñL‰ˆš9ƒÁ€—_~üq­{ccc±fÍ\ZTTT 55ñññæ²ÁƒcÇŽ¸ví\Zzõê“Éd.ëÝ»7úöí‹ªª*¬^½\ZAAA8{ö¬C±26l@yy9Ö®]‹èèh»ÇÈµ-[¶ ¬¬©©©P*•.µåêXçHIIÁ„	0vìw‡âY½FÍ{©!qNÈY­ñÅš‡ŸŸŸ5j”øùçŸkí“ŸŸ/ÆŽ+4\Z¸ãŽ;DzúAsÙîÝ»E¿~ý„¯¯¯;wî2—=zTˆÐÐP±wï^±lÙ2¡V«ÍíZÇaÉ`0ˆaÃ†	F#âãã…Á`Ü×ò¹\\{Ç·ß~»ÐétâË/¿*•J˜L&§ÚªÏXx²Öv¢R©¬õ¹ Îœ9ãî°š\ZñEÅÍìÒgg£[ppç-AK‹·5àœ³„ðòò‚ƒ?²ˆZ=TUU¹;j\n…§3kßºÑ§§ƒÔÍKÏDDDD$‰‰\"Ib¢HDDDD’˜(‘$Å½žw†Q³g2™Ð#$ÄÝa5KÖ‹YÚ¶©nz½]yÊUÏÔ8\'ä¬šÕÎ\\õLä®zn=¬¿$@ƒýŽå¥g\"\"\"\"’ÄD‘ˆˆˆˆ$1Q$\"\"\"\"IL‰ˆˆˆHE\"\"\"\"’ÄD‘ˆ¨‘H­D”{½©>¼Qöuw¿êÃ2ö–ÜÖfûöíðññ©ózVVâââ ÑhpçwâðáÃnˆÎ30Q$\"je²²²\Ze_OÁ¯`j~øáüòË/¨®®û}Ó¦MCll,ôz=¦OŸŽÙ³g»!BÏÀD‘ˆÈâââ ÕjƒóçÏ\0*++¡Óé°bÅ\n¨Õj\0À¾}ûÐ¿¨Õj„‡‡cÏž=æzÒÒÒ•J…ÈÈH¤§§K¶wï½÷\"33\n…‹/–Aj_¹,åää`äÈ‘ðóóC\\\\Š‹‹ŽõÚµkÐjµØ±cüýýÑ·o_œ8qÂ¥±³–‘‘ ((;wîªUfyFÑÑþRÓ;rä^{í5É²‰\'bîÜ¹h×®&Nœh~o„ƒ.èõ’Ï[‚–okÀ9!g™L&áÄ¬fÁV¼–¯?ñÄ\"%%E”––ŠÅ‹‹‰\'\n!nô×××W,_¾\\TTT!„ˆˆˆ»v}-*++Å{ï½\'úôéc®\'00PüãÿÕÕÕbÛ¶mâ®»îr8.[1Hí+ƒå¾=ö˜xá…„Ñh)))bæÌ™.Åzë­·ŠE‹‰ÒÒR±|ùr1zôh—ÆÎÚ< –/_.JKKÅ‹/¾X+vËçrýmî”J¥»Chö~.|öÙg\">>¾‰¢q\0âtf^­GƒÕíèŽL©!qNÈY-5Q´õ¨Ñ½{w‘››+„\"//O„„„Ô:>\'\'G²îªªª:	ÍüùóÅ¹sçŠË’½l±ŽÁò¹N§3Çž——\'BCC]Žµ¦žüü|¡ÓéŽÛÖØ	!DPPÈÏÏBa0löC®¿ÍE!N:%BCCÅ±cÇš0¢¦×˜‰\"/=5\"qã?äµ–Š‹‹¡Õj\0\ZEEEµÊÌÏ8€AƒA«ÕÖ¹¤úÅ_ °°ÑÑÑˆŠŠBzúA‡c´ƒ%¹,Fèt:(\nàÒ¥K.ÇÚ¥K\0€Z­†Ñht8nË±³VRRbŽ¿¦)Žö—šŸ_~ù			X·n=\"##ÝN‹ÅD‘ˆÈüüüPPP\0\0(((€ŸŸ_­rËûå1kÖ,dee!//¯Ö~={öÄ–-[ ×ë‘””„©S§4X–äb°¤ÕjQZZjNŽ-ïQt6Öš$³¨¨¾¾¾Ç-·zÙ×××œXÊõÃÑþRórñâEŒ?o¼±£Grw8-\ZE\"\"7\Z2d6lØ€òòr¬]»ÑÑÑ6÷íÝ»7úöí‹ªª*¬^½\ZAAA8{ö,\0`ðàÁØ±c®]»†^½zÁd2Ù¬§G8{ö¬yµ¨\\ÖûÊÅ`)66kÖ¬AEERSSo.s&V¥R‰Í›7Ãh4bãÆˆŠŠriì¬EDD`Ë–-(++Cjj*”J¥ä~Žö—š—””L˜0cÇŽqw(-Ÿ£×¨y\"5$Î	9«¥Þ£hïuƒÁ †\r&4\ZˆƒÁæñG\"44TìÝ»W,[¶L¨Õj!„»wïýúõ¾¾¾\",,LìÜ¹Ëf\\ÇŽ·Ýv›´ƒõ¾r1XÆ›ŸŸ/ÆŽ+4\Z¸ãŽ;DzúAs™3±*•J‘––&üýýÅm·Ý&222\\\Z;kÇ·ß~»ÐétâË/¿*•J˜L¦:ÇÊõ·¹óô{!sï¯R©¬SvæÌ7FÛ¸Ðˆ÷(*n6`—>;Ý‚ƒë<o	ZZ¼­ç„œ%„€——¿ã®•Q(œsùøø ªªÊÝaPP(8YûÖˆ>=ý¤n^z&\"\"\"\"IL‰ˆˆˆHE\"\"j¶xÙ™È½˜(‘$Å½žÿ]#¢fÏd2¡GHˆ»Ã \"j–¬³´mSÝ õz;ºò”«ž©!qNÈY5— Ÿä*N\"GÐßýd´¿#µxƒÂ}ê¼ÖP¿cyé™ˆˆˆˆ$1Q$\"\"\"\"IL‰ˆˆˆHE\"\"\"\"’ÄD‘ˆˆlúëÎ11ávw‡ADnâíî\0ˆˆ¨yºpî46oX†5o}éîPˆj¹ví*Þ]¿iÛ7¢ºººÎ·!Ì›ý ¾Oÿkãø­	ÎãE\"\"ƒÂ}$ŽHÛö–ÃûZ¶åˆêªJ§öw¥¾çOÆ33—¡Ïm‘\rÒ†£í:ËÙq–RÃõë×êu<5žƒß|êjéï\n,/+iâˆ<Ï(É¨9Q“8sFâ‡ƒi”˜šÊi‡Ý‚CšÃ8óLUÓêªëŽ•k¶cd´N²Üh,R©Ä¾Ãh£d_<£HDä¢«ÕUX÷êÓ\r£†áõ³P]U	àFbyäÇæçÀK¹sgÃØØîŒ¹³ÆÁ Ït¸½¼=ˆÑ1Áøtû;uÊ+¯T`Ý«/`üˆÞ5$«–MÃÕjÛ	Œ½ú¬Ï’ÉÅêäQ<7uFÇcÔ@¼0}4ÎýzªÑûa=ÎW¯VcP¸\ZŠÿK}Ãï\r°»¥¯Ò¶`ì°nxâÁþ¸˜åPß¥ÆJî½Aõ·hÅŸÐYåg³¼¼¬·¶ky³ÄˆÁXøüc(/+mÂ=Ï(¹è½M¯à“6bÁ‹ïÀÛ»\r^^2\r:vÂ¬VáðÉª:g!_iþóŸŸ±1u/Œe%xnêý¨¬¼‚·ßÛëP{›Ö/ÆNýŒ¥¯lÁÕ«u/¹mZ¿Ÿ|´K^þ\0àå%ÓÔ­7žœšâR}Öäâ_±ð)œ?wi_Ÿ@éåbÌ™=o­76íjÔ~H3\0ËŒh£ôÁÎo³ìÆnÉ§í­˜™¼\n/-œ‚w7,ÅÊ59u|\r¹÷5¾r£%¥—qøÐ>\0Ào¿B@× üaþZ7GÖòðŒ\"‘‹î»±È#6þ!–póµ?ÛÜãÖýØ¸}ÃïDDÿ{\0\0§Ow¸½Ÿ\0‰‹Øø‡ê”ÿþ5\0`è°ÄÆ\0ìßû™Ëõ9Í¿O·¿ƒ+•åøzÿÉ$±1ú!¥´¤#Ç<¶·¶³»¥¡q`ðÐ1\0€?ÿ÷Ò»³sçì{ƒ\ZÖžCù8|²\n‡OVáåµ\0}¿ÛÍQµL<£HDä¢ÂÂK\0€|!pãoQ_..´¹ÿ‘CßbãúE0è³P}3±2\Z¿é¾¬ôÆ¾í-Ú³Tz³<þæåV\0ø-ï¢Ëõ9ò¢õx{í|ºý]|ºý]h»`vòk1fb£÷Ã–Î*C±[jßÁ¸ùwÅËF§¯áì{ƒ\ZÏÐaã\0\0—/sü]ÁD‘ˆÈEjµ¥%Å(/+Åµ›«e5š.6÷ÿãª$èÏgâ½¾Gïÿ¹C£:;Õ^ßN(+3¢¼Ü(yÏžÖ¿+ŒÆ|÷¯(}ÚÖ»>gâ¿wèhÜ;t4²ÏŸÅ·{>Åæ·^Â»–J&Š\rÝ[\n…C±[*3–@ÜL;uêìôñ5œ}oPÃš>)ÙçÏàÕ7?EiI\0 K—@7GÕ2ñÒ3‘‹b‡?\08¸ÿÏHÿöæ¥Æ˜Ë;«Ô\0€¼œ\0€ª+W\0\0>mÛâ³7B«õ\0T”ÿ÷Ì•œ~áw\0¾;°÷×½Œ÷ \0à›Ýiøéèw18\0ó“v¹>krñÏOz£c‚Q^VŠØá7.\'·oïÛ$ý°ggc·ôÝþ?ã»}_\0îˆ\Zìôñ5ì½7¨~¬Yo÷\rë¢âBL2óž»1Rÿi!û˜(¹è©éñÈãÏbãú%HÝ¸=1“Ÿ™o.OxèitòíŒg\'\0<3{9ütHžqãžµéÏ½„€®˜>)Æ¡öžMZ‰ž½ûbãºÅ¸Z]…N¾7Îj]»v\08m&NNÂ›^Æ’¹ãŽˆAx~þ]®Ïš\\ü“§-@÷P<?cfLŽÅ]ƒb°lÕûMÒëqv6öš5Uj”•–`Ó›Kq[XÌxn¥CÇK±÷Þ Æ5=iÆ>ø$üýuÐv	ÀägæáñÉ/¸;¬I!jÎ±Û¡ÏÎF·àà:Ï[‚–okÀ9!g	!àååÅï«£fÉ•ïÙllCtÄw?9v¶šZ¶Aá>8™Wëµ>=ý¤nžQ$\"\"ª‡ßò\0€.]ºº9¢†ÇD‘ˆˆ¨&<­Ö‰Ó¸;¢ÇUÏDDDõ°ÿ0¿v…<Ï(‘$Å½Þ¡Å,DDîd2™Ð#$ÄÝa5KÖ‹YÚ¶±ÿg9ÁUÏäœrß7DŽãç¥õÐgg£òª²Ök\\õLDDDDŠ‰\"Ib¢HDDDD’˜(‘$&ŠDDDD$‰‰\"IúO8\\­eM\0\0\0\0IEND®B`‚','Captura de pantalla de 2019-10-21 18-46-36.pngÂ¿Â¿image/png',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidoLibro`
--

LOCK TABLES `contenidoLibro` WRITE;
/*!40000 ALTER TABLE `contenidoLibro` DISABLE KEYS */;
REPLACE INTO `contenidoLibro` VALUES (49,'Di no a los vicios.',68,1,NULL),(1,'El poder del aire',69,1,NULL),(17,'Aprende a alimentarte',70,1,NULL),(65,'El poder de la comunicaciÃ³n.',71,1,NULL),(33,'Recargar Fuerzas a travÃ©s del descanso',72,1,NULL),(59,'Relaciones humanas efectivas.',73,1,NULL),(25,'La riqueza del agua',74,1,NULL),(9,'La importancia del ejercicio',75,1,NULL),(73,'Confianza en el Dios Todopoderoso.',76,1,NULL),(41,'Actitud mental positiva',77,1,NULL),(9,'Los hermanos de Mowgli',83,7663,NULL),(16,'Las lecciones de Mowgli',84,7663,NULL),(22,'Los Bandar-log',85,7663,NULL);
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
  `aÃ±o` int(4) NOT NULL,
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
  PRIMARY KEY (`idEstudiante`,`aÃ±o`),
  CONSTRAINT `fk_contribuciones_1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribuciones`
--

LOCK TABLES `contribuciones` WRITE;
/*!40000 ALTER TABLE `contribuciones` DISABLE KEYS */;
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
REPLACE INTO `diasEstudio` VALUES (1,'Lunes',NULL),(2,'Martes',''),(3,'MiÃ©rcoles',NULL),(4,'Jueves',NULL),(5,'Viernes',NULL);
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
REPLACE INTO `documentos` VALUES (16018,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16019,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
REPLACE INTO `editorialLibro` VALUES (5,1,''),(5,1140,''),(6,1890,''),(7,98,''),(8,7663,'');
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
REPLACE INTO `ejemplar` VALUES (1,1,2020,'',NULL),(2,566,2020,'',NULL),(2,2568,2020,'',NULL),(2,5687,2020,'',NULL),(6,236,2020,'',NULL),(6,8955,2020,'',NULL),(98,98,2020,'',NULL),(1140,1140,2020,'',NULL),(1890,0,2020,'',NULL),(1890,1890,2020,'',NULL),(7663,7663,2020,'',NULL);
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
  `aÃ±o` int(4) NOT NULL,
  `idEntregante` int(30) NOT NULL,
  `idRepresentante` int(30) NOT NULL,
  `zapatos1` bit(1) NOT NULL DEFAULT b'0',
  `uniforme1` bit(1) NOT NULL DEFAULT b'0',
  `utiles1` bit(1) NOT NULL DEFAULT b'0',
  `zapatos2` bit(1) NOT NULL DEFAULT b'0',
  `uniforme2` bit(1) NOT NULL DEFAULT b'0',
  `utiles2` bit(1) NOT NULL DEFAULT b'0',
  `comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`,`aÃ±o`),
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
  `estudianteComentario` varchar(145) DEFAULT NULL COMMENT 'Detalle de la informaciÃ³n de los estudiantes y sus representates.',
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
REPLACE INTO `estudiante` VALUES (16018,'',1,'',4,2.00,'\0','Padre#MadreÂ¿ ','\0','','','Padre','','Noveno Grado','','dssaaaaaaaaaaaaaaa','','',1045367070,1045367070,1045367071,''),(16019,'',1,'',0,2.00,'\0','Padre#MadreÂ¿ ','\0','','','madre','','Noveno Grado','','centro escolar','','',1045367072,1045367074,1045367072,''),(16020,'',1,'',4,20.00,'\0','Padre#Madre#Hermano/aÂ¿ ','\0','','','hermano','','Noveno Grado','','65cÃ±jxj xf o uz uhzl zllzi','','',1045367075,1045367076,1045367077,''),(1045367070,'',0,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'Padre','\0','6','padre',NULL,'','',NULL,NULL,NULL,''),(1045367072,'',1,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'madre','\0','5','DomÃ©sticos',NULL,'','',NULL,NULL,NULL,''),(1045367075,'',0,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'hermano','\0','8','opÇ˜fh á¹•fci',NULL,'','',NULL,NULL,NULL,'');
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
  `aÃ±o` int(4) NOT NULL,
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
  `FaceCulminaciÃ³n` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `actitudicionales` longtext NOT NULL,
  `resumen` varchar(250) DEFAULT NULL,
  `propuestaMejora` varchar(145) DEFAULT NULL,
  `evaluacionMaestroComentario` varchar(145) DEFAULT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  PRIMARY KEY (`idMaestro`,`fechaHora`,`gradoModalidad`),
  KEY `fk_evaluacionMaestro_1_idx` (`idMaestro`),
  KEY `fk_evaluacionMaestro_2` (`grado`,`seccion`,`aÃ±o`,`gradoModalidad`),
  CONSTRAINT `fk_evaluacionMaestro_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_evaluacionMaestro_2` FOREIGN KEY (`grado`, `seccion`, `aÃ±o`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoAÃ±o`, `gradoModalidad`) ON UPDATE CASCADE
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
REPLACE INTO `financiamiento` VALUES (1,'MINED',NULL),(2,'CDE',NULL),(3,'AlcaldÃ­a',NULL),(4,'ONG2',NULL);
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
  `gradoAÃ±o` int(4) NOT NULL,
  `aulaGrado` int(30) NOT NULL,
  `gradoActivo` bit(1) NOT NULL,
  `gradoMaestroGuia` int(30) DEFAULT NULL,
  `gradoCoemntario` varchar(145) DEFAULT NULL COMMENT 'Historico de los grados y secciones junto a los maestros que han sido sus maestros guÃ­as.',
  PRIMARY KEY (`idgrado`,`gradoSeccion`,`gradoAÃ±o`,`gradoModalidad`),
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
  `gradoAÃ±o` int(4) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `fechaEvaluacion` date NOT NULL COMMENT 'histÃ³rico de evaluaciones a cada grado del instituto.',
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
  PRIMARY KEY (`idGrado`,`gradoSeccion`,`gradoAÃ±o`,`gradoModalidad`),
  KEY `fk_gradoEvaluacion_2_idx` (`evaluador`),
  CONSTRAINT `fk_gradoEvaluacion_1` FOREIGN KEY (`idGrado`, `gradoSeccion`, `gradoAÃ±o`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoAÃ±o`, `gradoModalidad`) ON UPDATE CASCADE,
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
REPLACE INTO `horario` VALUES (1,'07:15:00','08:05:00',NULL),(2,'08:05:00','08:55:00',NULL),(3,'08:55:00','09:15:00',NULL),(4,'09:15:00','10:05:00',NULL),(5,'10:05:00','23:10:00',NULL),(6,'11:10:00','12:00:00',NULL),(7,'13:00:00','13:50:00',NULL),(8,'13:50:00','14:40:00',NULL),(9,'14:40:00','15:30:00',NULL),(10,'15:30:00','16:20:00',NULL),(11,'16:20:00','17:10:00',NULL);
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
  `maestoCargoComentario` varchar(145) DEFAULT NULL COMMENT 'HistÃ³rico de los cargos que los maestros tienen o han tenido dentro de la institucion.',
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
  `maestroComentario` varchar(45) DEFAULT NULL COMMENT 'Detalle de la informaciÃ³n de todos los docentes de la instituciÃ³n.',
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
REPLACE INTO `maestro` VALUES (1045367084,124596,884545,544548,2131331,315388,2,3,'ConfÃ­a',2356546,'4444-4444',1,'1986-01-24','2020-01-24',NULL,'M','2','',1,'',6,'\0','','\0',''),(1045367085,8778878,78787,78787,787,787,1,1,'ConfÃ­a',784555485,'3333-3333',2,'2020-01-24','2020-01-24','2020-01-24','V','1','',1,'',5,'','','',''),(1045367086,7899646,65456456,56464,456456,65464,2,3,'Crecer',87945613,'2222-2222',7,'2020-01-24','2020-01-24','2020-01-24','T','2','',1,'',3,'\0','','\0',''),(1045367087,31132321,321312231,312123123,321231123,123312312,1,3,'Crecer',354563,'1111-1111',5,'2020-01-24','2020-01-24','2020-01-24','T','1','',2,'',15,'','','','');
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
  `tipoMateria` int(30) NOT NULL COMMENT 'Listado de las materias que se imparten en la institucion.',
  `materiaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idmateria`),
  KEY `fk_materia_1_idx` (`tipoMateria`),
  CONSTRAINT `fk_materia_1` FOREIGN KEY (`tipoMateria`) REFERENCES `tipoMateria` (`idtipoMateria`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
REPLACE INTO `materia` VALUES (1,'MatemÃ¡tica',1,'c0d6c8'),(2,'Lenguaje',1,'bfc4de'),(3,'InglÃ©s',1,'9dc4ae'),(4,'InformÃ¡tica',1,'c4b0c4'),(5,'Estudios Sociales',1,'8e8cb3'),(6,'EducaciÃ³n FÃ­siaca',1,'e6ddaf'),(7,'Ciencias Naturales',1,'cae3cb'),(8,'Moral, Urbanidad y CÃ­vica',1,''),(9,'OrientaciÃ³n Para La Vida',2,''),(10,'Seminario',2,''),(11,'Curso de Habilidad Laboral',2,''),(12,'TecnologÃ­a I',3,''),(13,'TecnologÃ­a II',3,''),(14,'TecnologÃ­a III',3,''),(15,'PrÃ¡ctica Profesional I',3,''),(16,'PrÃ¡ctica Profesional II',3,''),(17,'PrÃ¡ctica Profesional III',3,''),(18,'Laboratorio de Creatividad I',3,'f0b8f0'),(19,'Laboratorio de Creatividad II',3,''),(20,'Laboratorio de Creatividad III',3,''),(21,'ContadurÃ­a',4,''),(22,'General',4,'e8d0e8');
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
  CONSTRAINT `fk_matricula_1` FOREIGN KEY (`matriculaNivel`, `matriculaSeccion`, `matriculaAnyo`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoAÃ±o`, `gradoModalidad`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
REPLACE INTO `matricula` VALUES (16018,2020,1,'C','A','\0','N'),(16019,2020,1,'G','A','\0','N'),(16020,2020,2,'C','A','\0','N');
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
  `idMateria` int(30) NOT NULL COMMENT 'Detalle de las materias y horarios que cada docente imparte en la instituciÃ³n.',
  `idHorario` int(30) NOT NULL,
  `diaSemana` int(30) NOT NULL,
  `idGrado` int(30) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `seccionGrado` enum('A','B','C') NOT NULL,
  `aÃ±oGrado` int(4) NOT NULL,
  `mestroHorarioMateriasComentarios` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idMaestro`,`idMateria`,`idHorario`,`diaSemana`,`idGrado`,`seccionGrado`,`aÃ±oGrado`,`gradoModalidad`),
  KEY `fk_mestroHorarioMaterias_2_idx` (`idMateria`),
  KEY `fk_mestroHorarioMaterias_4` (`idGrado`,`seccionGrado`,`aÃ±oGrado`,`gradoModalidad`),
  KEY `fk_mestroHorarioMaterias_3_idx` (`idHorario`),
  KEY `fk_mestroHorarioMaterias_5_idx` (`diaSemana`),
  CONSTRAINT `fk_mestroHorarioMaterias_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idmateria`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_3` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idhorario`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_4` FOREIGN KEY (`idGrado`, `seccionGrado`, `aÃ±oGrado`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoAÃ±o`, `gradoModalidad`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_5` FOREIGN KEY (`diaSemana`) REFERENCES `diasEstudio` (`idDias`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mestroHorarioMaterias`
--

LOCK TABLES `mestroHorarioMaterias` WRITE;
/*!40000 ALTER TABLE `mestroHorarioMaterias` DISABLE KEYS */;
REPLACE INTO `mestroHorarioMaterias` VALUES (1045367087,1,1,1,1,'G','B',2020,NULL),(1045367087,1,2,1,1,'C','B',2020,NULL),(1045367087,1,3,1,1,'C','A',2020,NULL),(1045367087,1,4,1,1,'C','A',2020,NULL),(1045367087,5,1,5,3,'C','B',2020,NULL),(1045367087,8,1,2,1,'C','A',2020,NULL),(1045367087,8,2,2,1,'C','A',2020,NULL),(1045367087,10,10,2,2,'G','B',2020,NULL),(1045367087,10,11,2,2,'G','B',2020,NULL),(1045367087,18,9,1,2,'C','A',2020,NULL),(1045367087,18,10,1,2,'C','A',2020,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=705 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
REPLACE INTO `notificaciones` VALUES (690,'2020-01-27 15:41:35',1045367084,16020,'Solicitud de permiso nueva','Andrea Johana Pleitez AlcÃ¡ntara ha solicitado un nuevo permiso.','\0',' '),(691,'2020-01-27 15:41:35',1045367085,16020,'Solicitud de permiso nueva','Andrea Johana Pleitez AlcÃ¡ntara ha solicitado un nuevo permiso.','',' '),(692,'2020-01-27 15:42:18',16020,1045367085,'Rechado de permiso','Francisco Javier MagaÃ±a Arriola ha rechazado su solicitud de permiso. Motivo del rechazo: el motivo no es vÃ¡lido ','',' '),(693,'2020-01-27 15:42:59',16020,16020,'ModificaciÃ³n de solicitud de permiso','Su permiso se ha solicitado para entre las fechas: 27/01/2020 y 27/01/2020','',' '),(694,'2020-01-27 15:42:59',1045367084,16020,'Modificaciones en una solicitud de permiso','Andrea Johana Pleitez AlcÃ¡ntara ha cambiado su solicitud de permiso.','\0',' '),(695,'2020-01-27 15:43:00',1045367085,16020,'Modificaciones en una solicitud de permiso','Andrea Johana Pleitez AlcÃ¡ntara ha cambiado su solicitud de permiso.','',' '),(696,'2020-01-27 15:44:24',16020,1045367085,'Rechado de permiso','Francisco Javier MagaÃ±a Arriola ha rechazado su solicitud de permiso. Motivo del rechazo:  debe anexar una constancia vÃ¡lida','',' '),(697,'2020-01-27 15:45:15',16020,16020,'ModificaciÃ³n de solicitud de permiso','Su permiso se ha solicitado para entre las fechas: 27/01/2020 y 27/01/2020','',' '),(698,'2020-01-27 15:45:16',1045367084,16020,'Modificaciones en una solicitud de permiso','Andrea Johana Pleitez AlcÃ¡ntara ha cambiado su solicitud de permiso.','\0',' '),(699,'2020-01-27 15:45:16',1045367085,16020,'Modificaciones en una solicitud de permiso','Andrea Johana Pleitez AlcÃ¡ntara ha cambiado su solicitud de permiso.','',' '),(700,'2020-01-27 15:46:34',16020,1045367085,'AceptaciÃ³n de permiso','Francisco Javier MagaÃ±a Arriola ha aceptado su solicitud de permiso. ','',' '),(701,'2020-01-27 15:48:49',1045367087,1045367073,'Se ha agregado una nueva hora clase al horario','AgregaciÃ³n: Viernes 07:15 AM - 08:05 AM Materia: Estudios Sociales. Profesor: MarÃ­a Pineda. Grado: 2Â° General SecciÃ³n A','',' '),(702,'2020-01-27 15:50:14',1045367087,1045367073,'Seha editado el horario','ModificaciÃ³n: MiÃ©rcoles 07:15 AM - 08:05 AM Materia: Estudios Sociales. Profesor: MarÃ­a Pineda. Grado: 2Â° General SecciÃ³n A','',' '),(703,'2020-01-27 15:50:38',1045367087,1045367073,'Seha editado el horario','ModificaciÃ³n: MiÃ©rcoles 07:15 AM - 08:05 AM Materia: Estudios Sociales. Profesor: MarÃ­a Pineda. Grado: 1Â° TVC Contador SecciÃ³n A','',' '),(704,'2020-01-27 15:51:07',1045367087,1045367073,'Seha editado el horario','ModificaciÃ³n: Viernes 07:15 AM - 08:05 AM Materia: Estudios Sociales. Profesor: MarÃ­a Pineda. Grado: 3Â° TVC Contador SecciÃ³n B','',' ');
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
REPLACE INTO `pais` VALUES (1,'AfganistÃ¡n',''),(2,'Islas Gland',''),(3,'Albania',''),(4,'Alemania',''),(5,'Andorra',''),(6,'Angola',''),(7,'Anguilla',''),(8,'AntÃ¡rtida',''),(9,'Antigua y Barbuda',''),(10,'Antillas Holandesas',''),(11,'Arabia SaudÃ­',''),(12,'Argelia',''),(13,'Argentina',''),(14,'Armenia',''),(15,'Aruba',''),(16,'Australia',''),(17,'Austria',''),(18,'AzerbaiyÃ¡n',''),(19,'Bahamas',''),(20,'BahrÃ©in',''),(21,'Bangladesh',''),(22,'Barbados',''),(23,'Bielorrusia',''),(24,'BÃ©lgica',''),(25,'Belice',''),(26,'Benin',''),(27,'Bermudas',''),(28,'BhutÃ¡n',''),(29,'Bolivia',''),(30,'Bosnia y Herzegovina',''),(31,'Botsuana',''),(32,'Isla Bouvet',''),(33,'Brasil',''),(34,'BrunÃ©i',''),(35,'Bulgaria',''),(36,'Burkina Faso',''),(37,'Burundi',''),(38,'Cabo Verde',''),(39,'Islas CaimÃ¡n',''),(40,'Camboya',''),(41,'CamerÃºn',''),(42,'CanadÃ¡',''),(43,'RepÃºblica Centroafricana',''),(44,'Chad',''),(45,'RepÃºblica Checa',''),(46,'Chile',''),(47,'China',''),(48,'Chipre',''),(49,'Isla de Navidad',''),(50,'Ciudad del Vaticano',''),(51,'Islas Cocos',''),(52,'Colombia',''),(53,'Comoras',''),(54,'RepÃºblica DemocrÃ¡tica del Congo',''),(55,'Congo',''),(56,'Islas Cook',''),(57,'Corea del Norte',''),(58,'Corea del Sur',''),(59,'Costa de Marfil',''),(60,'Costa Rica',''),(61,'Croacia',''),(62,'Cuba',''),(63,'Dinamarca',''),(64,'Dominica',''),(65,'RepÃºblica Dominicana',''),(66,'Ecuador',''),(67,'Egipto',''),(68,'El Salvador',''),(69,'Emiratos Ãrabes Unidos',''),(70,'Eritrea',''),(71,'Eslovaquia',''),(72,'Eslovenia',''),(73,'EspaÃ±a',''),(74,'Islas ultramarinas de Estados Unidos',''),(75,'Estados Unidos',''),(76,'Estonia',''),(77,'EtiopÃ­a',''),(78,'Islas Feroe',''),(79,'Filipinas',''),(80,'Finlandia',''),(81,'Fiyi',''),(82,'Francia',''),(83,'GabÃ³n',''),(84,'Gambia',''),(85,'Georgia',''),(86,'Islas Georgias del Sur y Sandwich del Sur',''),(87,'Ghana',''),(88,'Gibraltar',''),(89,'Granada',''),(90,'Grecia',''),(91,'Groenlandia',''),(92,'Guadalupe',''),(93,'Guam',''),(94,'Guatemala',''),(95,'Guayana Francesa',''),(96,'Guinea',''),(97,'Guinea Ecuatorial',''),(98,'Guinea-Bissau',''),(99,'Guyana',''),(100,'HaitÃ­',''),(101,'Islas Heard y McDonald',''),(102,'Honduras',''),(103,'Hong Kong',''),(104,'HungrÃ­a',''),(105,'India',''),(106,'Indonesia',''),(107,'IrÃ¡n',''),(108,'Iraq',''),(109,'Irlanda',''),(110,'Islandia',''),(111,'Israel',''),(112,'Italia',''),(113,'Jamaica',''),(114,'JapÃ³n',''),(115,'Jordania',''),(116,'KazajstÃ¡n',''),(117,'Kenia',''),(118,'KirguistÃ¡n',''),(119,'Kiribati',''),(120,'Kuwait',''),(121,'Laos',''),(122,'Lesotho',''),(123,'Letonia',''),(124,'LÃ­bano',''),(125,'Liberia',''),(126,'Libia',''),(127,'Liechtenstein',''),(128,'Lituania',''),(129,'Luxemburgo',''),(130,'Macao',''),(131,'ARY Macedonia',''),(132,'Madagascar',''),(133,'Malasia',''),(134,'Malawi',''),(135,'Maldivas',''),(136,'MalÃ­',''),(137,'Malta',''),(138,'Islas Malvinas',''),(139,'Islas Marianas del Norte',''),(140,'Marruecos',''),(141,'Islas Marshall',''),(142,'Martinica',''),(143,'Mauricio',''),(144,'Mauritania',''),(145,'Mayotte',''),(146,'MÃ©xico',''),(147,'Micronesia',''),(148,'Moldavia',''),(149,'MÃ³naco',''),(150,'Mongolia',''),(151,'Montserrat',''),(152,'Mozambique',''),(153,'Myanmar',''),(154,'Namibia',''),(155,'Nauru',''),(156,'Nepal',''),(157,'Nicaragua',''),(158,'NÃ­ger',''),(159,'Nigeria',''),(160,'Niue',''),(161,'Isla Norfolk',''),(162,'Noruega',''),(163,'Nueva Caledonia',''),(164,'Nueva Zelanda',''),(165,'OmÃ¡n',''),(166,'PaÃ­ses Bajos',''),(167,'PakistÃ¡n',''),(168,'Palau',''),(169,'Palestina',''),(170,'PanamÃ¡',''),(171,'PapÃºa Nueva Guinea',''),(172,'Paraguay',''),(173,'PerÃº',''),(174,'Islas Pitcairn',''),(175,'Polinesia Francesa',''),(176,'Polonia',''),(177,'Portugal',''),(178,'Puerto Rico',''),(179,'Qatar',''),(180,'Reino Unido',''),(181,'ReuniÃ³n',''),(182,'Ruanda',''),(183,'Rumania',''),(184,'Rusia',''),(185,'Sahara Occidental',''),(186,'Islas SalomÃ³n',''),(187,'Samoa',''),(188,'Samoa Americana',''),(189,'San CristÃ³bal y Nevis',''),(190,'San Marino',''),(191,'San Pedro y MiquelÃ³n',''),(192,'San Vicente y las Granadinas',''),(193,'Santa Helena',''),(194,'Santa LucÃ­a',''),(195,'Santo TomÃ© y PrÃ­ncipe',''),(196,'Senegal',''),(197,'Serbia y Montenegro',''),(198,'Seychelles',''),(199,'Sierra Leona',''),(200,'Singapur',''),(201,'Siria',''),(202,'Somalia',''),(203,'Sri Lanka',''),(204,'Suazilandia',''),(205,'SudÃ¡frica',''),(206,'SudÃ¡n',''),(207,'Suecia',''),(208,'Suiza',''),(209,'Surinam',''),(210,'Svalbard y Jan Mayen',''),(211,'Tailandia',''),(212,'TaiwÃ¡n',''),(213,'Tanzania',''),(214,'TayikistÃ¡n',''),(215,'Territorio BritÃ¡nico del OcÃ©ano Ãndico',''),(216,'Territorios Australes Franceses',''),(217,'Timor Oriental',''),(218,'Togo',''),(219,'Tokelau',''),(220,'Tonga',''),(221,'Trinidad y Tobago',''),(222,'TÃºnez',''),(223,'Islas Turcas y Caicos',''),(224,'TurkmenistÃ¡n',''),(225,'TurquÃ­a',''),(226,'Tuvalu',''),(227,'Ucrania',''),(228,'Uganda',''),(229,'Uruguay',''),(230,'UzbekistÃ¡n',''),(231,'Vanuatu',''),(232,'Venezuela',''),(233,'Vietnam',''),(234,'Islas VÃ­rgenes BritÃ¡nicas',''),(235,'Islas VÃ­rgenes de los Estados Unidos',''),(236,'Wallis y Futuna',''),(237,'Yemen',''),(238,'Yibuti',''),(239,'Zambia',''),(240,'Zimbabue','');
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
REPLACE INTO `permisos` VALUES (16020,'2020-01-27',4,'2020-01-27','2020-01-27',8,'Muerte de familiar cercano','1',16020,'0Â¿Â¿Â¿Â¿Â¿Â¿ ');
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
  `personaComentarios` varchar(250) DEFAULT NULL COMMENT 'Detalle de la informaciÃ³n relevante de todo el recurso humano de la instituciÃ³n.',
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
REPLACE INTO `persona` VALUES (16018,'Francisco Antonio','Regalado Cruz','1999-01-16','savvvvvvvv','',0,1,'02#13','8d2a5f7d4afa5d0530789d3066945330','',8,'','','\0',0,'SalvadoreÃ±a','','',''),(16019,'Rigoberto Alexander','CÃ¡rcamo Murga','1998-08-13','santa ana texistepeque','',0,2,'02#13','5218f316b3f85b751c613a06aa18010d','',8,'','','\0',0,'SalvadoreÃ±a','','',''),(16020,'Andrea Johana','Pleitez AlcÃ¡ntara','2000-09-23','santa ana metapÃ¡n','',0,2,'02#07','ac2a728f9f17b5d860b6dabd80a5162f','',8,'','','',0,'SalvadoreÃ±a','','',''),(1045367070,'Jorge AgustÃ­n','Pereira cruz','1988-12-04','6666666666666666','7888-8888',0,0,'01#01','ab8a338aa2b1da6d97c11ba6e67be768','',9,'','','\0',0,'SalvadoreÃ±a','666666666666666','',''),(1045367071,'Sandra Andaya','Cruz Fuentes',NULL,NULL,'4564-5656',NULL,NULL,NULL,'cd9187113425eae93d8116205d03bdde',NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1045367072,'Ana Lidia','CÃ¡rcamo Flores','1975-07-15','texistepeque santa ana','6666-6666',0,1,'02#13','7845e7b45be70d2391a2b16c2ffb68e3','',9,'','','',1,'SalvadoreÃ±a','','',''),(1045367073,'Guillermo Aldolfo','Delsas Murcia','1991-01-17',NULL,NULL,0,NULL,NULL,'02951a6cb9595ef475fed783e59c687e','Ingeniero de Sistemas InformÃ¡ticos',1,'','0213-170191-102-9','\0',NULL,'SalvadoreÃ±a','guillermox020@gmail.com',NULL,NULL),(1045367074,'AdÃ¡n Rigoberto','Flores ColsÃ­',NULL,'','4555-5555',0,0,' # ','630abdfb00098f16ba48450363d8d64d','',11,'\0',NULL,'',0,'SalvadoreÃ±a',NULL,'',''),(1045367075,'Pablo JosÃ©','MartÃ­nez CÃ³rdova','1985-11-22','santa ana texistepeque','9999-9999',0,0,'02#13','13f93ad73a8401c8735cc30fd70c7698','',9,'','','\0',0,'SalvadoreÃ±a','','',''),(1045367076,'Juan Sigfredo','Arriola Sagastume',NULL,'','6444-4444',0,0,' # ','ea519761c0e00b5ae877cbfce9ce697a','',11,'\0',NULL,'',0,'SalvadoreÃ±a',NULL,'',''),(1045367077,'Venancia MarÃ­a','Rosales Mata',NULL,'','7856-4666',0,0,' # ','2161b146f79c6a1b733b60a8e0ef7175','',10,'\0',NULL,'',0,'SalvadoreÃ±a',NULL,'',''),(1045367080,'MarÃ­a Carmen','PeÃ±a CÃ¡rcamo','1990-06-20','santa ana santa ana santa ana','9999-9999',0,1,'02#10','6e80cf219e79bc8a8d83ce9a5b757f64','Licenciada en administraciÃ³n de Empresas',6,'','9999-999999-999-9','',0,'SalvadoreÃ±a','99999999999@gmail.com','',''),(1045367081,'Hugo Daniel','Flores Diaz','1989-08-12','ahuachapan ahuachapan','8888-8888',0,1,'01#01','ad9f88eb26394a8ad9f46975cf79a133','Abogado',5,'','8888-888888-888-8','\0',0,'SalvadoreÃ±a','888888888@gmail.com','',''),(1045367082,'JosÃ© Antonio','Murcia PÃ©rez','1979-07-15','sonsonate sonsonate','7777-7777',0,1,'03#01','5f04b909d4b1bca2e6e57dbbf7208c51','profesor',7,'','7777-777777-777-7','\0',1,'SalvadoreÃ±a','77777777@gmail.com','',''),(1045367083,'Laura MarÃ­a','LÃ³pez SuÃ±iga','1960-04-15','santa ana el porvenir','5555-5555',0,1,'02#05','a6ba5f99ff9616298b2212c76ea111dc','profesora',2,'','6666-666666-666-6','',1,'SalvadoreÃ±a','555555555@gmail.com','',''),(1045367084,'MarÃ­a Pilar','Dolores ALvarado','1956-01-13','santa ana texistepeque','4444-4444',213,1,'02#13','0c979466ac54e4b96f3f5c832e126941','profesora en matemÃ¡ticas',4,'','4444-444444-444-4','',1,'SalvadoreÃ±a','444444444@gmail.com','',''),(1045367085,'Francisco Javier','MagaÃ±a Arriola','1988-05-25','santa ana coatepeque','3333-3333',206,0,'02#03','ff0c210fd0f86b21bc0497faef184c7b','profesor',4,'','3333-333333-333-3','\0',0,'SalvadoreÃ±a','333333333@gmail.com','',''),(1045367086,'Juan Manuel','Bartanes Pilar','1990-11-15','cuscatlan monte san juan','2222-2222',780,1,'05#05','f59bc51b847690dce791fce5f7179e04','Administrador de empresas',4,'','2222-222222-222-2','\0',1,'SalvadoreÃ±a','222222222@gmail.com','',''),(1045367087,'MarÃ­a Dolores','Pineda Mata','1983-07-15','santa ana metapÃ¡n','1111-1111',210,1,'02#07','ee17cb731e48303aafe44cfe78c25853','profesora',4,'','1111-111111-111-1','',1,'SalvadoreÃ±a','111111111@gmail.com','',''),(1045367088,'Laura Isabel','Pneda Rosell','1981-05-10','santa ana santa ana','0000-0000',0,1,'02#10','c95b8be4befbee1a550a06fd19ed251a','PsicÃ³loga',14,'','0000-000000-000-0','',1,'SalvadoreÃ±a','00000000@gmail.com','',''),(1045367089,'Ãlvaro Mateo','Cienfuegos Altamirano','1970-12-12','santa ana Texistepeque','4444-4444',0,0,'02#13','d5367241b0f4893393b6bc984029e999','Jornalero',15,'','4444-444444-444-4','\0',1,'SalvadoreÃ±a','444444444@gmail.com','',''),(1045367090,'Pablo Alejandro','MartÃ­nez Santos','1960-03-01','sonsonate acajutla','9999-8888',0,0,'03#01','8912074c9b782911ff4f5585c747c132','TÃ©cnico en reparaciÃ³n de computadoras',12,'','9999-999888-888-8','\0',1,'SalvadoreÃ±a','999988888@gmail.com','',''),(1045367091,'Alba LucÃ­a','Aybara Campos','1988-12-30','cuscatlÃ¡n cuscatlÃ¡n','8888-8999',0,1,'05#02','f0ee269fcf3f4b1f8883aab03e6a7919','Secretaria',13,'','8888-888888-999-9','',1,'SalvadoreÃ±a','888888899999999@gmail.com','','');
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
REPLACE INTO `personasReserva` VALUES (1,16018,''),(2,16018,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
REPLACE INTO `recurso` VALUES (1,'10 pasos para una mejor calidad de vida',100,3,1,68,'',10,'B','REAL','1',NULL),(2,'CaÃ±on multimedia',NULL,1,1,NULL,'',325,'B','ESTIMADO','',NULL),(6,'Microscopio',NULL,2,3,NULL,'',356,'B','ESTIMADO','',NULL),(98,'No me agarran viva',900,3,1,68,'',3,'B','REAL','10',NULL),(1140,'Luciernagas en El Mozote',800,3,1,68,'',12.85,'B','REAL','11',NULL),(1890,'El Arte de amargarse la vida',100,3,1,68,'',20.9,'B','REAL','1',NULL),(7663,'El libro de la selva',700,3,3,73,'',19.99,'B','REAL','2',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
REPLACE INTO `reserva` VALUES (1,'2020-01-25 22:50:12','2020-01-27 22:52:00','2020-01-27 23:50:00',1,1,2,'S',NULL,NULL,NULL,'fgd','ndfndfnd',NULL,NULL,NULL,NULL,'Francisco RegaladoÂ¿Â¿2Â¿Â¿0Â¿Â¿Â¿Â¿0'),(2,'2020-01-25 23:05:49','2020-01-27 21:06:00','2020-01-27 23:05:00',3,1,NULL,'S',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'Francisco RegaladoÂ¿Â¿2Â¿Â¿0Â¿Â¿Â¿Â¿0');
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
REPLACE INTO `solicitudReserva` VALUES (2,1,'1'),(1890,2,'1'),(7663,2,'1');
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
REPLACE INTO `tema` VALUES (16018,'humanity',''),(1045367073,'dot-luv',''),(1045367074,'luna-pink',''),(1045367083,'pepper-grinder',''),(1045367084,'eggplant',''),(1045367087,'cupertino','');
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
REPLACE INTO `tipoCargo` VALUES (1,'Fondos Propios',NULL),(2,'Actividades de la instituciÃ³n',NULL),(3,'DonaciÃ³n',NULL);
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
REPLACE INTO `tipoEspecialidades` VALUES (1,'MatemÃ¡ticas',''),(2,'Ciencias Naturales',''),(3,'EducaciÃ³n FÃ­sica',''),(4,'Ciencias de la EducaciÃ³n',''),(5,'Lenguaje',''),(6,'Ciencias Sociales',''),(7,'AdministraciÃ³n y Ciencias Comerciales',''),(8,'InglÃ©s',''),(9,'InformÃ¡tica','');
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
  `tipoMateriaNombre` varchar(50) NOT NULL COMMENT 'Listado de los tipos de materias que se imparten en la instituciÃ³n.',
  `tipoMateriaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idtipoMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoMateria`
--

LOCK TABLES `tipoMateria` WRITE;
/*!40000 ALTER TABLE `tipoMateria` DISABLE KEYS */;
REPLACE INTO `tipoMateria` VALUES (1,'Ãrea BÃ¡sica',NULL),(2,'Ãrea Aplicada',NULL),(3,'Ãrea TÃ©cnica',NULL),(4,'Modalidad y Opciones',NULL);
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
  `tipoNombramientoNombre` varchar(60) NOT NULL COMMENT 'Listado de las formas en las que se uede nombrar el cargo de un docente dentro de la instituciÃ³n.',
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
REPLACE INTO `tipoPermiso` VALUES (1,'Enfermedad',8,NULL),(2,'Materindad',0,NULL),(3,'Paternidad',0,NULL),(4,'Faltar a clases',0,NULL),(5,'Salir temporalmente de la instituciÃ³n',0,NULL),(6,'Retirarse de la instituciÃ³n',0,NULL),(7,'No portar uniforme',5,NULL);
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
REPLACE INTO `tipoProyecto` VALUES (1,'Proyecto Planificado',''),(2,'ExposiciÃ³n De Alumnos',''),(3,'Clase De Docente Con TecnologÃ­a','');
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
REPLACE INTO `tipoRecurso` VALUES (1,'TecnolÃ³gico CRA',NULL),(2,'Laboratorio de Ciencias Naturales',NULL),(3,'BibliogrÃ¡fico',NULL);
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
REPLACE INTO `tipoReserva` VALUES (1,'Uso en sala',NULL),(2,'Uso dentro de la instituciÃ³n',NULL),(3,'Uso en aula',NULL),(4,'Uso fuera de la instituciÃ³n',NULL);
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
REPLACE INTO `tipoReservaRecurso` VALUES (1,1,''),(1,2,''),(1,6,''),(1,98,''),(1,1140,''),(1,1890,''),(1,7663,''),(2,98,''),(2,1140,''),(2,1890,''),(3,2,''),(3,98,''),(3,1140,''),(3,1890,''),(4,98,''),(4,1140,''),(4,1890,'');
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
  `idzona` int(30) NOT NULL AUTO_INCREMENT COMMENT 'La IdentificaciÃ³n de la zona geogrÃ¡fica (1Â°, 2Â° y 3Â°) en la que estÃ¡ dividido el instituto.',
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

-- Dump completed on 2020-01-27 16:54:00
