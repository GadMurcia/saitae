CREATE DATABASE  IF NOT EXISTS `intex` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `intex`;
-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: intex
-- ------------------------------------------------------
-- Server version	10.5.5-MariaDB-1:10.5.5+maria~stretch

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
  `accesourl` varchar(100) NOT NULL,
  `accesoIndice` int(30) DEFAULT 0,
  `youTubeUrl` varchar(100) DEFAULT NULL,
  `accesoComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idacceso`),
  UNIQUE KEY `accesoNombre_UNIQUE` (`accesoNombre`),
  UNIQUE KEY `idacceso_UNIQUE` (`idacceso`),
  KEY `fk_acceso_1_idx` (`accesoIndice`),
  CONSTRAINT `fk_acceso_1` FOREIGN KEY (`accesoIndice`) REFERENCES `acceso` (`idacceso`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES (1,'Introducción a SAITAE','#',69,'vvIoCS0OHgI',''),(9,'Administración','#',NULL,NULL,'fa fa-cog'),(10,'Sistema','tipopp.intex',9,'PRxuV1fgz2M','fa fa-folder-open'),(11,'Permisos y Licencias','lictp.intex',9,'jpoB7dhtzCE','fa fa-cube'),(12,'Académica','academico.intex',9,'xqZTZBWC4Ss','fa fa-leaf'),(13,'Perfil','#',NULL,NULL,'fa fa-user-secret'),(14,'Permisos','#',45,NULL,'fa fa-eye'),(15,'Solicitar Permiso','permisoE.intex',14,'2taqyO5-saU','fa fa-location-arrow'),(16,'Personal','#',NULL,NULL,'fa fa-users'),(17,'Gestión de maestros','agregacion.intex',27,'z95v9LAqEpk','fa fa-user-plus'),(18,'Gestión de administradores','agAdm.intex',16,'Z_9XM6mawiM','fa fa-heartbeat'),(19,'Plantel Institucional','plantel.intex',16,'kE_GK-VYKhU','fa fa-table'),(20,'Inventario','inventario.intex',23,'A2iuTIQK3UM','fa fa-barcode'),(21,'Libros','libros.intex',23,'za6PsFqJ4xw','fa fa-book'),(22,'Nuevo Ingreso','inscripcion.intex',36,'fG_pxuQiENk','fa fa-user'),(23,'Recursos','#',9,NULL,'fa fa-yelp'),(24,'Nomina de Alumnos','nominaA.intex',36,'btLM8Ap0nf8','fa fa-user'),(25,'Gestión de Recursos','admRecurso.intex',23,'hcStyHhJXJU','fa fa-table'),(26,'Lista de Representantes','listaRepresentantes.intex',36,'lz_ro4WBz7w','fa fa-list'),(27,'Maestros','#',16,NULL,'fa fa-puzzle-piece'),(28,'Gestión de horarios','horario.intex',27,'FHFxHb9KbNg','fa fa-plus'),(29,'Gestión de permisos','permiso.intex',14,'jQxOPSdKrJo','fa fa-legal'),(30,'Solicitud de permisos','permisoM.intex',14,'5KCUeTVc0dE','fa fa-ge'),(31,'Anuncios','anuncios.intex',9,'OlRPrt81ABs','fa fa-bell'),(32,'Matricula','matricula.intex',36,'gsNmACB_jhs','fa fa-slideshare'),(33,'Entrega de Útiles','paquetes.intex',36,'SzU0g7AHrC4','fa fa-sliders'),(34,'Contribuciones','contribuciones.intex',36,'6DdwbMkRVRQ','fa fa-money'),(36,'Alumnos','#',16,NULL,'fa fa-graduation-cap'),(37,'Reservas de Equipo','#',45,NULL,'fa fa-gamepad'),(38,'Solicitud de Reserva','solicitudR.intex',37,'etEs-_9C4Ps;QdicGaVmyKE;Vzl57q_AQT0','fa fa-flag'),(39,'Historial de Reservas','solicitudH.intex',43,'lfu6BuEXeEU','fa fa-archive'),(40,'Gestionar Reservas de equipo','srCra.intex',37,'bUiMPCvBZiY','fa fa-certificate'),(41,'Historial de Notificaciones','notifh.intex',43,'2AItrbWMG7k','fa fa-forumbee'),(42,'Proyecto Planificado','solicitudRPP.intex',37,'PF-RsOBMFyk','fa fa-pencil-square-o'),(43,'Historiales','#',13,NULL,'fa fa-folder-open'),(44,'Historial de permisos','permisoH.intex',43,'fbBCKYURFVI','fa fa-database'),(45,'Solicitudes','#',NULL,NULL,'fa fa-street-view'),(46,'Área psicológica','#',45,NULL,'fa fa-ambulance'),(47,'Solicitud de cita psicológica','solicitudCP.intex',46,'nz7TFDnwcBU','fa fa-bookmark-o'),(48,'Adminitración citas psicológic','admCitasPs.intex',46,'CT1WchUKyFU','fa fa-calendar'),(49,'Consulta Psicológica','consultasPS.intex',46,NULL,'fa fa-umbrella'),(50,'Historial citas Psicológicas','citasPSH.intex',43,'c0n7MzrU2fI','fa fa-file'),(51,'Horario de clases','horarioCl.intex',13,'Jzf5uLibF7Y','fa fa-calendar'),(52,'Aspecto de la aplicación','temas.intex',13,'lUwlOJ0pYDY','fa fa-picture-o'),(53,'Mi usuario','infoPerfil.intex',13,'1CLiFlFRDKU','fa fa-android'),(54,'Administración de usuarios','admUsuarios.intex',16,'IfDFy7sJAXc','fa fa-university'),(55,'Evaluación de maestros','maestroEval.intex',27,'PUGwTNWXP8o','fa fa-list-alt'),(56,'Evaluación de grados','gradoEval.intex',36,'VonX5TINpJ8','fa fa-flask'),(57,'Reportes','#',9,NULL,'fa fa-weibo'),(58,'Historial de evaluaciones','maEvalH.intex',43,'WpILwjb1I9k',' fa fa-history'),(59,'Evaluaciones de grado','gradoEvalH.intex',43,'ioFuLA0i6Tg','fa fa-dashcube'),(61,'Entrega de Paquetes','repEntrega.intex',57,'m_p006iKTfg','fa fa-leanpub'),(62,'Gestión de horarios (lite)','horarioLite.intex',27,'rpzqHZh1-gM','fa fa-list-alt'),(63,'Pago de contribución','repContr.intex',57,'fe9XxpJTmM8','fa fa-server'),(64,'Inventario de equipo','repInv.intex',57,'-RwAqJ6NRsM','fa fa-linux'),(65,'Matrículas','repMatricula.intex',57,'7onjIK6pPuY','fa fa-book'),(66,'General de Permisos','repPermisos.intex',57,'trkgmy4mYSQ','fa fa-bar-chart-o'),(67,'Área de psicología','CPsReporte.intex',57,'xKqevg9d-7I','fa fa-newspaper-o'),(68,'Elaboración de reporte','CPsReporte.intex',46,'QdmLKk81No4','fa fa-paperclip'),(69,'intro','#',NULL,'','');
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
  CONSTRAINT `fk_accesoTipoPersona_1` FOREIGN KEY (`idacceso`) REFERENCES `acceso` (`idacceso`) ON UPDATE CASCADE,
  CONSTRAINT `fk_accesoTipoPersona_2` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesoTipoPersona`
--

LOCK TABLES `accesoTipoPersona` WRITE;
/*!40000 ALTER TABLE `accesoTipoPersona` DISABLE KEYS */;
INSERT INTO `accesoTipoPersona` VALUES (1,1,''),(1,2,''),(1,3,''),(1,4,''),(1,5,''),(1,6,''),(1,7,''),(1,8,''),(1,9,''),(1,12,''),(1,13,''),(1,14,''),(1,15,''),(1,16,''),(1,17,''),(9,1,''),(9,2,''),(9,3,''),(9,4,''),(9,5,''),(9,6,''),(9,7,''),(9,12,''),(9,13,''),(9,14,''),(10,1,''),(10,2,''),(11,1,''),(11,2,''),(11,3,''),(12,1,''),(12,2,''),(13,1,''),(13,2,''),(13,3,''),(13,4,''),(13,5,''),(13,6,''),(13,7,''),(13,8,''),(13,9,''),(13,12,''),(13,13,''),(13,14,''),(13,15,''),(13,16,''),(13,17,''),(14,1,''),(14,2,''),(14,3,''),(14,4,''),(14,5,''),(14,6,''),(14,7,''),(14,8,''),(14,9,''),(14,12,''),(14,13,''),(14,14,''),(14,15,''),(14,16,''),(15,1,''),(15,8,''),(15,9,''),(16,1,''),(16,2,''),(16,3,''),(16,4,''),(16,12,''),(16,13,''),(17,1,''),(17,2,''),(18,1,''),(18,2,''),(19,1,''),(19,2,''),(19,3,''),(19,13,''),(20,1,''),(20,2,''),(20,5,''),(20,6,''),(20,7,''),(21,1,''),(21,2,''),(21,5,''),(22,1,''),(22,2,''),(22,3,''),(22,4,''),(22,13,''),(23,1,''),(23,2,''),(23,5,''),(23,6,''),(23,7,''),(24,1,''),(24,2,''),(24,3,''),(24,4,''),(24,13,''),(25,1,''),(25,2,''),(25,5,''),(25,6,''),(25,7,''),(26,1,''),(26,2,''),(26,3,''),(26,4,''),(26,13,''),(27,1,''),(27,2,''),(28,1,''),(28,2,''),(29,1,''),(29,2,''),(29,3,''),(30,1,''),(30,2,''),(30,3,''),(30,4,''),(30,5,''),(30,6,''),(30,7,''),(30,12,''),(30,13,''),(30,14,''),(30,15,''),(30,16,''),(31,1,''),(31,2,''),(31,3,''),(31,4,''),(31,5,''),(31,6,''),(31,7,''),(31,12,''),(31,13,''),(31,14,''),(32,1,''),(32,2,''),(32,13,''),(33,1,''),(33,2,''),(33,12,''),(34,1,''),(34,2,''),(34,12,''),(36,1,''),(36,2,''),(36,3,''),(36,4,''),(36,12,''),(36,13,''),(37,1,''),(37,2,''),(37,3,''),(37,4,''),(37,5,''),(37,6,''),(37,7,''),(37,8,''),(37,13,''),(37,14,''),(38,1,''),(38,2,''),(38,3,''),(38,4,''),(38,5,''),(38,6,''),(38,7,''),(38,8,''),(38,14,''),(39,1,''),(39,2,''),(39,3,''),(39,4,''),(39,5,''),(39,6,''),(39,7,''),(39,8,''),(39,14,''),(40,1,''),(40,2,''),(40,5,''),(40,6,''),(40,7,''),(41,1,''),(41,2,''),(41,3,''),(41,4,''),(41,5,''),(41,6,''),(41,7,''),(41,8,''),(41,9,''),(41,12,''),(41,14,''),(41,15,''),(41,16,''),(42,1,''),(42,2,''),(42,4,''),(43,1,''),(43,2,''),(43,3,''),(43,4,''),(43,5,''),(43,6,''),(43,7,''),(43,8,''),(43,9,''),(43,12,''),(43,13,''),(43,14,''),(43,15,''),(43,16,''),(44,1,''),(44,2,''),(44,3,''),(44,4,''),(44,5,''),(44,6,''),(44,7,''),(44,8,''),(44,9,''),(44,12,''),(44,13,''),(44,14,''),(44,15,''),(44,16,''),(45,1,''),(45,2,''),(45,3,''),(45,4,''),(45,5,''),(45,6,''),(45,7,''),(45,8,''),(45,9,''),(45,12,''),(45,13,''),(45,14,''),(45,15,''),(46,1,''),(46,8,''),(46,14,''),(47,1,''),(47,8,''),(48,1,''),(48,14,''),(49,1,''),(49,14,''),(50,1,''),(50,8,''),(51,1,''),(51,4,''),(51,8,''),(51,9,''),(52,1,''),(52,2,''),(52,3,''),(52,4,''),(52,5,''),(52,6,''),(52,7,''),(52,8,''),(52,9,''),(52,12,''),(52,13,''),(52,14,''),(52,15,''),(52,16,''),(52,17,''),(53,1,''),(53,2,''),(53,3,''),(53,4,''),(53,5,''),(53,6,''),(53,7,''),(53,8,''),(53,9,''),(53,12,''),(53,13,''),(53,14,''),(53,15,''),(53,16,''),(53,17,''),(54,1,''),(54,2,''),(54,13,''),(55,1,''),(55,2,''),(56,1,''),(56,2,''),(56,3,''),(57,1,''),(57,2,''),(57,3,''),(57,4,''),(57,5,''),(57,6,''),(57,7,''),(57,12,''),(57,13,''),(58,1,''),(58,4,''),(59,1,''),(59,2,''),(59,3,''),(59,4,''),(59,8,''),(61,1,''),(61,2,''),(61,3,''),(61,4,''),(61,12,''),(61,13,''),(62,1,''),(62,2,''),(63,1,''),(63,2,''),(63,3,''),(63,4,''),(63,13,''),(64,1,''),(64,2,''),(64,3,''),(64,5,''),(64,6,''),(64,7,''),(64,13,''),(65,1,''),(65,2,''),(65,3,''),(65,13,''),(66,1,''),(66,2,''),(66,3,''),(67,1,''),(67,2,''),(68,1,''),(68,14,'');
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
INSERT INTO `anuncio` VALUES (1,'jd','2020-06-22','dfjjydtrydt',1045367073,NULL,NULL),(2,'Citas psicológicas','2020-06-30','Las solicitudes de citas deberán realizarse para las horas matutinas. Por su comprensión, gracias.',1045367088,8,NULL),(3,'Suspención de clases.','2020-06-26','El próximo Viernes 26 suspenderemos clases a nivel institucional debido a la jornada de limpieza institucional.',1045367083,NULL,NULL),(4,'Reanudación de las clases','2020-08-31','Se espera que las clases se reanuden en septiembre del corriente. Estar atentos a las nuevas informaciones.',1045367083,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (7,4,''),(8,5,''),(9,6,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (2,'Mónica P. Alegría',NULL),(3,'Herbert Meislich',NULL),(4,'Otros',NULL),(5,'M. D. Masjuan',NULL),(6,'J. M. Dou',NULL),(7,'J. Pelegrin',NULL),(8,'Michel Lewis',NULL),(9,'Guy Waller',NULL),(10,'J. A. Chamizo',NULL),(11,'A. Garritz R. Vilar',NULL),(12,'Lothar Beyer',NULL),(13,'V. Fernández H.',NULL),(14,'G. E. Educar',NULL),(15,'Biggs',NULL),(16,'Kapicka',NULL),(17,'Lundgren',NULL),(18,'Espasa',NULL),(19,'Hickman',NULL),(20,'Roberts',NULL),(21,'Larson',NULL);
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
INSERT INTO `autorLibro` VALUES (2,5000040,''),(3,5000042,''),(4,5000040,''),(4,5000042,''),(5,5000044,''),(6,5000044,''),(7,5000044,''),(8,5000046,''),(9,5000046,''),(10,5000048,''),(11,5000048,''),(12,5000050,''),(13,5000050,''),(14,5000052,''),(14,5000056,''),(15,5000054,''),(16,5000054,''),(17,5000054,''),(18,5000058,''),(19,5000060,''),(20,5000060,''),(21,5000060,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (3,'Director',2,NULL),(4,'Subdirector',3,NULL),(5,'Administrador de área CC.NN',7,NULL),(6,'Profesor de planta',4,NULL),(7,'Profesor horas clases',4,NULL);
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
INSERT INTO `categoria` VALUES (0,'Generalidades',NULL),(100,'Filosofías y Disciplinas A Fines',NULL),(300,'Ciencias Sociales',NULL),(400,'Leguas',NULL),(500,'Ciencias Puras',NULL),(600,'Ciencias Aplicadas',NULL),(700,'Bellas Artes',NULL),(800,'Literatura',NULL),(900,'Geografia e Historia',NULL);
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
INSERT INTO `citaPsicologia` VALUES (16018,'2020-06-24 18:39:02','2020-06-24 16:54:57','T','',''),(16018,'2020-07-02 08:45:00','2020-06-24 07:58:09','C','','ya no'),(16018,'2020-07-03 13:16:47','2020-06-24 07:28:52','T','',''),(16018,'2020-08-31 08:00:00','2020-06-24 16:54:22','P','','me retiro temprano'),(16018,'2020-09-01 05:17:16','2020-06-24 17:32:58','T','',''),(16018,'2020-09-01 08:45:00','2020-08-24 01:43:43','P','','no habrá clases'),(16018,'2020-09-01 09:45:00','2020-08-24 01:43:11','P','','no hay clases'),(16019,'2020-07-03 13:20:39','2020-07-03 13:19:51','T',NULL,NULL),(16020,'2020-07-03 13:19:25','2020-07-03 13:17:50','T',NULL,NULL),(16020,'2020-08-31 08:40:00','2020-08-27 00:41:30','S','',''),(16020,'2020-08-31 09:40:00','2020-08-27 00:39:40','S','','');
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
  CONSTRAINT `fk_constancias_1` FOREIGN KEY (`idConstancias`, `fechaSolicitud`, `tioPermiso`, `fechaInicio`) REFERENCES `permisos` (`ipPersona`, `permisoFechaSolicitud`, `tipoPermiso`, `permisoFechaInicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constancias`
--

LOCK TABLES `constancias` WRITE;
/*!40000 ALTER TABLE `constancias` DISABLE KEYS */;
INSERT INTO `constancias` VALUES (1045367086,'2020-06-25',5,'2020-06-25','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0;\0\0\0;�4p\0\0\0sBIT|d�\0\0\0tEXtSoftware\0gnome-screenshot��>\0\0 \0IDATx���y\\T��?�����0�0��(�BR*`��˽��UY��(��a}��_���f�F����M�Ij.(���\Z��\Z\n��*\n&�0����\\�Y8���~><���9���0s�;\"\"0�c�1ƚ�\r]�c�1Ƙ��F�1�c��f�7��1�c�5C��g�1�c��>c�1�c�o�c�1�k�x��c�1�X3�}�c�1ƚ!��3�c�1��F�1�c��f�7��1�c�5C��g�1�c��>c�1�c�o�c�1�k�x��c�1�X3�}�c�1ƚ!��3�c�1��F�1�c��f�7��1�c�5C��g�1�c��>c�1�c�o���K�.!,,eee\r]fS�ML���|��W��b�!\"lٲ�nݲJ��=�J���������il;^�\Z\'\"Btt4�R)&L����ꆮkBx�/;w�������/_n�ܦM�0w���CSbʸJSVV����#,,�.]�dUm�رc4h���PTTd��333d�|Me���X�[hlc���\Z�8ݸq���(..FJJ\nrrr\Z�J�	i������o�F�Νm^vee%\n\n\nl^�����p�ƍ��<x\0�Ri����˱e�����˳11e��y�w��鉬�,t���U����L�^�\Z+W���O?m�2�j5��*y�����V�Cc������&k�5�qruuETT��ߏ�ÇC�P4t�XbG��g@Cn�ѧOܹs��e7e�|�	N�:�͛7[$?f\rgΜATT~�����J��櫥Ƕ1��1ƌ�d��g�1��J�Bqq1~��ܹs���\r]%�c�P��F�Ν;�6m\Z�r9���1d�=zT#΃0s�Lxzz�{���֭[E�R����oC�P@&�!..j�ڤz����y�&F���]�bݺuP*�������<<< ��1g�TUU�J_�Z�N�l�?EEE�������\n�q�L777DDD ??�`����Fii)d2d2���o���۷/***\'��o��u�S}�SXX���\0���b�����􄿿?�9\0X�b|}}���%K�hգ)�Ա6�ݺ�9VČ�-��֚/��iRRЭ[7�n�\Z#F�@JJ\n�ݻ��׾��Z��̙�y��՛�ر�׆�ز�Y�\r{\\��kP�[�\nѯ_?���cܸq��򂗗�ϟ�qɖ��US�\0�ѣ����/���ر#����>������駟F�v퐕�%�V��k�&N���;w����H$x��\'����#G�`РApvvFPPN�8�Q^zz:ƌ��ݻC*�\"$$;v�U�U�Va�ĉ��񁳳3:w���Pl߾��>a6FM\0�}����U*ѻ�K���DD���F���t��I!^LL����TZZJj��Ν;G���t��}�y+�J�J���K/Qrr2��j�s�=�䓴i�&��T*��Ǉ�����ѣ�V�����JKK)%%�JKK����͛4h� JHHЪ�����k�������R\\\\=|�����i�֭���E�\'Oֈ[QQA����q�F���$�JE�֭����Suu��2���R}���I�����޽{�@III\Zq���RIr��\"\"\"����DD�g�^��d�h�\"Z�p!UVVҵk���Ã�?n�}b�3u��i�.��M�X�r�t9}�4����ԇ��S�4))�@yyyDDt��E\n\n\n�~��`;�����i�ܹ\Z�U7c�Jl_뛯b˪��\"\"\"h���z�Y_��=�t�5�q�AJ��\\]]i�ȑ���ADDyyy@˖-�{^5����\"\0���L\04~(--M+nhh(���	q=z$�V��k�\\\\\\�m۶\Zy{{{����F�B��؁�^��Y�~}�u���ՙ��ё~���z���N���oܸ�BBB��/^Lcƌ�����\'NU�R�$\0�����z�j�2e�I�P*�$�Hhɒ%���y�f\Z7n�V���׵�Z��m�F~~~�V�5���}����\r����h�ر�}�v��:ɚۗ��7!!A����OM^�w��W(4}�t���ӧk�YW�Ĕg�X�n]ꫛر����k3h��bʘҁ4¾��k\Z>|��v���3Vb�Z�|[V}�@o����׉��I]��+]x\r�]^C�AJ��:t�@W�^�OM�G����\Z{^�^���2\0�:u*�?��z�-!,<<\\+�����]�R�޽5^ӵ�@ӦM�3g�P��݅��c�RVV��A@W�\\���jR(�\\]]�СCt��\n�q���F_�N�:E˗/�\'NХK�h���B3f̨�_��4�Kw��ߏ���k�O�0Ǐ>b0`\0֯_��\Z��T*EDD�FX�N�PRRbR=\0���QQQ��ݹ��޽�.6�1�2�8�^xvvv\Z�;vԊ����g�yF+<((YYY�ˬ�ܾ�5�R�Tk|��T*�_���0�D�	&h�9;;k�_�)�a�1(�ݦ�͘�����e��bJ���x{{k����z/y˘�2��ŖU_?�9s˖-Uf}�W��5�l����<<<4\r\n�R��ׯ�Mg�y��cF\"����?���-Z$<���ɓZO�R�T7n�_�����z�vrr5k�=z�V�B�޽ѻwo!�޽{HOO�9r�H���R�/��\"\0������#��ٳg#88\n�ӧO�^�zUt�0�k6������k�������Lx���u��U�V���ETTv��e�ǯ���x1��d\Z�_|��///�d2L�6Ugu�7�^��ϵk�t歯s���q��Y�v-JKKE塋�})���K�g�1hͺ3ֶ\Z?��9_LIӵkWdg_��x���_k�Ksʲ�\\��q�k��j\rҧu�֐H$��{^��8�h����B��R)\0��ݻx���V����-ZԿM���G�֭@�\r�v��	e�V�;\r�9��;����W\r�)\'\'S�L�\\.Gǎ���*ĳ�\Z��k6���j�w����J�^sr��>�.\\�رc������pTVVڴ�,X�\0+V���E�p��% 11�f�2�Z����]��f�\Zh�(�J|��Ǧ5Nk����K�g�1h���;�֚bXs���f��٘7o.����V�q��i,\\�o�����m�ز�5�ly\\�\Z���k�!���ptt`�8Xck�ѪU+��$	���gV���r�Ԯӵk��͛7���˸�����,��l�]]]q��5����H�R���h�;::b	8t����,v�����k˖-X�|9BBB�&�-�eL������b�nݺ!;;۸ʛ�Z}	X���Dy������cm��-�c�L�2����<y2���1k�,���{;v�������ز,=�ly\\�\Z��ZkP]������b�Ss����x��m��L�6m�h�.�]|sԾpڴi���kj��}�v����kܼy\0��g�\"##êuf�k6��Ç�o��\nONN�3�<�w���������G�֣FUU��^�۷o5X���OXX��ۧ�����;v�0�=��h�����Ǐ%�3��T��k�6㧏-�1iRS���B�ӧO#//ǎӺ�Z\"��ڬQ]]��~���:�;V�蛯��e��f�q�kP�[��j5���5¾�v\',��o�8XbKKK�t�R�;wo��=z\07*K		�kHIIARRrrrp��L�:�����~��T*������ƍz��l��l�_}�U���߇J�\0�ݛ���$���{\0���\'O\n��޽\'O��s�=g�z��3�`������_�5�_�.,֪���3i�$<x�\0K�,Auu5����駟�_~ъ�G�a֬Y(++����ѣG�?�\'�J���C�x|��!��K[?�(��c�Ru3g��ͅ�:t���b<z�H�|Zk��:�%%�x��L�G]d2:t�M�6x��/�������s�J}�ULYb��o��A�ؚs\\�\Z�x֠\Z*�\n�����s�x�b̞=[�c�8XbU*�y����_~�%\0�K�.�׿�eT{-���		��C���>�M���={��g�ŦM���;�j�\Z5J��8!!����;w�p�/��߸4��~``��\r\\�/_���������cŊ�ضm���\0...�4ifϞ\rwwwxzzb͚O���///��QL=IHH@uu5\n�����7)غu+��Ñ��h�z��?-[�Ğ={��?B&������������h�utt�w�}���b���@&�a֬Y�>�����z۱n�:̚5������3�$K��-�K�g�1h���;�֚u��r6\n����\0�7_LӉ\'B�P�O�>��dpwwG�����\'�qZ�h�/��k׮���;ƌ����0lذz��ܱ�G�|S��~����yyHm�����נƱ�hӦ\r�̙�	&����ǏG\\\\����q��8J�R�]�~~~�J�:t(���g�q��������?�<�u�:@�P`ƌسg��O]���AAA�H$����������W_}AAA�ak�!vķG3�X�s��EL�4	o��6����:��\\aa!���;w�4tU��ѣ��� �Ju=Y�դ��g��?�cǎa���Z�z���ѣ��֞1���}�k�:uꄏ?��N�Ǐ��_��C�6`�c�5f-��1���ի>��#���DAA���вeK���K�.��#6kjڶm��S�6t5\Z2dF��`��3���3�c�1��;�1�c�5C��g�1�c��>c�1�c�o�c�1�k�x��c�1�X3�}�c�1ƚ!��3�c�1��F�1�c��f�7��1�c�5C��g�1�c��>c�1�c�o�c�1�k�\Z�F��\r�T�	&������d���\"-[p��-�����#���\Z�s�v��%�������f��-��>��nZ��y��Ͻ�j��7n 99���HIIANN��y����7nd2:u�\'�|[�l�Bm��D;\Zʱc�0h� $%%������eff\"((��将�����������&�4MIon��{<޹s���ˏ5M�<m+W�\\�����/b�ڵ\r]�x�ij�}WWWDEEA\"��o�\n�Q鋊��o��׮]�ݻwq��)TVVZ�ƺ�ێ�����իWc�ʕ���ѻwo���V�ADV/\0֮]�L��Ӯ];�8qBo���b���K��d���ĬY�P^^nr�?#[�s���������\r���x�7p�������wPPnܸ�N�:�,��e�J��XYY������\Z��z�����\n���c�Ν8x�`CWG\'�{�\Z�F���[�nEqq1�m�{{{���ݻ׮]\0L�<999سg/����Q]��mGC�ׯ�mۆ��~���b3f�@AA���ѣGѩS\'�M����())�̙3M�Ǭ����?�<^{�5\\�v\r��ٰ��GTTd�iy�k���y�6�J���↮kDZ6t�-??_�}Ĉ�����\rX#��mذ&L@�֭u�~��1���#55���ppp�g�}�\\���<xyy��ƶm�\Z\Z����\0ڴi�+V���\rW�^�����t<ތ�Ƭ��W�\\AZZ\Z6l؀�_~�������b�D�G\0z��;;;��rk�&N��Çc���pvv���?�o�\0�ԩ�{�=!MLL���0o�<l߾\'N������ѹsg���\ni�)��ŋ\rt�����x�����u�Cl=ty��fΜ	OOOt�����غu�F���BDEEA&����\r\Z�����߿?n޼�ѣG�k׮X�n�J%bcc�����r̙3UUU��͜���\'�O����֭[��k�鍓���Q�Fi��Ӿ}{���b߾}F�3��u\"  \0����<y2<==���#G�\0\0V�X___xxx`ɒ%��)�����ѹsg�0{{{899����<ޅ��Z���o߾���@\\\\\nd2�|�M��u��{���믿ooot��#G�DFF��4�gb�Ac������p��| *ݝ;w0m�4��r���cȐ!8z��V��w���_����_}�^y��xgΜ����V�9s�`޼y\Za��Caa!�����|�7^^^�������5.�;N�8�Ԝ_#\"\"��_   @8o޼Yg���h�?O?�4ڵk����z�;w�D���!�H��O\"##G���A���쌠� ��>���1f�t��R�!!!رc��:�U^^��K�\"00R��۷G߾}���|��w�\\�j��}�޽�xꩧ �J�ݻw��ӧO#\"\"���H$�������M�ߦ)�[\Z=j���\0I�R��.]����#~$	�T*���ٴiM�>]�k������?Uѯ��J...Z�988СC���Cl=t�����_~�JKKI�Vӹs�(66��߿ODDH7n���JR�T�n�:�߿?UWW�(�J�����h:z�(��j*//���RJII���R\"\"�y�&\r\Z4��3sҞ>}�|||Lʯ�>�OJJ\n\r6L#,\"\"�V�^-�=v�XJLL�J;�|�1c���t1���J%��r����Çў={I&�ѢE�h�TYYI׮]#:~��޼�ے�$��8���O$�˩��H;u����Ree��v�Y�[_��׫�0OOO������dR��t��]\Z0`\0%%%՛����\r\ZD�gϦ��2����ÇӺu���1�8��:���O<A�?�<]�p���Ο?O>>>��\'��O�RQPP���T^^NDDiii���N\'O���j\n		�Y�fQYY��j���C�z��ɓ\'k䩯����4w�\\��A_�]]]i�ȑ���ADDyyy@˖-�\'k�sjί���:��iiiZqCCC���O����#��\rj۶�F��������P(�>=p����5?�ׯU�ڪ����g�ՙߠA�hǎ�T*\r�+j߱wo�־���رc��$�D�3^hh(UTTq�۹��k�����ܹs4r�H!l׮�t��uz��7��O?��\n\n\n�ѣGt��)Z�|9�8q�.]�D�����>)�)��(  @[�t)�?��>0������ۛN�8���\r6Д)S��ǎK۷o�V*�$�Hhɒ%�#\"ڼy3�7��x�{�Օ_}}R���pJNN����~[�{����{���			at<����R�$\0Z�*\n�>}�F����\r�y�v[��D\r3�+W��^�z��իiϞ�\Z\ZJgϞՈ�go}�������������FW�͛7S``�Qe�\"�8�\Z���С]�~]#|۶m�P(�q�F\n		��s���4f���;v�����|ѢE&o����.5m�z��Fxj�>���6�V�8Y�S�\\=u�T:�<���[BXxx�V\\@]�v�޽{k��o�1m�4:s�u��]co���%l�Е+W����\n WWW:t��9s�����j6���T[ZZ�P���)33���҄76����m��}G�޽��ŋSFF���hm����I.�\0j߾=%%%QFF=��sB�+V�6�sKc�$.�1���	������׸a�޽����\'��$	���ѦMb����B����ӅxW�^5���\'O\n;8�������ԩS�>:���z�6`�\0�_�>��zZZ\Z�y��� ��KJJe�<\0���w�ޭ7��ӊͯ�>1��ʚk�k�9s˖-�V�Th��A+�����G�b�%���R)��׿h�I$L�0A#���%%%z��nK�Ӝ�Lg��\'\\]]����3���={�k׮\Zq���m�T����01����\"2����#��Y�rpp����F��ѣ����R�7������\0�0a�?.\\F�����cǢE�St�L�oM��􃃃<<<4\r\n�R��ׯ�M�o��uΑH$�������E�	}v��I�\'��T*�7ׯ_Gfff�y;99a͚5@�=��U�V�w��\ZO��w���ӅGt�9={��T*ŋ/�\0�}�6~��Qu�|�����I�зo_������\0������n�b����8w�\0�o߾�׿��~��a�ܹZ�?~���\0���PL�2������/����o�ߛ㹥1k�}{{{�m�\0�ECrrr0e���rt��QcѮ��W�����u]+i�zԶn�ghժ|}}�]�vi�)((��9s��v�Z���j�%�J!��4_|��/���\0\0 \0IDAT//�d2L�6U�c��IkN~���!�ׯǤI��࠽Y��M�6��Pi��T*�i���x�X����)��m۰t�صk���///2���z��x[V~~�ֆ�>��1�9ѩS\'ܼy�`]��ݵ����QVV&|O��x�F?�n�\Z�D�\"Ec����\Z-Z��iݺ5�R)���<<x�@+��`oo/j�`oo/<����No׮�Pvm�.]~OLL���w����\ZU\'ooo��������������֨��<��;._�\"����Kg�5j6�\04Iڳ��{OLS:�4v���;�\\�v\raaadc��j���-�w���pr��>�eeeHMMEBB֬Y���T�j�\n���X�f��,X�ݻw��O?�SO=�V�Za߾�����o�3\'�9���\'��T*��?����_o]:uꄢ��Z�EEEpqq1:�.��?kiJ���{�a��uh߾=�Ǜ�y�桠�\0+V�����e��j�[hN���\ZC�V��h�ԥ��A�R	��ٵ0�+1�����ptt`�ql�yP�f˺k�D\"A�~�Lλ>�|_O}u\Z1bƌ���T���	����� ��y��w�j�߽L}�v���>�m9�����=Dc����7��_-����8{��p�)z�����|�������	&�СC(**��֭��_�)�lق�˗#$$��ܜ���O_��m�6������___�#�ڲ�����ot<],���Tƹ��\n�������z-  @㝷�x�-�{���w��eN����URR���b�w�ksuu�����H�R�B77W��\0��\Z�p��(..>}0�8��<�}��pi�L&��d���L�U���iӦ������oU�-Z`���Zox{{c�ʕx뭷t��!v����&�^��j����������(;�w�wc/�T�-M��r�_�@�J�����x�ݍ7PQQ!:������ǎÚ5k����͛7c͚56����<==�����s���رc��;UUUi�[p��-���d~u�D��7bڴi��2f��߿_�Q�eee8z�(F�\Zet<],���Tƹe˖�ڵ+~�]{�s��y��3o�\n�7�|cT\Zs���uP���j��]v�܉�����>\\gۓ����3����0��d�}�D\r�D�{��i�履~�*ۜ~P��Z����;1x�`�}s�cK̃��R,]��Ν�[o�%�nT>�\"\\�������$����ȑ#�:u*���M�w���}�6F�\Z���L�={���+�|��zӊ�w���S���ɓؼy3����������v���Oزe2335�Q�4i�Qml*�&�Zw�Z����k�-\\�P��{˖-DD���B�֭[����ٳԡC�G@վ�<==ݨr>���R���t��1�yS��nݺE�Ǐ��~�Mx4�]���͍�\\�BDD< ???�9s&=x���ߍ>j�(�w�!/}O���������^{���ȑ#��ˋ>|hp��I���C...���CR�բ��\'��;w����I�R�|]ף����i��٤R�����bbbh�ԩZi�ƫKl�խ������^#l�ܹ�7����J���S[����˩_�~t��)\"\"����M�6���+]�xQo?�9�[}O��U�֭[5��/nyy9��ۗ�ϟO�=\"�ZMǎ��7�Mc�q&v�u<���DB�ƍ���|\"z��{{{ӷ�~k0���2���\n��y�s焴���ԫW/Z�x1UUUQee%�Z������ԝ�\'��<�����I\ZO�������H\'N�7nQVV)\n�\'��\'k�sj?��O�.]4�]�uC��\n\r\r�}�6M�4I;}�4=^�t��k��5OV2T�����t�P(hÆ\r�m̾��?֊���,<b��|߱c�o�^g����5� ���-�ݟ��>}���/�\"((�r�~�!����ꫯ\"((���F�9t�P|�������777t������5k��tloN=\\\\\\0i�$̞=������Ě5�\"%%E������}��������L�Y�fa����c�\'t�[[BB����P(���o�I�֭[���D�����6l\n���E�\'�Otqpp��U��~������q{rr2nݺooo����cǎ:?��.����n����o�Q�,5�q�={6����^���+����k�.����gϞz��s����n�\ZD~~>���������k�A]�gb�A]ǣ>...�7o^z�%xxx \"\"���x��׮];8p\0������Y+V,Ƕm�4.�jٲ%��ك�2��{�ƣG��ꫯjեE���/�v�Z���c̘1��y	Æ\r3��iӦ\r�̙�	&����ǏG\\\\��5�挓%��ߥ^�v-��� �J1t�P�۷������������?�<�u�:@�P`ƌسg�I�}��\':t��\0��� 66V�wj��={6,X\0OOO899a���سg��{�ƍ����c����ҥ$	���>�@��������5�ۉcV��/`ذa��?���Ua����ԩSZ��jm����ӧ�ܹc�r�ѣG���A*�6�z���~Cyy9�R��H���j$&&���_����/���!�i�[l�O��ƘaD����cӦM\r]�c�ߌ3p��Ixyya˖-pww�Çq��!N�N�\Z������x��Ӓ������ٹ���c������ɓ\'������0��]]]�;�|n�=��3ƴ����wCW�1VKPP�Yߎk��m�a�ԩ6/�C���#����b������	��������������nnn:t(�~�m�Gc66|n�=�F�1�c��f�O���c�1ƚ;��3�c�1��F�1�c��f�7��1�c�5C��g�1�c��>c�1�c�o�c�1�k�x��c�1�X3�}�c�1ƚ!��3�c�1��F�1�c��f�7��1�c�5C��g\Z=z��U`�*�ض-�o�\\�t	aaa(++�h�ڈ[�l��[�L��A<ט!��g���L��~ӦM�;w�k�<]�rċ/���k�6tu���c���Yz�6��V��x��!�ˑ�����\\L�<���Ŭ����/_�Y6&n�cǎaРAHJJBQQ�9Uթ��5f;Mf�������p������o������`���t�9pssCLL�ΉV\\\\��^z	2�����5k��˭ՔFK�V��LN���(�J֨y���@zz:v�܉�6tu���c�m�o�����pss����/_^o\Z�k���,K�݆�oK�|�2���������L�1#F�h�j5���r�_����a5AAA�q�:u�$��k����dffb���X�r%~��G����b���T�\Z��&��/,,���?��^{\r׮]Cvv6���i0�k�����x���#77��Θ8q�Vܨ�(��� 77.\\@II	fΜi�&�FD�R������a5ͽ}�ў={�O?�ׯ_�?���;w���?7�N�Z�k�u(\n̙3�:uBbb\"������jP%%%�7o^CWæ,��~��a۶mx��-P+�L�$6�۶mChh(Ə;;;�i�+V���3gp��U�i�u�_�C�\0!MNN.^�(�;v������G����ڵ�g�}���T���٢y����!++˖-C�޽�%\'�j��k�,Y������\0�G˗/�ʕ+�����cL�&�ѿ�>:w�foo\'\'\'�7Ŵi�F��-[�K�.�{������Q�F���^k߾=BCC�o�>��R*�������<<< ��1g�TUULWXX���\0���b�����􄿿?�9\0X�b|}}���%K��K���BDEEA&����\r���79���\"���펋�CEE�E˾z�*�L�OOO<���ѣ�M��K�.i�KOOǘ1cн{wH�R���`ǎ\Zq��˱t�RB*��}���۷/��㑓����\0 �H`gg�B!����������p��\0@�=`gg��\'����<x0�������۷k��wo*�z�)H�Rb���z�|��iDDD��������?~�ׄ�m_M����q��y<���h׮V�Z��\'�������ܹ3BCC��b���b�|37�`�̙���D�����[���W�V#++!!!\Z����(**Baa��tb�\"s�,�6sWs�Ϝ5Sl�����۷/***�B�L�7�|��Ս&O]����ell,���QZZ\n�L�L�}������7o���ѣѵkW�[��*}S_��9>\n5.ũ��u/۱e?�Ν;�6m\Z�r9���1d�=zԨ~e�5?����r***�N�:E���TYY)�EDD��ի��SRr��u릑�رc)11Q+����iƌ�UZZJ)))TZZJDD7oޤA�QBB��tJ���r9EDD��Ç��hϞ�$��hѢE�p�B����k׮���?~�`~�������@ڸq#UVV�J��u��Q������Z�w��i���7���j\Z8p ����Ç�����n�J^^^4y�d�ʮ��ݻ���A\0�~�\"�;p�\0999錷~�z���>���8�\r�;v�R�$\"���B�&M�>}������\0u�҅5�H$TXXHDD{��j�^�g�رB9$�D�3^hh(UTT���whh(���\0rpp���X����ʲV{꛻D��7\"�Ƕ��bbb��_���RR��t��9��������,����ڶmK7o��z�W�^t��)�m���f�b���ߺ��f�-W�T���\'EFFRrr2��j�{�.\r0����Lj�5�ԥ�cԜ�T*�$�Ju����Ptt4=z��j5���[�o�k�9Ǉ��j�����]t�5�JEAAA���Ryy9������;�<yRt���Il�V�\\I�z��իWӞ={)44�Ξ=�\'  ��~�m��\n\n�/�}��\Z��ݻ�h�OHH�����y�f\Z7n��8J��\0h��P(h���\ZaӧO�%K�]��6l�@S�L�\n;v,m߾]�[�F۶m���Gj�Z#������,�-��͛7�¨�(�t�<x�\"##��~#�Ǜ�BA\0��Օ:DgΜ���`@...TZZJiiiB^���LJKK#�TJ\0(..N(�؍~���ܹs4r�H!l׮�DDԻwo!l��Ŕ��A111Z���j����ڷoOIII���A�=��wŊ:�ʘ�������\0P׮]�w��t��)Z�|9�8q�.]�D����y�V{�]C��7\"�Ƕ������ĉF�+  @k~_�r�:u�D���B��m���f�b���ߺXz��UnM)))\Z�			:����ԥ�cԜ�4��H$��O��M}�3����F�V������q�F\n		ъ�x�b\Z3f��)kkz�ĥ;\0�P􄫫+rss1c��ѳgOt��U#Ι3g�l�2���\\.���#^{�5��T*Z�v�J���`���;�h\\\Z��T*�_���0�D�	&h�9;;�����zԖ���g�yF+<((YYYF�w����������ر���vv�\n�ggg�ҥ���!99O>�$�Ǘ����\0\0F���={B*���_\0ܾ}?�p�/_�4i�����p���\0RRRD�\\���������q�ս{%���ƹs�\0\0}��ſ��/���O�c�?���\\\0@hh(�L��~�������|��:�`J�T*ƍ��ׯ#33����={6����P(0}�t!n�}0�l���[��͜�������Ç��5k���wp��Y�;�3f�e˖�J�u�,v-2gͲ��5�1�g�5S_�R�Zab�`[�YW}Ǩ�Ʋ��QQQ��3�o��A[�S�U?���~�?^+|	8~��p��)kkz��F۶mX��C�ڵ			��Ɂ�����z��~��7c���8p �ܹ#�֦MTT��ҨT*�k��\"\"|��2d��� ��0m��F�����̙3G�ް�g�ڵ(--5:�k׮���ݪe�3\Z#G���:��ed2fΜ)<\"�������B�������������Gqq1233���\r\0h׮����aoo��m�\0Z�МN�/_~�ի��|j6�\04������]Okj�,X\0{{{�h�999�2e\n�r9:v�WWW!^��l���c��&6�u�>C�V���단�(�ڵ��2�N���3g\"::\Z=z���5k�j�*�h�B�\r�\Zb�\"s�,[�]}\Zj��F��-���QK�e\r�T\n�Lf�v�ھ�f�~���@�<wwwGYY�pm���,�Il��{�=���h߾=\0�u�֘7oBCC�b�\nQy8::��W_�SO=���$!�S�N(*�����...�\\�`V�X�E��ҥK(((@bb��4\r���\Zk֬AAA�ƏR���lt~-Z�k�#h�[�h���Tlڴ	ÇG���q��-�]�C��ÇQYY)�#F���1c\0<~gK*�\"  @X��~�c)�Z�~�}�.�oЪ����g}y��>�D�~��x����͛q��eܿ�Aۣ�������:��>Å0v�X$$$ <<������;���������d���		��n�k�9k�-�>\r�^Z��Ɩg}Ǩ���Z����9ؐ\ZrP]]�s�T*��ZS�Wf�F�ѯ��Bnn.|}}�^�zK}z���ׯ���\n�#Ԗ��\r�ymٲ˗/GHHZ�jeT=l�[�n»�����*��u�)�E�x�Wp��A����*������O?i��=m�4��{N4~�x�\r�h��ׯ��y{{c�ʕx뭷��������E���M����@�]�Vkŭݖ���^�����𻗗��r�i_�45���kܼy\0��g�\"##��ڣ��盱�9::b	8t����t>�H���,^�X�X����f�j���P�5�m�y�;F-=��Xs�͙��֐�WWW\\�vM+���\0R�T�\\є����o�[�l��]���ߵ����k}\\V��t>�*##r�\\�{̘1ؿ�Fܲ�2=z�F�2X���*�z�\Z�o�2��!>;v��Graaa:�W�r\rs�.**BXX>��#�:uJ��[�l���xxx\0x|zRRrrrp��L�:���B��ӧ����5j233q��Y���x��75�}�\'��O�8�-[����FսFϞ=ѣG\0�ɓ\'�y�fdee!>>^+���������Oزe2335��eҤIz��>]joԥR)���5��ƍ����i{t��|35?;;;xzz�?3w���<���#22R�gU�k�9k�-�>\r�^Z��ƞg�cԜ�tpp0�1��gc砱�m�.\r�?>|8�������d<��3Z��ְv��b�;}-e���ԯ_?�t����i�&ruu��/\n�j?�n���4j�h���!\"�G��ҥKI.�Sqq�F����4{�lR�TTVVF1114u��z�E111���#\"z����#G���=|�Pg�����L���F�ܹs)>>^o^_}����ty������̙3���D��N�Q�Fѽ{�rrr��Ņ>|��T��*++�W�^�x�b������J��Oh��ZO�[v]����G8<������h׮�ԡC��z��-<:.,,Lg�BA6lʍ��Ԋ�����;��q�B�-[��������3�m�V�q�;v�����gxx�����m��z�={Vg�~�Nzz�U�#�8;�t�ul���֭[4~�x��߄G��ڵ�����ʕ+˼z�*���;�P(t>S�#EŮE��Y���D���>欙b��W�֭[5��γ.1Ǩ9cID���I$\"���l�m�t߈i�9Ǉ��b�l�~�G�\\+++#???Z�p���Ǎ�;w���[�X��$6�DD���Dݻw\'777\Z;v,eeeiĩ�����Dz��\'I&����EFFRAA�V�w�ޥ��hrww\'�9s�09\r�s�EFF�����у^y��{�.M�>�>����2gQ���T*�����[�k׮	uuww������-22�\\]]��/�4�ߥK�(<<��w�N={��E�Ѷm۴6Ɣ]�Çiٲe��SO�T*%�DB}��������K\\��������S�nݨC��P(hƌ���\'���̤�C�R�Νun<�m�FDDׯ_�Q�F�T*%�3g}��&o��j5-X��<==��ɉLǎ�#��B���?��ѣ�K�.B�?��R�T�Kl�t՛��D���r9}�����z��W)((H8�X�=b�c��M��Ƕ��RRR(44��v�J��s��/��b�,�ZMÇ��˗SI�=�qt=R��V�\0\0 \0IDATT�Zd�Ed��[����Ŝ5Sl��l�\Z2O]���������Ǉ<<<hԨQTVV��m����g����6۲��u޾~�:EFF���;���ѳ�>+�aSÔ��5=vD|�uS��/`ذa��?���Ui�~��7���C*�\n�����Fbb\"^�u\0��M���/��&k���1�����Ga�����شiSCW�Q�1cN�<	///lٲ���x��!.\\� ĩ���MISoǌ1Ƙu�F�	�����������UiԢ��p��I���!,,L�uWW�&�NrSoǌ1Ƙu�;�OaӦM�������lܿpss�СC���ok<:�)j��c�1Ƙ�x��c�1�X3�蟣�c�1�3o�c�1�k�x��c�1�X3�}�c�1ƚ!��3�c�1��F�1�c��f�7��1�c�5C��g�1�c��>c�1�c�o�c�1�k�x��c�1�X3�}�c�1ƚ!��7�.]BXX���\Z�*�Fx�3ͣG�\Z�\n�1#�mX��oJKKq��eQ�aӦM�;w�\rj�,Eט3����ە+W0p�@���X�vmCWG���L5t5kx�21x��Gyy9֯_o�����p��\rt�ԩ޸<�R��A��|�5��̘17�-���X�ؽs�~����?�Aaa��������@zz:v�܉�6tutR�� \"�����\"88nnn�������\r�OOO�ȑ#���777��Ġ��H+^qq1^z�%�d2xzzb֬Y(//�V3����z�s���}=JJJ0o޼�����8�ͱM5�y�\Z4������m��X�J�BqqqCW�OeϞ����ǧ�~��ׯ�~�Ν;����_XX��^{\r������Gnn.���1q�D��QQQpqqAnn..\\����̜9��M��j����,kx��c�TYY����l�2��ݻ�~<�\\-Y���>���\0ݺu���˱r�J��u�_�C�\0�i�+V�@NN.^�(�;v������G����ڵ�g�}���T���Y�a�jxβƦ�l�������:���ѽ{w�9��w����i� �����!C���ѣ\Zy�o߾���@\\\\\nd2�|�MTWW�bcc���R�d2�d2�۷_#���(�d2���!\"\"���&�UW�%EEE�������r9���PQQ��Ĵ����9s&<==ѽ{wc�֭�������C~~>ƍ///xyya���\Z�)�J������O��9sPUU��_���q��M�=\Z]�vźu�D�7T����P�\r���3g���U�9s��-;f��ܘ>��ql�1cL?��G]������aaa���Ө[zz:ƌ��ݻC*�\"$$;v��ȧG����Ctt4Ο?���~\Z�ڵCVV.^����hxxx�cǎ����{ｧqy��e�U^^��K�\"00R��۷G߾}���|��w�\\�j&N�8;;�s��\r\r���۵�ڻ7O=��R)�{�n��}��iDDD��������?�I���;�M���cY�V#++!!!\Z����(**�{�G�6m4�nٲ%�t邻w�\na���5j��텰���#44���H{�*,,D@@\0JKK1y�dxzz���G�\0�X���������%K�%V}sH\"����\n�BH	;;;����̙3\0��۷�:��͋�;ֻ^�z��5���,Ӄ����*\Z4h͞=���ʨ���>L�֭#\"\"�JEAAA���Ryy9������;�<yR�G�T���\'EFFRrr2��j�{�.\r0����4�T*�$�J��RQQA����q�F���$�JE�֭����Suu��ʪ����R\\\\=|�����i�֭���E�\'Oֈ+��111���/Sii)��j:w�����������R�$WWW\Z9r$eddQ^^вe˄x������B���DDt��M\Z4h%$$h����C���t��QR��T^^.:�.bǤ����ӧO����Vx||<͝;W�ۘ1�U�1}h��ؔcƘ~[�������ω\'�����z�_�^���ˋ\0Phh(���\0rpp����\\\\\\��:88СC�,RƣG�����g�ՙߠA�hǎ�T*\r��3���#����BY{������θ\0h�رB܃�D\"�/44�***���z�j��F$�8�E�\\����rUU�mۖn޼��Z�^��ԩS��\\Rr��u�FEEEB�رc)11Q+����iƌz�2��u)�J���A�&\"�={��L&�E�������]�Ft��q�����_�w���\\.��4i�����DD4}�tQǵ�yQ�za�1^���5g�nMb��y�f\n���ƍ)$$D+|���4f��o�RI\0(%%E#^BBM�2E#L�iÆ\rZq���w�qQ����_����0�0�2�����,�Y�Xi�\nR�\ZW�>Ҽjݯ�-sɴ���B��&.���^.���[$*�\n*\n*�l���?N3�sfa��ǃ�>�9����|�|�ʉ{���f�k�֭���Ij����bIl���݅�M���,jݺ5ݼyS-=>~����xlLL�\Z5J�<�DB�/�[���{N���ԅ�!�LW]��\Zú�ccbƐqێ�nݺEaaa��k۶m���I���T*��Ã\0���#:t�Ο?O$\0��� �`�n�666�:v�H={���}�\ne/]��._�L��Ѵp�B\"\"��Q]BB�P���7���PBBI�R@3g���*�?���˗��ӧ��ի4�|�L�dϞ=��E�Qrr2EDDh,\Z�J%)\n@�Z��\r6Prr2���B�+V���ۗfϞ���\"�Z�u-�)ϘX�۷/�޽G-�ƍdooO)))B]}��̤#FqS���G�\\��k844Ԡ6���y�z���)j����k�H�B_l\\�.���ĸ*�f�5�45�Gw���������#$$D#}���8u�ڟ��R)BCC��I�R���jKBB^|�E�t///�?śRׁ��o���J-�m۶\Zy����X�n����֯���r�\\-�嗇\"++�o��y\\��j��������p���:�:������e�9K��U3f���!ד*\'\'\'�l�R������ΰ��Fbb\"���\0\0����ҥ�R)�|�M\0����q��1��JKK1j�(ܾ}����c���ޘ3g<==1q�D�Q-S�HII�����ׅ�ǎ�޽{#  \0���\0���8�c��ٯ_?̚5���\"##��7o�\0����ҥK\0�޽{㣏>B�>}�n}z��)჋~~~�0a����?�\\����?ߟ?˖-�(G�׺)��3f��G�Å@D8y�$�M���M�B*����@�P���S�NU{���͛�hccccԣb�O*���F��I$�=Z-���N�\\��ٳg�^C�ת�_5��Ƹ*�f�5�45��~FF��BSUff&���5ҝ��QXX�uk3ceffb�ܹ�3�U_�W�F~~���u��>�j����Y�͚5C����]�v��U���!�Hp��=\0\0�~��!C���\n�L�I�&j-_*�B&���r|ubω9���!�LS��P�9f�Ʈ����W�\n�GGGeΛ7OH�ȸ�q܂`mm�?��SH���s�Ѥ������.|��~���\"%%���\0��P�UfZZ\Z&L�\0�B��m����Q�Wuޮ_�!�u��Uk�UTw\'Q}��K�����y����b�3&�\'N���ӧcܸqpssêU���7ߠI�&�رc��&%%!77Æ\r���7<x �֢E���jSZZ�񌿱��O�/_��u\rBL\\WWӵ�ʔ�k��]�LS��n�jZ�N�Tj�{TSii��׌�T*�j�*᝻�Ҥ���v���vm�v�Z\">>QQQX�j���ѬY3��X\\\\[[[\0���ݻ��w��^@�fͰo�~,Y\"�C]�/������rδ1u\rQ�cfh��z*++3��D�>}�\0��o�4m�}�4�m^y�#>>			�;�U��+\\��[�n���w�ޭ�͚�ݧ��U\0j\rU����_}eTg�8[����?�����~������+�߶���<y2�=�\r6`Μ9\0\0{{{����ȟ�����>����ת�]k�L�q�f�5��5�w�;w�[�n�|���Q�뙙��J�z\'NCt��I�m�6999���B������G�ơC���������<z�����;����X�|9|}}��\0M9��sb��kc�9���14Dm��!�`������������.ۤI�@��ER�z�����R}������ϩ��:�iҤ	֭[�q�����믿Ƈ~���*?����`7n.\\���3Y\'\'\'����L�{�ř�~^���c\n������յ�~Ug�87�<S����<,Z�H빨�����c�ݻw�P����=z�XV]��s\r/>U���ת�]kb�Cc��Y���5�\Z�B?  \0۶m����aô��e����zo�����hl�YU׎;j��G���Z�Y���>���\\\\\\����\Z�RQQ���y\'|||�w����5�͸�^��2�xc�I���:���=RKS*������9gژ:�ژ;��Č��k��Թsg��#G�ܹs��̄����_\\\\6l؀��4;v\'NDbbb�����B�P\0���|ժUHMMELLV�Z\0&סKdd$�߿��� ����8s�>���Ǫ���R)�����Ý;wPRR�.]����\r@��111�x��n�*��Ǐ����X����=g=v�X��h�87�<��_���t ,,L�W�:\"�z�%\'\'1\0���ؿ�Z���B�8qAAA5��6�	ss\r@�6m\0T�%���ӈ��Ł�����/L�q�f\rWW�,��j���V\\\\L�{������ӧO����N�<I�ׯ\'\"���B�����>�L�6�j۰K�.	��ځd���j[SUqqq��Qjj*���\'M�>�\n\n\n���S�AAA���c��Җ�����v�J�-���r*++�o�����s���߻w�BBB())���ʈ�h׮����D7n��h�j�lmmi̘1t��\"\"�x�\"yxx��N�{��S`` ���RQQ��q{�6bΉ��k;�U;�Tm]y��}\n���P�]w9g����14w3�����I���dz��Զ�		�ٺuk������Sغ�j\'���y��a�������ɓ\'�R�6���Z������^ȧ��.hm��n���DD��W_i䳳��S5�v��A�Z��ڮ��\0�mP�����m髍)�zZZ\Z988PQQ������e\"��7oҼy����C떘�����PP�pJKK#\"��O��ҥKI�PPnn��q4k�,*--���B�����\'������.\"������ȑ#ji�1͙3GgYbγ�kHu\'��/\'\'\'�]w�뚮���Cb�:�f�5��5��>Q�I�w��Օ:w�LC���~�Mx����F������D/���p�T1t���~�֭��r\n\n\n���B\"�{k?\'\'\'rvv&ڵk��u��{��U\n�Ν;S�.]�/���[�j,���?..�����cǎ$����W_���]�,mm;w�����L&�.]���ի��=x�@777z��w��ÇI�~��޾�=^1�DL�u��������ONNN4`�\0���Gk֬Q[��?g����1��86&f���e���ԫW/�H$ԵkW���������N�:E���:u�ԉZ�nM4m�4JOO��iap��yz뭷��ɉZ�nMݻw�y��Q^�#!��uT���BC�����k�Ioݺ��2w��M^^^$�HH�PВ%K����&O�L^^^����,X@...Ԯ];���\'O�\\.�X4?~��N:t �DB�z���Rii�Z>�T*,�t1�Z#GGGڴi�A��4l�0Z�|��yWU}{���h�߿?�d2rrr���0����8��Ç4n�8rvv&�\\NӧO���\nڈ�o�v��Я^���L��\Z�}�6\r\'�TJr���ΝK�6mR[���k}�ZM�����نu�2MVD�f�[vv6z�ꥶcc�����P\\\\�T*lϧT*���{@�s��6m��f��7���/������V��<W�k�5�b���tӦM�ٳg�����X8;;���W�\\�����ckFD�|�26n�X�Ma�������e�/�c��ٳg�������n)))������]}7��\">��k�5���ѣG��h����/�)�Y��7��Djj*�<y899a�С�={��6{�����,k�x��c�1Ƙj��3�c�1��}�c�1�,/�c�1��@��g�1�c��B�1�c�1�}�c�1�,/�c�1��@��g�1�c��B�1�c�1�}�c�1�,/�c�1��@��g�1�c��B�B<}������\0!66��ݫ��9��#\"�7R��G��R���&1�\Z0�WY}�~=ظq#>��c�����///��WW***��;�@�P **\n׮]�����Y\r�ɓ\'1x�`lذ999f/��đ��s�s��lق��\\���!--����X�nܸooo���X�zu}7�A��s%�?[�F��_�~=���q��Q����\\���ې�dpqq��3P\\\\��<��[�.���2���***@Df+��\\�~=z�@bb\"RRR��+���W^��f5H)))X�r%���k����ٳ���h(qd�����D���z���������������Zj�:sΝ����\\.���\"\"\"���i�y������m%%%HLL�Ν;q���Z�OW��{Mߟ�ߟ-G�X�?|�������B�v�4^����]��+W� //ӧO�[���-�����s�΅��=�����������nV�ԧOlݺ�\r��<󬬬�y�f���b�֭���6��y��a���õk�j����=wfggc�ԩ�3g222p��5���a̘1&��P����RZZ����:��6�o�b�:�?�/�?[�����	\r\ZWWW$%%�C�j��<y���/acc��-[b�ڵ���Gzz��r�gl��1V�jc��ԩΜ9��C�\0Z�h�+V --\r���Ie?k\nq��E,[�={�l���o�b�:�?3f>\r~�߶m$$$`ٲeh޼������\n\nR{W�U�V���þ}�t�+�8c˯��������r(\n̜9%%%Z�fgg#<<2�NNN\r\rEFF��:����)S���)�=w�\\����=6;;}��E~~>Ə���ǎ\0�X�ݻw�\\.��ŋ��7;;�{�FII	fΜ	�d2|��\Zn��2�(((�������Ν;c���ؼy�F������l<���{�.���;b͚5��C<x�\0�&M�B����3��\'N<�����wo<\r\Z;;;t��\rk֬A׮]aee�Q�F	�$	�����	������p��y\0������`oo/�J3f>��١G�ؾ}�P~tt�p������*�ΝChh(���!�HУG̟?������٢E���6m�:��Ç&���͛71a�����M�6pssäI�p��U�|���F�Ν!�J���;v�O�:U8�,\0\0�ٳWH{��k��c�ҥ�ׯ�R)Z�j�޽{cΜ9HKK�/����8\Z7n._��A��e˖��o0f�t��\rvvvh߾=�����R�wo<^x�H�R����w��ٮ��7}�Xߟu��3352��#G�?�9����5�͟?��M�&�\Z\ZJ+W�4�8���Q*����M3gΤ��\"R*��y�fruu���ǫ�-))�~�����멬��JKKi͚5���ϓR����s��Q�n������)..������ݻ4x�`�����,\"���,R(\Z\ZJ�&\"�={��L&�/���>��3*++�[�n�\\.�S�N\\oVV���PXXmٲ�***��Ç4`�\0ڰa�Q}��2ň���w�y���󩢢�.]�DS�L�\'O���s���Eݺu�q��щ\'�������k���h����R���O?�������(!!������ٳ��@���>���K���@��ȑ#���ڵ#\0�P(���c�\nyϝ;GDD�����R���*�C�\Z�I$���ʯ�u��i\"\":x� I$�y������D������������Q�N�(\'\'���y��!��r��1d�!߁t��u눈�޽{ԡC@...TVVFo��p~222�z~T)�Jz饗�7x�`ڱc��\0\0 \0IDATeee��q���G����lllhʔ)Z������Ǐu��/:��2�jz���|6��0M�~����C�w���E�����}���ٳg|��|�lݺ�<==���B-���?טH���{�0a�F#G���۷�X���D���\Z5j��|YYY@����I�/6�ު:����ң����C}�)������F����\"�D�w<u����k����ד���F�E�Qpp��1Ц�����\0Z�d	����;�Sk��2/]�D���Bڮ]��֭[&�m۶�233�����J%)\n@�Z��\r6Prr2���B�+V�U���1�ܩ*33�F�A.TK7e�T#�=<<��^�J���0JJJ\"����� GGG:t��?�H\0���AX0,_�\\(�o��}��YϏ���!���7���PBBI�R@3g��Vő��\r��;RϞ=�?���˗��ӧ��ի4�|�L�EmϞ=��E�Qrr2EDDh�{]�[M������Ɣ��i����SZZ���m4�mll���x��y,[����������x�7`ee��޶m[��			x��5ҽ��p���\Z��}{�?��D*���F��I$�=Z-���yyyF�+�J\Z\Z������.S�`ݺu(**���!�6//���F�Ք�k��~���h��=\Z�N����o�����ʕ+�r�\n��4ϝ;�{�Ƽy�D��P�ڵÖ-[УG�O?z�\'\'\'�l�RHspp���3���q��)�ß~~~�0a����?�\\����?�W��e��Ye��P(����ԩS�*[;;��}jj*�^M���?�lق����|d�j����@t��R�o��&\0����8z�\0`ƌU���Gaa!�����G�YϏ��ׯߏ;�{�F@@\0<==\0qqq\Zǔ��bԨQ�}�6RRRЯ_?̚5���\"##��7o���ҥK\0�޽{㣏>B�>}�nY��V�?����2�~�~�ߢE���j����j<Kj�qƖ\0�n݂��s�y�dffb�ܹ��dj_�W�F~~��2T~��2�����d�4ib�o�U�6�2׬Y�f͚�{��Ǯ]���1��J�R�d�Zk��233�ư��3\n�m���6uq}�����ҥ���Lemm��{\0Ф��)Vu���t��U���g��1en���$���bذa���ƃ�Vv����P�,�����d�>}�{���GGG����\\F�M\0@�f���g��7ӦMC�֭��Ŕ����.|��~���\"%%���\0��˅����\ZM�4AZZ\Z&L�\0�B��m����Q�Wu�]�~CH�ڵ�Fy��Om��s�h����,�Yִ�`*{{{����H��Ɂ�����[>\04ib��n�.J��V�ޅ2Ղ�{�n|��wx�ЬY3�۷K�,�p����ٮ][�]�������GTTV�Z���x4k���s[_���Km1LD(--^�7����Ѭ��S���`�5�����T�Ȝ}0en�bkk�ɓ\'��ѣذa�̙c����_������?`���HLLĽ{��z�j=zgϞEYY���\0��_S�y׮]�;w��X4�����+F||< �J�^�����>}�\0�\\������ݻ5�ѐx��x3ߟkGC���f�ϲF��~��݅?U�JMME�=L>������Q�?��ԩ���9���b������չЪ\r�Qoc)����G�ơC����#�a깭�s	T�s�[�ni�gffB*�j�Lu��6uq}899���JEE���U7~Յ��I}�6�{1VQ�w=���^������\n߻������mչ�����۵Rv�&M�������HKK���\0��\'~��7�q�4i��gj_��>\0���ˈ�^�rG��џ��X���8?M�4��u�4�www|�������S姟~��ƍÅ����q�!�^��f�?׎�r/��{�%j����`�߿_m{���B�8qAAA&gl�@�D�_��	˰aðc���i���\\�]���캮���Y���\n...x��1\0��m}�K���۶m�H߲e^|�E���Tm����ҥ���\0\0gϞELL.^�(��\\]�6m\0T�#x��i������թO�Ν��9�s��!33>>>���\0���Cll,RRR���[�?v�X��Ø����n՚���BaR��������_~�%������۴iS���\n��\r6 --\rǎ�ĉ���(�5k\n\n\nСC�رCxt��O?EAA��;?�����>�������.�̙3�����B]*����Z�ڹs�JJJ����7C���v4�{i}��,R�~����}�?  �f͚E���TXXH4q�D�<ڶs�!��+++��]�ҢE����������o��h|�����<==i���TPP@D���\n\n�G��XOZZ\Z988PQQ���@xx8EDD�ӧO��r˵��@ruu����\Z����R�M����5���?�9s�?��WW�7oV����������du��ݣ��JJJ���2\"\"ڵk7999э7�H�������6�⨰��<==��>�ګ���ҥK��@���>���+��۴i�u��W������uG5��>����%\"���dz����		!\"�;vP�V��nw�����ج�sgLL\r���4\"\"z��)-]��\n���\Z\\��>���:�������r\"���֭[k�׳gOR*�\'�U��`�!m޼yDd��S������<<<����i��.h��;���D�=����>��{]Ǜ������gc�44&�U��}����{��������h۶-V�Z���ڵk\Z� �9ΐ|�5m�{������\n�L�=z�ɓ\'�׿���������rssѭ[7�d2̘1���@۶mj�G�P��_����l�\0����R������ݱm[6oތ��\0�cn�Qo}�����k��U;v,f͚ggg���`ժ�\'��۔s[[��F[�l����)�ì+�c�֭�Ō�6uu}̚5,���ڵk�]�Vk�e˖!(h8�R)�r9�Ν�%K��BQ�����ףW�^�H$�ڵ+\\\\\\�T*1j�(�߿ÇG� �HЫW/,\\�{��Q�����йs���\r\rAXX�r9<<<����#G�@\"�\\��>�^�\Z˖-��S�x�����g�_�5���/x���ѩS\'�n�\Z�6m\Z��ك��Ra�[[[L�>@�q�ڽv�Zܸq�l秺o��C�E��������0e��;�T�ի6m�///H$(\n,Y�����<y2����G��ǻ����٣�����7]����gcʬ͘�$VD�1f�ty�7���/���g}7��џ�)lm8r�H�ܹ��[d8K�MK�III(..�T*�N�T\"::\Z����g�7m�T�ͬѳr�X��1)N��u���BD�|�26n�X�MaL�%Ħ%�A�iӦ��ٳpuuEll,���QTT$���r���Y:W�q�����鐒�ooo����wSSc	�i	}+<<gϞEzz��ۏ*GG����t�X��1)?��{����bŊ�s�\\]]��\'��w���۸q#~��G����ɓ\'��������ٳg�m��c��}�c�1�,�E��c�1�S�}�c�1�,/�c�1��@��g�1�c��B�1�c�1�}�c�1�,/�c�1��@��g�1�c��B�1�c�1�}�c�1�,/�c�1��@����q}7�1�c��za�������x���j�|\"¸q� �J1z�h(��Z��կ�O��wc�1ƌfQ���r|������Ν;q��q���/f��Ν;زerss���4���Xܸq���x��7�z���n�٤����˫���X�`��\0c�5v�����1w�\\���#  \0۶mðaÌ.�������������B���#���!�H��[o�����o�JJJ�����;w����������\0�y��ׯ���=�=j�kU�\\\'\'\'DDD \'\'G#_nn.�~�m�d2���`ƌ(..6k_,����U��y�1�\Z;�Z臄�`��Ÿt�kkk�˛7o���0\\�vMH�����͛�����[��TGm+--Ennn}7�����C���\"**\n�ڵ�����lL�:s��AFF�]�;;;�3F#oxx8p��5\\�ryyy�>}���e)t����1�l�������͛�L��\0����x�\"�-[��={���Ǐ�`РApuuERR:t� ��:u�3g�`�С\0�-Z`ŊHKK�_�%�;y�$222��_���-[��ڵk������(�S<0�k��7ob	pqqA�6m���I�&��իj��Ν;C*����;v�P����+++����~@߾}Ѷm[���111B>�D���h�g�|�r���5�3fv�܉�����Grr2�;������^^^8}��Z�Ν;���P8;;C\"��G��?���c�ҥ�ׯ�R)Z�j�޽{cΜ9HKK>�Pվq������4hZ�l�o��cƌA�n�`gg�������۷oרk��x����J��ׯv�ޭ�]����3f��fj�߼y())�z\\VV�L�OOO��r(\n̝;����ohy�>}:\\\\\\йsg8P�mڶm���,[�͛7��6-Z�P��iӦ�С>|(����#((H�/Q�Z�������g�1�.;;}��E~~>Ə���ǎ\0�X�ݻw�\\.��ŋ��SC�ﯿ�¸q� �˅��?�������۷o���)++Cǎaee+++�GBCC��s���nU�>0�35p>$�\\N\04��\"�;p�\0�k�Nk�u��	�\\]]	\0���i䳱����\"\"�e�>}Z��T�Q���=��sjǹ��k����AJ����<H�Dk�~~~TRR�u|�J%���KZ�<x0�ر���������G���B��L���x[[[:~��P�޽�dkk�5/\0\Z9r��א�����ʕ+u��ѣG�K�.\Z�+W����0�����S\\\\����ݻwi�����*�Ν�nݺU^DD���;���Ot��%�2e\n=y�Do�DD��#G��zM����=�N�:QNN��6r�H�����;�|�6mZ�m3vL���H�PPhh(>|������K2�������Ϩ���nݺEr��N�:Ucy�gΜ!����C������z����0!}���B�Us������Ve	�\0c�1�k������NW�^��RXX%%%Q�M��Ã\0���#:t�Ο?O�U���\0�8q\"]�|�>��C!-  ���nݺ�vs޶meffRyy�Z9��\0hҤIt��y�ܹ��\r��ŋ��\0ݸq��J%)\n@�Z��\r6Prr2���B�+Vh���!���7���PBBI�R@3g��h���\r��;RϞ=�?���˗��ӧ��ի4�|�LՅ_Ϟ=��E�Qrr2EDDh��\r�O߾}i���:c@�T���3%\'\'���֭[�����\Z5j��|��b�sww��0d�_��eff҈#h�j�>>>�{���QQQ\Z\Zjp{ŌiVVШ��Ã\"##��\"##i������1�W��t�R�|�2EGG�o.s�lٲEH�3g]�~]H���|���c�����w�n\n�����{�5�:y��;33�233iɒ%Bz���&\'�H�uqq1�n�ZX�WTTѤI�����7�:kZ�k׎��������W(��͛DD4z�h!�ܹst��q�砠 ��ӧO����Z�gժUB�wv���\0999i�\0�\Z5���˅�(��s玐o���DD��\ni�{��^�rE�oJt�������?�Ϗ=�:Paa�A����U�؅���ƎK\'N4�mUY��ҿ����1c������^0`\0���/\ZǬ]�����\rn��1���R�V�8P�?���6�!񗔔��@֥���:m�ϣG��M�6�^z�%\"\"����|{���y�1Ƙ�5�g􃃇#00@峞#FC&�a���¶����GGGC&�A&�a޼yBzF�M�r�4i\"<�ܼysH�R\0�;���fkkk�yj+++!�e˖BݪTw�P� q�.]Uڟ��.www�����#77)))HMMU������\ZM�4AZZ\Z&L�\0�B��m����Q�G�����oi]�v�(�\\��%$$������������m��0d����B&�aҤ�Fo�)��5k֢Y�f�޽;��ñk׮:ߪ3))	���6l�������-Z���T���R�g��3���C�����BZ��ݍ�O��Ӷmx{{\0.\\�\0�R���D\0����\r{���cf���M�4A||<6n܈aÆ�U�V�w�V�^�!C����eee&ף�a�f͚�\\��u�.�TIе��+�����`\0@BB�R)���+�4u�T�c$	���\0�u������ׯ�ɓ\'Z�i֬�޶��?����K���Bff&����9��c,X�+V��/��իW������\r�kLy�ڵ�ڵkq���9QQQ0K�\Z����\'O�/��\r�n���=rr�k���Ɂ��C�e�{Lk�!�WQQ!�5m�w��%���#F\0�|3�����ТE�c��]�_����w�}DZZ\Z\0���?��o����5i�$P�#Ij_������߿/�J\"�Ʉw5Uo�����j��]�.|����𽫫��c�4i�u��i,�������_��?�zL��~�	w��\0�7.\\@rr��1NNN��U�m@}�d���bmm���@�޽J�Ǐ�k��^�1���X�|9|}}��˛�����b���8t�rrr��^R���p��m���ݻ�ҥK\Z�RSSѣG�\Z�2���C�����5��k]s���\0^��x=|���n{����c����999���Ǘ_~�?��C�|6m�������\0���8lذiii8v�&N�(��\\U~~>�.]�K�.��?�z�t��Y��ȑ�8w����\\|||��?�bcc�������B��c��<>22���GPPRRRp���9s|��޺Uo�R����j[,޹s%%%�ҥ���\0\0gϞELL.^��9s昽?����`�޽8~�8z�ꅶm�Ԙ���\\x$��������򬬬���Ǐ]�D�R������B!�������-,,ĉ\'Tc���`H����\ncs��I�Z�\n��������U�������P�&\0\0��=\n\n\n`cc#,���y��͛x�����舝;w�m/c�1���Fx��w�nU����>P�k�n��տz��)|�L��hտ:t�@7n��NNN��&3$$D�m�UM��0\0�C�cǎU�0.ю;�U�VZ����rU�������A��}��p��qS�Y#11������+�|vvv��n�gH�����ٳg��BYY9;;ӤI��nY]xx8EDD�ӧO��r[���@ruu����\Z�MKK#***>�-��{��QHH%%%QYYUƦ���Zl����5cbb((h8����ӧOi�ҥ�P((77W����\0�5k���Raa!EDD�ĉ��M�V��Ӕ�V/KL��ֺ���-�<y��t��\\?DD�~��Z�A����\Z�<���_��3�3���/**�e˖�/�@R��$	��Ջ����O�2�ʩS����_�N�:Q�֭��Ã�M�F���B՛��ի��ӓ�R)\r:������7o�L�z�\"�DB]�v�?�����;�\'�ܥb���ԡC��.����\Z�(%%��J�۷�zC�ڂR[��*�^^^$�HH�PВ%K����&O�L^^^�B����,X@...Ԯ];���\'O\n{����\r�T*~��g	ԦM�}�uy�����������ѻ�K>���H���o�F����i�&�ʋ��#???�ر#��rz��W����?\"Ӷ׌�������L&#\'\'\'\n���L�r>|H�ƍ#ggg���4}�ta�^�cP�]�,���%6^��Ο?Oo��999Q�֭�{��4o�<��{$��5��~��Q�6?��S�ڭ�1����ԧO�ܹ3�ر��~2�ϊ�m�Q��ܐ���T��Ic������bH�Rxzz\0�J%�����{��|�vӦM���\Z���x�����So���}X�f5���[���X\0\0 \0IDAT-c\r�!�򬰄y�1Ƙ���kP�M���g�������pvvFQQ�\\�\"䱷���֌�p��elܸQo���R,Y��|�I��5D��˳����1�j/����p�={�������x��ѱA�󙒒ooo���՘�̙3��O������J��54b��Y����c��{tg	��������?�j�6n܈����x��	lll��䄡C�b���j[�5FD�ѣGcܸqz��g�Ye��\0c�1�=s}�c�1ƞ\r~}�c�1Ƙ�x��c�1Ƙ�>c�1�c���1�c�Y ^�3�c�1f�x��c�1Ƙ�>c�1�c���1�c�Y ^�3�c�1f�x��c�1Ƙ�>c�1�c���1�c�Y ^�3�c�1f�x��c�1Ƙ�>c�1�c���1�c�Y ^�3�c�1f�x��c�1Ƙ�>c�1�c���1�c�Y ^�3�c�1f�x��c�1Ƙ�>c�1�c���1�c�Y ^�3�c�1f�x��c�1Ƙ�>c�1�c���1�c�Y ^�3�c�1f�x��c�1Ƙ�>c�1�c���1�c�Y ^�3�c�1f�x��c�1Ƙ�>c�1�c���1�c�Y ^�3�c�1f�x�_G�����w�^}7�1VG�^�\n�5�*�[�g옳�O׹}���F^miL;���X�oܸ�q����I<6l@NNN��]�}g�Y�����ׯ��9\Z��J}�-���1�TӃЯ_�Y��s���///�|�Ҙv<V�S�[���KpvvFEE��c\n\n\n���U���-%%+W���_�_�={����k���ׯ���=�=�3Obb\"!����䄈������\\���ې�dpqq��3P\\\\l�6�6c����4V���X�n]}7��xyy�Ν;����t�Y[ޚ���R[�2&����4Teee���l��i;� \"�|���Jc���s���\Z�B�����믿о}{�<y���#J�>}�u�V\Z4���b>Dhh(���Ю];�����1u�T̙3�v�\Z���0f������ppp��k�p�����a����C���Ә�������w}7�N��ϖ6�Tyc�=�8�Y]hZ�\r0��ݻ���www�ܹ~~~�ݤg���O0h� �9�7o�СCu��ԩΜ9�-Z\0\0Z�h�+V������v�\n��у��������\Z666X�v-\n������j�~�m[c�c�1Ƙ6���]�v!((ÇǾ}������ADD�r9\nfΜ����y����L\'\'\'���\"##C#O߾}����������=z���c�\0\0+V�@���!�˱x�b�c���0e�xzz\n�;w.�����`���pqqA�Ν1p�@l޼���1w߫k۶\r�l�24o�\\o{��U�6m�:��ÇBZ||<���`mm-��j�\n~~~:�q��kl��?����ӧ2220j�(��������ϯ�ϥ�Ĩb�Әx�2e\n���|�d2�d2�۷_(����ݻw1|�pt��k֬}γ��ѻwo���`�̙����L&�|\0�RiP�L���l�G����#$u9�<z������ѹsg\"99Yx����4i\n���1d��8q¨v�4>U则���Yۘ�ͥb�o�/v>0$L��������^W\\�p���ԡ/�\0����g���̙35��un�kƎ��XW�͘1|0S#��͛ppp���րQ#����H$t��]*//��;Rrr�Z�RI���4s�L***\"�RI�7o&WWW\Z?~�Zޒ��ׯ�_����ʨ���֬YC�?�<)�J!_VV)\n\n\r\r�Çў={I&��_|A�}����ѭ[�H.�өS��c���)..������ݻ4x�`���RkKDD���;���Ot��%�2e\n=y�D���F��<x09rD�944�V�\\�3^�#�ԩ���i#G����h����ϧiӦ�X���C[��?YYY���H���Bl���S߾}iٲe5gl���/>M����,�J�Zӻu�F�ƍ�\'NPEE�>�YYY���Baaa�e������ҀhÆ\r�ϔ��ֿ���-o]��6���4x�`�5kRyy9>|�֬YCDD������E�~�)QBB9;;�ٳg�j���1d�6�.C�R��7f�;�Ē�6�iӆ^�u�r�\n]�|��u�F�~���m�oU����������q�F��U?��Ν�nݺ�M3$�L�>�źظ���ѣԥK���+WRXX���ĶW�X����,��l�B�\r~;v,-X�@-�֭[��ӓ***��?��s�	��￧	&h�3r�Hھ}��sVV�ݻ��������H����HZ�xq������Q�F�������ӧk<N���>��}���ٳgk͛��I#F��������h�-QTT����nKm㫏���u����u��t��M����}���^�q����ŧ)�TӢW\"��j��s^5&qqqj�QQQ\Zm��?S����\Z]e���O���ׯ\'___��E�Qpp�Q��5>�����e�\\*�������D�c��X����o�VKߺu+yxx\\��x�unW�\\)�܊]�k�^��b]l\\U�T*���Y�MЀ�\0ںu��6�k//��F����ݻ ���{���9p�\0�x�\rXYY���m�V�������\Z�^^^�x�Z�T*�k��PK�H$=z�Z������j�G��\Z��0\0�֭CQQQ��֤��n����cٲe\Z��B����-�N���Zii)�7��8���ƨ�z��oMjj[}����r�\\-�嗇\"++�o��y�9c�:}�Y[񔗗���p��t�s�T���P����s�����SW�M||<���t���~���h��=\Z�N�R�ӿ)�\0����ː�Tl���㍝tł��������jiÇGZZZ��i�C_��ϭ���Y�;Cb�6�Ԑ�JU�&M�]�v	i�?Arr2���E�mL{Y��(�%%%8|��Z�>W�\\Azz��v��-8;;�*333s������Z�z5�����n\"�?��!C����2��&M�x�z͚�h֬�w���p�ڵ��-�\ZZ�U%%%!77Æ\r���7<x �֢E���jSZZ��L|ub��ض�uti޼9$I��C$}�Y[�$�J!�����q�\r�_}��q�&##Cc��*33S������B���_W�s����3ƪ���B]Œ��-���q��]���ouŐX��15�\n		A||��������닖-[�<���V?\Z�B����hѢ���/�988�O�>��矅�&M�5ޅ�E�TbժU���T�����W_}e�v/X�\0+V��_|��W�\"33��4�k�k׮ŕ+W0r�HDEE!  \0eee��jh}�����\'O�/��\r�{{{����ȟ���\Z�;�ƶ͘cL�OM���akkk����uO�:��q�յ�m***�>X^�R��:�JKKE�Ib�U�:��鿹cLu>05j+�***�ť�:��[]15�LSS���^z	YYY������ȑ#k���ak�]�~Fnn.��� �H��K�.a���B>\'\'G��ФS�NHMM��&\0bcc�|�r����Y�fz����b���8t�rrr�}�v�u5�������\'��ݻ�ҥK\Z�RSSѣG�\Z�2t|\rm�1ǘ�]=z���\\��2�]�Y��d�s�ʔ믮��8��ܹ3nݺ��uGGG��gffB*����muug�̥���1V}>05j#���򐛛+��-�}�VWL�5S�Ԕ����\Z���ؽ{7�J%�?��^{�V��\Z��Я���/����[㐗���u��i$%%����wP����nax��5��aÆaǎ������rH�R�����?~aee<~�Xt]\r��D�u����d(\n����`�߿_-oaa!N�8����\Z�0v|Ŷ͘cL�P������?�O���_]��4%�lllDo��\ra��gC��M]�P�Y�m۶�|}ذaZ_߲e^|�E4ib�-F���ż>�\Z��1&f>05L=^�Tj<βs�N��E�֡/�ꊩ�&��5ź)�UHH��݋�Ǐ�W�^h۶�Y��\Z������\0�W_}E�5OOOt��{��\0�;X�x1�J%�����w�����8vʔ)x��)f̘���B\0��>|8?~b�����X�|�0Q����O?��۷o̼�>BCCq��Y�6�w��ٳg�ꫯ\0�����?���������zQQQ\0�~�����ps,..Ɨ_~���T�����1��\\.ǜ9sPVV���\"DFF\"((nnn5�\'f|�۶��P�,���+��x��%,Z��f���.S�+KL|�OR��ڵáC�\0\0��W���=�����6�]&M��\'O���O>Aqq1��N�Btt4\0`������������Ϧ���\r6�?���Qu�\Z������R1�7%����Ƃ��[YYa���£\"/^ĢE�0{�l���o�jݺ5rss���Sa�-��X�_]�n�u5l�0\\�r�6m¨Q���^mc�\Z��������o�iS���w�ر�\'̛6m�={���_�L&C�=�����_��8������rssѭ[7�d2̘1�����ۯXQQQP*�������;�m���͛ L\\;v,f͚ggg���`ժ�\'����_�?:j}�v�������#44aaa������@rr2�9�D�vܖ-[p��=������m۶ŪU���\'f|�۶��P�a޹s�b��ѐ��		�̙3��ojm����%&>M��5k�`ƌpqq�̙3kܙ��snJ�j�!}����K���q��Addd���NNN�?>�t�\0hٲ%8�?�{�U�����U4�H� ��h�x�Kꦩ+]4	�Rj�Ʈ�~e�Z�~ӶV�H$�+�6ܼV*j^6�T4/���R@AE�\"�����2��a�9����|������3og\'N(��g��9X�re�oU,�OC���Υj�o�\ZSs>�w-ػ����x�\r<�����Edd$^}�U<��S6�Q�z�W`` �\r��� ,_��j��k͖1����=��5k��ÇcժUx�ɚo۱%^KcE����ײF逸�°a����١P=���C���U=�������Gz�F���7{9�{\Z��{���رc���sv(DDD�ȕ���f㥗^rv(�0�o�>�����C������\Z�}����\'�Dxxo<���g��c��wj4�������aPhժ5��yg�AD�\0�d+�G}����Z��O�ޣODDDD�A�u�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL���ԩS<x0JJJ꽭��R$\'\'CD꽭�Ζq����.]�K�.�5L\"\"�j��(�_�K��Z,^�����IYQQ~������k;iii�Ν;q��5���l���Ѯ]�0`�\0,Z������J��,�CH�\Z�=��Ö�l,����D�������5)ǅp����[;K�.EFF6mڄ+V@��9�-Wei���ʰ`�U��������O�����C�n�7QC�t�j̬�ZU_�m��(K�9�Ґ��e.�9���Aw0�o�&N��O?��;wvv(��իW��o�]O�=�r�J<������j�c�Uh��Z�\Z�j��51�\'\"\"\"\"� �H�������\"L�8~~~\r\rŎ;\0\0s��EHH|}}1{�l������`0���������2�.??qqq���E`` �M��[�nY��ҟѮ\\����x���C��?���vrss�����]�*�Ϙ1VǯJqq1�L�???xzz�o߾HKK��XY�f_{����HHH@߾}QTT��\0����7Y���<���/^��ѣѱcG����Ӽ�<<��C�u��M���� ����0\Z����n׮]ǋ/����\0xzzbԨQ���T^W���=>Ԯۻ:t!!!f�3f�0��e��2?=z�@VVƎ���c�̙ff���S�N��/O3��ܹs���P�׺��=�1��bK���E�Ƿ�����Uۖ��Yuj��{㩩�j�#�a�;\Z�Z��hC�ۖs��|��瀺΅-qؓ_�����J``�DFF����EDd��\rb0���ߗw�}Wn߾-999���+�w�V��u����K.\\(�oߖ��rIII��={��hT�3\Z�ҿ�6m�ܼyS�F��������L�8�,�^oRV^^.������oKYY���l޼Y|||d���k���HV�Z%EEE\"\"r��E0`�$%%�:�qqq��s�IQQ�TVV�ѣG%!!Anܸa�XY�v_{���xX*�i���`����~�A*++���L����抟��DGG���˥��R\n\n\n�O�>�hѢچ�LEE�0@�O�.%%%RQQ!۷o���Q���S�mXr��A	6+��W���_wظ�2?^^^2j�(�����g�JXX�|��G6���o��.]�����\'�Htt��z��%��C��X�Z���V;�֎]�m�v>���9��Q�X��㨡�;\Z�Z���hC��޶��P���%{����$�\0dݺ�&�AAA���hR���(�g�V~��?�)�\'O6�s̘1�f�\Z��+WJ׮]����d���{O�It�2h� �vf͚%kǒ%K��رck�.  @���k�u�ceϾ�̥#}�NgR�5�ƴ*�U�V��\'%%Y컚6z��e�u�kʞ1Uۆ%�$��7��Ӷm[9w�Iyz�F	P~V�g��(>>>�/UF�)+W�T]��}�Ės��k[���j��ڱ�����gwS3��8*{��z�h�sh��ϣ\r�o{۪�s@]�8��/�>.q�\0��z<���&e:�QQQ&e:t�իW��7oތ�C����#G�(?oٲO=����L�k׮���6mڄq�ƙ�GEEa���ʟG�mǒ�@AAA�����,�͛7-��v��ݷ�s�W�^ELLL��YS�^���H���ę�����h���]SU1�eLmi��7����h����&eÆ=���\\�?��>7i���믕ׯ_����LDDD���}��-��1ֶm=��k�m�v>���9m�xlՐ��u-q�y�!�mo[�q��\\��=���e�����ƌ3�{骾�ϟ���\"e�������Վ��}||PRR�<���vD˖-Ð!C���������U�C����мys��� &&_���~j��{�mHz����̞1�GVV�YRZ��5e��h�^��O˖-��������ƍCzz����M1h� �n�ڦz�\'[�!jcT���V�Vm�3Kj�ӆ���|�UC�Yc8�Vo�!���8�e.l��r-j��\0��hDrr2�~��\Z�kҤ��o���ciAyy�����[X�n�͛�~���y��ظq>���C�wk߾>��3��� ==IIIHNNFzz:�7o�z�,�g_g�gL�QYY��M�Z}]횲GC�a/G�OYY�������~�;���\";;����3f���=cgO�l9���Q�Zl��[m[���,�mN:[8��V\r9f��<Z���8N��P���5W�\\���w��	\'O��u;oo/������rrr�ʳ���������v�.]�9s�`РAu~�pwwGTT�mۆ��|�Y�����Ğ}��cZ����L�k�\rц�읟k׮���P���M�6ŨQ��n�:�F|���x�\'���;{�d�9Dm���ņ<�mm���̒�洡�Ecx�P�!Ǭ1�G�4�qR�*�̅-q�r���4��>k׮��OP��ƍ��Ϝ9���իW��/_�C�E�&M�NEE�z�I��˗T�{7777�������\0ԏ�%��k�-Z��іU9��9r��5SE횲�=m�t:\\�vͤ�h4b�Νv�U�-�SYY���2�����T�����q��aÆ\r����ѽ{w�kw��=cgϚ���6F5k��Ƿ�c��m�}>���9��Q�X���1�wTq�V���m��8�M�\\�\Z�3r�������b�ԩ())p�ţG����7��&L����b̞=F��7o��٣��^x���x��P^^\0ذ!�-�;��v��9s�(�Lz�F�X��ϟGii���._����H�߿_��ͺu��~�1¦��Ğ}���Ѿ}{l۶\r\0���\Za��\0\0 \0IDAT?�\\G]Ǵ&_|�8P�6���q��|�M���AD�{�n���P���aO�m۶��ŋ�y���>ooo��VŖ�)//ǤI���LG�ŬY�0}�te[�<|�p?~��9Ǝk�=cgϚ���6���b}�֎]5m�9�YSӜZ�x��W�q������6��=�vG��z<���r��<G�ң����+���L�^�uy��WM�rrr$::Z������G(_�ά�S�N�ȑ#���S�t�\"����\\�R���Ο?/������#������N222�Ε+W��t��Y&M�$���(�~��Y[խZ�Jy��ر����ʈ#dϞ=u\Z+K��k�\\Z�wӦM,�������^JJJlz��1��ZZ��3ƤL��˸q�̶�ۥK�������G}Tv�ܩ��fM�{|�]���ٳGz��-���ҧOIO�()))f��T;n��:?����`�.]������괥ϓ\'O���O����.}�F�9Ėk[������ұ��-5�3kj�SK����9�D\Z潣1�ac8��G�mi�ڶ�>��x�%{��;7���ўz�)6��_��=#//ݻwǕ+WZoz�F���ǆ\rZ/9��5�<Jd?�ߺC��DǎC\\\\��C!;����f㥗^rv(� �S���(�c0�\'r�Ç����С��C!;�۷O>�$��{��sv8�\0�S���(�c��\"҄k׮c֬����]�� **\n����>g�\\甈�EL􉈈��4���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��~#WZZ����N�:�������١8Uc�Ƹ^������t��x�b�������>|��ᵖ5EEE��_������Cc]/DDDT��9;\0{#77��aԛ��J�H�e�Axx8.\\���0����Cc]/DDDT�\\��>Y�D�����H�\\&����G\\\\|}}�iӦ�֭[����CLL������,�m���1e�������}��EZZ��znn.еkW��3f���¬��={��ŋ=z4:v숔��Z_�r�\n���2?��C�ǧ�����G�����رc���̜9�䖏��+//���Y�׮]ǋ/����\0xzzbԨQ��̴9n5s������0a�ĉ���Chh(v��\0�;w.BBB���ٳg�ykꓵqPSw^^z�!ܺuӦMCPP^~�e�F�mծO\"\"\"���0\Z�ҿ�6m�ܼyS�F��������L�8�d�[�nI�^�d�r��m)//����ٳ��Fe���8y�礨�H*++��ѣ��� 7n����\"Y�j����ŋe�����d�^nn�Kll����RYY)eee5�V^^.������o+�n޼Y|||d���J����`��,���ϒ��\\���Q�FIff����={V���䣏>R=^������Mꮨ�����ӥ��D***d��풒�bS�j�477W%22R�o�.\"\"��o�� ������r��m���___ٽ{��cX[�,��ںsss���O���e���RYY)ҧOY�h�I�jק��BDDD��H�W�\\)]�v���J����{�,���?�)�\'O6�c̘1�f�\Z�瀀\0ٻw�Mq,Y�DƎkR���+:�NfϞm����.\\(�\r2�~֬Y���6�W[�%���Ҷm[9w�Iyz�F	P~�m�,%�K�,�^�zY�Gm�j�477W\0Ⱥu�M�\n\n���D����D�yQKm}�4j뮊ժU&�%%%Y���,�O&�DDD�.��ug˖-xꩧ���fRޮ];�m7oތ�C�������ȑ#��}����p��M�q<��\n\n\n�ʯ^������XzmӦM7n�ٶQQQؽ{�ͷ_�[_�-���kR6lأ��������m����mw�j�\0�z=�x�q�2�N���(��:��ի6�R[�,�e~�z=\"##��T=Vk��O\"\"\"�7�D����U�fggcƌ0&_���GQQ��]J�gh޼9BBB������t��e�0d�����`0 >�y��*���0��Zvv��������������Z_�@˖-���p��%\0���%YYYf�@�%n�sj����\'{궅-듈���M.��&M��]ͷ�h4\"99O?�t�۵o��}�JJJ������$$\'\'#==͛7�[o��u��a޼y�ׯ�7o��7��?�i+��h�?\"���r�}����������@��eIee%�6mjw�j��jc��O��m��\\�DDD�\r.qE���K�?��ԩN�<��nwwwDEEa۶m���ǚ5k\0\0K�.Ŝ9s0h� ��l]yyy!\'\'Ǭ<;;z�N���d���B�+����OOO�q�\Z��sZjc��O��m��\\�DDD�\r.��<7n4+?s�Y���ñv�Z�oapss����_�\0����^�7����K6�i���ñz�j���˗c�Сh�Ķi�����J�����}�՗8p�rE�nw��%#G����q�uNm�6���dOݶ���IDDD�����	P\\\\�ٳg�h4������Þ={̶MHH@ii)�N����\0��C�0z�h\\�~\0p��eDFFb����!׭[����cĈ\0��C�bΜ9J���+V�����QZZjW^x����Cyy9\0`Æt,Z���]۶mQXX���R%ɵT��>k���1i�$�&G�ŬY�0}�t��eI||<nܸ�7�|eee�޽���6ŭfN�6���dOݶP�>-��g�yIIIuj����\\�K$�͚5������w��`0 447n��+��b����;���\"88�S�NEb�Ѯ�}\0\0L�0ӧO��������<�V����?\0 ))	F�AAA��ի�����#G֘ԩѺuklٲ\'N�P���ܹs�r�J���*�bذa\n\n���˭���Ϛ���7�1c������q��aڴi�=�j�˒�-[b�֭���B׮]��퍙3g�K�.6ŭfN�6���dOݶP�>-��3g��|��7�c:�iyyy�޽;�\\���P����ȁ\\�>ن�>�1ѿǵj�\Z�?���� \"\"\"\"�=�DDDDD\Z�+�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL����R$\'\'CD��MJKK��ѩS�0x�`���8;��k�DK�.ťK��)2��3ע�r�{S}�\r�=�oL��Y�x1^�u��������0�ܹ׮]kж�q��a���;�>jXEEE��_4��Z]��k�.0\0�-B~~~=FG�4�Z�t����c�0x�`����K�.����56rG�7�����9�\Z�J�O�<�������{�Fjj���/..Fnn���S��ҥK����M�6aŊ��t\rֶ�*++]�/�_���p���~g�b���2,X�����>>|�|�	>��c|��w�֭��C�kc�\r�-�����/��g�EVV233���O�kluU�����T�벡�=�Ƚ�e�={� \"\"#F�����q��y,]�[�lAvv��ó�ĉ�駟�s�����e\\�zo�������+W���?쀨��Qc�*�?�1c�\0\0Z�n���@\'Gdٽ6/d;��{W3g�ƭ[���/��O����Jyhh(V�X��Ȉ�H����Ѭ�K�M�������{����+W����쐈.qEݺu��t&I�%���HHH@׮]�����@̘1f����#..N�nڴi�u�]uZ�����<�?�5T�U�����`0���������R���쉻��S�L���<==ѷo_����k^^���PTT��\'������رc\0`�ܹ		���/fϞ]�������C�֭[�6m\Z���`0���/�h46�1��Һ�g����УGdeea�ر������?fΜi�gt[ƸgϞ�x�\"F���;\"%%			�۷/���`0`0�q�\Z�d�{��СC		1+�1c�ɕ��Z\'���k\Z�������5g��n���^��`@II	z�!|��\'��լG̋Z׮]ǋ/����\0xzzbԨQ���T^�r�\n���2?��C��UG����u	\0�-BXX:uꄖ-[��êU�����r~�T���j�������oԺ]QQ��Z�J���DD��ŋ2`�\0IJJ2��h4J���eڴir��M1\Z����&���2q��:�i�-����^�wJ۷nݒ^�z�����R^^.)))ҳgO1\Z�5�s��A	vX�qqq��s�IQQ�TVV�ѣG%!!AnܸaS����(����}�vY�~�y�����wߕ۷oKNN������ݻm�?77W���$::Z�/_.���RPP }���E�5�1��Һ�g�rss���KF�\Z%���\"\"r��Y	��>��Nc,�����?Hee����Y���>Y�Ǟy���ED^}�Uy���M�n�u�Pk�Ҙ�r\\�2��<������Kaa�C�j��j׍��FEE�0@�O�.%%%RQQ!۷o���)//���py��9ݼy����������/K�����y��ί��vѢEҧO9{��������.�~�m��[:?�]���j�\\\"�1b�����i�%K��رcM�V�\\)]�v���J����{��\r@m���Ҏ���!���?�)�\'O6�c̘1�f͚\Z�Q{2Uw@@��ݻ���jc���\0�n�z�킂�$11Ѥ,11QfϞms�Um�Z�ʤ<))�b�j��Qcb�����c���+m۶�s�Ιl���Qj����t:��ck�o�5qXb�yC���Z��ܖ����T�%�8�ZJ����05���yQcɒ%ҫW/��/\\�P\r\ZdV>k�,���0�՞�Am�Ծ7�v~�4��z��-[����X�B�^k�j}W]#�8�ĭ;ׯ_G�V���x�����l˖-xꩧ���fRޮ]�:�i���4Tۛ7o�СC�����q�ȑ:�Z�ڸ�����͛_�%V�^�\'�xܤL��!**ʤ�C��z�j��������4+����꼛#�D-{ƮE����5)6�Q�������V۴6W�^ELL��]�s=j��\r�N���5o�-k���t���������nlm�6��鈎�����M�0n�8��(�޽��v+{����]m�WK���`R��]\\u�P���2j׮nܸQ�v\"���_HMMEvv6�F#n߾��� ��rrrЫW/Um���[�qf���٘1c��׿��WTT��\rٞ�SR>�k��@HH������\'�Tެ��㯏:Øثe˖��t�t����m\Z�^��`w�꩏����ⱷ][֠-����5���!�WG�����g�y�ƶ|||��}||PRR���|t��ɦ6�������jIǎq���&O����r�\\w�P�����`����Z�vo��֭[�y��_�~h޼96n܄>0��Y�&Mk<��R�%���̶�F#�����h{�n߾>��3��� ==IIIHNNFzz:�7o��X}�����������~Ƹ.\ZKΎ��v�k\r:��k��}m��ՑmUVV�iӦ5�ei�E����G�_m�WK�O��7�x>>�\r\rEff&�}�]��ו��j�\\�֝�Çc���n�t�R̙3�\r�z������\Z��N{�qf۝:u�ɓ\'��E��]���QQQضm���f͚z��G�_u:sL�u��u*W��c�뢱���x�m��֠3Ͽ���׆<^ٖ��\'rrr�����e����l��zxxx8$��\Z?k�WK&O�???L�8�:u*�y��.��U�5N.��3���X�vm��UTT@�כ�]�|�l���c�ƍf�gΜ�s���Ҏ%\r����ñv�Z���[{⾛�����p��u\0���G�_u:cLlQYY���2�����T��;b<Z�h��q|���N�S�W�h4b�ΝN��j۵6����y���޾��X5ļ�9�W�������-��|�r:M�8&ݨ�����WK��7�֭r<xgϞŮ]��>c���U�5N.��l��^~�e,Y��o�\0���/;v,v��\0:t(�̙�$���b�\n�?���J}&L@qq1fϞ\r�ш��\n̛7{��1k[m���Ҏ%\r�vBBJKK1u�T���\0���ѣG����?Ѷm[���T9Q�5�˗/#22���W>��n�z�߿#F��;V��wG��X�����4i�r5��ѣ�5k�O��l�1���h߾=�m���=���\'����m�b���\0�<���g������q8\"{�m�ژ��\Zt���\Z{�Zce�|��8p�@�m����ƍx��7QVV��ݻ���\n\0x�PXX���{���\0�\rұh�\"���;u�%j�d��njί�\\�Z��7K��-������.�H�`Ȑ�HOOǦM�ХK���b���x��Gѿ\0@RR�F#����իW!--\r#G�TNF\0ЬY3�_��}�BCCq��\r���+f��[ڱ���vww�7�|���B�`0`�ԩHL�#ڵ���v1l�0a���v����	&`�����񁟟���aժU����;V��wG��X�����o0c�DEE����ƍôi�L�u����`�ԩ���ôi�lzr��q4i�˖-������ト���=�aÆ���ⱇ-�Z\Z��Z��<�Zco_�k�왗?��ϵ�_޲eKlݺYYY�ڵ+���1s�Lt��\0кuklٲ\'N�P�a�ܹs�r�J���ֹ_wS�\'K�MwSs~�d���\n\nB���a0��マ={��O?U�������.7��k��A���н{w\\�r�١�JO=��\r����/��e���Ϙ0a�������uv8D\n���ODDD�%\"8v�����Kصk,X`V�����G��޽{��uL􉈈�Q�F���ѡCg����~���7�LC��V�X�G}ԉ���;D�0׮]ǬY���?tv(DD���/�Ĝ9s���\r7774k��;wFbb���L�LL􉈈��4���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i��$�yyy�����`���7\"##���e�Mqq1�L�???xzz�o߾HKK3٦��\0�=�|}}��^z	����1i�$��:����8f̘�7�x���������\"L�8~~~\r\rŎ;\0\0s��EHH|}}1{�l�}sss�����]�*qϘ1�!�C\\\"�///��?�aÆ��_�ٳg1|�p�;����v��Q\\\\��G��X�x1���;\0DcƌA���q��	�>}\Z�;�S�@II	��yL�8�Ν����!&N��Y�f���G���]��`��ٳG�����ȑ#�o�>deea׮]�����bR�3�<����:��������%�e˖�G����G�f�мys$&&���_}���ݞ={0e��i�nnn\r\r������m۶\0����\nW�\\�?���n�\Znnn?~<�{�z�\r\0Μ9�瞛�G}\0���hٲ%rrr0s�L4k����������NٯM�6���D�6m\0\0>� ���?��o�5�?\'\'��}!\"\"\"\"�p�D���:t�Yyxx8�9��ܧO,X�\07o޴ZϘ1cФ�i��~���\0@���\'7)��t���2)�С�^�Zc�<������C�ᣏ>�!z\"\"\"\"�*�H����1c������+��\0@J�gh޼9BBB����\Z\"bR����Sb���`ٲe2d���a0��I߈���Igg�\0\0 \0IDAT��k��\0�0\Z�HNN��O?]�v�۷�g�}������#))	���HOOG��������j~C�f���z�֭üy�Я_?4o�7n�̮}g\"\"\"\"�\'���N�:��ɓ��wwwGTT�mۆ��|�Y�\0�����\\��VK�.Ŝ9s0h� 4o޼^�\"\"\"\"\"mp�D���X�v�ͷ�������ׯ_\0<7n4��̙3fe:�׮]3)3\Z�عs�Cb�EEE�z�I��˗�=\"\"\"\"r}.��\'$$���S�NEII	�;<=z4�_�\0�|�2\"##��~����֭����1b�\0��	P\\\\�ٳg�h4����|���k\0�`0�m۶X�x1\0 ??�>�,���m��^C�Ŝ9sPVV\0HO߈+V����(--U���5������K$������oPXX���`L�:��D�v�\0<<<0a�L�>>>>���Cr�<�Z�\n���\0�f͚a������`0Э[7����^0k�I�&X�l�ϟDDD .�Y6���암��ш�� `��UHKK�ȑ#����l��kQ7�[�駟���X�d��C!\"\"\"\"r���ODDDDD�a�ODDDD�A.���n��%\"\"\"\"jlx�>���\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1ѧg4\ZQRR��0����4��>5���<��Ø9s��}D�����������h��������MD��A���7��ҥKQZZ\n�N��Ǐ�cǎ��{��y���(?�8q����.��s�+�aaapss���Ξ=��pn�̙J�������+��ڵ����h��r�\n��ك/��yyy�]�ٳg��>C˖-���כ%������BLLt:�y�5t�DDDD.��� ��ի&?��㏈��\0<x����B���א��\n\0عs\':u�T�H��W^���&O������6��tssCZZZ��JDDD�L����E�(//ǁ�ת�������Uxxx��W^qvDDDD���uG\r�N777��:����[^:\0�ܹ3���0~�xl߾D�\Z\Z�5k֘ԙ�����xzzB��cРAX�v��6�Ν��ɓ������;wF||<N�:�:���=00\0p��qܾ}\0��O?\0\0\0׮]S�[�f\rƏ���`t��<�\0y��~�t:�*9\0<��\n��~V�/��={��N�C�޽����;v`���С��ñw�^��Y���\r���___�k����x�wPVV��m�1�HDDDԨ��ѣ�\0\0�믿Zܦ}��@��	&(�<xPDD����<�����@t:���剈Ȗ-[�:��Z�`��������m�\"\"\"gϞ���0�����k�Z��_�~@\"\"\"���C\0ȏ?�(���ҦMiӦ��3F\0�����_bb�Ŷ������7�����ݫ�������CZ�je�]@@�YAAAb4\ZgU�z�^�i߾}�xU�jѢ�l۶Mu�j摈����h抾�.]���{G�ŨQ�\0ܹ��oߏ���Ĕ)Sp��5xyya۶m8t�����·g����~�zdee\0bbbp��)lݺ�������\0�ꫯ������\\,X��b,UW����ѫW/\0��}�p��a#88�Z�\0\\�|\0���̙3{��ũS��GV�������7\0�ȑ#&�]�z5�������]�|1118t�<==\0�����#G��k׮\0�ӧO+cco������˗\0���p��1�����7�İa�T��f����\\�={�~���|�r�j�\n?�06o�\0�v�*222p��i\0��Q�ХK\0��O?�}�����������A��w��I�:u\Z�=6ÇW�ǌ�%K� ??/����X�n�iҤ�˾}���{��܊ܹ�����z�R~1\0���D���{\0�܊\0���hݺ��������ݻw���O<n2n���hٲ%:w���\\\0�?������[�n8~��I��Ӓ���#33\0п���\0���QEM�j摈����ܳW��6m�\\%o��t�ߗ���\n��\0����^{M)��:�����_<�����`��)S���\0���Cff&.\\���cǚ�a4\Z���E�8p�R_��\n���g�\0�s�|���D�v����l#*�=��~V״iS�l�����T����tD��;vL�>$$��vj�V3�DDDD�枽�_���֦I�&HOOǲeː�����\\�t	���Ƿ�~�����$����\0��.����̙3�-:���3Il��������ŋu��~��qZRYY�|߬��e��mG�#Qc��+�UW��_!�k\"[��\0������}���p\'I�4i�n݊ӧO+���8q;w����\0���6m� $$���8q�<<<ww�j�bŊJ��~�I���n�������-��+G�iI�������#{ڶw����\Z�K�W�^�ŋ+_˖-\0�w�}\0���|�ݻK�.Ŗ-[��ƠA����\0X�j-Z�ӧOcǎx��瑑���5x�`|��8p���m͚5ùs�гgOxyy��/�4k��?��J�~�a��gϞpss3I�L�h��z4m�7nT�.\\��[�n��Y\0����������V�O{8\"NKyd��8�]�v!99\'O�Ē%K���lSێ�G\"\"\"�F����U��k��եK���6{������5�?���w�U�[�t���|��:i۶��6�u�&F�Q&M�d5��JEE�|���J�ȑ#����W_)����\"\"���Jll����ʿ��/INNV��;w����O��֭��}FF���dff�=sܸq��im�y�e�˗/���#M����o�.:���3w�ڥ�mG�#Qc�rW��VuE���>��?\Zz�����1c>���:���O��o���O>�N�:�m۶\n\n��\'�_�M�4������G�_�~�����t�޽;��׿b���hڴ)ƌ�=z�����Sw���۪��C�����?�qqq\0`r�xaa!�w��?OCxx8t:�� ##/����Õ�Oz�聅�{����t��o???�FU�������G���<��3���F۶m��S��k�P�m;b����\Z7�:>�������\Z-���ODDDDD��i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���i}\"\"\"\"\"\rb�ODDDD�AL􉈈��4��>�1�\'\"\"\"\"� &�DDDDD\Z�D�����H���k�� 66z�QQQ0\Z��t�8Z�S������Mn\"\"���������Q~>q������8,5jrrrЬY3>|���~��W��ƢS�N>|8���?9 J�ԧ�<�5y�Wp��I\\�~;w�������&.qE�̙pssS�>��s�]�v���ж�\\��={���/�@^^�C뮋�7������/ڵk�.]�`ʔ)��ʂ��bbb�����3� ((�)16�8,ٻw/�?��7o:��[�n!##_~�%�n��:��R�\Z��d͚5ذa�?^�v\rտ�v>!\"\"mk��\0Ըz����?��#���\0\04y���Сm���kHMM\0�ܹ�:urh������̝;פ�ƍ8}�48������9)��rsskq��h}N���|BDD��W����-Z\0\08��V��W�v�/Z�l�2%�����ڵkq��q,Y�}����%K� 5*.��W%�\0��Ǐ����\0��~�	\0\0\0�v횲ߚ5k0~�x�C�x����#�`͚5&�w��nnn���űc�����u��h׮�r�\r\0lv�/##���^�ǠA��v�Z��ϝ;�ɓ\'�����w:w���x�:uJ�̞=[�>55cǎEHH&N��}��)�W�����7�_M�U��?۷o���ѡC�������?����X����P���;(++�\Z�������k�\0������fr�Ftt�r;ءC���\r�ѯ_?��z����֭���۷o�����ڴicr����?���q�&�}��Ǘ_~��={B�ӡw�����Ď;0`�\0t�����ػw���j�ܖ>Y[[Ddd$|||���\Z\Z��3g����Ʊ�����8Tٶmz��\r�N�nݺ�/�P�?G;:��!�\"\"\"�����O\0HDD�xxx\0������Tڴi#mڴ�1c�\0���P�KLL\0f_�������+����\0y�G�k׮@Z�h!�۷���޽{EDd˖-V�Y�`��������m�\"\"\"gϞ���0�����kך������>~~~5�UU_�z�R�&���>������n��N����<ٷo�2տZ�h!۶m�\Z����N���Rw�8�X6a������Ȇ\r�f�R�k̘1��l�s�N��j����RVVfu.=<<�U�V&m��iPP��F��ܖ>Y�ӭ[��N����#�<\"�nݲ8&�̙=�P������v�Z��o��Qc�y�8�|BDDd�H��t�\"\0���Q�F	\0INN��� �{����h�M����\"\"r���3g��ݻWN�:%3g�T��ӟ���_�&ݢE ;v�nݺINN�I��W����l�����(AAA@���d۶mr��!�۷���ɒ%K��cbb�ԩS�u�V�����QDD>��ce��#G�������Ç�q��NV��Y}ߪ��ѣ�x���^\'\"\"aaaJ����79v오�������Z�Ö��N���R�=�~�nݔ�Y�fIff����՚触�*�����˗/+e���5�%\0����C�����I{G�Q~a\0 ����MsnK�,����@ mڴ�E�Iff��1B��ܹ�f˜�u�����?~\\�M���EDD��?G;�8���%����#G����~[\0�ĉ%99Y\0Hbb�L�4Iy�t��z.\\��l3z�h�����رc�7^���x��Wcw��e�|dggKvv�|��J��u�eݺ��Ͻz��\r�ͮr�={Vz��a����:�|��\Z���dEm���m߾�ܼySDDo\0�t�R��������:[�:5�gK�uM�O�8����C)�?~��D?//O�%r	\"\"�v�Ze�ŋ[ܯ�|T]�4h��߹s�DD$**�$V�snk�����^��������޽{�����<Q��v|�:����t�1]ZZ*m۶\0��Xퟣ���\'DDD�h����F��-Z`���\0��\\u�t�~�кuke���\0��ӧ1y�d�]�v���R�+�>୷�BӦMѤI�CS�����T���kJyV�9DD�ƨQ���<�S�LA~~>�;����ą0v�X��t:��}m�=�5��6m�V�Z��8;vL�>$$ĦX�2jƯ�u��_~U���okӾ;vDXX\0(kv���\0\0www<���5�ߴiS�l�����T�Z�wϑ�9��O\0p�����o���ueeeY���9�u�kҤ���o~���z\0@~~>���-���c�&ui����6���(//\0�j�\n?�0���q��TTT\0���WO@��������ŋ����t�ѣ��m�>\\�&M� ==˖-CZZ\Z222p��%̟?�~�-���o�K�%U4L�+GƩVee��}�f�O]�P7~u��͛���M�6�y��#Gb߾}���q��ddd\0\0z��m��O{��s{�Tu���y�$�Z�u]�R}�����c�&\r��;\Z���������mڴAHHJKKq��	xxx 88�����)Ċ+�$\"66?��233kl�����le�����w||<��mP&_��z\'M���[������۷/�;�}����Y�G��ӳg�bǎ&�WO��fK�jt����N�>�z���G���Ϟ���&�Փջ/ooo����l�����$\"\"B�~�Ν�Ӣ��;��9��O�����|��	�{���;g����W����ٻ�������#F��r�\Z�7.NY����y���5S��L?\'e&}�Ƨ,�zf�\Z���.cb�:��2	/�xII���>gŁ�����z����Zk������e����[]���ޟ�>�\"\"\"�Z|�_�`���A��e�����`�H����\"Y1�Lppp�֭[ղ��bܼy���{xx��_~�(,,DDD|}}\0�ׯǪU�����]�va����mII	������������\0w��\n\nЯ_?xzzb�ƍV���/��ӧO�ƍq��)�_����X�j��zZ��Udd���455			8q�������Pk���-�msRWVV�n�h߾��Vzz:֬Y�m۶Yl�{��\0\08p\0III8|�0�Ν[똫\Z0`�J�W�\\�˗/\0F����-���Ǝ)<<\\m\'%e7֬Y�C�ᥗ^Re&M�d���>�Z���b�8|�0���?�[��^k{v�ƟO��+������@�|���a��s犈�W_}%qqq\'k׮Q���f����V�U}U�e$--MD�~p4++�Ɣ~�ƍ��>�du��TTTX<$\\�.����κcV�t�\0���[�^�ju,Z�Y[^~��\Z�ܹ�ꔊNNN���j�-[�GUZ�gK۱��j����\\�|�b&���˫ƃ�˗/�Q���U�=�k��SO��_]����HU����\"b}� ��ܖ1Y�Orr�8;;[�Ntt��Nu��|j�C����:w�,�N��s|���4�|��\\ADD$�\nf�Y�z��b[�x��r����;_�aaab4\Z%00P�.]*W�\\��3gJXX�TVV�H�3Ĭ[�N���#F�Qz��!s�̑��rٳg��=Z�v�*...$�f͒��|�v�,[�L(&�I�F����G�ϟ��˫o֝�6l� 111���%�۷�=z���?/���u���~�V�Z�\"\"���)&L///qqq�^�zI||�\\�x�ֶ���ϖ����dذab4\Z���K����̙32bD��L&����y�����_#i���������t��Q���%55U��__���GY$o/��b�����h�綌��c+%%Ebcc���]�%K�ȭ[��_c>��&�#G��7�xC������U}�Q9x�`���\ZG[>;�9��r� \"\"2��aJ\"�dѢEX�x1����������T��u�H\n\n\n�����˗\0bbb��Q��}�&�w�^2D�����Z��NDDD���5��/\"  \0^^^���E||��?A#\"\"\"j\nL􉈈��t��ϣODDDDD�c�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�p�ҏ��\"\"\"\"\"��m�/\"�����d�O<����\ZeN�>�_��=���C���ͭ5�����Z��Hsw�)�9s������Ǐ�gϞ\0���r�X����:JKK\0_|�����z?cbbPTT��m��СCw}��������5�����Z�VqE��0�����u�փ_\0\0 \0IDAT���&O�\0���Ĕ)S`4\Z1a��:�~�)�͛���2DGG�O>�c�=v��\0���8v��]��,��۷��]~~~���n��x�[�um}�p���݋�>�gϞ���n1} \"\"\"۴m�hq��E����ߏ\'�|\0���a��~\0\0�[��j{�ƍë���q��5K�G��u��\\�WWW��[���R�����x$&&\0v�ލ�]����>�mZ�}s����\08x�ZgN����R`��`@||<����ի8|�0�-[���������%\"\"\"�V�U$���=00\0p��1ܾ}\0���\r\0�֭\0�ҥK�^@@\0���,�KKK�ȑ#����Ʉ��$\'\'[�1׍���ѣG1h� <���8|�0N�<���8����C���ŋq��\rU?##�Ǐ���7�F#����`�\\�~]Ә�����\0ӦM���ڷo���\0̘1999��a[b6q�D�ܹ���puuEpp06lؠ�ݸq���\Z~�a�L&8;;㡇�ܹs�������\0\0����`���ɓ��/���\0�\r6`�ĉ�ٳ\'\\]]ѩS\'DFFZl\0|||`0���n���n߾\rwww8;;[�r5}�tշ�[�Հ(�<f�F���\0QQQ5��7�x~뭷�]}}к�\Z�\"\"\"j\0i(\0d�ȑҹsg ����ׯ����8;;˘1c�t��Y����\0b2�Բm۶Iǎ@��ʕ+kԍ���޽{\0qtt���Շ�/GGGٱc���l߾]�F��mDFF�͛7�v�}	���������k��СCED$??_���+���l5�����޷�~k���1sww\'\'\'�rF�QΞ=+��#�XmkȐ!���,�}�]���4i�*���!\"\"�<������$%%E�����q�h[U�ǏWev�ޭ���777�q�F�b]����o���\r�7Տ租~��������1} \"\"\"۵�D�{��@�q���\0��� iii@���/�\'OV	��۷E�f�TQQ!AAA@<==eǎ���)P	`YY�E]GGG ]�t����۷���k��&G����DY�d��F``�\0gggY�j�dee����U�+V��UO���1))I�7e���ɑ�۷��ɓe���\"\"��o�2���Vc[_�ِ��1c�ȑ#G�� �}�I���������СC��_��d\0��/�\Z�	����7ސ��t��ɑ�2�f�Ru�\'�������D�����ED����j�����14�EEE��\'�|\"���R^^n��YK���-��1} \"\"\"۵�[w̷�i��\r\0�۷Oݫ߿�����������Ґ���δ�ݻw��d�/�K\0������W�,�ܺucǎř3g������,\0����1w�\\���ӧO�K/�\0سg���\0\0����6m\ZBCC��?�Y��駟�:V�}tu5�:\'N�@NN.��������\0�1c� 44��o[�6�Ґ�u��|�������K�.�ԩS��I�&ᡇBtt4z��\r\0X�~��}|�������À�g�yF�+((���\0 66V=r��\0�7�|�֏9��1����>����s��������C���C�i�]]}h��􁈈�l��gݩ��P����#���ܹ����\08���WuJKKѹs�\ZmU�w=11��c�ӧj,[�p!p��q��W�^V�kN�Xܳܽ{�*�8m��-}�5kbbb��_ ##�F����;ƍ�E��S�N���S��4TCb����v�����YU�g)\0�_���|�I�ĉ\0`�Pj����W^y)))())��˗�:���D4�x�ҥ���}��������\0prr¨Q�lCC4�x\Z��j	} \"\"һ�藖��֭[\0�v��aРAprrB^^����I�=���vE��\0�-�F#BCC\0���jy۶�Cg�`�����+�Z�ئMlٲ��֭[���4|���x����W_���\rJ����q�9[�l�_|��d��7���M�!**\n�Ν��/�[tt4��ۇ�\'O�HKKp�K��n*�=���h	} \"\"���[w����s�����z�����q��qt��={����S�:���W�g̘����瞳�S��t@�O�ͷLԵ����nS9q⧿����:^[�ئML�:۷oGnn.\0��Tݽ{w�۰ECbV�6m�`�ʕ5��ҭ[7��曘3g�Zf���/LՓۏ?�X%�qqq�����W�ƌ���9�w�V�?�����TVV���϶Į�>\0���=�@DDD�i�W��^�7\'�\rR�F�����\"���RX___�>}\Z�ׯǐ!C���b���{��o~cqOyu��D^^RSS����aÆ!--\rW�^��ٳ�����k֬A߾}�=���{��ڵk�K�.���999��XRR�q��aԨQ6l��gܬm۶(((�رcq��y��o�رc��\'�|bq5����&MjT̬y�gp��y�1K�.��`���g��վ}{\\�x%%%HOOǉ\'�m�6�2U��b2�����͛7�e��Ÿy��3f�9\0///�9s+W�T���=ZS���׿��ղ���_�3���\Z}<�������i?5�gϞ��X&\"\"\"��Ϻ�駟�8�Ν+\"\"_}�����I\\\\��]�VDDj�jcmz��>�$...V��		����Z늈�ܹ��ԙNNN���*\"\"������lu���j\"\"���j����\\�|YS�N�ju=\0	���r�gݩ��޽{�c���/��k֬���(�mɻﾫ�V��������%;;�j�BBB����4�i֝�]��|<X��SO�(_-��ì�,i׮�E�q��5z������e?5�Z�e\"\"\"����իW�/�ŋk*7�|�=Y߳g��=Z�v�*...$�f͒��|U���\"\"���2a�����ի�����ŋ�T������www1\Z�ҧOY�d�ܺuˢ���<6l��F���R�U}}�v�,[�L(&�Imc���jJ���|	\r\r�<�~���?��YK�:$�>��t����v�����ș3gdĈX1�L���+��͓���F��g�$,,L�F��ҥK�ʕ+2s�L	���J�}����W�^6�|��G�~���,�%ֵw�֭�>}���h�=zȜ9s����9��Į�>h�O�郖c����,D8��=���Ǎ7`2�Ԕ�HLLTS�������߷�v�y�̚5\00e���,��-��ŋ��舌�ۥ]\"\"\"��j��蓾̚5���?֬Yooo\\�v\rǎSe�=k͒%K�t�R\0w�������F�YPP���$,_���y��QK�D��)S�������GTTT�����x�����|W�^��d�[o��f\'j��{�bȐ!����`�Z����$\"\"\"�+޺Cw��ի�v�Z�8q�/_���#����裏�����캽��2�����~�;x{{7���/\"  \0^^^���E||<�F�zJDDDd?L􉈈��t����,\"\"\"\"\"�}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�ͥK?6w�����0�\'�����d2�\'�@EEEsw���Kc�Oee%гg�۷OSƏ���iDD���:}����C׮]��c�a֬Y8s����U��Ǐ�gϞ��˦�ر��Ġ��m۶šC����wŁ��s�!==\0�-[��[�^:V����C������`0�`0`�̙�ݝ��o߾j��_�?���v.\\���{�⣏>�ٳg�ֿ�7o\"--\r7n����\0����2e\n�F#&L���� �m�>|�}�Qt��:t@PP�M��#G�4��\Z;���t;v׮]k����֭�¨Q����:�{��={6���1e�������.�����jj�9�\"\"�{A���\05L@@�����HLL\0�޽]�vm�n�`0`ݺuM�~m���?b�ҥ�._����<lذ[�nEDD�]��\\c���̙�+VX,�|�2rssq��A�������k3f4�{�ď����0�o%���///�s����7-KQQ��׿\0:u�w�}!!!8z��xc9���0x��f�e���{�$���+V�@Ϟ=�o�>$$$ ))����P��֝��F�?�O�<Y�ޒ�������a�ȑ�����dBDD���\0�o�F�.]T�����?^-��Ȩ�-���L�6\r~~~h߾=0c����4h�]�t����zu��^�v�F���\0QQQWRm����[0p�@�L&<���شi�վ�`0����byFFƏooo�Fc���~�z�bw��1\\�z\0�������@�n�0z�/��W_a���W���\0N�<���8u�Jpp0/^�7n�:�\r6`�ĉ�ٳ\'\\]]ѩS\'DFFbÆ\rV�_����۷o��������\nM�>]��[�U����\'&&b�ر�ի�z�)�۷O%�U�`�究c���76�DDD�i֭[\'\0�̘1C-�ر�\0���@�lҤI�lFF���l۶M���Z�r���L�<Y-۰a�j���W\0H@@��JKKU�ꯡC���H~~����W<<<$99��CCCU�o����z-۩�����6�p��-���d�-\02f�U���_\0��dR˶o�.F��j���H�y��1Uw��q�r�>��9r�jY��ٷo�t�ܹF9GGGٱcG�c}�g�����$)))��������n�����ݻ��޽{\0qss�7nX�9t萪���g�]��q��y�?-q�\Zc\"\"�{Y����Eee%fϞ�K�.���;v�@ff&\0\0X�`�\\��_����y��o���O�\0>\\s[����7e����`���<y2�/_\0���O������+W��w�ΝCQQ���P\\\\\0��s��aL�<Y���\'����aaa6�1>~��j��+� ++O>�������x��gq��E8;;cժU�������\0)))HHH�<��z��i���y���� ,,���Q^^ns?\0�7��\rΟ?\0x��p��Q$&&���0lذZ����O�7�@zz:rrr�`�\0�իW���\'{_Ս1B�7OYRR�cǎ\0~�����﷨�������ok�|�j�%�\r�1�=���Т1W�SSS-�Jaa�,]�T-ߴ�s�t�Gi߾�\0�GyDDD֮]��|��f�mm�������͛�X\\)�sE?44T���/��O-��1c�ի�ZcX���C=��;vL����UnĈ�\\zz�ZeӘ��|��L�:��_�����ի6�c���j����kݮ�+����bcck��=���Ξ=+���@&M�$\"\"��ɪ�իWר��C�=zt��W���ϓ�zZ�^]m1&\"\"�����~�{������ǫ�O�C������lTTT --\r\0��������#c����F����fϞ���\0wl���Bqq1Ǝ۠�iَ=�:��zߣG������U�������Wz:&�^�\ZG��+���>}��u���X�t�M�8z��Z֫W/�ŝ+�ӦMC`` :t�\0OOO�N����<���ҥ���\0깋={�\0\0���0jԨ\Zu�F�zo����h�<Y�5�\r�1ѽD����۷5�5\';������V�DFF���V�6m�e��^�\Z�=������������СC4o���~���M�k��əl�>��|�`���\Z�6vL~~~����C����W˿����QYY���m�}r���\"DEE!))	�N���˗5�m��+::\Z��]/\\�������x\0�u��W�%I��>O�h�{cbLDDt/iՉ�9A���UO��&+3f�P�r��s�=\0=z�*�s�N�8q\00r�H��jӦ\r�N���۷#77W�g}��q�޽�n1в��	Se���N-1�:�gaaa��*��e�xJ�?q�z���oӘ�3_�73��߼yӦ~�T�������q��9\0@\\\\��������nS_��������k,�*44T��#??�v�X_�\'k��<Y�%1ѽ��%�U���og�ɒ����c͚5ضm�E������\0֯_�U�V!77�v������UM\0�����~�3\0��ﾋ+W����Q%&Z�*))ATT^�u<x���m۶EAA���OOOlܸ��qW}��������\0����Z��;����v-1�޽��]@RR>��s���o\0WqKIٍ5k��СCx饗T�I�&�~hSU�ƠA�0l�0lܸyyyػw/^y�U&\"\"¦~DFF�PSSS����\'N ))������c2������[��e��Ÿy�&\0�]�v\0���2�������f��ꗶ�+W�+�U��^|�E�~���ظq#N�:����#44�V���n}�\'k��]k�m����]|��ԃvs��U˫N�g~yyyY<H*\"��g�����ꃭ!!!RQQ��\\�h���A�Y�EK[S�N����`hyy����jYtt��q��0.\0	Ӵ���,i׮���q�����˗�(���ڭoz���dqvv�����h�����%K��Z����Jii�M�ٹs�թ8���$55��X����!!!�}ZZ�����ƪe...r��e�_�yꩧj�Y�ڦ� ���r���ZJ���d�^}q�\Zc-�1\"\"\"=k�~EE�<�����?V�Μ9##FĊ�d___�7o�����5�T�={���ѣ�k׮���\"AAA2k�,��Ϸ�^ff�E�hѢ\Z}���k׮ɲe�d���b2��h4J�>}d���RVV&\"��uǜ�kَٺu�O�>b4\Z�G�2g�)//����JY�p����Iǎ%<<\\RSSռ��%�\"wf߉��www��%K�ȭ[�T[�TUzz���׿��� �ر����IXX�,Z�H�\\�bs?�233e	���%...ҫW/�����/�:��>�$aaab4\Z%00P�.]*W�\\��3gJXX�TVV��H^^�6L�F�xyy�_\0�q|�棏>�8�^|��:˛mذAbbb���Kڷo/=z���^\nk��9~u}��WWܵ�X�g���H�\"-w��K�~��ѿ@JJ\n\0 $$�1�7i�h�\",^�������@pppsw��������D�Aǎ���}�������5PAA����?Պ��a�ODD�c-��>\0�]����\0ڐ��ػw/��~��_\r��Ԍ�\"\"\"����}\"j��/\"  \0^^^���E||��?�\"\"\"\"�a�ODDDD�C�n}\"\"\"\"\"�}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�]v�ҏ�݅&��_��o�i�n�hͱ��|�5�BDz��D_D�Ʉ\'�x��%]hh\\�?j***����1rdl��h�q�������Oc���X�fMsw�Ҳ_~��<����?7nܸ+����DBBz��}��i�Ӓ�1{iH\\�r/Ĭ5�~ �Bt���H\0����Ǜ�K��и�R�ԩS2h� ;v�$$$إ�M�f}����w����CY,�}��,[�L���T<>�|s��YCK>�\'M�$\0���U\n\n\n\Z�^s�Æ�o��Y�F�������zˮ�?v옌3F����d2IXX�,Z�H��k���v���oP\\�������C���D���X}`�F�ܺu�b�ԩS����2e�1\Z�2a�)//o�^�]ӦM�8�}���9�f\0\0 \0IDAT�\rj���D���#~��|��wjyeee��jK�cǎ���3�A��m֧cǎ@-�oܸQ\0����>\\�����۷�m��\Z�?�ZJJ�����\'��������/�GGG �\r���D�v�ݶ}��y����8\0OOO ����p�B9s�L��ҚX;�UTTHPPP��R[�\"��YS�-n����;D-Q�N�ED���>�����z�!���������SYY)���_�s��iP[3f�Pm�޽��=������JY�t��<yҦ�Z�ѨQ��899Iaa�]�lM�OBB��߿�I�^�j���SO=%������%99Y>��{6�휶e��ǥ9ϓ�YK����/Dui�����裏\"33\0�w�^0\0\0PVV���\\\0@pp0|||����%##�O�\0!77۷oo�^Qu����k�n4����ڵ\00x�`x{{7o�Z�Y�f5Y��s\0\0<���D```�m������] \"�kZ�ø����}zz�z��~\\�~\0��#�\0\0`0���f�FZZ\ZF�	�L&DDD 99٢��n\\\\�=�A�����Çպ�\'b�Ν���+����a���UPP�iӦ����۷G@@\0f̘����b�u�V\0��h�̙3\0���(((�Q��ɓ������/:t���`,^�7n܀�hDbb�*���u��Ո��۷ѥK�={V�?~�Z���Q��ؼy�Ʉ�~�6m�:�\r6`�ĉ�ٳ\'\\]]ѩS\'DFFֈ�-mww�F�e�\'OVq2�k�j�k]��O[���W_�ʕ+\0�~�JK�m�-1�WL��U�~����������\r�ш��`,X�@���l9Ϙ���a�����\'�|�/��R�}Ҳ�����vj;ow��A�9Mk\\l9O6e�n߾\rwww8;;�ڵkj������`��Y�__\0����\r��;���Gc�wl���\'��Ts�I�>7n���X㖈�K��?�mܸQDD�����L&Un۶mꖊꯕ+W�r溑��һwouO�����:wwwqrr�h�h4�ٳg5o������6��СCED$??_���+���\\kl\"\"\"T���t�N�����\'�;w��=GGGٱcG�}6�*U=��\'OVe6lؠ�cW@@@��c��-5bX�U�O��<��2NNN���Ҡ6���v뎵e�VHFF��c������x6d��ӟT�?��b��ϟ-��\ZS{�Dk[����������+22Rn޼Yc��w���d2Ym{���V��u�6�1���vj;o�zN�[�lʘ�?^��z+�9nnnr�ƍ\Z������l}q��;���Gc�w�����Dw[�O�EDF��U���b��D���,�.�(\"5?�U�����;vHff�0@\0H�Ν���̢����.]�HHH��:�	�ȑ#��}��&��JJJR��L�\"999�}�v�<y�����7�Te��������5o�<�}�����\n\0��/~aQ�o߾���^{M�=*����d��3SA����O>���Buk��~����ܹsE���e�<��z\"\"!!!��+��\"YYY��OZ=�<xP�x�\rIOO���Y�`�*7k�,�۴�>��1��-q������x6d�U�����������e�Zcj��hm���\'00P��V�Z%YYY2|�p�֊+jԯ�<Sݙ3g�����*��M\n����V��u�6�1���vj;o�zN�[�lʘ%&&�2˗/�;e���?�j�����l]qk�wt}���|��2��~O�m�\"�_�b��@�_�^DD�u�&��߰ͪ�SSSU�3fHaa�Z�5`Ӧ�-���cǪ�P�u;vT�e,Z�H�_�f��mm�������͛�X\\!�sE?44��+�k׮�q�{�G�3����~��������k�q]KU��K?J����<��#5�c�:�z��Ǐ�2U����PT�Y��S��Ҧ=��5\rM�m�K��j��Z�ِ�W�޽{�r��u�ZbjϘhm��~�:ш#T��}����Q���5��_��ʬ[���>iݿMy�5Dm��u޶圦5.��ٔ1;{����fҤI\"\"�������S���4�1[[�\Z�]߶\Z�c���=At���{������݋s���ԩS\0�����֫z�\\bb\"|||�����x����\Z�.\\�ic�k�\0j�Ӻ��#c��}��F����fϞ���\0������P\\\\��c�Zۿ�u��KGGG��\0\Z4�����_\0�=������j[��С=��3HKK\0����ǆY�w�Է�}�=��Nnn.�M����@t�����j���ܦ=��=�\Z���c-�l��͟	\0�z��z�5ލ�5��IC?Cyyy�}��	�w�i�U�5��<�X\r=��O-\Z�Nm�m-��3ߔ1�ҥ���\0Ꙕ={�\0\0���0jԨ��n�\r���u[��_l���� j�V�����ݺup�!ܪ�>���ֻ}����2\Z�\r\r����m�i�[�l��ի��c������=�~�m:�����TVV�믿\0ܺunnn0x��WU�/���*kֶ��&Y2����\";;[���H<��V��w�O�wpp�����\"DEE!))	�N���˗����G��e�h��Z�ِ������/^T�ƻ��ƞ1i�g���\\������^�ժ�Ƕ=�Y������YS|�:f�`\'O�ą�Ŗ����xUk��1ې�h[�r~�e�w�{���ZE��t�����HMM\0t��I]Ŷ���\0̘1r�V%��s�=gQ��W�l�V�6m0u�Tl߾���j���Ǐc����n+--\r���u�1O��S��ӑZS��_YY���ѣG��;w�ĉ\'\0\0#G�������z_XXXe{�5�~���8w�\0 ..������jT�ws��� �~iT�r�e�h��Z�	�>������\Zo[ǯ%������PuUǟ�wJ�?q�z��ﯹ={iȱm�c�.\ri��y��s�����fSǬ�v�����ή����4�1[[�\Z�m��~Gh���\'��R�I��W�/]��?���[U��Z�DDD���\0�~�z�Z�\n���صk�O����؃�m��� **\n���:<X�O|m۶EAA���OOOlܸ�ƶ��j�+�����l�\n\0�8q\'O�Ddd��S;55			8q������������P��r\'222,N������g?�\0��w�ŕ+W���Xg�߽{w\0\08���$>|s�έQ��I�d2����b���Ÿy�Mm�sYc�srYY���t���U����X�f\r�m���X�ek�gC����߿_��\Zo[ǯ%������Pu���j�))��f�\Z:tHM}	\0�&M��~Sh�m�x�9s������>�|s�mim�>��Ӵ�Ŗ6�3k��ؕ+W��T�ck�꘭-nw�;ږ�-�o�g��k�G\0짴����Xo���EkO���&qqq��g~����x�jݺ�}��k<�e[S�N������Kyyy�����g?S�;f�n�̙j�yv��;wZ�.���IRSSED$++Kڵkg�~ܸquƦ�P\0dРA��m���5���ꪶm~(*;;�j,�Ξ���fS���G����4;����\\�|�b�	����K�7�c��ŵ�}�5�\r����U�̳`i�����\ZS{�D�g��~INNggg�㏎�V㯭���Lu�<��u�6�1��[o���^c<�엺�۶�Ӵ����=�Ak�z�\Z���8n�c���5�;�ڶ\Z�c��z�$��ZM�/\"n�a:r����N�{��ѣGK׮]���E���d֬Y���_o�����\\߶�]�&˖-����d��(}������i��u�ﾳ�J����b}�iת�����)&L///qqq�^�zI||�\\�xI�Y�n����G�F����C�̙#����&33�b,Z��޸UVV����O:v�(��ᒚ���#��������h���@Y�t�\\�rEfΜ)aaaj춴i�}dM^^�6L�F�xyyIZZ��9sFF����$���2o�<y���U��I�-c�kԵ��ĳ�c�:��_��W��m�����^1��Vm�%%%Ebcc���]�sɒ%r��-�rw#�׺��;v옸��	\0y��g��I�~��-���f�qߐ󤽎��>��#�s��/�XkY��i�c����4�;Zk�o�w���7�\\It�Dl�\n��Ȋ��JDEE!55���8|�0\\\\\\��[�B���������j�j�E�a���pttDFF��}��hE��Q�զM���;�ر#N�>�������PǎCQQ��$�\n\n\n�h�\",_�\0�$��j��\"Dd}����E�`0\Z=S�yj����f�I�w�^2D��U�V5c�����;DDD��ŋ\0///���\">>F����ED-}\"\"\"\"\"�=�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}�g�_��j�n5�{.�����d2�\'�@EEEsw�E���p�B<���>}:nݺ���!\"\"\"�;��Hsw�n:s������ǏGϞ=��G-CK�KLL���жm[�_yOMMEDD\0���3�ϟo��������=wE���S�L��hĄ	��]jZb\\���q��1\\�v��m���c	\0�+V��ٳv�Qs���S�a4\Zq��%\"77�����6l\0`�ܹx���\r\"\"\"��r�]�\'2{�G���\0ذa�;/�I�H�`00~�x���{�۷/:t���`$%%Y�-((��i�������#  \03f�@NNN�����,�<yqqq���U�/^�7n�Pe2220~�xx{{�h4\"88,����k�;--\r#G����L&\"\"\"���lul\'N�ƍѯ_?�F���YYYصk�WWW���!==ݢ�-��o|��E�6��e�Ν���+����a�UnÆ\r�8q\"z��	WWWt��	���e�%�Z������0\0��S�p��	M�\'\"\"\"j����\0���*\0,^�����_��Hii�����(@�Z�=�ɤ��۷O:w�l��;v�������h4Zm?22Rn޼��۶m�t���jٕ+W��K�Ν�]�v�u�V���� �����?Z�g-.�l�\\���]���,�\Z�F9{����<��3V�srr���՞y쁁�6�U�q \"�p�B�n�ڵZG\"\"\"�V�U%�\0d���r��Q�3g�Z-\"\"IIIjٔ)S$\'\'G�o�.�\'O�����h�jB۷o_U���^��G�Jbb�,Y�DDD***$00P\0�����Z�J���d���ފ+T٠�  ����c���̔��������f̘!�����ᡖ�3F>,�{�V˾��[���e|��b�6��e̘1r�����Q�>�l���<xP�x�\rIOO���Y�`�*3k�,�^�D_k\\�\"\"o���*�|���DDDD-N�J�F������ȍ7���E%�����i��*i{��e��-W���gNh��߯�\r<�jRRRT�#F�����jyTT������Z$�RXX(K�.U�7m�ܢ/;v�7n��HDD�*WPP \"\"O<�Z���aS���Z\\l�F��\\�vMDD-Z�ʮY���v���U���X��z��5�Z��U�V��.�56DDDD�M��G߬M�6ppp\0\0���0�L\0���R\\�r#G�\"&&����G�\Z	̞=%%%��{��Q��W�^V�����U���޽�z��i\0��<11>>>���A|||���;88����p��q�|P�����2>kl�FUh׮��~@nn.�M����@t�����j���@�ָ�r\\�zU�7ǚ���HZU�_]yy�z�}��M�6زeV�^��{����������oc�С���^YY�޷m۶�mUMF�&��_Bn߾ݰ����h_c��UQQ�������S�N���˚�j��-���?��ޛq$\"\"\"҃V��?���\0\0<��\0�$yS�N���ۑ���\0��^w��m����n�}m�w��S���S�����{�\Zeg̘�s����瞳i��鏖�5vZ}���8w�\0 ..�����ʲ�?��U�qp��I�>44Ԧ��d�*�/++�k���#G�`Μ9jz���h\0@II	����������5nӨ�jvdd\0���HHH��\'������\0w�����/\0 %e7֬Y�C�ᥗ^R�L�4	\0�ʮ_��V�Bnn.v�څ�ӧ#--�ѱ��?Z���mhU��&�	غu�ZV\\\\��7o������999��j�qp��A\0���;BCCQPP�~�����7n�ilDDDD-Js<`����T���˷�~+\"\"S�N��\\xx�z��ڬ;;w�:����������Hrr�8;;[m?::ZM{)\"��g�����_!!!����DFF���ϟ�I�&Y<�kk���Z_lن��/����ø���V��ާ����Hll�Z���\"�/_�W����Ç-�y��7-�GDDD�Z��D�d2��o�-�{���$�>��<xP��v�,[�L(&�I�F����G�ϟ�����^U���2a�����ի�����ŋ�T������www���%K�֭[5��g�=z�t��U\\\\\\$((Hf͚%���u�Ek�ok�_mqѺ\r-��ȝ_�����h4J``�,]�T�\\�\"3gΔ��0������<6l��F���R�\0�W���s�=\'���%p��a��ϗ��P������\Z1$\"\"\"j-\"uLs�B ??&�	.\\h���:u\n���ǥK�0s�L�����%\"\"\"\"�jU����_��\\�t	>>>X�tisw������ϵH�#˖-�<���N�IDDD��*nݙ6m\Z���o�ϑ�����ȺV���mx�>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H����}\"\"\"\"\"b�ODDDD�CL􉈈��t��>�1�\'\"\"\"\"�!&�DDDDD:�D�����H�����=����� **\nW�^m���K���8��ׯ7w��-����PD�f�\Z|���\r�M�_�-�ߵk��ݖ��\rUwO%�eee8u��>�nO�V�^�?��O����6�C�!,,�����l�/\rه���2dV�Z�����tU�ז��9�1�����λ-����%��<����QYYisݰ�0����.}�w{w��`���7|||ХK���/��JKK�+W��ﾳX��3�կ~eu�������-��vTVVBD�-w��\r�\\��.��yX�/����}x��!�����|�M|���		�[�k�u����������W_�Y�~��~�+����������p�ƍ��k��h���-��R�!kZU���y�<y�:uBjjjswG222PXX�s��a˖-(..FLL��˛�k6sss�֭[�����]i�.^���^z���qW�k̡����?��A�١Wͣ���Ǐ�_��t�ر��S�LA�Ν����cǎ��ŋ�={v����Ѫ�M�6!22111ظqcswGw����v�Z\"%%���c���\'N���7wW�Z���A�������{��SSSq��i����pttă>�����زe���m.GD��[�n�ܹsظq#�}�����=�U%��}�F����Xlݺ���+W�`�����󃇇�u�֩�gϞ�񧾳gϢo߾(++�SO=???c׮]\0�+V�W�^���ū��Z�n��������.`ƌ���7��o��Ʀ8�����Ν;��}��wx��ѻwo���\"00��ͳzտ��O>��*��/��͛5�Y�]c�w������͛���[gY[�t�ҏ��o�nݺ���111���j�8Ξ=��z7o��/���� �������=***\Z���<���0`\0������l��/է~���ܹs���E�.]��;�h޾-cj��J��Rߘ��\Zk��^���޽Ey�\0��(Fj�2*�YP.1\"���+�\0\0�IDAT4�VQ��DԨQ&4\r10I�hL�Vm�#��(^Zh\05�\"5���5�1�j��.^A@n����㶯{{�}��|f�qϞ�s����w��u�%>��������l;\n�ӦMC�>}ti���/�������gH]]F����Z$&&���~~~X�b��[Į����=�/552����HJJBmm�E�;wAAAz���ٜw���A�1����Xz~.]�����^�͛7!�H���lt���cs�;��!�<���7Sc��Z������P6����<y2JJJp��=�m��X�X{M�X����<<<؍7XWW:t(;�<\'ϼy�؋/�Ț���V�e.\\`iii����1ƘJ�b��SF�R1���Ī��c���d2���Y���Z��uvv�k׮1v��IN�G������j���}����c����L*��3g�S\0�֭[��{�\Z����9�577�������c�ƍ,22����p�j4\Z6v�X����Z[[�F�a��Ϗ-X�@o�;����Z-{�W�9�I�R�T*�����EFF���,���º��XUU�����J�|}}ٜ9sXaa!�j���ݻ,\"\"����s���ٳgY``�ٱ2�����@6w�\\v��q��jY{{;����ɖs��\\7�gCyŌ�!b�\Z:�b��_��������qRRۼy��qBB۱c�^�+V�W^yEp>CT*���bS�Nխ�555,44��_��d9K�KY�:::XXX۾};���dj�����1c�0�Fc�C����~뭷زe�t���A�1����Xz~;v����1�V�I���ٌ3t}|t��틱�ݝ��Q|����o�Ɗ�5.??�EDD���\Z�c���,<<�=z�lB�9���ZC����/,,d�=���qJJ\n{��8y�r9;}���:�]����rNz@@\0KOO礥���u�֙��O���}�v�W�ڵkY\\\\��6��ߍ~WW�׿�ŦM��fΜi��]�Xbb\"\'�����-ЫW����?\0����]�v�I$���[�ܣ}�}ڵk3ZFL?�%%%�|999lѢE&c5�56���NH�B�d˹b����q��oY��ՒX�臆��7�xC�����;�=8�III���R�����իW9�\n�!&��M������5��?68�ؾ}�L�#v��w���\\�����j�\\.g_�5\'}ƌl�Ν�1�s�o_L���:v|����o�Ɗ�5.,,�UVVr����h�mb�c�5@�z�]��[w����{��r�DDD`۶mhmmT�D\"����yxx 99��6x�`444���O��WQQ�Y�f�՗����\'OZ�vSXXd2<==1}�t��Ƣ���l�_��S��y*++\'\'\'N���;�X��?�Vooo���`�ڵ��}�P�\n�̙#�!��H$HJJ��H$f�3c�ZCCCRSS-n�o�l9W�A�8�a�ch��Ν;�������j�����ׯ_?����gL�~�����I�4i\"T*�_�n��=�!k��Ç1a�����p|�����0�������G�9?���0}�t���Z[[���_cƌF�	oSs�;��-�%����X��)�J��rN�[��qͱ�\Z`��#���~GG����K����ŋ9����}��EPPRSSQZZj����eJ�R�T/]*����Ţ��~��;_|����1{�l�=���ڳgƏ???�d2,^��^��]�f0>��ٿ��~������\r>ϷO���z��=�!4^k�H$��d6o�;�WS�=�C{����GG�Z/]�V�����	���\n��(�9B�8�R���l�gB�mݺ���6���1Z2WŜ���ɜ�***�����`xne˱�71�7Cc��\Z7t�P\\�T��S]]�W���9���uՑz�F���s����<�.����G�Ɓti��㣏>�ŋ��������Ġ���n��2�F��J��dU����kԨQ�<y2���?�=��{�aӦMX�f\r~��\'(�J�ؑ���ٹ���ٿG_��?/|���j��ڳB�[���Pb���ch�sbȐ!�}��^��۷���)8�P���pss���5	Y�4\Z\rrss�T*9*�\n6l�q����ђ�*��;v,:::p��E\0@yy9��k���9�o|��k\\VV�/_���Z�gϞŪU�~��Q�X�}]����/-=���z<��.���L/������q��ܾ}���{̶�������>)�JH$QS\0x���QPP�+W�p�w�ލ�7\"**\n}��5Z���Kԏ�X�o��6���PSS�7�>\r>\\�m��8��Vl�~w��|�k���Ή�� \\�pA/�ҥK		�O�{�\ZQ__/�Bk��\r6�.]�qD��Q�\\{~�����O?�F�AUU���M��x�r�Ķe)���5nѢE���ł �ˑ����+W\"!!�l,�X�}]��n���j����P\\\\������ӧ��7���-�W������������Q�&���h�ݻW/���&L�����)��1{�l�X�������D�I�uK���q���\Z�˗/�j������BJJ\n֭[�\'�x���>�����[\'���կ_?�_g��\r��|�gCČ�����\0���PQQ����?~ӦM���V��+�|���ۼ�/d���������v�����+	�h4�ꫯ,�����U����ٳQ^^�cǎaĈf����m�-��Zm�\"f���)��ѡ�ٳgQSS�\'N��7o�=�7{�����7�_}�����L���\\pp0���P^^�[�n!))	gΜ�}���gΜ��)S���cX�d	���z�j���=xP���|�\\�R��O>���~kQ��*++��7���&L���7������p��u·�RRRp��}�[�\Z�]]]زeN�:e��	���o���T�>F�}Z�x1�������1�<y;v�k?��;p�@��ף����EA\"�`РA8r���MZ�}�1_���1� ����j�c��/��������H���୷�Bgg\'Z[[����iӦ��\'����Z���^1�p�֮]���,����h]|�M!k\\ZZ\Z��ڐ�����\0>����&��:�2��Ν;<�%j�������o�1Z:WŞ�hllDnn.�W�Ō�%�5v|�;�}����1|�q\r\r�hmm��,���7{��t����0s�L���|>%%������DJJ\n��� �J�����-())����]b�u@ee%~��GݏTlڴ��Ŝ��_}�U�fذaX�d	�-[�K��ɁF�A@@\0�r9��-AAAbbb8^�����/��L&CHH�����oZ�B>s����eN�}ruu�����Z���+V���#�������cҤI@aa��:��򐑑___dff��V�����*�φ�1e\rWk��._����|aa!n޼	�\\���`���#77W�,�|�������HNN���f͚���L̜9�dl�z�.>릐5���\r�}�����L��������4َ�����={�`�֭�J����üy�1i�$z�?FK�5����x�����?�o_��Zc����7!�?��f�k��ٳ�Q�FA&�A*�b̘1���Ͷa����mtN��}�� >>�&M�k����P!Ĭ��:�\Z5\nw��qX�nGp�y���V]]�������;w���u�W�0�1����7o��C!����M����;q��mۦ�>r�H����������D�^���رcM~�0!����u�8Bo>��\r6p>��3nEEE�8q��{�Э;�B�޽F�]�|���C!�׳�|���O�q�F(�J899���O>�$���\r��.�\r��B!��ѭ;�B!��B��\'�B!���>!�B!�m�	!�B�h�O!�BH/D}B!�Bz!��B!���F�B!��^�6��B!��B��\'�B!���>!�B!�m�	!�B�h�O�c�1�ݻw��͛V����~¸q����b��b������B����g�aܸq�j��z�*�̙�萈H;w�Ĳe��c�ĉ���D~~>n߾-�.Cǭ��W�\\A[[�:�淤\\o;�,���\Z}��0n�8���`Ĉ����!��Bz���//?�aÆ���999�0a�^�K�.!55�������3�<�;v�?Xprr�A�n�߿�JeQ�`�ܹz�~\\���c۶m����y�f��/��_~���zJT[��[xx8���`Ȑ!���ߒrbί���1뎬ї�_~���Gmm-Ο?��3gZ1B�z�q!��N=b����~~~hmmEAA�r9��S�N!..S�L�ŋq��u�޽���P*����ʀ����㪡�˗/7���ѣQ\\\\��{��Qb;/^DBB�k�����#\"�������ѯ_?tuu�������!;::�d�lޜ���.N����\"G�Kl�����޿I�V�Q__�S�N�Ν;HKKstH�Q��pq��/Bq��~ii)6l�\0���O����=WVV�&ߐ��:�37n�@ll,����<�s�����d���FRRjkk��w�/��2�r9���S�����6��c*1̵�����_��+w��Uxzz���CP�~�ittt 33��dx��ס�h�ڸ}�6�͛���#33S�ޣ�ܹ�ŋ���R��Ǐ����uϷ��A�V#**��o��޽�_|Q�ҥK����.��;w������ggg�z���1�O������|}}1|�p<��(((\0\0�����g�Ess3d2d2�\0\0�T*���!88X����ltuu��q���ӻu��|3t�C~~>BCC1l�0���b���())��{�L����e��������ѣQ[[���D������+V��%t����\Z\Z���f,X�\0���		�_|\0شi������u������J�x��5e�ҥ��dhii��O?\r�L�͛7����_��}C};�!ĪX�d��|�r��T*ds��eǏgZ��������ƶo��:;;�Z�fyyyl̘1L����wuu���H����ZZZXWW���byyy�1ƻcq��ݺu���|�>z�(1b�^�͛7�9s��/�3g+,,dZ��ݽ{�EDD���|N�\Z���;�eff���V��hXAA���c,��U��,<<������19|�0�J��̙3&ǈ�Vˢ��XFFkiiaZ��}��\'l�ȑz��={�����[o�e˖��3C���7o{��Yss3�j��,--�5551��D�Wss3+))a��͌1�nܸ�\"##YNN�ٱr��o�<7�???�EDD���\Z�c���,<<�=z�d;�:�Č�J�b^^^l�ԩ����1�jjjXhh([�~��c�R����?KJJbUUU�1���2�L�֬Y�V�Z�:;;ٵkט��;y򤮬��J�x��5�1����X}}=\'�oLB�2��ꋘ�!�k���)S��;v�ͧR����[�n\'��?f�-�˟�����ۧ{�k�.f�~����s}>mk4\Z&�Ju��bbbXqq��>\0`%%%�|999z勋�Ypp0�j���իW�mĶo�΢����_�v-����Kj���,00Po�f�\Z�7�|���e�r9;}���z�m�\rٵkKLL4�O�q3�q3v���*++9iEEE,::�d9G�_|�R�R����W�r��CL.�s�	��󰬬������9i���zm�^	c}᳦0fx��7&!m�[���=�cC!��#n�1���O<���\r\r\rHMM�>|����������=V(&�֓o=���O���Έ��Cii�����&�?qqq�� �H���������I���D||<���8����z�TTT`֬Yz����8y�跾>���8;sO������YZ6\"\"۶mCkk��q>��_y��ݻf�	9n�9ϕJ�އ����������X>g����I�4i\"T*�_��K�6H$L��;N������9i���M[�WB���k��b�ۖ�u_l�bk=~����&^y%	d2\'M�T\";;[w�ÿ�[����Y����V�BmI=���o۳f͂B��=��8���(0@p��v�\Z�R)�~�+�J���\"�+F��/�NKǌoټ��зo_!55�����i�1�={�`������L&���/�*+�#�<:t(.]��UWW�-o��K�X\Z���\nΏ�Y{m0F�ze���1�[��!�X��m�L&��?�lqy�F���\\��ì�jѧO���߶���B�RA�TB&�A�P辢NH=B8;��{���Fc0/cj��w=�899뽚/��1�[v� w|��Ghii�B�@NNrss�P(зo_���{�=���a˖-�����}��С\n��O��|���f\rYYYX�|�Ro�������X�j����/{�_b�Ҕ��v������b纭�C[�dnݷW�b���~tt4���,.?l�0\\�t�l��Ç�ڵk���m���S�NEYY4\Z\r�;���g�Goo/�?\\���ep��J%$	<==�_b�LhY777$\'\'�ȑ#�}�6���g2��ݻ�q�FDEE���!�+S-Z___,X�\0r�X�r%�?�����3��ܻ׈��z���ćعn���1�[��!�X��o�p��}�߿ߢ����ؿ�ٷUcbb�w�^��؂��g͚���رc5j��iQ=|�7��K�|��^Ztt��1.,,Ą	D�\Z/$��:>��h��W_��l�YZ���	���hll���oC_����D�I�u�^>C���5(��ѡ�ٳgQSS�\'N��gn���/1c	<xe�����v���x����ع.v<l�1�[��!�X��o�]]]�m�����_Ǯ]����	\0�r�\nq��	�������ֆ���q�;w���hl����/FSS�}�]����1��\'Obǎ��!mGGG��ŋ�������D���+%%���Ǻu��h��Յ-[��ԩSzy�,Y���z�^�\Zj�\Z\0p����X�r��v>��|��cټy3�=��W&�a���عs\'���>�|x{{s�3>eoݺ���$�9sF�aѲ�r�9sS�L���A��ȑ#\0��\0&L�ƍuL�����p��u���	+c��\Z\Z\Z������1<>�u~�K��<-\\�P��Å�v�Zdee	꯵���b��l��u_L/��rrr,��B���}\0?~\n***0b����`��٘8q\"Ǝk����>��3���#002�HO�=��nWWW|��稭�Epp0����b�\n�1BP=�\n���ܕ+W������h���`ƌ��l������/��L&CHH�����o��0`\0*++��?�~�hӦ�(..FHH��v^}�U��s?\Z�SO=���6,Y�D/���3��ك�[�B*�\"..���ǤI�8�Č�����HIIAVV�R)|}}���%%%����Օ��������\"33�����ɁF�A@@\0�r9��-AAAbbbLnT����f\r�g�F@@\0F�\Z�L�T�1c���?�Z�b�/1c	\0���Gvv6������Y�f!33�!����u��a���ܺ/&�˗/�-�B�rb�U\0�����������j���1i�$���k��~�����o�k�.�F,V]]�������;w��ñX]]F�\Z�;w�8:B!��^�>�O�V�OZ��K�::�a��~��y�\n���\'�m�6���#G\"66�O�v@T�BH�G���?��O̘1���`��Ɏ�j���;�;�vt(�C���\r8��xx/tQQ&N����!������>�1����#==��W�4�����_�jq���pQ��K�9r$>��,]�J�NNNpqq��O>�?���=�|}�x饗!���ݣO!�BH/D��B!���F�B!��^�6��B!��B��\'�B!���>!�B!�m�	!�B�h�O!�BH/D}B!�Bz!��B!���?!i�7�~�\0\0\0\0IEND�B`�','Captura de pantalla de 2020-05-23 20-49-00.png¿¿image/png',NULL),(1045367086,'2020-06-25',6,'2020-06-26','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0�\0\0\0�ToW\0\0\0sBIT|d�\0\0\0tEXtSoftware\0gnome-screenshot��>\0\0 \0IDATx��yT��ǿ,�AD���h��qy��q_PQc4�T4�_�4��s��K�{Ĩ�(�aQčE$�\";Î0���~��af�g�aP�s�UշoݺU]յ�!��B�P(\n�B�P\Z��i(\n�B�P(J�(\n�B�P(�L�`�B�P(\n�B�Ȅ(\n�B�P(�L�`�B�P(\n�B�Ȅ(\n�B�P(�L�`�B�P(\n�B�Ȅ(�Fy�䉦U�p��7��(��,P(����c���صk��![/���A�D�P�F����N�<y�7n ++���<x0V�Z�i�(�T�	�Bxxx�޽{�1c6nܨV����̙���r�����ٳh߾}s��2TaU�S�N\\im��Z�6U�IS���L�*�����󑗗>��)S����U�jQ�`���[Jnn.�����닻w�\"..N�*Q8������CTT*++q��e��(**���۱:z�h�(\0�����Z\'.��rj�m�:줉�V��X&m�{��!,,����������5��\r�MRRR`ee%�O hZ=����˗/C[�Mq�����_~iV㬩����F�~����w�%j��{�n���c�����񁉉��j�U�B��T�Zc9�ƶMv�Dy+Kk,���o���3g�hZ\r�[���h	,--�s�N9r)))\0�E��>��������M�������������5��B��ϯEd�Y��\'O���c��.TaU�S�N\\h���ZP��4Qޔ�C~~>�ܹ\'\'\'hZJ�M���1i�$ܸq�,���`��\Z֌�6QYY�s���[o��AA~~>233���`cc�6����;V�hii)�Ks��E�jI۪��^N�E��U���ț����B�8qAAA��ʂ��\r\Z�%K����^*��Ç�w�^��������u��ob�P��M�!%%������CFFx<��},Y��|�D���@�9s���(//G�N�0`�\0�?ӦM�t���\\xyy���d���z{{CGG@]E�|�2.]����T����k׮4h�.]���{O#������___���AWW}����ŋ1v��f���͛�����Gaa!�n݊��(������\0�1c��ݥ�ģ�������x����K�.prr�ҥKaff\0x��5v�܉��4�|����pvv����q��%���K��n@@\0�m�>�\08t�:\0X�l��O�4FSr233���[m``�)S���ӧl��9sp��%v�ӱcGܽ{W�ڦ�+11s��mT�rHHH��-[���������	KKK\\�v\r>DII	�v��˗c����7o���[�neg\rkjj�i�&|���5kV��m,����.M�����Fep��\\���<e�I���(�f(�p�gWWW<~�XB��ݻ#88^^^8�<>q�D,Z���nڴ	�:u�իW����s�Θ={6\\\\\\�� **\n�^���èQ��y�f���\\�(qqq���AQQ\n�a�888 ??;v�@II	\nѵkW������)u?��ڵk���Fyy9LLL �PTT���0����СCprr��&33S���ݻ�C���}��������U�������5qqq�7o��>AAA�ٳ\'F����l6|۶m�o�ç�\":���ޚV�������5�]�t��vǎ�}�6���1k�,|��())Att4�����v��1lڴ	eee����ٳgCWW׮]Caa!f̘Ѥn���X�`RSS�l�2v�����رc1j�(\0uo��/_�\'N@___�5�???$\'\'c�С�`��� ���wߕhXՑ���J,^���\'F�t��~~~������e���\\���#99�_�FDDF���ӧ���\Zqqq�}�6���0f���]�v���EEEX�z5�L��Ǐ��͛���Ǹq�бcG���aժUHOOGii)���C�p��U�~�\Zpss��KOO������\0�?7nĴi�0t�Pt��Q!�4Vv\\�8::��n4455���hii�W�^x��)���1i�$̘1�_��˗/Q[[������=��WNN�\\���������H���8�z�\n\'N����>}�/^��͛?~<�F���;v�@dd$Ǝ===hkk#88�B�n�8����e�j�.\\�sc2��g���U�������GCm3i��s�^�������,\0��ﾋ��ݻwG�= ���3���b��ܹ3g�u�2331m�4�3			�����;wp��%���c�̙022Bll,������JuZ��1d�	��ǅ���#���c����ׯ*++���0dee�������>�ϟ�\n������Q�F����X�r%>��s���!55\0���̞=[�:���c۶m����d��o�ܹ��xM�{Ϟ=ظq#rrr�d�̛7;vd��YYY��CE�8��=.mM�޽QSS��\0��ͱu�V���BWW}��EBB\n1w�\\̜9*�i��C�+W�$��aH|||�i+**����ʈ��5a��ٳ�\r�裏�0d���lXUUqpp s��mR���\\2n�8�0���a�w��E�!�Ǐ\'���l����	�0��֖����3g�$Ð��p6�^����=?��#a�L�0��D\"6|Μ9�a2b���,>>�-�ݻw��\"��̚5��{��!!����\06��ϏM���+6|���lxff&qrr\"ÐѣG��vrr\"�\'O��׽{�Xy۷o��W�>��/;�rjjjȿ��/�0���\"yyy�\Z1b����wqq!��{*R^�d(Z���l�ԩSImm-��=zT�>���+a�|��l�((( C�!Ð�/.�ˇ�zɓ�H}�\'C���ſ���=\Z���!E�.6Rԟ+�ar��\rB!yyydذad�ʕ�&���_���q������\rm�h^�!�LN�>�ʹv�Dܘ1c�0���In���TK=\Z#\'\'G*��˗��\rˑ�>�SSS�����/+?((�\r���c�׮]ˆ+Z�\Z�j����TVVGGG�0�߿?)**b����GGGbccC!Du>M��] ===�a��\0�o�\0���BCC���#\0\0��CPP�����}���`�������s��!�7oƑ#G����;v��𕗗������%fG>��C���A__���WUU��/\0lll \nQUU���*v��������Ͷ�8�K����0y�d����0\0����ٰ�?���ݽ{w���\0p��-6���N~~>��ߏG�!44���;g��Q�>�����Þ�MA`` +�������5j��XU���� N�A=������4h�?��s�\"==&&&��o\0\0�}��ʎ�TD/Yh�>s�oE�5L��=TU?�����b#E��S�Nطoڵk\0ظq#�|>���[t��۷oWj\r�����u����ﲲ2��=z�\0PgK�}Uͩ�ꆋOi���q��#^6={���#� ;;<O*�+\0\0t�ܹɥz��g��=�mM���1q�D\0u3ȡ��l����~�!:u��u���,4BFF���WWW8::���%%%\0���qqq\0̞=���G�N��<BoٲeHKK���6�l�mmm�߿gϞ\0�����ؿ�V��ݻK����������󗚚���R\0�իWagg��ݸq@]�Y��l��\Z��w�e���������\0��4<U�����$)y���3f� \Z)����Q��Y�f��\\X9AAA\0�y������rh�����[5|���;t���L���A$aƌ���!�ׯg��UIcz�B�Y���[y\r�jU�eh�f4D�������o�P�m�y��!>>Tى7�6������UUU�iTY7Ս,�j-�Y�wj�Ν+W�q�ׯ�N�D\"β��Ґ���n�QS�Mu�3E}��m�̙3���������p\0u����&���\0��,��/b���\n��޽;V�X�>}�`���le�g���\n�8�<D\"���l߾��ʢ~C���1,--��6�3h� ������o.k[*�߫=z4�.]*uO]]]�1i��\Z��[X�@\0��)��\0��///W�\\P�>��cff��?������>���ѵkWܸq&&&R�����Rg9��ڵ+��͑��>�B���acc���8B���Yz5D�Y�����\\fn\Z�vssC@@\0bcc���+�;�m�UMc6��k-m�2��M>\Z\"��o���Eý5��ӊ�\n|��HNN�@ ���	lmm���	kkk���ߊsY{ߒ������5666���Brr2���PQQ}}}���A[[�ݗ�&�tk��8|�0BCC�i�&xyy������p��ƭ~�/�ǃ��.\\�S�N���˨��DRR>��3�Sc\r���ƪU� �{�nx{{cŊ������ϱa�\\�z�=�@�ɋ����g^^���\'��P(�\Z�(#S��\ZC�q����x�!�ͦ�SSS���E�J9nnn�[���\0���#\'\'.��������k�.���AGG[�n����SlƎ��#G6�>�E����qAU�C\Z�\\h�?߹s����{ｇ��T�oM[���F6�������_~�%\n\n\n��{��z�ohh��#Gb����ӧ\0 22>>>Ctt4Ο?/w� ����|Yh���B��f�̙��PUU���(�������a��Y����[t�.\\�Ç����V�aÆ5����� ��ǣW�^���Bpp0���!��O>����x<Ν;���Xt��gΜ���-�|>6n�Ȧ���b\'&&*�Ϥ�$��o߾�҄��iFed*Ó\'O�ߣG����!;�X\\\\,�!�?��]�vj=�^��Z�СC���7o�dm�u	�*ʫ%�!**\n�O�������1u�T���`Æ\r�D?~<��ݫ�%-����Y򸠪��\r�.(�Ϲ�������G����l�f˖-\Z[�uS��q��*Jky��#�p�B���a�ܹ8x� ���Q\\\\�\'N���\0Я_?9r��9F�\Z�Q�F��Ü9s\0�u�O�>-�>�3R���5D��Lʴ5�&MbI����	����l���������\'!!���033�ؤS�L\0jkkQ[[+q]mm-<==�͓@�ҏ����s������~�x<lذUUU�ԩN�<�aÆ!88�.]P�櫾Q{��nݺ%!����5��ʟ��!�����X���)PU�L����>�\0��:ǐ��wNN�Q�4iR�ת�o�k�Q6E�������bm���`�����UU^-Q������oahh�cǎ����Ǐ#99...ؽ{�Z��(CK�g.�ZTU?E^��E�Y(⫯��P(�?�\0|��wlܗ_~ɮ�ni�]7�u���?�J|J]ϟ��*̛7�������KBB�Ν���\\�߿^^^�[�3g�`ǎM~�sذa��W�^�Mgnn�~\\699�=���`h���C����Ȉ]n���H���`ܸq��ieʺ-�f�� �V<���#33����믿����a����~�\'==���(**���233!�УG�9<DQQ������S:t�\0}���ڵk��������/�=z���a	HMMEtt4fΜ	---8������BXX ��7��ރ��!�߿___\0����A�Νѭ[7��oРA�~�:***\r�H�P���X�ܹ7n��ԩS!��e���<���\0�\Zccc<{�^^^x��lll���?�S�ă������X!//�7oFnn.�={���㡦�)))���Eii)tuu������r���;�.�����ɓ\'�=�---��ϟ�_�~��S\\\\,��ttt8��w������QSS���B,[����l|���� ���C[[����ܹ3tuu9��P(�+���)T������ٍ�<�{�F�=PRR���`�cmhh�^�z�[�n�r�\nbccq��q���\Zl۶\rÆ\rÎ;�\\JӘ-D\"��z5i��곉��\\����볮�n��ݥK��\0(UN�PU���\"m�6@���þ}�	��ڢS�N���BTTJJJPZZ���d���;v�[�@�������=z���\0����w����UϞ=ann���x\\�z��\'ӧOt�����\n�EM�I�.]�����ϟ?���RRR�c�������\Z�۷���LLL��)u<222�s�NV��ŋ�n\"\n�طo���[TUUaܸqHII��s�p��	8p\0aaa022����L�<y��p<x�`���8��>���P[[���P�ŋ����Q]]\r�P�Ν;���\n���J=?��J��ի�F�����!|}}QUU�/^`���R߯Pԧ)불����\r��Ço\r\Zc�ĉصk�|>�n݊��H�D\"���b������C`` 0~�x|���DDD>|���\\TUU����G�������bC�����G�D\"B$�8x� ���PPP\0}}}����ƍ��ٳq��\r�Y�FJ�����맶�����СC���@^^tuuѣG:������c��������)���أ�&M��ٳgK��\n���񁟟^�x]]]���\'N����Y����1\0\\�|���f@��~�?���r��������ԩS�#����ϯѲS���[�W�\\��CTT�Ć8q��s��)|�ᇜʫ)������1a�	9������ŝ;w�p�B������GʪC�����Ғ���,\Zˇ����zm޼�I�4U��={֨��yٲe�����E�)]N�PU�h�\"m�\"m\0Wvtt�����ӧOc�������G�.]p��A��mii)����1bbb���իWK������QQQq�w�fO�Yp)�ǏcǎHHH���6�9s株�\n^^^���B�>}�g��}J���H���e)��颢\"�\Z5��Y���4���/�d�����<<x������ ����8}�4���)S�`�ڵ\n٩!��Fs}O��H=�|��\'��;v`ʔ)R�*�ӊ�u[�M(o��U�Vaٲe\ZֈB��fh�AQ�gϞ���?|�P�%��p��Yl޼@�~�\'N�7�r�8q\"rss!�{\r���e�&�:�R(J��[\n�B��E���\0X[[���H�P(d���;w�]_?f��ܹ���gϞa��*(\0�-�7:X���(�\n�B�mEbbb\0\0ӦMS�����c޼y�����pvvƜ9s$69S���Ɂ��>?~��7BWW�-R�|u���,P�(���p��M����x���Q�_ޤP(o>�͠(��ׯq��Y��ٓ�GE����իWQ[[�����[&o���c���+O��Fi\nu���=:��Fq��5:t���֭[�����$H�P(\0m3(�STT��={������º<x<���+++t�҅��cǎ��Յ��֭[��*���~ӡ�)\n�B�P(�L���B�P(\n�B�	,P(\n�B�P(����B�P(\n�B�	,P(\n�B�P(����B�P(\n�B�	,P(\n�B�P(����B�P(\n�B�	,P(J���M�@�P(o-������մ\ZjC(jZ\n�t�@�(�����ӧc׮]��5�P(��������())Ѵ*ja͚5X�j���4�\n��(��V�B�P(����ݻ�3f`�ƍ-rmC���|��7 � ::\Z_~�%ڷo��<J����ܸqYYY��������j�*M��*�{�.nܸ���\\�_~�����բ�RT�/~~~8u�ѡCj�~���������3ڵk�1=�A �������BQQ�9�ƕE1���!..QQQ�����˗[�Zq��������r�����ѣt��������0�����ݻ���ӴJ�8::���w�L�*��xyya����s玦UQ+�����lذNNN8r�x<�\n5U?M�\"\"\"?���O��={�@[[=]1u��:�����Ո���˩�\0tf����q��9>�ִ:�kkk���pw_\"ߘݚ��+�w�Fzz:&O�ooo���+-�M����p\\�t	O�<Ann.ڵkccct���z��W_#DO\0\0 \0IDAT}M�����\'\'\'���@$iZ�����_����x���A__fff`�|�	>��S��������HKKCHH�Jd�rssq��-L�>�E����\n�/5i�|4�*�������X�r��:��1[�B���X�~=,X�1=����>Ǝ���D����L.��B�???8p\0���t� ���1�����7f����ʚ5k0y�d8::6[֛��Ǻu�p��-t��\r����ݻ7JJJp��Y��� &&˖-Ӵ�*������055m2�H$RiG���7n�������5k����%%%HLL�ƍQPP�����JPP���[��}��i������L�r[:-�ٳgն4G��x<�����������B+����Νв\'%B���ժeB������L�x<��ذqM٭�k��А�@A�6�$�_��_|���t��.\\��<\Z\Z�K.��Ok�!ׯ_�������g�L�0A*]VV�9���P�����������prrR��\"����x��.\\� ��433����\r���r���V\n\njѷ�zzz���S�ܖ�GK�w����Q�>��`���J*,((={���ѣ���͆o۶M��@�9s���(//G�N�0`�\0�?ӦMc�UWW�?����/��Ҡ���>}�`���;v�\\=�m�6��|\0��C�p��!\0��e˰t�R�ܹiiix��%<==�������ҥK�իΜ9������#..��xx����d�|��\'\0�օnٲ|>|>������ĵk����C����k׮X�|��M��ECٛ6mB�N�p��U<x�\0����ܹ3fϞ\r������«W����0j�(l޼���\0���Ν�:v숻w�r��رc�^����VcSqn޼	��|b�֭���BHH\n\n\n`aa�3f���]����ǣ��]�t����.]�v2��[{��EJJ\n\0૯��z�>h� hkk��w�y\0�n?��E �ܹ�������46\\�	XqqqX�|9JKK�r�J888 \"\"ǎý{��q�F̛7O)=Μ9�[�n��ѣr�PO�0A�-���EDD������l`ذa���oe�ILLĉ\'�������<�R��ԯ������%K�駟��������ʂ��).\\777�������HHH@mm-����������Ra]���v�Z<���s�0`\0���k��z߾}{8_�5���ǦY�v->|===�?����������;w���+V�`��ʕ+l]i��T�����۷�����/0a��9s!!!��Ȁ��1�͛��K��ԅ��p�Usl����5k� //K�,��E�ظu��!..���8y�$��|7���	e�����+���Aie�6����	�0�a2j�(@*++	!�DEE�O?��0C���I^^�LG�%�GGGr��9\Z\ZJ���	�0d�ܹl�ׯ_777�0Y�n	\r\r%?��3{���]��������g�zzz���C��Ӊ@ `��!����?>����!��o����?����$,,�����+V�a���5IJJ\"����G�m��^okkKf̘A���Or��M2i�$6��Q��dϙ3�\\�z�ggg6n���d�޽$<<\\�\Z///�����d�����֖0C8ۭ�k[�MMfΜɦutt$���+�y�&���d�׭[\'q�Ν;	�0��?$��	&ӦM#Ð�#G�����ݐ��rbooϦ+))��.22��������~\\��cmmM�!��ϗ[����Jlmm���+�:u*{�k׮I�+,,$#F� Ð�7JĹ���y�׾4�H$\"�ƍ#NNN\n]w��y�t�R\Z\ZJ��� ���dȐ!d�ҥR�/^�Hlmmɾ}�Hff&)))!�=\".$ð���lq***HDDqpp �\'O&�\'O&����������իW�aȘ1c��ݻ�˗/IYY	\'���d��J�S$���j���B�͛G����?q������+y��)))!			d���dȐ!R�w��A���H,X@N�<I���HYY[/���ȢE�Tj?U棪��DGG�e���B|}}�@  |>�lذ�0#Q��Q�_�ت96���%111�a���?K���aHLLL��-El��PFB�uY�ݻ�0C���U�J�M*++���#a���ߟ�q555��ё����@ W�G}D�!�ׯgê�������`��$Ð	&�HĆϙ3�0CF�Ѩ����c;$۷o�����$NNN�a2z�h����D&O�L�{7����� �ٳG�6���:u*���e�ٸ�G�*l��������q��е>�l���\"���b�Ʈm\r6�E||<�v���l�H$\"�f�b�>|H!$  �\r���cӿz��\r_�x�B�nHtt4+K�Ϋ��|B�D\"���!����(k�p��q6����qgϞe�N�<���d�����U�֭[I����P(dÒ��H���ɱcǤ�>|XfG��ly�9�̙3�TUUI�gff����˷��\"���J����\"��ɠA��:J�?��V8p�0C�={&W���+���*�1r�H���ʾD���y{{K�+�/\\l%�6)((��7��F�`�E�-el��PTE}D����u�v.xl@���1q�D\0@MM\rBCCٸ���~�!:u�$WF�����P<z�@�F��� �߿\0PUU��/\0lll \nQUU���*v�������J���]��������ѣG\r\r���\02�����KB���d���ӓX�baa�����as��,���������\r�s�ѣ�:[�ľ��`Ӧ�����ɓ\'��ןFq��q6��?fw�ޝ�R�u��+�|7D|�Kǎ9�n�)+�)�������d���p��{�\'׳gO�wRR��:dff\0�M�\\033CMM\r���ٰ�~�\r����?��e7����Ա�ݺu���6�T�>}�����\\��\0>>>����Z*ѫW/\0u�X�Es�戣�βP&�;w�:���\0]�t���@��EQ[��&�P$߲PUݑ��+�����,�.G�zi{\0`�̙��?\0\0����:u*��=�Ǐ���...8u�fϞ�#F`��5j�	NMMEii)\0��ի�z���---�mn���ǘ1c���?���������o�Ƌ/X�����\\����{�p��B�555q�����=c[S6U�w�}��������\Z�����T6| ��у�g���$��\ZϷ8�7E7Ӫ�~���,❊��������]?XR��MB<x���$&&����d�׻��H���)T׸�V---�o�^f~�ۆ��\n��R��c�СR�I�k.���|�o�^��)�/\\P�MEV�e�J[4\'���N_oM�HQ\rmf�`cc+++$\'\'#**\n���GXX���%:J�X�z5�B!Ο?�H���(DEE���۷oG�~�$ބ�=Z��(]]]�>pdq��El޼B�ݻwǊ+ЧO�^�Z��DlC\'[(+[���D�6U���w�<Y�Q���91G��v��r.��~ꐯ⃨��	���|��͟��#|>x��)f͚�/��={����/<Ȧ+--EYYY�3���n���QoK�W�.���\n�;v,6m�$3��N5R��T�---��P�_��>�\r�-Uڢ9�WTu�zk+G�jh3��nv�~@UU���`kk���Æ\rk��Q<^^^X�p!N�:�˗/���III��� �!\n�4h���$E^^���PSSsss\\�p�}K�e9��B�M�6U�����D�.�m��[��,g����������ݻ�k�m��P>�KJKK%fJJJ���3B\\�޽;�������B�o7mڄ��D�={V��\Z�:�˫���W�-��t�_*)�~b�:��|(�/\\h�M4q̲*mќ�+��:}�5�\r��&�,�3i�$�R#22\0�����u�!>>�z�������1d�\0uK\"\"\"зo_v�@BB�ʿ�Ʌ��$v�oذar��(W[�M�ۦ�������ѣahh���(..�Z�R��]�vJc���O[_�|Yf:�[�|>_��k\r��������?���K�mmmL�<�_�f�Dɢ���o�f���������[�۷���9�={�Y\'��[U颫���}�\"))Ib���i?u�C�Bsm��ALc���ɿ�z��GZS�@Qmj�`dd�.7���@dd$ttt0nܸF�������\'���6���s��a��С\r\r��@qq�̎��M{�o�Tfs����2����F�Z�\nW[�4͵[c�ۦ�RQQ�K�.\0��vTgΜɦ			a��䰃�I�&59���|�\r�`>w�����R�۷W�\\A��n��P>�f�bg1%�\0\0������g����1b��=��̈́˖-C�n���O?�M{��%�޽���cǎ2�H�\n?~<RSS\'\'kC�\"�Ս��hii��PN�2�_�����Jul�*��|(�/\\h�M`dd$�=�z���BU٢��WTu�Hkj(��M\r��u������>��s���˗زeBBB�~��O�>�׿�\0X�~=;��m�68p\0QQQ�x�\"-Z�իW7zKKKv:�޽{���ąp��5��� 99�]fRSS�����ٳgl����\0�;���_EHH>��3v�guu5���QYY��7o��.((@TT���111l\\zz:<x��B�PJ��[��߱��l�������c\0u?���͛(((@EE�����7���gORj�n�]ۚl�w��AHHnܸ�E�!;;666رc�fѢE�[�;v������￱r�J���b������|6�oy�����탾�>JJJ���S�N�֭[���JKKѩS\'\Z\Z��~��/..Ftt4�潨�qqq��955111x�����cܹsyyy\0�N@��ۗ/_ƾ}���7\"..=z����_��\'O�D~~>������ahh�cǎ���,��\'������*\\�v\r�B����k\\\\\\����#G����ϟ?ǚ5k���H��aŊx��w��W_�ƍ(++Cvv6��ك�� \0u�����V7��ҹsg���C @ ��ݻ�����������Ç���Q^^���8��?���5�D����kjj�\\㮬βPU>�AQ�b+U�d̘1CXX***����_~�G��,Cݶ�Gs�����6PT�ic�F�\'�|¾\rݱc�L���u�������Ç������*XXX`���X�|9���ٴyyy8t�\"\"\"���]]]���C������ъ\r9v��?���r��������ԩSacc#�K��/_���5����[�nEdd$D\"lmm�x�b���!00?~<-Z�	&H�144Dll,�ܹ��J����/^�d���L)]����A���#N�>\rwww�sX��ݻѳgO�7���:u\n~�a�v�֭��k---[�Me�����mjj���2�x<����&M��ٳ�fq�B!|||���/^@WW�z��ĉ1�|v�������8s�\"##���+���A__�{����=��ѣG�����wttĚ5k�����\'wc�رc���.3���Mb�`XXN�:����B���pvvƢE�������Ö-[`aa��J|�X���r�\n������+t��vvvprr����u���8\0???XYYa�ʕ��x��/`jj�={������سg;��۷/�͛###�Z�\n�;wƮ]�`oo��lq���0e�v�nll��� !$$�|�\r;��ԩ���`ff���������������ɓ�m�6�u�}�6֯_���|t��\r������/++ï�����\0������vvv�5k[g***��� ��urr¯��\n\0HKKüy�  ��������رcͲ_=��GJJ\n���ؗ.FFF��󃹹9���0m�4�����N�>����/���M�J�EII	�lق��p�B0�Y�faԨQpqqA�v�~�z0�t�e���;wV�O(R����,�t�R�`\r}}}���.\\PI>(��67X�g�ĉ���EDD��N��PT��`aժUX�l��5�P(\n���hsː���Ϟ=�ԩS�@��F���P(\n�BiH�9:5\'\'���x��16n�]]],Z�H�jQ(���B�P(\nE���������&¯����-��Z��ʒ����� 8::6�4#\n�B�P(���eH;v���.,,,�n�:xx,״J�\\�O���֭[����8E�B�P(\nEݴ�\r�\n�B�P(\n�q����B�P(\n�BQ:X�P(\n�B�P(2��\n�B�P(\n�\":X�P(\n�B�P(2��\n�B�P(\n�\":X�P(\n�B�P(2��\n�B�P(\n�\":X�P(\n�By�\n��V��C\n�B�P(o0k֬��U�PUU�iU(o!��V�By�{�.nܸ���\\�_~�������(�ϟ�ݻw���\rggg,\\�P�*��P���ڲ/\n>|YYY(**#GСCM�%��Çggg�k�N��P�B��E�xyya����s玦UQ8::���w�L�*i�A�aܸqx�����4���iI_mʿ\Z�E$��9s&���0m�4��Ky{i�m]K��:�����Ո��m�K}\"\"\"��O?a���سg��i���z�WQ4Jbb\"***޸�SKKK8;;c����V���0�������iU�BK�jS�՘.k׮Ett4<���h���O�VWm����ҥK�V�M�\Zۺ������;v,���T&3$$VVV�ꫯ�-K(�~����m�6���@C\nE\Z���QN�>���2���iZ\n�QZ������ݻ�z�*���/t��\0```�	UBPP���1}�tM�BiE����(�/_����\Z\Z���\"+-�����ߟ.=��:�@�(zzzod�Oi��qv�5��<]�={�� ��i(���TA  **\n^^^���Ƶkך-�(-A��Y\r\rűcǐ�����jt���ƍÊ+�*ܵk�p������}��8p ���k������	���`ɒ%���O�����`dee���.������p��u$$$���vvv����aii�ޯ�����G||<���a``�aÆ��o�eƈ��۷�����/0a��9s!!!��Ȁ��1�͛��K�J䇫|y(z=[�X��r�\nLMM��+**p��q���#33�:u A�0m�4�?�n݂��\'����b�HLLĉ\'���������V��BCCq��	$%%��a��g�a�������Ab]�={0a�\0��e���C���#�x<��SRR�f�\Z���aɒ%X�h�n�:��š��\'O�Ā�������EZZ\ZN�:���p��|������s��m��֮]��BOO�ϟ��???���b�ΝpvvV�|��k�Wѽ1���,]�������ϟ?\0�_\0 99Y����6�6�*O�����ڵk���/�p��P~\Z����#77˖-���)N�>���D�������V��0�5������:]�x�.]/ ���{�a�ԩ�3g��z�����e�Y�ooo���r6���[��V�B`` CCC\0��Ns�v�\Z�a`oo�K�.a���2�6�JAnn.�v��P������O@._�LJJJHvv69|�0a�K����\"����ѣG����$$$��ӧ�!C����<B!$\"\"�888�ɓ\'�ɓ\'RTTD�����ի	�0d̘1d�����˗�������{{{�`��{�?�,]������@@***Htt42dY�t)�����DGG��uqq!���D >�O6l�@�!���Jɗ�\"�s�uPPY�ha�ddd�����d�����͍$&&���R���S���N�!G�%���D$��=.^�Hlmmɾ}�Hff&)))!�=\".�ҟBv��E�\rF���Hii)���\"�7o&Ð�\'O6j���b��G�!C����R�8�HD���KF�AJJJd^_[[Kbbb�0����+**\" Ð��B��>%kkk���L\\]]�͛7III	���a�ģG���Q�^$���d����ɓ$++�����6Q�|��\'�W��]���,]D\"���&�N�\"Ð��R]]M���%�åm�j��@�\0\0 \0IDAT��������y��yiN~�y��5�}�6qtt$#F�`����rr�����B���HRR{��}��mrUUqww\'&L �o�&����>��L�6Mi�����A�vG��2|�p��bmm-ٻw/6l���g��{���+(ʴi�ȅ!��={�0C�>}*����PB����0�ܹs�ҙB!��63X��� ���a���R�K`` 4h�Tc���c�09|��D�ȑ#ɜ9sHUU�Dxff���\Z!�lݺ�XYY����&�޺u+�߿?\n�R�uuu%����eee��ښx{{7)�1�\\�u=W[B�ѣG�\Z�cǎ�a�˗/%�+++���.��:푔�D���O�;&�����ƍ�a)�~޼y��֖���4�ǎ;�0��ݻRqnnnM槠�@��J�Q�\r����ʕ+Imm�DxNNa����/��������a���3N:�#�߹ȓ嫪(kE�K�.�r��i�0IMM���h�֔M�i+�/2�|��_#G�$+W��\n���#�&nnnM�h�O)\"�!{��%���$;;[\"���\'�g�V�>��bs�@�r~!�����#�eĬY��������U�>}JlmmYEEEd��d۶mRi��%�ooo���(�B�(J�ٳйsg��� 55�\rk߾=\"##�)I\0��񁝝���i�^�\0\0���l�� ݺu���6�T�>}��S�Maff���\Z��S���%�ХKdgg7)�)��^����HLL\0�eZ\0`ll����e��~�\r���r��r��1t��\r#F����={6�B!�_�ި��\r�\r�	ܿ�ƍ㤋��@��gnn�: 33S\"�9�Rtm~S���<U�����,ʴm�|�(#OU�����bff��c�\"..yyyM�U�Oqi��B!Μ9��\'J-3qvvƲe˔���|Q��*����ZZZ�r�DxZZ\Z?~�Y�f�a��y\\�r#G�Dǎ\0FFF5j�]����j���}�u��޽{��������f�,|���~�:fϞ\r777̙3R�=z\0:t�D8!@�Zl.hii�}��2�v���P�.��=<x���$&&���\0999\0���\ZN��\Z�ׯ_K�7W>���Z���\0�\Zl�ʥ��ppp�,h�=\"##agg\'5 �Euu5=z�Q�FɌ�����<��}87n���\r�#����`dd�!C�4��*�gCE�С��߫�^�PU}���tWĿ����6u�SƿT������\0���Ξ,�j�RV^rr2JKK%�T�ӥKV_E/���)���.F���ׯ��o�e��_�z����ӧ�VݾӐ��Z\\�z�ׯ��2e\nn޼���|��\'lxs����i3��޽{����طoN�8�#G����	_�5�P(--�P(�رc�i�&�r�;�\\�DRa�o��&\0�������ӧO1k�,|���ٳ\'|}}q��A��%u���W�z.�n777\\�p6l�Ν;ѻwoc˖-�ݻ7���Z����(++C�N�8ݫ�����Ν;��f<yL�>��޸s�>��#\0�͛7�����yڲl�,�rTi/qTY��\n��/eQuۦjy���:��ԗk�[_U�Ts�\0\0\'�QW[��<pAQ��={6\"\"\"�1c�\0�,�ϴ���4$**\n���=z�D���\r\rq��%��Bs����i3��nY�Ν;�v�Z���_8~�8f͚��g����\Zzzz��҂@ h�c�6mڄ��D�={vvvl���@l�|E�o�֍aii�ӧO���\rS�L���ttt0~�x�9s��\'�U��������\0���ˌ��h��td����ׯ_�G}���Jܺu?��s�׾)G���^⨻>��]Q�RU�m�l+[���KH���ڧ�#�>Maa��/�D=S\'\'\'t�����3f?~�@ q*�&|���˨����A�dƇ��C ��Ą\rk�3�BQ5mf�����QZZ\n������q��hkk�̙3\0���틤�$�����~111����hp[�|E��b�8p�\0fΜ�G�!22qqqضm����r�O���annΞ_���z��gϞ��EqRRR\0��R*CCC�;!!!�����۷Ѯ];6��k[��\\Ti/q�]�\0�讨)���6M��-u���X���{�ѣ\0��Ts�1��ũ�>��bK�3E�����Y����R\\�~\'N��)hi�-))�����\"99Y���ɓ����իW�kT��P���;������\ZYS���\ZM�4K�P���״�Hͥ>&Jf��L�}�L3LMAID#�A1@DIMD��e@�Y8�?�΍�\\`A{?��<�̙�=���{�9ך�5�����祽���hڴ)o��aÆ����ؿ�S����yyy&�Bi�Q�%�7��+\"��p��Y���\"����V�Sn����s��f�	|Ç�Z���mt����b������G^^�������\r\Z������&�,�SӬY_F5}=Y#vKϯ��o�����Dvxk��cccq��|��\'\\��ϩ\')���o��6Ο?_�dܚ��{Zי%����B��#22�Ν���_�<�:wd2o8����0888.�\0\0���:\Z7n��G�riO�7(�l�;Bȓ��t\0`Ϟ=���C^^T*��ۇ��t���sy&L���;b˖-ؾ};\n���p��Ư7/^������t�ܹ����{�.�ϟ���X\0�㼫�Q���-��9u]��\'N@.�C��A��[m̼��3s�L���˘3gΞ=���B�d2�[��{ì�`��O�4	��~�-Μ9���\"deea�ʕ�|�26m�GGG���ի�b1Ξ=���h�\Z�@tt4������#<|��7o�Ν;M��6YZ_%%%������_sʳV�B,=�*b0����z���K~�̩���[����T*�T*H�R�����۸v�\Z\n\n\n�����b֬Y���1x�`.��ϩ\'�M^�h\Z7n�)S� 22������Ctt4����j}���bM�ݪ�X��}�b۶mhذ!:t�`��\Z�ΪU�п�ڵ��|���+\r\ZT�ܦz����w�EZZ\Znܸ��?��P\0�ꫯ���Ç����ʈX]h-<R�ǏG||<�����/�cǎ���M�\"88�����Ά�����1r�HnRff&�\r�=*lԨΜ9���o�Vqx��q��I4n�.ĉ\'`0`kk��C�b����j�غu+N�<	�J�v��a֬Y���ǔ)S���u�����	�ƍ�����ₓ\'O�I�&���Ĉ#�;@...�駟�ꫯ�]~�n��ϒϛS��������R�PRR�^x]�v��ݻ��Н<yZ�������:t��9sХK���=��P*�X�n�x��W^�|\0|��gpwwǚ5k������q��Y��r����۷/>���W�ؼy3v��GGG��Ę�d���_�.@��B\"�`�ȑ�۷/;;;,\\���ZuX^jj*>��C�puu���H�R̘1�{�ѨQ#�>}��kn}=z�ݻw7ix��� 88����Ƿ}��U�Wչj�cm�����.�ҥK1h� ����oxKF���fn�[^u�Q����T*!�ѽ{wL�8��n��W�o߾`���������&L��>}���Z󜲤��~����&88QQQP(pssC߾}�����K~�d�s^888Tz-\ZEGGc���X�xq�b�s�\\�~ӦM�J�c���G�֭��/�`ݺu8p�\0֮]�~������-L�<999���A�ƍ�g��jՊ˓����#GB�TB�����cƌ�����\r]�t)��°u�VZ>�<�Mg�<;������_�ȑ#�ɡ�������o!�J]k鞶�aÆ�ꫯj;B�}��E��ݱnݺ��B��0$R�1���_���&����ؠiӦ����Z�6y��󪨨QQQ/K��5޹A!�3�,�:���999�/�3��? ���m>���݇=z�M�6�\n!�z�N!��W�g��}NNN�ի~��Wx{{���...(,,����q��a\\�~���5�������#�D\"�={{����������Z�FII	���QPP\0gg���B�$��@Ꜣ�\"�ڵ�ΝCFF������W^y���5j�B���ҥK��/�@\"���/��t�#!�2ǎ�yi���*N�<YKBH�E�B!�B� ��@!�BD�B!�B� �,B!�BQg�B!�\"�:�B!�A�Y �B!���!�B!Du!�B!���@!�BD�B!�B� �,B!�BQg�B!�\"�:�B!�A�Y �B!���!�B!Du!�B!���@!�BD�B!�B� �,B!�BQg�B!�\"�:�B!�A�Y �B!���!�B!Du!�B!���@!�BD�B!�B� �,B!�BQg�Bȿ�V���!�C�B!Ͻ}��aذa��ɩ�P!�B�B!ϵ��`,_�:t����ş���DJJJ\rDF!u��1�j;B��͛7�KsssÄ	j)��!--\r�O�����A\"��OJJBTT/m�����5cmZ�n��ۇ�� �3������_���cIII�D5%!��]�d��L���A����c�DEE�aÆh۶mm�U�lmm�����D���#88W�^̫�����p���ϰ��G�f����R��_�z5��������o�>$\'\'��ɓ�v*ۇ��dh�Z���SG��DO!ό۷ocȐ!X�p!>�����N�<y2|}}��7�`�̙�={�I��gΜ�X,�L&�����;ϟ?����\Z�ϟ�rj�N����]�y������ѨQ���B�<z�@yfH�R\0@Ϟ=��_\\\\\\�6�FSe�����]%%%���P��U�}����W�\\.Gjj*�\0P�T&yT*�mۆ�\"##/��r�e2�*�Q��a���x��׫�Ϝ�)�R��`����Z�������A$�~��ng�A�TVyܫ�ϲ�}~Bȓ���\0!�\\qqqhԨ^}��J�_��Z�Ftt4^z�%\0����ɓ\'C�TB,��ٳ\0�y��!669998�<nܸ�#G��ҥK�j�puu�ڵk��o�|Wzz:�lق����z��j���b͚5x��|*�\n����p����!�1c��1�W�{�\0\0-[�4�^N�8___4h�\0���P*�&y֮]___t���ݻ�I�Z�ӧO#,,��\'�Z-���1i�$̘1��w��a:tiiiP(x��w\0mڴ�֭[-���u���d9r�����t��ؾ};lmmq��A���o��d\0��C����\r��>DEE�ﾃL&C�^��c�^]%&&b��ݸu�\Z4h���t8;;c�ʕ\\g��X\0��By���!�q��t�޽ʱ�3g�D�֭!���\0�j�\n�\0t�҅K�8q\"^}�U���c�ܹ�����I�p��),Y�*�\n{��5��3g�`ҤI��������x̙3�ΝCHH�O�P���NNN\r\r�o�����8<~����������>���z9y�$\0pww7y�p��u�={��9\n\n\n���g�dA�T���			=z4~��lذ\r6�ƍ�P(��͛7G�֭\0���Ǽy�0o�<L�>��)_������S�0�|�d2L�6\rK�.E�n���O?�_~A���q��I�ce�}���Ƅ	��jѩS\'^]m߾��9Ə�3g��رcشid2^|�E�c��� �����,B�	�o�FNN�Y�^lllp��0�d�\\.�N��\re���Bqq1�b1֯_��`xzzbÆ\r����r����ݻw�G�\\��#�i�&ܹs�K۵kf͚�ut�ׯ��mۚ<�HLLD�z��^�)%%*����&M� 33����o��̙3�����D\0@ӦMyy\\]]\Z\Z�5v�n޼���`��޽{c߾}�łw�-�cݿ��Kذa<<<�m~�!V�Z��ݻc���\\z�f�0d�����5����\r�7\0�9��~��ѣ\\g(�����=��$K�By���!�`�|���T\nv,���\0��\Z��������u�ұ�j�\Z�����ŋ�_�~��0\0���(ml\Z������r���wϞ=&C�fϞ�+W���߿��J� ���;���\0xxx�,���\"??�ǏP:(mp�U�^=��-P:<����׹0�z��౰�n�u߯_?^G\0w�]h�Y~~>D\"�	����(..����ܹ3\0��ÇX�jfϞ��(\0@��s��j�b��A!O=Y �<̝�`�w,���!�y�億�t:��Ejj*o(Jdd$�����k���eONN\0^C�C�����ȑ#1c�����ppp�]$��:TF��#,,7n�Қ4i�Z\r�N�N�իWcŊ��-��7�)�d��`0����x��!\n~��wt�����so)55j�Z��,����ޘ��X/��m۶����t��R):w�{{{\0�O\0JJJ���e���.AkN,����Qg��L0w�P�!hڴ�ɸ|��d___^�T*�H$B���M�2v<�6p#\"\"���\0///���;wF׮]y��9s栰�!!!X�t)�n݊��@6��}�LLLlllЭ[7.�xw>//@�N���or��޽�ƍs\r`����޽R�^^^hӦ\rlmm!��0r�H^�ʞ�XZ7Ʋ�?�\0�������K��t�v�\Z���\Z���	��۷1k�,\0���9sݺu�����g�KM��b\r�Y ��yU�W`����h޼9JJJp��U��\n��I��R��D�ΰ�IDَGRRZ�n�)S�����=�,Y�I�&a�Ν8z�(,X�&M��W�^f�!��_����դI\0@vv6BBBx����\'�;Q���\n\n������\r\0�ZT�z�J�&ubdi��^�=�����F�;�������tb233�R��z������A!�@s!u^Uw��9�+V\0(�X��j���@�������HHH0ٖ��kҀ�㭿ߢE,[�+W�P��.�Z���(����ҍ���۷c̘1��0c��鼴��||��W�ӧ����a�֗��o��3Vѱ0�n���^�R᯿��`�	�i����������@��7Kb���B��:��:���\n���X�n�z�qL~�;�%%%����h�BJJ\n���L��������U�8+!!4I7�G��7f/�777����aH)))�m��d(..��ͥK���hL�`3�p��et�҅�@�q��j5�v�*��uT^��;��ۤh۶-7���\0�vP��������\0J�2��b��A!��:��:�ʕ+�֭4\Z\r���P(����{��aŊpww疘4N����F�AQQΟ?�)S� 11Qp8\n�J�+��=p�@a���ܝa�Z���pl��}��Ka0���å=~�7n����y�z�J��ӧ�]�9q��{�=�twww�D\"��ё�͸R���%%%\0�˗/�ѣG�j����D@@\0�ܹcR_7o�P�v���|�����ŋ׍q�����}#�V�k׮���>�+���X,F�= �J�s�N�\r�<��m�s�Kb��� ���\"b����B�L�0���\\ì\"K�,��1c\0\0���7n���\0\0\r6���?�O��>}��A��:u*���1l�0nyN\'\'\'�ٳ^^^�h4���\\.��`���6l��MV��Dtt4�ի\'\'\'8::bȐ!�:u*�d�cǰe��T*t��@�˺����\0ފ8˖-������\'V���������F��H$���+:��͛sybccy�����a�ܹP�T`�A$����h4�={6bbb ����\Z4cǎ���-Z�A�(}i������&WO�<>>>f׍�~�������:�6m� ))	3f��\Z����ػw/ڷo�-[�`���x��1lllлwo�ܹ�?��>t��\rC�ENN�Z-���ТE���B$A.�#00qqq������Z�j�ɓ\'cȐ!\0`Q,���R[��@y�0����C�ףe˖ܰ�L{{{�:�OB�P@.��Q�FN�J_�P(����F�G��T*y�sx����PE�v�\0\0 \0IDATPP\0OOO8::�����߇�����xy������OOO��K��ƚ��Q*�P(����\\�$s�B�-�Y �B!����B!�A�Y �B!���!�B!Du!�B!���@!�BD�B!�B� �,B!�BQg�B!�\"�:�B!�A�Y �B!���!�B!Du!�B!���@!�Bd[�BHff&rssѡC��EP]��Z�n�:dee\0~��7���k�.DFFB.����111�W��qϪ�}�α���K�,AVV�J%.^��\r\Z����.y։c��� �.HKK��ӧyi~~~�H$������K=z4�bq���,���8s��߿���\\4j�/��������\r{{{\0�_�0Ɛ���HTˑ�����I�����;v,^�ulݺժ�\";;}�Z�l����[������\\پ?�s짟~BBB�͛��_~�ƾG��\"33�f�caaaf}��t���w��!����puuEbb\"�����W�\n����\n\nBxx8~��g��ۣY�fpqq��W�^����\Z��\'�P(�駟��?�V�E�޽������Ϙ0a���������j������\r���59::���j�\Z������oذ!����T*ѳgO��_V]��+���u����_Fxx8�ܹSc�\0����Ÿ��E�Rm^o���+!���!�Z�n�֭[#::\Z~�!�������ݿ?\\\\\\ �!����\'��x|�ϟ��ӧX��U]���;�ϟ��S�b�ƍ�m�����d�J�h޼9�>b�����hԨ���,u=>k����\Z�,\0@||<\0�G�5R�Q]��+���u�-]�ӦM����!��k��\0�ڵk�j�uk�z{~_	�-�d��2�r9RSS1|�p\0�J�2ɣR��m�6,\\�U>�g�A��T����:����^�Gvv6��u:֯_oV���r�j��ʼ�=�26s���b�̙���0e��<���x��yi\"���ׯ�\\s������3f���R������3��\ZY���S�9�J�R8;;��)_�eUUfQQ�r9JJJ �Jaoo�.]�T��ْ�0o߭q\rT��_�^����8/E�V����`0Tx=��7*�9*,,��\"��{PS���</��!e�8q���hР7d���k����;vDFFz��m�G�V����ß�	�VgggL�4	3f���EEEaŊ���3����c�֭c���8z�(:���4(\n���\0�6m��Ɣ���c˖-����^��Z����/֬Y�^x�˧R��.�`0 ;;b�3f���#x�q��=\0@˖-+����\\|����߿?F�]a����s�DEE�ﾃL&C�^��c�^^s�g޼y���ENNΟ?�7n�ȑ#�t��Z-\\]]�v�Z���&�$&&b��ݸu�\Z4h���t8;;c�ʕ�ٳg��{|-�oK�[�%����=zp�oׯ_�@�V#::\Z/����	��\'O�R��X,�ٳgy�b�޽8~�8\n���#�D\"t����u��E,_���w�\r�T*|��\\\'z���7o^�ud��0���d߫�d26oތ��(��� \'\'^^^X�lڵkW�~�WPP�5k���ￇ��3���;e����h$\'\'�ȑ#����N��X,����akk����~�L&\0:�}�o�T*E�6mp��-lܸ���\0\0777|��x������{p��a����\\b�ΐ!CإK�c�����q���\'\'\'��ݻ3�B����D\"a���Q(��7�d���g�N�b���,<<���ߟI$&�˹�J���ٳ�I$�|�r�����Ν�6l��~��G�c���;w.�H$�رc,22�EFF���$����ֿv��9f0c�mݺ�I$�������Ǉmڴ�3�+**bo��/c�EGG�v�ڱaÆUYo_|�k׮�w�^�y���O?��$	ۼy3o�������&N��:v��ƌÖ,Y�._���������D\"aӦM3����`������⸴��&�Hح[�*�ϒ�kI}[��r-��1��ݻgR����lԨQ����$���,�����ϟ�K�q����e����?�w\\�p�I$�iӦ\n�M�׳/���I$v��q��jy�SSSY���Yhh(����֓5�g��?-��ʮ�s�α^�z��{�2�F��{�=�����t��{YK�.eAAAܿ���˦N�j����4v�X�t�R&�Jٽ{���ݻ�D\"a>>>��?d���,##�%\'\'��Ç3�D��޽˕U\\\\�:v�Ⱥt��/^̒���B�`�{��}��,==ݬ����k����!�����w��\\d�ĉlРA�<cƌa{��a�1��2�D�~��w^���T*�I��ׯg��edd��O�8�$	[�z5+((�mڴi��5��|�2�ر#�J�����L&�H�W_}ť-_����Ӈ�����N�8�k$mܸ����k�_~�^���<ֱcG6~��J�	���`���h�dcl�رlРAL&���߳gO6e�^�O?��:w���ܹ�K��?X�>}��ϒ�kI}[��r-=>�$	�q�����Y�n�؂L�IJJb��=z�K�w�{�7Xpp�I���P&�H��˗+ݿ}��1�D�BCCM�����J?Ϙ��gK�����9˼���ѢEL\"��+W�TY���C���y�#F�!C��;v,8p �����t:&�Hؼy�L>�k�.&�HXZZ\Z�v��e&�H?~��&�H��7���Ƭ��J���,�N�8�w�y666\0\0����P���c���\0J�a\0@�f�x�ԫW/���I�*�\nhڴ)/=..�3g���L>g0p��U�I�Z��/F�~�L&M���(}�o���ƍ�.kϞ=x��Wyi�g�ƕ+W���o�e�9sZ��4����8��ۣs�����F���d���p�c��Z-�j5<==���bժU�={6Z�n��ߡC�ܹ���\0ˎ�%�m	s˵�\\��������B����\'C3���_~��I~����)�8������T���!((���ֹ�-9����ϱǏ��/�D׮]1d��r��)�*�1��K���?F�ƍ�twww�aH��_�~����m3~��y����Hě�!�J\0���7�߾}{\00�G�\0����9��tBqXXo�&M�@�VC��A��a���X�blmK/�x��\r.#����ׯ��ÇP(����ѥK��PI�Rt�ڕ{�@y���.e���t���k&c|����W^�Сbcc1r�Hn�DEc�E\"�Ycq��cl\0XB*��s��ܾ[�?			��t�u���\n���N�:qi�v�BII	7ɳ,��2��W�9�ג�����Zr.���\0��!jL���C,s\r�s���ڵkذa�ಗqqq��������,�Z�\ncƌ1��g��ْ��^��Ç+\\����6gY�#G� //}�/���\rj�\Z�=�M&��z2�PG/99m۶�%�JѶm[�����7N�>��c��~_	y^ѓB\0������ݺu�Ҍw����s�Nt��	o��&���ݻhܸ�IC2%%s��E�~�����#%%*�\n2���Rvv6222УGūp��	5�\"\"\"���\0///������ܹ3,X���9s�`̘1P*�X�t)|}}q��	jʔ��U�	KUT*n߾͋����J��D�޽�I��F��9cgΜA�n�0��Xv|k��-)גX���!��M����ѴiS�U��wd��?q����ѯ_?�X\n����ZqF����7ob֬YU~�Z׳%�cu�]�\0^leݽ{\"������bݺu��� �ɐ����g� �}�	��o�P�x���ۛ����p��5�g�Z-+<�Ɔv�U����A�}���+!�+z�@J������lҤ	��?�!!!		�}�޽{&\r���Pa��񈈈@Æ\r�[)�����V�Y�łK:&%%�u��.UZ���=�,Y�I�&a�Ν8z�(,X�&M��W�^f�Q���i�ߥ��К��T*�D\"��j��m����L�T*�m۶��Yz|k���-���b����\\�zUp��qxR�Fֵk���+�>����\r���pww�ދ`0�j�*|��pvv���ֺ�-9���B�Xrr2\Z7n,8$Q���ʕ+�ٳg��5k��`0��ď?������c\0�˧�jՊK7^OB�8��)[RR4\Z\r�<0��%t�����^{\rmڴ�ҟ��A��X�����=Y �zj�\ZQQQ����۷oǘ1cxLcHOO����㫯�B�>}��_p�3��y	���������$���X��F���_*�1�[�E�X�lV�\\	��bu���(�3]���\\ddd�҄���?�?㓅�F��#!!���8^�����g���6��꜋B�n߾\r�Zmr7�X�OX��B�TV؈5w��Q�f͸�BHH���0jԨ*?g��0�|�?ǌ��h|xx8�j5&M�Ti<��\'N�<������&�-^�\0��BeדJ��_�U��ӧ�=����Bzz:�Ν[i]\05�{\0X�����uȿ^xx8���L���-���   ��M&�����׸�t�4\Z��c�._��.]����J��ҥ���c�q��j5�v�*�����o߮�X			8p�I�q�b�?�f��lРA\0J�W$00�Ν�I�R�1���P��䔔�;5)))U�-�%����^�z5����*c2��Ꞌ��+���oD��� &&�7_��������￹�MFZ����f�W0j֬���PXX�-[�`ѢEf=�����>Vw�˟c��Ճ�����㼼<lذÆ\r�dd0�t�R�;�§h�I�e�����x�_x������wz\n���k�?o��o���=\0���J��:�_�ĉ�����C$!((����mƕS�N�3������x���Z-\"##�;w������BFFF��2n޼	\0���E~~>RRRp��En���QTT�ŋsw��j5��ñm�?�ϸ8)w�(��q�F<�7vX*��O�>�>}z�q�5p�@����#Gx�?~�\r6 !!���RE���c�\0*�\\���X,F�= �J�s�N<��m��:B�Yr|-��޽۷o7�\\��2�\\K�Ŋ�+�����h4(**����1e��1�}��Ń���B�T���\0����6mZ��zy͛7�Z�Ǝ;��o�=��Z�3`��h�Wt\r���\"//ǎ���޽�)S����˖-�t�8����J�v�e�,Tu=	=�j��v�\Zo�Z-���O4oޜ�q����رc���o��/��S���~_	yމX�� ��K\"22\Z�\"����8t��l#P����>���0w�\\�T*0� ���鉈�h4\Z̞=111�Dprr���?\r\Z��c�����-���������\0/��\Z5j�N�:�Vo�.`���`�q6\'O�\0���z�����	���2d�N���A<v��l��J��;(�<:|�p���.[����GPP&N�hV]a�֭8t�\Z4h�V�ZA��!++����\n�Z��C�\"\'\'Z�vvvhѢBCC!����J�aÆqK9:99aϞ=���F�����r9����a�n��\\.G`` ���`kk;;;�j�\n�\'OƐ!C*����;h� �껰����puu�&�V��r?~lV����5jT*t:��������ۣ���ƍCZZ\Z\0�aÆ�������ѧO4h�\0S�N���+\n̘1ׯ_\0���9r$�z�-|���puuŢE��B��p�B�������&Ky�g��������}�ӧO��@^^�͛���4k�666ppp@@@\0���T��J�Æ\r�:�\r6��͛y����0x�`�d2�t:\0@�~�������,0����C��M�6HJJ3�2����w�^�o�[�l��ݻ���c��ؠw��عs\'\n�L����48;;�iӦP�ThѢзo_.���=���+!�;�,beYYY(((���\'QRR�������Mp�bU������OOO�҄e)\n��r4j�Hp���\\.�B����<<<�u<z�J��d=rsdggC�R���	͛7�x�3`��T�R��B�������[r|ͩ�����>������9�Z\ZkEc��￡��ѲeKn��L&����`�edd��������z<|����foII	ƍ��C�bܸqf}��Xr>Zc߁�sT.���ݽʎR]TPP\0�L�H�X\\��>���=���+!�+�,BH-:w�q��ދ���m���R�����- ��t�ҩ�RK4\Z\rV�\\��RG����������Q ��ZFO!���U�����J�;u�bccq��-���c׮]�K�By���@!���������K�\"!!��ޘ>}���D�Bju!�B!��=�B!�A�Y �B!���!�B!Du!�B!���@!�BD�B!�B� �,B!�BQg�RmZ���C �BH\r��!�Z������S�N�v(�B�!�Y ��dff\"%%��<��>���n��)EV����?��j;b���ܼy���xb�\\?��,1�XmA����4�>}������D\"�?))	QQQ��ѣGC,(�����1���$�D\"�2�_���S��k׮���o��/Zio��F���0v�X����غukm�Ĺy�&\"\"\"xinnn�0aB-ET�ܸq�G����#���k;\0�;f�\\?��\'�<�lmm�����D���#88W�^̫�����p���ϰ��G�f������INN�V�����`CG�R���?GPP�m�Vg:\n\0���;;;��j�������\r�ׯ�;v **\n\r6D۶mk;�:#11:�#G���P8�9f�]?�W�FQQQM�\\mu96BH�\'�<&O�___|��7�9s&fϞm���ę3g �!��p��A�<�1���Q�F~�N�����U㷖��,^�ǏG���k;�۷ocȐ!X�p!>�����Na������q�,=f]?�ϟ��_�����T��V�c#��\r�d��g�\\.Gjj*����y*�\n۶m������_~Y�,�H����W�]%%%��ͅZ��4�N�����둝�\r���1(��J�3�)�˫�\'�J���\\�0,s��G�A��T��\\R�\0гgO�>gN����&�)((0��Ǐ#++z��K�������vU�;ʪ��cf��/�P�6K��5Yz̄��N���כ��˜�������͉���n��!u�mm@y2\'N����/\Z4h\0ggg(�J�<k׮���/:v숌���ݛ�=**\n�}�d2z��;v𶧧�c˖-����^��Z����/֬Y�5򢢢�b�\ndeeaƌx����u�V����1���x�ږ��$&&b��ݸu�\Z4h���t8;;c�ʕ���L&��͛������˖-C�v�L�S*��G��W�Ĝ���NUpp0.\\�\0�����l��b̘1#F���y��=\0@˖-�8B����ШQ#���f�7\'�y��!669998�<nܸ�#G��ҥK�j�puu�ڵk��o�����ر��߇H$BNN���-Z $$j�\Z�.]�޽{q����jDGG㥗^\0���ߘ<y2�J%�b1Ξ=˕�V�q��i�����?��V����3&M��3fp���ۇ�{�B.�c���X�h��uP�ŋ�|�r��\r\Z4@HHlll�R���p\r�`޼ys�YE���Çq��!���A�P��w�\0�iӆ7�ƚח�u_Ul�ׯ��[;>BH�!ϴ!C��K�.1����c�ƍ�mONNfݻwg\n�����3�D�>�ˣT*�O?��$	ۼy3o[DD�߿?;w�3�1ƶn��$	���ye�ٳ�I$�|�r�����Ν�6l����|}}Y\\\\��$	�u��v��9֫W/�w�^��hc�����=z0���xq޻w�$&K�����Ǉmڴ�3�+**bo���I���Ѭ]�vlذa�\\�{�f3g�4+��1\'\'\'��\'��;�1cư%K��˗/���tv��A&�Hشi�L�_�z5��G&b{\0\0 \0IDAT�aIII\\��˗�D\"aÆ\rc�����1Ɗ��٨Q�����I9YYY��ˋ͟?�KS(��7�d���g�N�b���,<<���ߟI$&�˹��n�bK�,a���<y�ZuP�^�g_|��H$����L��򶧦����۳��P���+,�1�YE�����Ν�$	;v����d����z���eI�W������B�z�@�3,%%*��FФIdff��|��9s&��ݑ��\0hڴ)/���\Z7n\0�!	qqq��ݻѣG.}Ĉشi�ܹ�+���\0`gg��\'O��ɉ�=���Gpp0�=�[rU$��Ã��{��e|��X�b���k׮�y�9r����֭/�\'�׮]0�5k79�~��h۶�ɝ���DԫW��Ռn߾������X������!��~�z��/\0xzzbÆ\r��E\0p��i�ڵ?��3:v�ȥ�������D��gmllp����h�r9t:�i���+BCCM&�߼y����a-���*w.V���gcc��W���5�_�w�^���[��J�%Ǭ��w��طo�b�ɓ)K�Ӝ�˒��*6K����#���Y �v��	���;���\0xxx��������P���c���\0J�\0@�f�Lʊ�����=:w����̋/F�~�x\r\0���P�@(_����̙{{{޶�bժU���L��СC�ܹ@��/��]�vl�cW(����,�?--\rEEE���hҤ	��g��fϞ����J�ٗ�\r�z컥1k4\Z$\'\'cܸq����,�Z\rOOO^����!�y-\0(,,Dnn.����KOMMEaa�`�Y��V�^=�U�T*L:���������:�]y͛7\0�!y���ï��Z����+��~\0�`0��ի���5�o�����+�\r���[;>BH�A�B�Qz�aaaظq#�֤I��j�t:�t:�^�\Z+V���\n���Q�J��ܹ3�G>22���x��L�0$\'\'�I#G*��k׮�\r�]�v������]����NXX>|���@��6N�-�rN��\n��ߡC���b�ȑܘk�D\"������Ɯ��\0�N\'ؠKMM��`@�N�x�����]�N�8�z��ᣏ>2�n4���C,v>\r�_���B�P���G�.]x�I���թ!�x�wV�Z�1cƘ�\"AK瘔�~��cP�R�־��2��+�\r��q�f|����:�<�bbb`ccûC���\0���ÁЩS\'������w�q��&�U*n߾�Y�fqippp�����ww��]�v�54�������#�7��Ù3gЭ[7n�BE����wYw�ޅH$�x����\\΋����̙���B���`�ҥغu+1lذJ�5Ǖ+Wн{�*_�ei�R�\"�ݻw7�ol�opv��/^�T*�ʊ��\r�b�\n��q||<�6mj��VEw�SRR�{�nH�Rxyy�M�6����L&3y�7PXX�k�ZZB�:��Ѹy�&�s]s� |�\0�?����edI�W�����n��!uuyF�������5f�C9�������g�ݻ\'�l��e�IIIhݺ5�L�bV<�܉4m�effB�R��\"���d4n��d�3P:t�ʕ+�ٳ\'��!4,������d�L�4	;w��ѣG�`�4i��z�2�!U�}g����h޼��1K�RH$�����?�K�,���?&M��F�\ZA$������3y7EII	�^�*8n�8L�lc344AAA?~<\"\"\"аaC\0�V�\Z�R>��:���www���\0(m�Z�\n�~�)������%��~���#t\0�^_��u_Yl�����Rw�3?B�Aj�\ZQQQ����;۷oǘ1cx\r����B�sss�NP�GGG�a/�?�~��<��*\Z��Z�I�&�҅ޯ`n��1޺�-Z���e˰r�J\0���\'Q��#G�`Ŋ��3_A�\\�^����m���X�`>��$%%!44.\\�֭[_bw��m��jx{{�l+������W_}�>}���/��\Z�Ƽ&�ƕ+Wx�,���4k֌�,�������F�2볖3@��16�+*Úח�u_Ul�����R�Pg��gPxx8���x���aH)))�m��d(..�,H�Rx{{��軸�����f�4I*��K�.�owvww��L�z���€�,�myyyذa�\rf2	W��\n�Ɵ�������㔿[\\PP`�π�Ǿ���bݺuܪJ��ye�RRRPTTd�m׮]�{�.>�������Օ�/�8ǥ�9SRR���޸�K�.A�ј<�a������ҥ�ql�R>FKϻ�4k�yyy(,,Ė-[�h�\"���[r�\0���ƍP���ڵ��wX����͒�^�B��,�:q��{�=�t�җAAAptt�m3��T~r�q�u�F���QTT�ŋsw��j5��ñm����YYY��Ȩp(�X,F�= �J�s�N���<��m��:������ñcǸ��w�bʔ)���Ʋe�xe�W�$��8)w\Z(]�i�ƍ<x0�t�¥K�R���ӧO�O!W�\\A�nݠ�h����B���Lܻw+V����;�4�%un��]�|��w��R)�J%V�^�#G��رc8v����p��M�r�����hh4\Z����2e\nyu^RR�t��G�A��\"22�s���1N�-�%uP��͛C�Vcǎx�7��]�%Ǭ���X�������GJJ\n.^�X�������͒�^�B�c�`\'��I�������F��H$���+:č����X�{���0w�\\�T*0� ����_~�C�ENN�Z-���ТE���B$A�V#00��ѨW�������!C�`�ԩx������?<x������hԨ:u�d2�T.�#00qqq����Z���ɓyK����a޼y���A�f�`cc�?���/;;�F��J��N����=���{{{���cǎa˖-P�T�{�J%����\0���e˖a���\n\n�ĉ+=V&L@bb\"�1�Ȓ%K0f�\00+f�J�aÆqK�:99aϞ=���F�����r9����a�n���-[��?@��p\r��>��C,\\���waa!ƍ���4\0@Æ\r����ӧ�O�>hР�N����\0<~��g�FLLD\"������A�a�ر�����E�0h� \0��ݻ�z�j\\�p�7���V�cǎa�pss���ǹ�n���\r<�����>}:c�B�\'O������i��ei�W���}�ԩ5!�n��!�R\n�r��\Z5�d)�R	�B�J��W*����pww7��Ws���P(pss�������G�A�T����ڬ]�@i��������y��\r<x�Y�f!++���k����\r�^��-[r�Ed2���M�aVV\n\n\n���	GGG�������pss�}���㑗��S�N�H���`ܸq:t(ƍg��!;;������D����X�X�[���f�q�v|����:�򜋎�����R�Dҙ3gB&��Ք`РA���O1mڴ\Z��m۾G|�?���Y˟BFK�B�s����prr���p��}\\�|k׮}*�lܸ���;vl�������~?~�:\n�򄨳@!�9�����Bܸq���\Z���h�m۶a���ܘ����jq��-<xgΜ�֭[�z灹N�:���Xܺu���صk�\r_#�R�:����������c�ȑh׮���QPP\0�R���~����܈�ܻwk֬A�-p��Q���+V-��ի�~�:����i�&�U�!�T�Y ������#33\"��7F˖-�~�\0!��\'�,B!�B�-%B!�B� �,B!�BQg�B��g�㚺����Y�8P�jk۫u�E��:��Y������w����U�ƅֽj�U(Uq\"�QdhqRAV#,����/�r3n��~>>r��9�{Vrnν!�Bx�d�B!�&�B!�^4Y �B!���!���d��RI�d�By����Ϙ8q\"\n\n\n�\n!���!�TR;w��\'�|�>}��{��P(j�_�|���8+EWy�Rw��ń	Я_?����̑Un�1,_������􄣣��4�\r��G��LH�˗/�m����̙3Q�zu+EU���Q�F�Y�f�pyyyHKKç�~�-Z����}�=��ѣ�����accc�c�y�&\"\"\"���\n\'\'\'4k�=z�@�֭-����PTT���$����K�.\n\n�P�#==�ϟ�?�����,ԩS�\Z5���<<<`oo\0���X�h�����w�a����,m�bY��!U������q��)�ݻիWG˖-i�P����W��m۶�Ν;hذ!\\]]Q�N8;;���۶mӸZ/��ի���oƨ�լY...���ڵ�ھ���d2�=�jҞ={�Q�F��~�q6lڴi�?��#G�DRR��c0�agg�T�.]�X ����/��ӧO�L&C��������\r�ĉ����:~ݺu(,,��ӧ��(\0��\rB*\0#�TI��>�:u��è��ܹ�8�c����ƾ��4֦MV\\\\lTڗ.]b>>>���י3g�q,\"\"Bm�B�`YYY�_���4֭[7�{�n�};w�d�\r��8�QG�eǱ��x3EU��^�ʼ���Ν;y�/[��\r<Xm�L&39_k�ABHŠo���<y�X///�}�^������\"��\n���!�J��1��Q(�H\0�W��ԩ�u��i�FFW,���X�n��+���\0���#==\n�\"�����С��1666�Q���4�֧вߺu+\0`	\Z����лwo����X,�z��r`��=/�Hpgr��n��DDD`�̙���/����{L^^>���mvvv&?ɐ��Uwe���2#�C������.MY�n:�T���p4j�@�R��>�b����p�ZZ���ؼy3�_����H�R���k֬����^��~�Au<�qذa���cƌQ-��ի-ZdP�J�۶mÕ+W �ˑ��wwwb�ȑj�>�\0ТE�����\r͛7��goo�����m3$��G��ȑ#HHH@FF\r\Z\0hٲ%��������<�ݻ\'N��\\.G^^\n\n\n`ccOOO888\0\0.]���~�	)))���Ǝ;��III��M�p��%���\"33m۶Ŋ+ЪU+��Mdd$\\\\\\x\'[�ǏG͚5��(��d׮]��������D�����D׮]u��T*�ٳgq�����_��dpqq��)S���H$����US�~f�6�T�_9;;��_���-$	Ə��o)�ׯ�̙��FVV�����O�>��Ox��y����+7�}���[g�Ww��:\"�X�U�� ��/�`:tP[B���+���˻4&55��mۖ͛7Om{hh(�ӧ�x�\"���1Ƃ���qlϞ=�1�JJJآE��q�̙3\Z�v>|��{�=v��Q��C�e����t����6n��^�z�c,??����C�8�g�Z�bÇ7��d2���d���ն?~�EFFjoh,7n�`_}��8�?~�������0v��}Ƙq�����˖.]����Uۯ\\��8�c7nTm��l�����8�i�&�t.^�ȼ���޽{YQQc��0///���VwBʞ��ѣ�q�رcz�c�m۶����W���_��8�c����r���`��>�7o;}�4���b�Νc}��aǩ�/c�=�\\�]2f�6\\VII	[�p!�8��8qBcYЃX�֭YHH+))�Mc��U�V����Z�)��܄�q]mА�ZG��eH�TA�o�F�N�Ԯ�����ɓ\'\Z7��OH)..V���s�⧟~�|��������U�m۶U�����]�v�W�^��������������5k��)-5j���o��nݺ���jժa�ĉ�QLL\n�ι��k֬�]:ah,ݻwG~~>���1r�H�#7۵k�*#!�����3˖-C�\rT�rss�/�ruuUSv��[���_�믿ƤI�T�D�j�\nDJJ\n�����6�%/�/���<{���8�q8p\0۶mÎ;�����nnnx��wu�C�z���~�	C�A�Ν1h� 6�����H�4,Ն˲��U=-�z�갳�Sۿw�^���C�������srrp��it�ܙ��3m��Mh�V��֝�:\"�X-C\"���v����ǻ���\"�L�%K��w��\Z�dee(�P��\\�����vlTT.]��ӧO�nBB�j}~Æ\rU�w�ޭq�g�ƴi�Ԗ�\\��r�J�\\�%%%���prr�}������rܹs}����WH=0ư`�4i�ӧO�={{{xzzj�Sv{aa!���kt��C��H�iӦ\0J��#�|�����P(��?�ҥK�r�\nƎ�/���j�2*���d�Z�\n_~�%�z�-�c۴i���`��\0\0ժUCݺu5�H$ppp@�ƍն��_��m��7�x\0 �ն?x�\0gΜ������ϟ�L&3�!����>�-\r!u\'��!�E�B�����}廢wwwՇ���0$&&����Xo\0j��>H�����o���������M�M�6�����1c�Q�F��<�gccc�D(-��\r�֑��r�޽����Rkh,<���M!�p��Eܻw�ׯ�}�ddd$<<<4��D���T]�>s����1w�\\ޘ��PԮ][���2d�����Ν;q��Aܸq�Fݺuǵs�N(\n�1B��ڵk���We��r���\"99�v�\Z:t�q_B��,ن�S���U�Va�ر\Z��b1�,����>�-\r�u^G��IH�\Z5j�M�6jۣ��иqc4i�Dm��Jx�����ppp@۶makk��������W;�Q�FpppP� �o�>8;;�����t?��s�;b�˗/G߾}q��I�˨�����S[faoo777|��G��14m�5%!�p��I����>9(##���\Z��D�Ǐ�m?w�\0�������ӧ���Q{ڏ�ʾF�\Z�>}:BCC����ϟc�Ν��b������ԩ�ի�7_�r\0���8|��W�ݻ7�n݊��8H$���h������t���)��7Y�Ç1k�,��U��L�P����>Η�кRG��o�bn߾��;��+V(�s��岘�n�߿���zK�˳��A�f�T$��ӱc�8p@�*��t���l�2L�2�������1�|4l��������~\0:��ch,\"����\Z�@x=ܻw���7&|k����~u;&&\r\Z4P-�)K&������ڵ��9c�>33����S����z���o���ѣ��?��+99�o���ּ��CHH,X�	& 44T�D&哧ʗ%_WdvttD������	�tB�j�*|��pqq��Z����$�*<_���q�4^�|ip�	�#B���7�T!�?�X,�xC}��1�R)<<<4^���(++�w�.-Z�P���ի1~�x����S{�z��ͱb�\n���\0J?��B��+\0���ܷo��X��m�*��L�X��J���+(\n��檭�/�ܹs�J��2e����3w�\\�Ǿ*���\0\0<==�%�H\0��vY�rrr��7ߠgϞX�p�ڣ[###������۫����\n݆�6m��,��믰��������կ_@�#�dee�ŋj���WP2���ah�SG���!U�����>��,咄�W�\n�_���N(]C���cA?�ԢE��b���\">>3f��8��t�޽��\0TOK)�377W������5kƻ͚5�\'��%>>R�;v�MWH=������Ϟ=S]%V��d����z�B��ժUC�ڵ5nL���l�_�ÇW-uZ�e���!**Jucny����;|}}ǥ���5��ʗ�͛7QTT�q5�1�[�n�C�\Zf�~_�RmX��M�\";;yyyؼy3/^lз\0P�lJ��s���ŋj�ʗ[Y��q�4�;c�b}4Y �\n�p�\Z6l�q����Exx8�������˗/������\ZW������|,Y�DuuT*��ܹsزe+o�-Z��L&òe������nd�r�\\uE(}rΆ\r0d��_+�D�ٳ\'*#��\n^^^��d���GVV��ӑ�����0>|�&M�Ç�>�2\'\'qqq�z��j��z�HuQ�\0\0 \0IDATի�������C,#77aaa�1c^�xa��\n\0зo_dgg����mO�>���?<<<�b�\n�ʾ��7o���ϟ?W�����`�ʕ�u�v�ءZv$$.wwwxyyA$!88X���IIIزe��Q�rP�hح[�PPP\0�L���0L�6\rO�<1�~�2mX�7�xR�;v�@�n��d������8r��;������ׯ�ݻw1z�h�vm�Gɐ>Η��u\'��!��\r+I�R)=|�#F�@`` ����}yyy7n\0\05k���ѣ��={���S�NŴi�\0�~��;w.���Q�Z5ԪU���:t(�N���X�۷oc	����ҥKyc44��Ǐc��͐H$��\'��1b�M��veuŊ8p�\0,X�ɓ\'�,��?�			�+�xxx��ѣ�c�r�\n����-:u��>�>>>F�CFF\0prr1cУGL�>�����ŋѳgO6�����d���C���dggcΜ9�~�:�6m\n[[[888`ڴi\Z7t9��bcc�g�\\�rիWG��͑�����|\Z4jk������;w.\"##U�=��o��>�СC!�J��CQQfϞ��ׯ����j���ѣ1`�\0������\r�/���|}}!�HP\\\\{{{ԯ_�������H�����X�h\\]]q��	����:�t9]PP�9ggg���(..Fjj*8�����1l�0��V�)\\����4��P:�1���ߚB*�,RE\">>gϞ�����~��={����h�BuU0%%����k�322����:u��ް[�L&CRR�4i��ѐ�������������͍�VAA�b��%E�bH,\0������,4k֌��݌��/^���͚5���#JJJ����z������X,Fzz:�ׯ��C����G.��ŋ���Cݺu�����B�R���777��<h������\\UY*\n���?puuT��lú(\n�7Æ\røq��VI.�#--\r��j��o�a��G��qm�;s�!�b�d��JN���ӧOc�ΝF=W�R9mٲQQ\"���/���A!�F�N%��r�\n֭[�-Z��~�����C\"��ɡC�p���8q�&\n��J��Y �{��	\\\\\\РAk�B1�ӧO#\"\"��7�s�N�G�BHeA�,R��l���!B��Ν;������6n܈ƍ[;$Bщ�Y �B!���Y �B!���!�B!�M!�B!�h�@!�B�E�B!�B/�,B!�Bx�d�B!�&�R�L&�v�BH�@�B)#\'\'&L��\r��Uф�b\r4�T>4YxM�|�qqq���0G���Ν;��\'��O�>�޽;\n�I�VT�%33�&M\'Oо}{�^�ＫZߓH$@HH��C��*C�,�Z��l*{�ݽ{&L@�~�Я_?��s�NL�8�&��\rc�Y;�������?����V�\ZfΜ	[[[նG��̙3��5j��c��ѣG=z4c��>lll*4��f����{�.�̙�&M�X4/sԍ�4��򐖖�O?�-Z���L	���6�Ç\Z\Z�����\'N4������<y2j֬���͛77�u�λ���gϞ!  \0���1`�\0k�S)U��VT��]�T��+**BRR���ХKY<�A�a����7o�E�\"��o�{{{�;w۶mC�j�вeK��\0��۶mCVV���NLLd2F�])���ѣGضmΝ;�\'O��%�իW#??�w�9�FH\Z5kք���b1�v�jT~�H�����Q�v�؁K�.�f͚x��\rz�\\.ǬY�0b�9r�������R�{��&O��ٳgW����>ei���UU�}WFU��agg�T�.]�TH~�~�)<���L��G�H��x�b�qKNN�z̺u�����ն)\n���e���Ə�����8�cǎ39�K�.1���Q7B�8s��8�EDD��oE�m�G�1���޽{�V&�����*}/??�}��l�ڵ�E/}}��*S���Ҿ+��R~G�eǱ���\n���˗��8v�ȑ\nɏ�G�,T!�7\0�����ONNƾ}��d���666�Q���t\n���!�JuS\\\\�����iii`eV��z�J�5����OH`J(**2(]!������`Ĉ\0J�����X,捻���֭�y5F_�4��󑞞�B�H{{{t�Ё�XƘ������Y$��Wq˶Y;;;�}��6��Ս��S�8C�r[�t)���1k�,�q���,t�0�O	���1���MH�\0��߲뿕�����ڷ�20���k��r�ֺ���3h���8���9ޛ��{\r[D\"\\\\\\�q�Iq��_www��� **Joz�bT�v\0�p����>����O=z4�}�]\0��K���O?!%%���رc��񉉉ؼy3�_����H�R���k֬����*��+W\"55���5j���p��0�� \"\"����|�2���q��1ܼy2������?��nݺi�lH@�M�۶mÕ+W �ˑ��wwwb�ȑji>�\0ТE��677k֬�֭[���;;;�����h�ڵ��7����������ڵ+�=�#G� !!4h\0�e˖\n\n⭛�W��~P��q��<���3f���^�z���[g����a�޽8q��r9���PPP\0xzz���Au�T*�ٳgq�����_��dpqq��)S�q�B�,S�|\"##Q�NU�fݺu8t��R)���ѨQ#\0�k�?��3��b����F��������S���͛		���5&LB�J/dlڴ	�.]���-233Ѷm[�X��Z�R7g��c��>�dH[3&}u*�OZV���W_}���Hdff��?�āp��q�Ɂb�ʕjX\r���[hS���ሉ���c����b���c���^�:>�?��Sunذa�駟4�	�S���+?K�#@�x/����j�ԯ/[r\\oڴ�꽜T��J��8�c���\Z�D\"�޽;���Um��l�����8�i�&��CCCY�>}�ŋ�\\.g�1�8�c{��QKc��݌�8��?0��W_���׫����a�\'Of�ڵccǎe˖-c�n�b������Ì�86c���\r�!==������7�W�^1�J�M���C�8�g�Z�bÇT�˗/g,P�ݫW/6u�T�c�m������\"##Uۮ_��8�c��7c��7n�����qǎ?����XXX����\\��MII	[�h�8��9s������C��{ﱣG�2�L��~���Y߾}�ҥKYzz�j��+W�ql�ƍ�m����g���c�O�fQQQ�ܹs�O�>��8��M�1�Գ6ݻwg3g��{ܫW����/�r���Tֶm[6o�<��[W��~�ԉ)�P(����ٔ)S�cH��1v��E�������ˊ��c�=x��yyy1��l̘��O1fx[3&s�7�eeJ�޿�M�<��mۖ͜9��?�����Ǐ�Y�f1���ҥK�ej�Z�W�~~~l���L$��ϟ�]�v1�㘏��4i;w�{�����a#F�`Ǳ�O�\Z]W�����t?:�?�\\���ԇ��wԨQlȐ!Z���E��*D����S�.��و#�������P�q���u��-֮];&�x���oԶ�<y�q�V�^�6)��Ϗ\r0����h��ڵ+���W�&$�~����ٓ)\n�c\'O�����c6l`�����x���:w�6H�9�\r:T�����3OOO�����7n�`={�T�6c��k����СC��8\Z\Z�q�ܹsY@@��4�?κu�ƶmۦ�FHH�8�ݺuK�M.�3�D�q�u��q�ŋF�m�z�#�~���֩S\'6�|�}���gǩ�\'�����~�ԉ)��λ��x#\"\"X۶mYHH�F\Z�{�n߾��]����>%t\\3&s�7�eej����cÇW}�S***b]�taݻw7*/Sڷ�20�n�������Զ3��؜9s4�ݹs\'�8�%$$�����~$dla��~���?��#���u?�Xt�B���[[[�{~��w888�~�	{{{xzz(]ǹd����^^^j�fee(}�d�4��矣V�Z\Zy!&&>>>��J2�R�͚5S�&$����\Z�v�ޭ��d��ٸ}�6F��\'��/_��ӧ�A�������X�����U�Va���x뭷���i�������r9�ܹ�s�|����t�|�QQQ�t��.]�3\r�,X�&M�`���\Zy*�O�ͳZ�j�[��Ʊ��{e��m�z�#�~� //�w�{dd$\0��S��t�n�~���r;{�,jժŻD��x���_�cǎ:t�F:M�6\0ddd��	3\0�}Jh[3&���fLY�R����޽��������1*/c۷�20�n{��\r777��i�[NNlllT�}��)���WQ�H��hޯP�B�@bb\"�x�\r�����=U���-\Z6l��AR*�b�ƍؾ};��D\"<==aoo\0Cbb\"�{�=�u�111\0�1\0�D\"t��Q�Fyw��Eqq1��@.������ڴi����3Fu�D���J666jk%�9v�����駟�mwuu�T*EAA�j=�Ν;�P(T7@�U�vmԮ][��=j�|�\0�����|������?�7��i\\�x�������y�Cdd$<<<x�O.�#66��������k�СCՇ�i[���z���X�bwww՛��eZ�n��%}u_n�1\\�x=z���ۆ�{��$\'\'c�ܹ��(�Ǘ=?�c�r��>%���?`z3��L���S�_��B�2�}-s֭���{德�~[5��Sh�._~Տ�[�q��_�\"�����^�B�6mtG*}�P�4i�D��֭[ѯ_?���{\Z�J$<~�Xm 	\r\r���ڶm[[[�����?���iiix����t赱�A�Ν5�)?��<�����c�ر��X�|9��틓\'O\ZXb�eeea�ڵ?~<RRR�����W�zu����Ο?�N�:�^�zz��w���n���sppP��}�����~~~z�8y�$���ѻwo�<322�����g\\\\���+���[�nE\\\\$	RRRLJ��������ܹ�A�+���B�ƍ5~tOy���2-_7Bۏ�u_nϞ=Cvv6��!$�s��\0��}��O�>����ړT����\0�}Jh[3&s�7c�ʔ~!�P�Z5t��Ic�T*����՞�dh^��o�e`L�����j��������bܻwO�5B�ڿ��RE�#!cKbb\"���+|\\�y�&\0�gϞ:�#��Y�b\Z7n���(�d2��� $$!!!��*;Vv���>�z�-���������,p�{eTy���2�1���cٲe�2e\n������c���hذ!���\rJ�Ϛ5k �˱g��ٳGm_aa!��+�o��&^�|	�Db��|�D\"��.��n��oF�5k��,���cǎ8p����4�ݻ�w�y��ە��k\0 $$,��	\Z\Z��5k��)@e��vE���Ǐ�����\n*cIIIx�7�P(p�����O�8��H��7�Y7Bڏ�:�/��O�\0�����\r\Z�.Q��d�}�6�v��!J蘡|��>%����9��1eeJ��Dx��x��B���a��eJ�Z��m�:ux���6W�GQQ�Z�grr�����T�H��b�q����x�w.Oby��B���YYY���1{�l�A�_����u9��4�~��\\3�w����w����gh�1��67o�+V���?��t�2�_��S�N���ø|���?�oU(�Y�H$\0`P���B�WPjѢ�*�իWc���&��(b�X땭��srr��7ߠgϞX�p��C������ޅ�\rTl=��&�رcX�r%�҉�T*ո�h�9\Zs��t�n7���S�M,���ˆī|�{����Ν;�T�)S���3f��SB�5c�L�oB����-,,DLL��1�={�������༌m�ƴsխD\"��G��ܧ��m��8��?��iR��w�|�X�آ���\n�ד����?�Xo���d��Q�/�DHII�١D\"��Z�ڵk�������H$B��>]ךɸ�8���k�34��w���\Zەk��_����5�h�r9�/_???�W.���W��ׯ�:\'}���!�JѱcG���ՍR�- ����x̘1à4���aoo�gϞ��XP��&\"\"B���7o���H��c�n�B�To\nB�,W�|tݯ�\\n6q�D\0����W�\n�_��v��1�\rh֍��GH��Zn���[�eh�ժUC�ڵy�$;;�ׯ����Ֆ�3f��SB�5c�L�oB�����w���Fjj*���;��2�}�^�U�ʫ���Dx��U?�q\ny\04˯\"�����l��_�����-[ШQ#�e�ĺh�P�(\'?��3�����)J���������X�d�j�/�Jq��9lٲU����T�x�B�M�\0t��,���\"#E������Tm+,,Ć\r0d����\"�={�D@@��X�:���T��V�|�P^�www���D\"���U������-[���I<|�\0P�zu��� ..W�^U��V7J-Z��L&òe�����^�іF�^�������b����Ì34�R�o�n�BAAd2���0m�4<y�Ĥ��Գ6�o�F�N�PTT���ddd��˗x��9V�\\���뫞���3���(**B~~>._�DGG�|�|uch�R\'����fy�	���޷o_dgg����mO�>���?<<<�b�\n���3��)!�1����	-+S�Wy.-[�T{��u�p��Q���/����˔�-�\0��-߷�2����3�������d�~$t��_�츞����\'Ob��V@˳a�/��J-11���1x\0��vذa��̄L&����7o������@*�b�ܹG�j�P�V-8::b�С�:u*�֭�F����$������	u��A���U�(,�H0|�p�c�jժ�ݻw�m۶(**~���t��rԪU�ׯWݸeH\0p��ql޼��ڵP�tbĈ�6m��DiŊ8p�\0,X�ɓ\'�X,����U�W͚5�i�&��FcȐ!HIIAqq1\0�O�>غu+���1w�\\DFF�z�갳�Ûo���>�L�QwW�\\A@@\0c���E�N���g��S�N:�F���ۘ0a���4���~322���X\0���ƌ�=z`���W�/^�������g�����acc�Z�ja���0`\0������ŋc��\0 (mK�sy\'NDtt���Y�e˖a�ر\0JiwܸqHHHP��ѣG#  \0={����3�N��iӦ	:�={�Cڏ�:1�܀�>ܽ{w,\\�P�i`\0n���٘3g�_���M�����6m\Z>��#���3��)\0��5c�o߾������L�\0����������������bƌjk�\r�K��c���dH�*�/55�1ԪUG�A˖-q��}��}�ݻ�[���͛�k�.���ݻwW=�Th���__�Y�:�xxx������Ű��G���\Z\Z\n{{{���������E���|�r�m�T<�,T1\n�ϟ?�����G��������tԩSG�M��fh�����Ȁ��+���x�$\n\n �y��nnb�pssӺ�4--\rYYYh֬��Q|���dHJJB�&M=:��/^���͚5���#JJJ����z��i�@������\\ձ\n����\\]]yo��6`�z6��={����h�Bu+%%�����*���1���S�m�ȑhР��#�ƫ<.==����x��9ҧ�5�	mB�ʘ�-,,���>��3L�0�[�.\Z6l[[[���wn�h/֪[�q\Zz���O(��6�׿��;���cϞ=F��ˡ�!���N�:���V�h@��ƍ�������y�JHe�c��?{��4a!��Y ����G}��]�b���5ͤ�S�����,bm%%%X�z5����o�>�(Tb4Y ��ה��\r6l؀��k<чT=R�w��Axx8������Dk�E/�T����#((������@ː!��������\0@�V�0�|+ED�7��!�B!�-C\"�B!���!�B!�M!�B!�h�@�h��\0\0 \0IDAT!�B�E�B!�B/�,B!�Bx�d�B!�&�B!�^4Y �B!���!�B!�M!�B!�h�@!�B�E�B!�B/�,B!�Bx�d�B!�&�B!�^4Y �B!���!�B!�M!�B!�h�@!�B�E�B!�B/�,B!�Bx�d�B!�&�B!�^4Y �B!���!�B!�M!�B!�h�@!��JE.�C.�[;Bh�@!��JfժU�:u*rss�\n!�����cI$l߾/_�Dvv6������X�1=z\"�)))8p >���\n��uU�h�D�p���Ґ���M�6�v����T1�N��޽{���e�~�oK,����Et�oH����Ν;���QQQ��d���\'�{��!11��󷴥K��cǎ����v(j*��\n~��7|�������ȑ#͞�),X�N�:᯿��v(*�7���c�D��˳vH�U�6o�LM���#66�/������aooo��*���%X�/�[ˋ���|����W�^�<�{����_*(��!--\r7n���Q����\Z5j������Cxx�Ub�8�����*�[Z\\\\\n\n\n����Vu?�|��rlٲ�������X���(((@II��CQiڴ)�6m���D�������1�2�ys�`jZ]˖-�ԩS1k�,T�f�뙕�}�,����Et{m&����ѣG�|�r�ܹ���j�O�:�={�X\'�J�������by���G^^\Z4h`�P*�H$BHH�;777\0������Rw��a�~����J�7�U�6o�LM������ð�����!�ym&ժU������ի��z��ݱi�&k�V��?�B�����]prr�����èp�?P�&e9;;W��*+}cZeh���Դ*�<^ǉ����q��9���S�N!�^�ɂ>�\Z5��˗U_�z6l@ZZ\Z���1x�`<x��\'���P�N�?3f�0(}�\\���ǏǳgϠP(вeK�1cǎEBB�͛���tL�6\rS�LQ�v���s�����g��m�V��իWq����� %%����֭.\\��d̹���`���x��)\0�U�V�}����*\0�|�2v�ލ��x0��q&M��A�T.������v��e�ڵ���(..�o��`�̙��U�^���ػw/�\\����4h�\0S�N����I�͟?�����p��Q:t�N�\'O�z�j8PPY\Z��̙3����D�?�����V+[!LiS7o�ĪU�T�~����}>`޺0�oJ$�\\�/_�īW���o�����:}�4<���888�}���ꫯ���j�ݻw�Ν;��̄����#/�ߔ�k�rΆ�i|m�S�N���W{��)U9|��\r\rU틊�B�\Z5L���}?�Շ\r)[m�7�Xcj������t��?~ooo|���\Z��ݻ�E��M�6z�5�/�%������Ċ�k���ӌ�8v��\r�Ǿz��ݼy�u�ܙ\r6�\r2��<y�I$����/^�8�c�/_6(��S�������VPP�222ؤI��ȑ#c���rv��-�q۸q��볳�YPP�8�ݺuK���ѣlƌ����L\"����v��M֥K6c���E�P���b6d�6~�xV\\\\��W֚5kX�n�����T*e/_�d˗/gǱ={��-C�A�u��1��XNN�ѱ�9s��mۖ�8q���沔��}�v�t��nݚ\r8������/���\\��������2��Xtt��k��]P�����&N������^�|����Xnn�Qe�/���ϳ)S�0��XRR���V��7�M)��޽{�q,!!��ݛ�.�雹����f}��a�[�V���i�ҥ��חEGG���\\�F�\Zźt�����Վ����Y�v�؆\rXrr2���e�����O?Uk7ƌo���B�ِ1���K$����=z��WI.��u�ֱnݺ1�Xl�:�����#m}�в��zs�5�����G��k�8����\'O��3g[�p���\r�JB�9s���r{�\'EEE�m۶,33��5={�d������Hm{^^kݺ5[�l��|׭[�ڵk�RRRԶ�۷�}��\'��333y�Lc,44T��T�����iӆ�d2��eȐ!l	��\\�p�qǮ]���o���]�v,55Uo�B΁ߠ%4����?���W��\"�|Z�n�f͚��r�����T�q۴i��vc�.(h�8�=~�Xo<ei+KC�۹s��ME��.�&�|������3��ؓ\'Ox���.��K�,ј,ͷ���P����a������8�}�vն��x֦M�k�.�t��ʶ�㛡�6��Yט��_�v��I��1c؏?�ht<����q�/-!e�-!�h��b�כ:��2�:t��3Hvv6k׮�����z�}QH?��Rc/��^����9�����퍞={���X����ׇ����6ggg���!%%E�ke2<��C��Q�Fj����\0�NB�\r\Z���999\Z�L9��v��www���Cc�\'�|�L��g�\n���u���~��HHH��\'OT�p��5ԪU���˯�nذ!���lR|e	]���,��g��5S�sօо)�C��������X.ТE\0��G�T�v�؁\Z5j`	�a(s���o___�����?�P۞������c̘1��c�%ߓ�=֘Zf�����5e����C�z�4��:u\nu��E�.]t�^h_����R�@*�ky�+T7\negg㣏>2*�<��Ç�J��8Nc�����I+�b��޽{���?���L�����G*\Zr.e#::\Z�z���ߺuk\0�k(�1�9���ɓq��Y|��\'7nƎ�ƍΛ���#\n\n\nL��P�.��*[�jc�r����MS򍎎\0���1�\0@��׮]����E��/tܴt}7i�={��ٳg�p�B���t��	o��V�����vb��$s����Y��\rM��ܯ���aÆ�}Ȉо(��U�^b~��7...hР\Z4h�w�y��\'=���@�P�<&33\0P�n]���%##����<y2^�zaҤI��2�\\����cL��|�c����L���7�ĉ\'ЧO�޽}��E``�ٮ��-[s�]y�(��*cٖW�P�1雦�+�J!��лwo�����;}�4�]���S*�\"//�\"�\Z lܬ����O����+W��������?�J<��N��d�s45=K���t�=�ݹs�=�{1Sh_�υ�c/������ݻg���_�fee�=V�7�,Y���8>|\ZyZR�\Z5\0@�U)ձ�tʳ�9[ӦM�z�j̟?ǎ�/���1c����ê+��`��+�\"�Ce/[����\"c�/L����	666�H$z�Z��,�[©/^m���U�>>>pss�ɓ\'ѯ_?ܿ�D��_����\"�l�1�9�����\\h���=�w�}W��E!�\\������^�ot�s玠7@}8����-�ܹ��X���֭[h׮�Z��(5k�D�f����cޟ{OHH\0\0t��Yg:�8cb�{�.�R)�ҫぁ���?P�Z5<x�l��!*�=T����/��)�V�^����㑛���X4l�P�{�2�	7+��mmm1f�\\�rR�gϞ�СC5����O!e�������,U�B�5�8������P��H�B��P�����d����DL�0EEEfK�v�����p��e�_G:;;�v��HLL��Ƿ$������\Z������F���# �J՞3�t��1������K�����ϟ�k׮�פI4n�X�s�+*>CTD{\0,[�;v쀗�\"##����ʡ2�`j�ÇGaa!8���A��ɓ\'�:�nd2�	7����1M��?�%%%�ŋ5� OER�ژ�MM�Re.$]s�������d�O)�/\n��BT��O��ZN\nJJJ4�<xo��ٟвx�b4h�\0���C^^�����6�_�~Gxx8\n\n\n����M�6!88X��&�!C� 11�������ӧO1o�<DDDhk�����ŋ�H$�H$�D���S�L�q����q��y���#55?��#nݺ��7���Qg��:cb۽{7\"##���\r�D�}��!11�G�����S((.���_RR��>YHY\Z���b/[�T\n�T�_�U@i�3�M��r�\r�r�%%%jǛ�.���|\'N��v��a���ؾ};222����;w�`Μ9�z���ؙ3g�I�&����q�����!%%k׮������_����o���B�Yט����;z��-[��f͚�?�e��B�{s�5�����\\h��z9r��t��*m��E!�\\�����ql�kPsr�C�Qu]\r\Z����#!!�ƍC^^�ҫ1�N�BÆ\r���K�9R5c�]�6��߯sm�X,ƶm�p��%ddd����z����?�7o�:.77�~�-�\\��L��0f����C����-Z��>�2�AAA8u�$	Z�j�Y�f������puu�ڵkQ�V-��%\"\"�-�X,���;:w�ɓ\'�����b�֭�p����Q�n]������z�����3�����1c$	c�Q��z�-�/�\n�M$�ĉ���Bjj*�֭�v��a�������\Z��0i�$������õk�`kk�H���@U��S�Ξ=�zD����s��\Zo�>>>ضm��lݺ���1~�xH$(\n899�cǎصk�E˶���ƻﾋ�۷k-w]uoJ�JJJ4���Ø1c�^���o��G�A||��|��])//۶mùs琖��Z�j���cƌA߾}Վ��X�v�ji�;＃��ǣv�����/Q�~}�Y�F����M���qS�9k�t�y���p`ɒ%7n�F��R�������}磯lu��k��n-�>\"$]c�Cʻq����Uc����E!���E���b�@�:��:`ٲe��R[�hN�>����[;B���ƍ�~�:\\\\\\�!\0^�eH���)//Ϟ=CϞ=�J�\'�H,��RBH�KJJBxx8z��MR��d�Ri?~o��|||�J�&����m�Z;B��?~�16�ڡ��~g�Ri<}�7n�����C���������;���B�d����߿?Z�li�PQC�,BH��?�`�ȑ�]�6���k�!����d�B!��Y �B!���!�B!�M!�B!�h�@!�B�E�B!�B/�,B!�Bx�d�B!�&��K��r��rk�A��d2��C ���d���U�Va�ԩ��͵v(�\0���×_~�W�^Y;B1Zuk�ؽ{7<��r�J��� ==��������kO\"�`���x��%���GGGk�e�S�Na�޽���RqӈD\"\\�piii�����M�P�vmAiT�o��T�۷oGhh(;;;��D!�B�,T���h�۷�6mB͚5���|�߿�����j\n~��7|�������ȑ#\0����裏ЧO���UH,����ܹ3�����|`�ҥ�ر#\"##+$!bcc�x�b��� 88�����T�ƍ����1�D\"�����_��;K�[}�^�z�ׯǨQ��v�ZT�Fo�����F�\nPPP�9s�u�������.]� \"\"S�N�vxV3�|ܼy[�l�͛7�~�z\0@^^�={���<0�*$�\Z5j���hժ����8T��˖-�ԩS�e˖*sE��IKK���ǭ���M�b���h߾��i�k�����T�Օ�L&Ê+�h�\"������5kބR�hR�֭��������矱|�rԬYӊQY�H$BHH�;777\0���3\0�A��z�*���P�V-k����~���A��E��Çi����?aaa5j��C!X������̙3�\'	!�\Z4Y���y�\0\0�?�	By��ի�p�rrr�������EJ,���󴔤\n�V��>I�7y-&�������6m\Z>��C8p\0aaax��%\\]]�駟bܸq8u�Ξ=���X��rxxx��CӦMU���r\\�zgΜALLRRR���nݺa���XW�^ņ\r���<ğ����$ԩS�Ǐǌ3��,���ܹ���ܵk�b���\0���\0���\0lll��~��͛X�j�>}\n\0���Ç�����/_����;v��m�sU�9s&��� �H�����\0���_������>}�`�֭��?>���/899��ѣ8t�N�:�\'O�`���8p�I�u��Ul޼iii���+��ߏ��8��ڢs�����/�q��k/_��ݻw#>>�1p�I�&aРA\Z���r�?��<,����{ؑM1�p���\r�R\\H�姹����L-�RZPqG��HS�\rWDC�AED4QSDYa�u����g�a��\"ַ��yz�8�̹�{g��{�9�����Ç���C��j�k���>&M�T�r���/iii��/���P�C���ݝ��ĉ���_���KKKt��,��o������pܾ}\n����:���?�ؠ����t�ܹ׮]Caa!���j]2��z��K�RGCۯ�{�a�9���5�;�C^^^{�5��B\Z�(++c/^d={�d#G�d#G�d��Ѭ�����b���3�P��}�]�f�\Z���#VRR�.\\��z����O��UށX@@\0;�<�H$����]�|���Ջp�*++��˗��>�;v�I$���ϖ/_΄B!;��߲|>������f�z�b2�Lk�Z�f�֭c}��eR����j��)\n�{�n&\nYFFS(L�P0�+**bd`���\r��u��1�PȊ����S�N�Y�f1�PȞ<y¥/]��͟?���濰�0֡Cv���:�c��-��ˋM�>��ڵ�egg����__�������D�������˝󥥥,))�\r>�yzz�۷ok}.$$����[�ԩSL&����lĄB!۵k�V���J6g�6l�0�������X~~>�1c=zt����2�/��u���l�ԩZǹ�+V�	&���T&�J٭[�ؘ1cX�^��X,��EGG3wwwv��&�JYNN۶m��9�����<<<�����ӧO�T*e���l�̙:�1�b��ܯ��K���1����e��s�>�k�wvٲeL(��~�M�� ����4����&M��*++�ҟ>}ʄB!۰a��gV�Z�:t��JKK�[��U�X�Ν�\\.���	XEE�VzII	�ر#[�r�A�U����?0�P�D\"�ζ)S����{�2�P�<x�����O+X�x�m�w��c������+�f�\Z�|���gB���]����y�&\n����\r*�y���ׯ�7o�N�X,fݻwgS�L��N�>̈́B!��?t�O�:�yxx���\\.mݺu��Ã���h�ݳg�8qb��5F}~_�ΦM�ƻ��\'O��]��\\�޼y�	�B�m�6.�>b&L��WQQQk��q��mֹsg��MpT??��c�\Z��[jL�m?c��[cϹ�گ>��ӕ+W2///��YBiH��A����:Cc\\]]abb�D���m۶����iڴ)�J%���u�9;;���R+���...���1���4�<cbb��%	�_��!C����jȶ��o�������ӱz�j����|�I��Cߜ���gh�Ƶk� �\0���puuE߾}u�O�8r��;�r9~��W�1Bg���/>��C�ocʭK;^��E#\"\"���:�HZ�n\r\0�w��~322���.������s\'�o߾�\Z5´i��^uQ��������c�9W_��G�y�b�\n�D\"xyy���B���s�G ��Ғwy=�串�2�t�RRRp��Y���������\0\0�Ri�---Q^^���w.��7�@�.]p��i,_��[\Z0>>�ի����O/�/k#�J�駟���k׮�].����2�վ}{\0@VV�4i���Tx{{���ر#��`	��{\"��x�<���p�_)\n�ʭ�����F�>}���	\0����3��燘�L�8S�L��I�мys����������hS��b�o�1u4��|�r���~5\ZⷈB�ը�j�4�@\0\0Z�����㣏>�ݻw1~�x̞=�Z�±cǰe���)t��O(̘1X�r%������oЕ�\0\0 \0IDAT\0Ν;�A���u�_v_���/�ē\'O�}�v4k�Lg{}��e�Ksa�P(���30��^,9;;\0JKK\0���\0�&M�Ժc���e_j#�� ��1x�`|��׼y���ӦM9r�ׯ�Ν;���?c��X�`���OII�s�����o���\ZSGcۯ���\\}�h��\"B�o,���_���t�߿���\\��CF���>��������o����\n\\�t	6l��:֗�ݗ@հ�s�����_������n�fI���ѨQ#\0@AAo^�5��h���ٳZ�al��4�1����\Z�\0����[�l��~�	_|�\"##��/�`���ؿ?wg�����˪WC3��ƶ_cϹ��/�j�SBy��9��ʕ+���������ogg�����ٳP�THLL�������^v_^�v\rk׮E��ݵ�)(�Jܺu���e�+99�ڵ���lmm������sS�edd\0�ZV\0�B!LMMq�ڵZ�al���쾨���ڷo�۷oC*�>7����!��\0T���ѣGabb�_�U��,--ѬY3��$�]�W��:\Z�~}�=��k���=O	!�EP�P���(**�I�K�_.�ر(**Brr2��������^F�2�R\"��?�����v�Z��Չ��Zy�/�]����z�*>��#.���߇L&�ɓ\'u�GFF��Օ[�����\r����;�֘r�y���j���ˣF�Byy9\"\"\"�[�_|�?��C+�E�h޼y��J\0���{<�\r��&qS�WŘ:\Z�~}�=��k�ƞ��1n>!��J,����Ñ���������믿�x�b$&&�\Z�[}���j�}�􁫫+N�>���x�^�T��H3�Q�RA�T�P{j��R�V���?������ggg(�J����֩j�\Z\n����R�3���u��}���@*�������Ǽy�����Çs�f͚�P�U�V�ԩS(--Enn.���{\\�r6l�������hڴ)fϞ�3gΠ��EEE���ǲe��\\.���}��deeA\"�@\"�@$qw��O�lڴ	۶mC~~>JKKq��5,\\�/^�*k�ΝHJJBQQ$	��ك��L�;��:|���hѢ>���>}\Z%%%����ڵkq��)\0U�\'M[��׫`L�m�>ƞs��_c�ӯ��\n����TB�g�����F���1j�(���ƍq��)888��ٳX�h�J�&Mp��q4m�K�.űcǠR�`ff��#Gb��Ր��ؼy3�?�D�:`޼y�����ٳ��䄵k����S�L��x�����Ǐ�Y�f�����ѣ�;Sػw/�|�ͿM�=z�xn�nܸ;v쀕���d�ɓ\'2d�����~����#22!!!Z����0p����VKKK@\"��1�F�\Z�m۶X�f\r�N�\n�D�Z\rkkkt��K�.պ��3d�n����ر#z���?@XX�w}Cooo0�`ii���<������ӧOG�~�t�K�Rlݺ�O��X,F�&M��퍏>��wE������!..���prr���77��������/@�Ӗ�K����\0����ٳ\'�����%%%Cll,ח���?~<|||���D\"9r������E�&M���t����m-((�ڵkq���d2�o�S�N���>��38;;#$$�;���֭[����C�t�_߿����1�wvv��ކ���霫��\Z��\r\n\nBtt46o�L˧B^�E�@^�/������ꫯ^uU����ѳgO�]��UW�B!S�\Zy!�������o�����B��v\'�BHmh�y!�w�ڵk���B�,B!�6�d�����\0�O��Ν�������J�H2�j�\Z����J�����U\"�B���Y F\n\n¡C� \n��_\Z4��}>|K�.�J{��7q���WT#B!��]Q�@!�B�Es!�B!�(X �B!��`�B!��B!�B/\n!�B!�(X �B!��`�B!��B!�B/\n!�B!�(X �B!��`�B!��B!�B/\n!�B!�(X �B!��`�B!��B!�B/\n!�B!�(X �B!��`�B!��B!�B/\n!�B!�(X �B!��`�B!��B!�B/\n!�B!�(X �B!��`�B!��B����寺\n�B��(X ��!�D�I�&a�֭��*�B���^u!�U۱cΜ9�X���J$$$���y/%;;Ϟ=C�Ν����χ���bq��\Z�>\rU֋|����X�v-rss\0gϞ�S��\Z����#��J�c����Wo�޽�~�:.\\�-Z�l���@LL�V�СC!\ny˻y�&����&N�WW�z�ojj*Ο?��|cƌ���[�yJJJ�����3g�u�ֈ����:6�{��a�ر`���͛:y�>}\n???8::b͚5hٲ�+�OC���������\'O0y�d����7o6��JC�c}�����3o�B�ս{����X<x��7���������X����ڵk�y�J%�,Y���X��믰��@˖-���Pou677���W�f͚���	�7���\r�J%�� V��[���-���QPP�޽{�[ZZZ\Z�r9Ǝ�{a�P(���c	طo�K\r�OC����������9d2z��e��I�����<��7�aH��QNN\nk�Ӿ}{XZZ\Z\\�J��ݻw!����Ν;��Դ������\0�^�\Zb��7O۶mѶm[���cƌ���o��?\"\"puuENN>��#���<�:uBEE6mڄ�#Gb���Z��b1v��e�qrr2\0��˫���PF��A��q�Ƽ����	ss�E}\Z����KRR\0P���\Z����#�ߌ�B��O>AZZ����8q�ڴicPy���طoڴisss\\�p������y�06�>G��R���ￏիWsc����bܹs7nķ�~�D��G\"�`˖-�7�|�V�Z\\c�D\"\0��7ƺu�`f��g������pvv�H$����u릕���Ro�WQQ+++�m�1���vvvz��Cee��r�)S �Q�Fz?�V����3X[[�Z��mV��())����s�hH}�R�����}c�q�D����;��>��rXXX\0�Ꟃ��������v��j�T*.hT*�(,,���K����y^?�W��B(X �N233����M�6�[�n011���	�-[�-Zh]�?z�\0кuk���j5/^����ٳ���y��	�\r���`l߾���k#�J��[�������ǎ���lll�a;5�Y�>>>���@VV�~�m����#}D\"\\\\\\x<X\'����w�Ƒ#G�R�PRR���2t�ڕ��Y�n����L���x���k\0���>@AA\\]]q��i��SSS��w��������������\rq��d���Att4nܸ�\\{{{̚5���:u~^�qqq������>}�����lܸqqq055Eaa!�����wߡC�\\��\"11���8�<n߾���H\\�|r������[o�z\\�է.�?�m/�7��H///���/^��իWs�������055�D\"�ԩS��&���b�:e,X�\0III(,,�ٳg�ÇC*�\0|}}�ulh;������\\b̘1ؼy3����Chh(�����B��ׯPX�?�����\rkk�:}G����ڐ����/��1\'�\0`��mذ�͜9�wۅX�~�XII	��:t��F�\Z��ժU��ח����l�9s&�ҥ��MPP[�d	����7�3g���#F�`�/_f�16t�P6e���iii�gϞ,??�3�P�8`P]j�#>r��u�ڕ}���Z�fIII���}�6���a+V�`b��K�p�\n�lÆ\r\\Zee%�0a0`�N9�����ݝ-^�X+=,,����h�?!!�	�Bv��]�c����w�a�/f\'N�`���,66�\r8�	�B�zZfAAۻw/\n�l�ƍZ�?w��ӧ۽{7���`�1v�������\n�7--����16i�$�r�Jv���������τB!�����է.��ֶ�c�ãG��P(d�v���n�Rɾ��K&\nّ#G�\\.��~��ֱcGŔJ%o7o�d~~~��ݝ}����ԩS,//�ݿ�͛7�	�B�bŊ:������ܹ�	�B�z�j6`�\0�`�\Z\Z�v��ŔJ%[�t)\n�,::Z��`��?���u�ԉ8p����:}G���>۠�SǜR��,R�۷����Nzii)V�X�/��666\\zjj*LLL0}�t�����سg6n�kkk��lllPYY	�Bsss���&==QQQZ+999�}�����D�\r�i֬�����Z�\n�1������\n\0h޼y�����G�������\\kB�B�@HH�mۦ�?33�g��̙3��Ms׶�p&SSS<x�\0���NYb�\n�Bk������m�r��\0...x��7\0������B�&M�����?���J��trrBӦMu�p��|��ƈ#��:������HMME�=\0\0������+֭[��)\0777���B�T��GM��S������}c�q\0gojj��;�Z��wp����۷�ֱ�������h׮6l���}wqqAHH���q���\\���v899���@����Ǐ��rww���SSS�!|������Ƅ	\0T͙2�;��c}����9!�\n���{�Ǜ�n�:�n�\ZC��J�?>�Ν�s��i�&4m��\r�-/??vvv�E����a�!((����?�\0��쌔���;v����jܺu�����bL�6\r@�P\0O0��G�h�+#88J�*�\n����[��.Y�-Z����?oY�ڵ+�v������^ּ�y��)~��G|��gZ�\0йsg������&&&:+@�\\KKK.�2�LM������˖-C���y/N5�%??�K���@ZZ\Z�L��u!T����d�]�V_}^���e�h�\0�\rC�+����\0�3D�Ν;����ѣGk�����O��3����mڴ���ێ��$XZZ�O>��DT�X�Arr2���p��	�6������n�&ϋsBH\n�\'׮]���q��1�m�@�\"X\"�����3f�\nF*�\n�ҥK���&22EEE�9s�V���d2��ʴ�D+�JDGGs㗁�\'2�\n�\n�?��������������G��Dh֬.\\�\0�J�J��;w\"%%E�Ν;�������N�LJJ�����$M���R����puu�.�w���Z���_\'���*�\n�n��ӧO����?��ݺu�.�-S$�k׮��Stt4�>}�E��|��Ӕ��\\�~\n�����Ν;P�T�_|�y��k���}S��C�2j����9\'j?��#&M����T[UǍ�;eL;�w��\"�/XP*���o���G+�3�;R}�����ڠ��ǜR��B�\\.�������g�JD׮]�J�B�N�x��������S~}�={��k�\"00999Z�4�yyyZ�HHH���)7\\�z�\0\0EEEطo�t�w�y����_�iӦ���^W\n�)))��SSS������������رc���@���u����#33S��{rr2�7o��:�J�k׮���@�S�S�N�G����ڤ��#<<\"����h׮��̐���-�jl�����Ǽy���X\0�:&����_ZwxE\"z�쩓_sah�Ҳ|��k�5˪��;\Z�����-��,�����?��\n���D011���i�d2<z�H�7�yyy������c�����^����V��g����`���Zy\r��h����nC}sB�Q�@H=شi***�ZMC3LG_pq��iXXX`���uʯOHHT*v�څ]�vim+//PuW��~�=��C�jݕo֬���<��j����#�7A���\n@պ�|RRRо}{�\'|�%�j5�]��;[3�B����lH$���ϭwTT�,Y�iӦ��ɓ���\0n�M�)�GDZZ\Z�6mʻ��\\.�իWѻwo�n�H�P��$Ds�ؐc��u)�fY��7�\rc�`eeggg�$*�\n?��#>��S����D�ԩ�q����Z��ȑ#_��{�o�@ ���,��bl߾Zwލ�����z��6��1\'��=s#�i�V-[�̨a4��t|���d8r�����;����s��\r?~�������u����T\0�ˎ��ә��	�mۆI�&i]�1Ɛ���҂��ޯ\0TM4߳g��も�w���+ܿ2����:�k^�h�5�\'(����ꫯЯ_?|���Ŋ�LKKK�!g��Y���۠V�!�J���ě?662��f���4c����(�J\\�~��[�6_���k���}c�q�0��\n-[�䂅���ܜ�\\���r����׌1�ڵ}���;�S�v$%%����C�Z�n�����O�:u�Npf�wD�f?��6��1\'����\0�B��K��w���T�1֌����\0x߂�~�z�l�R�I���kR�T\n\n��ɓ�ޕ�L��>!66NNNZ~��!���c�ܹZ�rrrPYYip�������W�7�6$$�[����x��!�ƽ�\\.Gbb��|�|���W��HHH�\Z������js��eTTT�O�>Z�1\\�rݺu�.�\r-SC$i�����+[!44�F��\Z�U�X���t���\Z|��f}^���e�h�s��a�|��-[���%%%شi�/_n�gSRR����?����\\|��/Ԏnݺ=w�֭[���\0�n���۷uV���T��~|Ym��cN�/\ny۷o�Ç�|�r��\"����Ç~��������Ddd$�\\�R�Ė-[p��u���i=�06M���Cnn��8��4w߫?Y8v��\r������\0K�,�y�fȔ!��k�#>��\n^^^���(--ųg� ����S�9s���ǌ3��x{{�ɓ\'X�j\n\n\n �Jq�� ++K��Ls1���\n�������={6RSS�򻺺���\"�?��3�r9����mٲ���ռ��ʕ+(++�\\.Ǚ3g0w�\\<x�Ne��]�\r>>>(**��Ç������gφ��\'���;��\0����<Y�W����W֋��1�0n���믿�L��۷㭷�2h�G�~h׮�V^^�u�������_�Ֆ�mGnn.�Χu�֐��X�r%����ic�#\0?��6��1\'�h����!���?1n�8`����y���;DDD`ɒ%�����~��9�\\����pss�D\"�{ｇ�s�jݕ�k~�j��Q��\'���ظq��[r\n����(\n\0UÌ���QQQ�@\0GGG���o��\n\0$&&j�����@\"��1ƍ>y�$�*D��Qu�ƍCFFw�����\'8��������@n�Ikkk�?}�����?�|�r.(*))��)S������رc���_�~�����9s�\'*b��-BRR��~�6m��p����1�|$$$@ ���cǎŐ!C0y�d���`���2d�Ae�d2�9������077G�V��@���\",\\�			hٲ%LMMaii��s�jM��H$5j�����v��	wwwTTT`�С��P�T���Chh(�i}�ٳg���w�ҥֶ�H�TTTt<==1a�H$(\nXXX���\'O�|�]�Çc�ҥprr#Gj\ZX��ɓq��MXXX�}�����BNN|}}�5����i���;v,�<y�T\nkkk4n�]�t�;���ի�6m\Z&O��+V��1�;2r�H���R��\r�q�5�=B�6\n��\\�q�ơ��\'N��{�^VV����ZצW����˃��	\\\\\\�^T�5�ߝ!}T_���P^^777XYYA�T��ӧpttԙP��Ç�T*Ѻuk�1\'\'��\n\n\n�����rss!�J�:��j<~�NNN��Z\r)�6��pvv6�����E����`�Z�)S�`�ȑ�2e�A�)//���>��L�6\r���hҤ	�5kƻT��l�\\.Ǔ\'OТE��m@ݾ#\rՆW�B��P�@H�[�۶m����������C�ٲe+��E��_�/]��ٳgc۶m�K�BȫBK�b���L���c���(B���w�\r\0\0 \0IDAT۷��\Z�#G���O�~��ݻ���B��(X �H�Z�j\Z@��8q�q��]dffbǎ���d���@||<\\\\\\���WWW�j��%ךBCÐ!����ׯ���~��A��iDEEi�X\0:t�_|Q��$��:�`�B!�޳@!�B�E�!�B!��B!�^,B!�BxQ�@!�B�E�!�B!��B!�^,B!�BxQ�@!�B�e��+@!�+;;Ϟ=C�Ν_uU�\'�رgΜ�X,Fee%`bB��!\rG�c�����Ǐ#&&��߇��:u�q������UW�({�����ױp�B�h�Bg{FFbbb�҆\n�P�[�͛7��6q�D���\Z]���L9r\0�V�QVV���rTVV���\nnnn���E�V��.�޽{;v,c�y�&��e��(\n\\�t	7o�DNN�r9\Z7n�v������:u���i�է��yyy�9s&Z�n�����7!�\0�d��\n��j�_��.]9s��달�,�Z�\n���:�	�ݻ���0b��Ѽ����q��ydgg#33...���R�Ē%K�R� �H0k�,�������N�hԨBCCѹsgL�>vvvP*�x��~��Wlذ[�l����Qe���A.�cҤI��@A�T�_~��}����>}��k׮���ĭ[��n�:TVV\"11666\rV/[[[������\0\'Nl��B����a�$$$ \"\"���\0�6m�@�R!00׮]�[o�eT�*�\nw�ޅX,���#:w�\\�`c�����\0�^�\Zb��7O۶mѶm[���cƌ���oQXXț7\"\"puuENN>��#��T���\r\Z��k�b���9r$�m�������СC�w�^���ѣGcРAhܸ���U����ܹs��쌃���Ek��������R٠��Frr2\0��˫��M!4�Ҡ�={���p���s��F�F�\0\0NNNF��q��aǎ������?|}}����zɯ�ѣG�T*����\0rss���Ÿs��W\"���H$زe�.]���,ާu!�\0\0�{���֦M������B+]�VC�Pp+�J�����U�S���r���*�\nR���n%%%:����j��b�d�Z�<��5`ƌpuuŶm�t\r�T��y�1�>�Mii)�b1�j5D\",,,Э[7޼��\r!��=Y �4���4(\nދ̤�$xzz��7��J��\0�u��Z�j�\Z�/FII	���;;;\0��\'O0l�0c���u�_�T���lݺ���077�5X8v�|||`cc{{{��Y�f\r|||��ၬ�,���ۼe��}���`oo�;�����P�T�С\0 ..������E`` ƌ�͛7#::\Z�1$\'\'��ŋ������>}�p}�p�B$&&������HKKCdd$�P(�r333�߿gϞENN\0`�ȑ��t�3effbӦMHHH�R��L&���BBB�`Ӑ:����s�l�2��� $$��\'K��=����ڟL&CLL���q��\r��r���c֬Y��GII	v�ލ#G�@�R���eee�ڵ+,--�����`�ƍ������)\n������;�����!�Ai�q|���(**��oܸ�Ç������:�}��NY��=7�\\s�\0-[�D��ݑ���B�k\Z\Z�~�����\0��舼�<���?��Ç\0���u�,ܺu�O����T���\"�\'���>W�^����*:\'O�\0nx���\'�N�\n�B���bL�<eee�9s&>��3������ӧO�\\.G�.]�������o���,@bb\"�Ν�\'N`������A@@\0���УG�ݻ�Bǎq��q.�8u�f͚��C��ҥKHNN�\'�|�s������\\>C��\'66.\\�g�}���E���:�����:ׯ_�ĉ��/� 44���X�~=�����<u�������q��y$\'\'c�֭P*�:O����0f�t��.\\��K�p��Q<~����P*����BEO!\r�{������ŋ1j�(,_�YYY8}�4v�ޭ�*Ojj*LLL0}�t��={�`�ƍ:Ù������\n����F�Mzz:����V8rrr��d!==��z�\04k����ZyV�Z��?����HMM\04o�\\�,}������QXX��:�D�ݻwc�ȑ\\����GGG\0���9�?�Xi�4m�\0��uwwGee%^{�5���j\r�1c~��G���?���޲eK�1w��Ѻ�MJJ¢E��5V���ذa<x�U��ՙ�Ν;amm�aÆ=7o��?o������B�&M�����O�������K�����ٳ1s�Lh��ߪ��W�\\���~���`�1�K�С|}}���T���èvB\n!\rJ `�ʕ;v,���0�|�������:V\00�|̝;W�ӦMhڴ)\r\ZĻ���|���q���ׇ1��� ���s�@�ӂ����;v����0ܺu�����bL�6\r\0��-[��)K_�o��ݻw��_@(bŊZے��`ii�O>�D�TIII���@׮]����\n���aҤI:c�5w�k1���b�I�\\.��_�����L�}��\0�y-�Թ�Ǐ��͛<x0o_^�~]�鏭�-���c��LLLx�g�DKKK.d�aɒ%hѢ���u�k�+h����˖-C��ݵ\r�9S��!�������h���B�Vc�ʕ���Ą	�o�>�p�*��y1\'�Hp��e�3�w��J�BFF7D�������DQQfΜ������L���2��J����X�~=�֬Y3�d2(\n(\n���O��h���=Y���h�VEEE�̙3�J��w��ݻ�9s�`ڴi:�H$B���k���D�ڵ�V��ׯC�P�>�HKK\0����7�x��3g� 33�:uҙC�)�faH����Kǎ�x��޽�H$(..���#ƍ���O�R�֭[x��)������[�nܐ�s��!%%������j��h�+DGG��ӧX�h��4O\"��.!��D�!���ƍػw/lmmT��\n\n��Ç���_c�֭�-�ڵkP�T�ԉ�B/558p`������3�]������\\\rͅ~^^ڴiå\'$$���TkH��{QQ��ۇ.]���w�����_hڴi��k��ի���D��͡P(мys���{�ڵ+o�������,�=Fo�����Ǽy��5O1����<�����JW(HII��1���ɓ\'aii	www�r�v��ݻk$�Թ���L\0@���/��w�v������۷s�1d����H$���;ڵk333���`���\\�cǎ�������)#??���ZObcc@�|���@ ���?B1��������ѣ\\�\0\0�����o����7nT�f�N����N�>\rnB����			�J�®]��k�.�m���\0��O����G�b�СZw��5k������Z�u��\'��l�f����?�N�j�g4w�{��}:��o��H�P����\'@�۪+**��Iݼym۶��ٳ��5i�G���Z�D\"���i���_TT�,Y�iӦ��ɓ��~��i\0��RRRо}{ާE��Tϟ����M���ɐ��z�*z���ͩ ��E�!�A:t-Z��]����vvvpu��[�fr(�*72�G����w���|nܸ��Ǐ�ȑ#x�7t����`��Z+\"�d2���aϞ=Zy5�¶m�0i�$���1���L���z�b(͝~�aA�$%%��ʪ�!Y��W�<y�N~�D�{���<��*K�iĳg���k��k�kҔ��}�y�j5�^��=zh�$U�������W_�_�~���/u�iii�}N.����\0;v����\nj�\ZR�Tﲨ�����d�5kV--\'���ҩ��QPP��t\'P5L(##Cg��T*�}��&��{����ѲeK�u��_�J�BPP&O��(\0�&�V_)66NNN:��5AIzz:�Ν��-\'\'����O���>��_A�H�nݺ�:�[$i��j���y��M�7�xC�N����߿o�K��sM���011All,�T��?��R���	���]�|��\r��\\��nݺqOW,,,`aa����M.�#11Q��MLL������VQQBCC1j�(�!M�RW,B\ZD߾}������]+��ٳ�7o�,Y���\\�H�~����?�)������Ddd$7�D�Tb˖-�~�:��´�u���}��!77��θ��b����cǎ�.�����@�%K����Jk�f�T��͵��>W�^E����i5���\"++��\'��\n5�h�b���S�3|O\"��└�����R|����[�e2bcc�e���C��������CNN/^���b��?FXX\0� �y��k�r�\n��� ��q��̝;<�����7�<y�U�V���\0R�gΜA@@\0�~|||PTT�Çsi��fϞ\rOOO|��wF�!�<��񽗞B�R�Dhh(8\0GGG�������A�V���������%K����O��s��a�ʕ055���$	�{�=̝;W�M�u�T=\r5j�D���7n�[o���Q(>|8rrr�P(\0T\r3*..FEE��o����_�>����UNRR,X\0�D����p��I���GuӧOGjj*�r9��;�8x� �P/�Ǝ�\'O�@*����\Z�7F�.]���2�#G�Daa!�r9���ѪU+:tC�Enn.c����o���v����͛������w�Fǎ�i�&���������x�����?s�Z�h���abb;;;XYYaĈ�3g�4ibP�\r���#,,���x�7`mm���l��ڢw���ի��W^^����#!!�\0vvv;v,��ɓ\'���˗/ǐ!C\0TMb�ҵ������ѷo_������˗/�΢�\",\\�			hٲ%LMMaii��s������n7!���BH�R�T܅��������PPP\0777�e��j������...�KO�H��C��M~~>�b1\Z7n\\/�k#�H����F�\Z�iӦZ���Enn.�R)���`ee�Z�Ǐ��ɉwrrVV��˹�J�O�>���#o�����b8;;�:׆B^�B!�^4g�B!��B!�B/\n!�B!�(X �B!��`�B!��B!�B/\n!�B!�(X �B!��`�B!��B!�B/\n!�B!�(X �B!��`�B!����UW�B��;v�̙3�Ũ��DBBLL�����m\'�4c���JB�7=~�111��>���ЩS\'�7��jۻw/�_����E�:�322��6t�P�B��n޼���8���\'��յ�ud�����HLLDnn.�����憾}��cǎu.�����yyy�9s&Z�n������/�B�K�.��͛��Ɂ\\.G�ƍѮ];xxx�S�N055}i���!�N���\'��z�V��~�z\\�t	s�́��/����j�*���o8t��?\"`�w����PXX�ѣG�fffptt���瑝����L����J�K�,�J��D\"��Y�����:���ÇX�`Z�n�A��W�^���Ƒ#G�f�\Z�={-[��s�w���(//GAA&N��R��T*��/�`߾}���B�>}еkWTVV�֭[X�n*++�����R>\r�vB�`�R�6l؀��DDD���\Z\0ЦM�T*�ڵkx뭷.O&��֭[��dx�����^�p�J��w�B,����;w��ߠ� `����żyڶm��m�\">>3f����~���B޼ppp���+rrr��G]���b1�N�\n���im+--�T*��4���\0^^^�^v~~>�Νggg<x...Z����(��\r4^f�	!�	΄�z���3�����ߟ4\Z5j\0prr2��{����>ðaðf�\Z|��0aF����l��DFFbܸqرcbcc���___<|�Шv=zJ���>\0 77Wo^�X�;w�py%�N�D�-[�`�ҥ����}Ja��[�\0�M���-//������Z��X,�L&{�>��ˑ���Rɥ)�JdggC.�si���z˨���I��_�VC*�>�>\Z�����P���D���@�n�x�\Z���\n\n\n0c����b۶m:���T*ŀt��P(���J%����7�1��G�4D�	!D��,B�UZZ\Z\nT���OOO���Z�=\0�n�Z+}�ƍ7n֮]��j|��W����q��!|��\'\\^�Z�ŋ���{�쁝�\0�ɓ\'6l����}�v�� �J��[�������ǎ���lll`oo����<k֬���<<<������~��,}}�\'))	���03��)�:u*lmm��233�i�&$$$@�TB&����!!!:�݅�}�v<~��\0���8p Z�j��B&�����ؽ{7����L���x���k\0��G}��(((���+N�>\r\0X�p!QXX�������ۈ����˗!�����5k��>y*))��ݻq���T*�������\0]�v����V���lܸqqq055Eaa!�����wߡC����e˖���!!!�>��������\0���Cpp0rss�1c�`��͈��c���033�L&CLL���q��\r��r���c֬Y|�m\'�#��zt��U&\nٰa�سgϸ���ֿ���#�����C�lԨQ�ńB!۶m�V��U����/+++���̙3Y�.]nCPP[�d	����7�3g���#F�`�/_f�16t�P6e���iii�gϞ,??�3�P�8�S��}1v�X&\nYdd�s�<y�\r8��;w��T*�c�7ofB���ڵK+�O?���n޼ɥ]�r�	�B6j�(v��v���c���l	l��:����e���l���Z}����<<<ؤI��ʕ+ٕ+WXff&ۿ?\n�,  @��۷o3�b�\n&���.0�P�6lؠ��ܹs�O�>l��ݬ���1�؝;w���0`\0S(��WLL\n��СC�櫩����ܹ�	�B�z�j6`�\0�`�\Z\Z��s~~>{�w��ŋى\'Xrr2���edB�P�}���R=Y �ԫ�ݻ���/^ĨQ��|�rdee����ؽ{7Z�j��?55&&&�>}�A�\'&&������V{���ƍu����\r*++�P(`nn^k���鈊��Z����I��tH$���\0ЬY3�!R�V���ggg���\0�7o�S��}1{�l��?������E��M�6:�����h�\"���k�m=z46l؀pi111رc~��Wxxxp�{����3�}�].���<�J���P(�ݻ7������J���bݺuܓ\0pssChh�֐\'����ٳ1s�Lhm�]��?\0\\�r�~�)���1b�.�C����Edd$RSSѣG�^��s�NX[[cذaz��qrr���#\0���Ǐ�ri8::\"**\nM�4�J���?�5D�U��B��`�R�V�\\��c�\"//��χ��+>�sq\0����ܹsy/�k�x�\"�=�/��nnn\\��M�дiS\Z4��s������{n��CPP���ѴiS.���)))��9v�|}}�a*...�u��=**\n���ܼ��	�����P�D�Z���ի�.`ҤI��ϸT�\\����{XUU����M�r�yɴ�)�+\'33S2ǔ\Z/]�/eɘ\Ze5:i:�,1K��Rǯ�L^CLG�\"/G�PQ���8�#p�s���s��9� (����y=�<ϸ�:k���������ߧO�>�`�^�\n�א�[����p��dqq1W�^�Xq��i���UV�C���lii)\'N�`ԨQ�@���V�U�w�r�����y��L�0��\rw�~�.]��5�f͢[�n������M&��=���l�?N���5�.���<֥ҳgO�x�74w������w�b����Ż!DU,!�ԪU�HLL$..����ٳ�����#�ׯW\r¡\"�����n��n�:>��3�{�=F��ܳX,�߿�aÆi�;233�ԩ�\r�=!!���F�����j���D��n������ŋ�k͚5�j�b�ٰ�l|��G̟?_YW�^���$h�\0\0 \0IDAT5�P���jРA��ۗu��)3?��#_}�M�6e���deeѾ}{�5\'N�\0�;�deey�AEP�����7����Ç	WFiii�l6������8��՞={8v�qqq�t:�߸���s��t�3f���,��5���j������5�Y����L,�����z�{�9%X0t����;N�<ɥK�0�L���t��U���xw!��JvCBԙ9s���߲v�Zz����~�;�m�ưa�������߯U}�N����?\'22��G��i�&U�\0p��Q��k����)--�o߾նu��U>��^x��F#YYY�����<�oRSS���U}�w�SPP����7:u����{�����	\r\r��s&��&L��Ν;�ҥ���+W�`�Ν�����?]�t᭷�R\r�;v�Hff&�A����L\\\\����X�~��a��.�ݝG��\n:���z��=܃����֭[�������d2����j#))	@�畝?�N���<��\0�K���ŋ����,D^�bӦM*������=�!����M�F�>}X�l���f4\ZU��[��BT%3B�:�o�>���+�l٢څ\'  ����/8p��~��Vu�ر???@JJ\n/��S�NeذaJwZ�V�>��]����gРAն�p�B�W�f��ժ{ׯ_*�O��Ζ-[���T}�m֬P1hܸq#7nT���/���W�\\��ח&M�����z�{�=������*N�nӦ\r�ƍ�Q����c�ҤIt:�;wf�ڵ�A;�N�=��^���Tu��`0��h~�v�DT�cǎq�}�iθh�9�8q���P�uP��t��z�衬+��^3�t:��q�KPP�*P��L�v��}�vbccy��ٹs���{�����[��BT%���N����y���2���Dx���Zo�O������F��;�CDD��۽Tk�P����͛3f��=�~��\'�m���͛���{=��ر�iӦ�f�V+��ɬ]�VU�,,_��#F��.����,��um̘1����?���{���c�z����\0o���x뭷x��W1b���4n��붡gϞ�j�ҹsg�{7Z����iii���_�V^^��l�Rܪ���j�5hRRV���c�z�\n��:{���2N��#G�н{w����~���io������{��ݛ��~[uϽ������݅�*ICB�	����T�G�����H�����q���)�����uw\0�uj��ŋiѢ���n��9s�0r�H�@P�V�)))���`e���J222���V�3\Z����i�,Դ/���9|�0-[�Լ�~�z��Õ@�q�Ɯ={�F�~�\\�������/���^���|������t:IMM��z����]������?.\\�8̬����r�}||hܸ���U���1d���չ\r0\0����Y��Μ9CQQ�Ǣq��@׮]5��߿���Rem��������t��UIO���]!��`AQ\'}�Qrrr��oT����2e�bccU��\Zz��ͤI�j������С�r�O�>����|U���,]����4���]4�~�zrss�2e��2�3[�n��Vӽ�hll,���W�s�LU]�\\��ؿ?6��_~�E5�,,,d���<x�+V(�(����ڵk�����)�V����$�.]��f���>����6m�ĦM�HLL�̙3�����Gii)׮]c�޽�7���t��\n@����-=��c\\�x�y��a6�)**b���L�8����6���GAA�6mR��?�q��ѹsg�Ν[M�Vgʔ)�FfΜIaa��~vv6���z�$77W���iM������rv��Mtt4�Ν���o��BQ��U���B���N\\\\_�5z���-[b4\Z��4i�GZ�ܹsY�n����3��gee1x�`z���������ٳ����U�VX,Htt��ɶnf��!C�(3���,Y�Dur��fcРA�Fl6P�fTXXHii):��^φ\rT_�8���СCL�6\r�ł��B��ѪU+v�܉N��U_�<y�իW������w�}7׮]�ڵk8�I�&ѨQ#���jeƌ�۷����_�>�<��ǏWm���g���_PZZ������/��;�(...fԨQ�LO`` QQQL�4�޽{ӰaCƏOTTC�Q��\n\n��/�$\"\"���R\"##�����pD\\\\�2�d2��<y��m�\rx���y��G�0az��w�}W	�\n\n\n�>}:����h�___���f�����mU�|�\r���L&��^\Z4h��˗	�G�<��#�������x�\"EEE4hЀ&M�ЩS\'�NYׯ_���_\'55�NGPPQQQ<��S�9���0�}�]�z���݅�M�!D�r8����r���OII	f�Y���7999L�0���2��h.�t:�������CXX��V���j�n�������iڴ)���^���b����O�&M4ӠV�ZŎ;X�z�j������ŋL�2���\\>��������vZ�n��}�F���Ug8܊���_�N�V��_�>v��K�.���5���f���			�v�JMX,����;\r\rUm�{3rss)**R���t���Mpp�����.�,!�ceee�m�6֬YC׮]��_�*;��\n���ǤI�ظq���(^{�5�F�*�E!��~���?�?��O>��|}}�r�\n�����ٓ�˗{�(,���_MPP��@!;;�������\'B�[�`A���\'�䡇�����M�z]o ��ᠸ��S�N��(--%11��K������!���AҐ����ӧO�?����ڵkG�F�(**�l6��O0~��[>HN!�\'	�B\0�F�/_F��\Z\ZJ�֭�]4-��?	�B!��䓑B!�B�B!�BM,!�B!4I� �B!��$��B!�B�B!�BM,!�B!4I� �B!����[?�B!�V�\\��ݻ��ϧ�����T9M[��������\'--��ӧӼys������رCu-22�x@���Ǐ�����6|�p���k�l7n����5.?z�h�6mZ�v�[�l6~��G�?��h����&M�жm[:v�H�������m�S\\\\L^^�G��u�֬[�-���̂Bԁ�����x�\\��СC5�???�z={������dee�,��vbccq8X,ƎKXX�7������0o�<���O���	�~��̟?���`&L�@YY������ϫ��zS����n���_�~�z~�az��I�.](++��ɓ,Z����28@Æ\ro�sr��u�f3Ç�m�\n!DU,!~S���<y��Lpp0;v������s8��_�\"??�^O���\"\\���̙3��\'������Y�M�6�iӆ}�����/��p��Ͳ�֭�q�Ƅ��c4\Zoi��Na���LPP\0F����b������R�b6�o��࿅�d\"::���6n�HXX��~�������n���@�����\0<��÷�m!�p�H!�o��p�|�rȆ\rHKK�/�O=�Ǐ��:x��X�r%IIIL�0�p�:)�͖-[���<��\0���z-�����ӧ���ţ��ba�ҥ���;���h�R���ݻy�g�@�СC\0���CU677��;z��t:����j�zm��tb�ٔ?��v�����vu�\\���j��5�u3�ͼ��˄���|�r�@���������s�\\���z}���]�F~~>N������?]�v�,[��B�[%3B�ۮ���I�&QXX��_Mhh(P�7ELL{��A�ө~��/�\0кuk�u���̙3)..f�ڵʠ��ŋ<���̟?�+V�t���p�B�-[F�F��W�^���֭[�ׯ\r6�Q�F��f�2�1����cǎ���ЫW/ͺ��Gev�������K�u���N�㡇R]�������第,>��3RSS���X�V����iР\0���̟?���\\&O�̰a�����ILL��rq��a��*��&==�U�V����\r���E�F�X�`�*p��v��5k���,\\��ڙ�R���V+;v� 11��~����r\Z5j�رc�<y�G��ŬY��͛7�p8(..����NG�.]P�7\Z�,Y����d|}}�r�\n̝;�v��y}!��2� ���fϞͩS����W�z��ѽ{w._�Lff��7)))DFF�Q߂����_�[�hA�nݔ��7[�:qqq���[�\Z�������Z~۶m\Z4�������\'O�k�.�|�M���(((МY��?*+**�O�:tP]?t��ڵ�Q�F��C���G��c�رDFF��?r��a�x�\r����ƍ��t�ܙ^x��Faa!#G�����ѣG�ؗ/_Λo�ɋ/��w�}ǦM����O1\Z����u�nUIII���s����-[*�IM�3��DFF���������/���#00�ŋc2�T��g�L&_}�{������,[����1󓜜̰a�h׮)))���lٲ���l&O���n��}���dfAq[�:u�M�6�?�I(��f�������������K/y\\_�v-K�,Q~[YÆ\r)++�f�Q�^�Z��NFF۷oW�p�uf!##���#�<@�f�<v(�7o���\Z!!!���p�]wy��?�����9Ru�h4r��%�|�I��C�*��3f�j�*U��СC���O9w���z=P�m۶M�A�\Z���x���ڴi�\\��t���q����*�j���/iРO?��\r�VV���z=۷o��I�̙3���SVV�\\���bܸq�=��\'��(��\0<x��S�2�|�y��z�v�0`\0			���ӽ{�Z��BTG�!�m�e�\0�y�=�n֬���믿Ntt��\0���>#44�\'�xB�>��DPP�2�myo\\.s��a	��\'$$�cǎi�f�֭0@I{	��ɓ���۷SXXȋ/����hѢ�G]���&��Wp+//���ߧO�>�k�^�\nT����o��8�ҥK��������Q\n\0:t�o�ۯҮ���l�?N���5�.--�c�\'00��={֨=�-g-J��r�����y��L�0���{�B�.]\0�~�:�f͢[�n�@����Hՙ!��U,!n�cǎQ�~}��n��gϞ�iӦd�N�1��X,�߿�aÆi�;233�ԩ�M��NBB�=Zu=88��JII	w�q�r�n������ŋ�k͚5�j�b�ٰ�l|��G̟?_I�q�IКY�ꏚ�^�m���deeѾ}{��\'N�\0<w�1t��Ms\0�r�J�N�����ƍ+���u�Z܁҃�׼�f�\Z233�X,���y��`���9N�<ɥK�0�L���t��U9XmϞ=;v���8��9���ܹ��^!11�K�.1c����37���BTG�!�mUVV�5�<\'\'����#F�h�ңG��p8h�^{����Nii)}������\\�z�O>��ɓ\'c4\ZU����=�ܣ\\OMM���W�\"�ށ�������өS\'~���+�ϟ?Ohhh�oc�m���Ν;	 \"\"��^�.]�֭�*=&//�����Q��r��w�ѽ{w%�Ǜ�lכ��,\0�K�`;w0�z�j,X��+��I{�Z�\n��@DDm۶��������?��ۺu+������ǣ��DVV�j!))	@��Ge�ϟG��y=�O!n�B��*\"\"���L��ݫ\Z����0{�l\\.C��Q]�4�ʃ��v�څ��������Y�p!��իW�z�jս�ׯ�T��ٲe�������T���<6nܨZ�3��mjUխWp;~�8mڴaܸq5���iM�xܻ|�2��{�����e�޸\0;��j����T���۾};�������ܹ���@��+P�?8v���w��쐻���O�8Ahh�暌��r�9B�=n�	!DmI� ����N�ʑ#G�:u*�z�B�ד��Ƀ>Haa!���S�oĽXTk��j��y�fƌ�|��my-?��۶mc��͚�;v0m�4ՎHV����d֮]�*��/_Έ#T����\"++��A�͸�z��9���;kUg���5ӷ���5���v�q���Y�e�N\'G��{��J�Ѝ�+,,��ޣw�޼�����������̃>��~��\nN����\"�ۢ&%%a�Z;vl5o.�7G�NB�V͚5��o���O?����cժU8�N\'�f���MQQ���]YxxE*��)ȋ/�E��}�k[�*����9s9r��/��ŭ�wDJJJ\"88�#r%DGG���F���4g��GM�h�T佟={�Ƈ��v�(�}FAFF�\r��v�0`\0>>>$%%)�@U�9s���\"����ۿ?�����7������ڵ�0������υ<r+//�����\n>>>4n�Xs�������2d�fJ�B�*	�����?�?�8�F�b���|���l޼�y��y,�5��ݛI�&y�ӧOHHHP�K�v;K�.%--���xU�Gm�W�~�zrss�2e��2�4��3[�n�ܦ3$$�NGll,���W�s�Lզ?j�`0��x]�\0п�]���￯�l�ZIJJb��e��������Rf*���`0�����r��\0��K�����lכ��p�L���hd�̙[�fgg�ӀnԞ;��������P^^��ݻ����ܹs�{�Ǹx�\"����l6STT��ݻ�8q�f;�������M�6)�Ο?ϸq��ܹ3s�έU?!DM�\\Z��!�m��?0y�dbbb?~����s�n�:bcc3f���={�0{�l|}}iժ����q��͔0��2D��dɒ%��w�S��l6\r\Z��h�f��(������������lذ��-[*�;p����C�1m�4,.��NG�V�عs\':����e����޽���B%H����Q�F̝;��\\U�j�2c���ۇ��AAAԯ_�g�y����ӴiS\\.QQQ\\�x���\"\Z4h@�&M�ԩ�j�\'���|f̘��C����^�z�s�=���+�E�u�nu������1�L�{�4hЀ˗/H�=x�G�۷/>>>5j������뤦����\n\n\"**���z��#Gƻ��SO=T,b�<y��un�\rx���y��G�0az��w�}W	2\n\n�>}:����h�___���f���5~o!��-	��	����իY�d	o��Ç�,WRR��l�U�V^�r:�������CXX��V��R�?IM����L&���iҤI�,�6�͘L&���<�K�5ۭ��b!//�;��P�v�7#77���\"Z�jE���q:�dgg��89\'\'��ׯ+��v;�.]B��k�7�����R��\Z!��+,!n���t/^��d�>��f!�B�^���)(( ::\Z��ŨQ�x��gU��!��?��,!n�Ӊ�l��	!�⿄B!�BM2�/�B!��$��B!�B�B!�BM,!�B!4I� �B!��$��B!�B�B!�BM,!�B!4I� �B!��$��B!�B��o�\0B!��r�Jv��M~~>eee�����#�������r�~�B��v���IKKc���4o���~ff&;v�P]����Ь����$\'\'��\r>����[~���|���;����z�*M�4��;�s��t���[n㿑�f�������F���iҤ	m۶�cǎ�o�__���<������1z�hZ�nͺu�n[�B�&3Bq�~��g���r�\nC���������ݻ�˗/���EXX�f�`�ۉ����p`�X;v,aaa4n�����d21w�\\���<x0�z���tr��9������{�nZ�lyK�ԥ�>��W_}��\r�jm��v���֯_��?LϞ=�ҥeee�<y�E�QVVƁ~��*00��ׯc6�>|�mkW!*�`A�*//��ɓ��f����ر�MٶZ��<y��ʝw�IDDD�i����_������С�M}9�3g\'N��?$??_�L�6mhӦ\r�����_�>�ʕ+�e׭[G�ƍ	�h4�ꫯ�������9s&�Ǐg��Ū{����h4b0����{��c�f̘�a2����&$$��7��߿233���5Pp��8�\0\0 \0IDAT;|�0\0?��mo[!@8!~#���˗3p�@6l�@ZZ\Z��_xꩧ8~�x����矉���駟��?�>���#���|���ox��X�r%IIIL�0�p�Z��e��v;�>�,\0���^����s��i���b�(c�XX�t)��999���u��^{�5bbb7n�f���b�x�	յ��2�u���z��r����t:��lʟ�v;yyy�3cm6�-�G��w]���X�����l6���/����=���\"��Z=e5�ʮ]�F~~>N������?]�v�,{��.�5%3B�ۮ���I�&QXX��_Mhh(P1@���\"&&�={����T���_\0hݺ����%Kx����O�����t��{���7�����7�xC)�t:�9s&��Ŭ]���� \0.^���O?����Y�bE�ޣ�����l�2\Z5jD�z��\r�n�J�~�hذ!�\Z5�l6{�����ׯ;v$\'\'�^�zi��/��z�*o��&}���6�e�̙4h�\0�E��~�z�V+�����;�����+��f���ٵk��{��ʎ;HLL䧟~����F�\Z1v�X&O���KNNf������2y�d�\r��Nbb\".��Ç��7߰a�2331�L8��m����+u�F�,YBrr2���\\�r����ΝK�v���Y�fQ\\\\���QZ�`!!!5~~??�\Z��[qq1k֬a���8���)))A��ѥKT�o�݅��dfAq�͞=�S�N�\n\0��գ{��\\�|���L�oRRR���$&&ƣ�O?���{LI9����w��\0���W�]�`����\0Z�hA�n�8t�P��#..�޽{ӱcG\0�z=yyy^�o۶�A��1�p��Iv��śo�IQQ�3��EU}�W�^eڴiՖ\r\r%00��^{�6m��\n\0��s6l\0P}�6��DFF���������/���#00�ŋc2����;w�^�f�QXX�ȑ#)))a���������G˖-iӦ\rP�L�>��ӧ3i�$����d�\rF�v�HII��d˖-dgg3y�d�v{��DJJ\n1117L/jٲ�H���k��2�d2��ꫯػw/�fٲe��vz��*��.��!3B���ԩSlڴ�?��O�@��=(+,,T]OOO��Ǉ�^z�F�8p\0???嫴���kײd����\Z6lHYY6��z��U[FF۷oW�p�uf!##�Ţ��4k��#Ej޼y���k�������]w��QWM�����o����z��ﾻڲ����r��9�|�I�{����l6�\0V�׳}�v�6m�*{�����U�L�����z�\"8ܶm�*h�իk׮%<<��C�z<����:u*����g�Q��k׎���@zz:ݻw���_~�%\r\Z4�駟�Ao����k�YYY�7�ѣG3q�DU���\"\0U*V]��BԆB��j˖-\0�A|e��v�f�T�_�u���5�U}���lٲ���z�V�Z)�?��3BCC=r��L&AAA7\\.s��a	��\'$$�cǎi�f�֭0@Iw	��ɓ���۷SXXȋ/����hѢ�G]5������r�AuN�>Mqq��z��K�{>>>c�X��:t���\0�x�\r������G�ү_?�{ׯ_g֬Yt��M5Xvs�Wկ��eggs��q���هiii�>�����ٳF�_��p�\\���Ҽys&L��Q޽^�K�.u��BQ[,!n�cǎQ�~}�_�Ϟ=KӦM=�:�c��κu����x��1b�r�b���~�\r����p8��̤S�N7|���\n\n\n=z��zpp0V�������s%&&�v!j֬V��͆�f㣏>b�����U�ϲ{M���BM��ĉ\0<���7,[�; ����󄇇k1���\'Or��%L&?��]�v�ؑ�`0Э[7��^�>}\Z�ժ�$&&r��%�;$���W�ͬ��|����5k֐����b����^�s�=�7z~��Ǟ={8v�qqq�s��ٹsge�B]��BԖB�۪��LW�����?�̈#j���S�ػw/[�l�]�vlڴI5�\0p��Q��k���)--�o߾նu��U>��&O���hT�s�W^^��s�r=55___Uj�{睂�֯_O�N������?�<����t@�;��\Z�W�����u�]�%�}����`ժU\"\"\"h۶-~~~�F��yUټ�<rrr:t���\r��$%%������ϣ��v�?\0wݥ}��;�[�z5,`ŊDDD���k�[�n��ߟ>}�x�a2����R� �Ż!DmI� ���\"\"\"���d�޽��yJJ\n�g���r1dȐZչc����0`\0)))���KL�:�a��=�s��T�W�k�.������,\\�����իY�z�����ׁ�T���lٲ���H��cw�U^^7nd�ƍ��~��[�6ս�gugMT�t:9z��f�;=�� ~��������/�s�Ne��{��������%��` <<\\��O�8Ahh��:��e�ȑ#���CYW�Ž\0��tz-�~��� U�y��M;v���Os�H+ݫ.�]!jK�!�m5u�T�9�ԩS�իz����L|�A\n�ׯ���]SӧOW�{LL�G��w�!\"\"������Z�\ZV��͛73f��{����Ol۶�͛7s��z�߱cӦMS�d�ZINNf�ڵ���`a���1B50v�\\dee�z�AU��>���T�\ZUv��U������Ξ=��j�s��e�`y���ݻ7o���Gـ�\0���C�Q�~}��^�`Ek���館���֠IIIX�VƎ�y���gϞ�Z��tr���w�\n��{���Gyy9f��k�X��\nu��BQ[�u��j֬�~�����c�=ƪU�p88�Nf͚�񛢢\"%�F����4��ۯ��W��h���x�bZ�h�������`Μ9�9R3P\0�E��wDJJJ\"88�#\0r%DGG���F���4��צ/�z�)\0v���̌3سg��gw�Rն�N\'�����\n��林�T��ws�\\<x��]�z�Q�v��u��S��Z�t���㞏��7��q������8����Sـ���!))I�\r��̙3y��\\��צ?�����������s���z��zw!��-	�����?�?�8�F�b���|���l޼�y��y,�5���[�����?�:(����C@@\0			J\Z��ng�ҥ���_����ד��˔)S��q�T�Yغu����!!!�t:bcc=΂p�L�j_��ߟ�={�a�T��_�N\\\\iiiDEE)��_����Gii)׮]c�޽�7���tUZ�;��������P^^��ݻ����ܹs)H������T{*�3g������������{�~�~�(((`ӦMʵ���3n�8:w��ܹso�/���L�2���̙3=�����&>>P����k��=�/^d޼y��f���ؽ{7\'N�l�.�]!jK��:�^!n�~��ɓ\'����=�ϝ;�u��˘1cnX_VV��W�^ʀ�mϞ=̞=___Z�j��ba���DGG{���f6�2d�2#Ȓ%K�Cߠ���A�a4\Z��l@�Jaa!����t:�z=6lP�}��,���:t�iӦa�Xp�\\�t:Z�j�Ν;��t���k׮��石a�\Z6l�=�܃�f#77�x���~�?��J���bF�\Z���ŤI��ݻ7\r6d���DGGs��u^�uRSS��t�SO=�ȑ#	��wߥ��DEEq��E���hРM�4�S�N���b�ʤI�p�\\ʢ�W^y�����>}�tRSSiѢ�������k�\'n�|�\r���L&��^\Z4h��˗	�G�<��#����\Z=M��=�c2��<y���n�\rx���y��G�0az��w�}W	6��݅��$XB�&\\.�W�fɒ%���[>\\�\\II	f��cw#-999L�0���2��h.�t:�������CXX�斕��j�U9���X,ѲeK��]..\\�n�Ӻuk%u�h4���Opp��|nn.EEE�jՊ����t:���&88Xs1����q��UZ�j�ڂ�2��L~~>!!!ծ3�	��B^^w�q���^۬���GNNׯ_W���v.]��^��,_��.�7\"���KOOg��ŘL&>���Z/h�*++�m۶�f�\Z�v��_��W�F!��,!n������q�\\�\Z5�g�}�V�z�����O>��ח+W����OϞ=y���Ug!���H� ��m�N\'f��NR\'\n\n\n(--�iӦ^�!���H� �B!��$[�\n!�B!4I� �B!��$��B!�B�B!�BM,!�B!4I� �B!��$��B!�B�B!�BM,!�B!4I� �B!����[?�B���._��իW�С�o�(��V�\\��ݻ��ϧ�����T||䛟�ץs�\\���!������拉�1}�t�7o�q?33�;v��EFF��h�w��q���U׆Nxx�-?��?�̞={�����ח֭[��Ϣ���(\\.ǏG���r����f�������F���iҤ	m۶�cǎ�o�__���<������1z�hZ�nͺu�n[�B���䓄BԱ�����x���8w�f???�z=���$%%�ѣG5���vbccIJJ�������E�4n����3;;�1c���̀x�����y��\'��n�~�\'NP^^NTTT�\n}�׮]��z�c��Y�b���\'11��͛���	dѢE���������QU`` �\Z5�l6ӣG��ڶ��.ICB�6.���r����Y��p�����|�z=:t�鯷����ڞ3g\'N��?$??_�L�6mhӦ\r�����_�>�ʕ+�e׭[G�ƍ	�h4�ꫯ����ڻw/o��6��.�<������<x0111$\'\'�RP2t�P�x�	�4ir���޽{ٱc3f̸庼1�LDGG�ƍ	S��߿?�����v\Z6l��=�7�����m!�o��!�mq��A���?2v�XΞ=�Y&!!��{��+W���Ą	0`\0.\\�u{�����޲ev��g�}���\\�e���9}��R�b�x��X,,]��w�y���͔��2L�:�?����T|�5j׮]��S�+++�Z�֗v�N�w��q�j=N����\"�u�l6-Z�#�<�L����Z�7,[��l��_&<<��˗{\nnEEE<���m�l6��v����<�2}].W�f%�]�F~~>N������?]�v�,{��.���̂�W�y�f>��s\\.��t�*�t:�9s&��Ŭ]���� \0.^���O?����Y�b��7���\0�[����n�mo���X�p!˖-�Q�FԫW��`a�֭��׏�\r*�%U}�����׏�;���C�^�4���U��o��O�܃>T�*,Z�����c�Zٷow�y\'\0.\\��W^�l6ή]�\0HNN��+F���={*}8}�t8��+Wػw/�N�\"!!����S^^�^���?�w����,_�56l 33�����h۶-���R�h4�d��������ʕ+DDD0w�\\ڵkWm�\0̚5���b.\\X�҂		Q�s������2y�d�\r��Nbb\".��Ç����jeǎ$&&��O?Q^^N�F�;v,�\'O��{Z�f\r�7o��pP\\\\LII	:��.]��*��.���̂�WաC֬YÞ={\n\n�s���p��I-Z��Z�hA�n�8t萪|JJ\n������x�Wۺj[�:qqq��ݛ�;�������Z~۶m\Z4�������\'O�k�.�|�M���(((МY��?�Z�l&���_��r���{��^�M�6���+��=��Æ\r\0T_�;w��K/�Dyy9�:uR��3����M�Fjj*cǎ��o�e���X,֬Y�z��-[ҦM\0fΜ���ә>}:�&MR�$\'\'3l�0ڵkGJJ\n?��#[�l!;;�ɓ\'c�۫}ߤ�$RRR����azQ˖-iР��/��6����BF�III	�G�&&&???�f3������1|�p������d��ŘL&U���&���W_}�޽{9|�0˖-�n�{�W��wB���̂�Wu����4?��3�����~zz:k׮eɒ%�\0���\rRVV��f�^�z�o|||x饗n���iۛ���o߮��(88���BFF�EI�i֬�/_V��7o���\Z!!!���p�]wy��?�*//\'!!��ݻӶm�j�\Z�F�b`�ùs�x��\'=����c��T����`BCCT�C���΢E�T�G�V��������Ջ�k��СC=�?x� S�Ne������v��1`�\0HOO�{��^���/��A�<�����KU���ʮQ���c۶m��*���۷ӴiS��3g��J����bܸq�=��\'�ʻӴ*�g]��BTG�!�mq��\0����>����P�x�	�ߙL&���T���_���h�~m뺙���\\.�̙Ä	�2T�;vL�7[�ne������0N�<��߾};������\0�ډ-Zx��?�ڿ�f���ӧO([��>}���b�5�ٗ��:�vVZZʉ\'5j�*P��`�j�ҪU+�u���ѣG�ׯ�G�ׯ_g֬Yt��Ms�����~��,;;��Ǐӿ�>LKK��	�gϞ�{��o�����{�@*耀\0%\0t�\\���Ҽys&L��Q޽^�ݟu��Bq#,!n����ba���6L3G��p����Jc��E�Uu���f�֒��@AA�G�V]�j�RRR�Z�k��ILLd���ʵf͚a�Z��l�l6>��#�ϟ��_��L��$h�,h���֬��V�o�>����/��@k��Ç���t�\Z@���a��4��ӧO�p8<�����X�V��$&&r��%�;$���W�����|����5k֐����b����^�s�=���nݺi\n�9N�<ɥK�0�L���t��U9XmϞ=;v���8�mf:�J㫋wB��`Aq[��\nG���pо�� -==���R���{��k[W]�}��U>��&O����yyy�s�=����T|}}U�!�w\n\n\nX�~=�:u�����r���󄆆�p@Z����oN�:ENN�G�V������u�]k&�}��X,�={�)S���t:=��G��A{�mA\r��$%%������ϣ��v�?\0wݥ}��;�[�z5,`ŊDDD\0�999:�k��Z�\n��@DDm۶��������?��ۺu+������ǣ��DVV�j�.�]!nD�!į��zwjM�te�v����_Y\\���UWm/\\�����իY�z�����ׁ��S+��e�\"##U_��5kT>7n��ƍUu���/��mjII	���V�XAPP���\nP�c�ѣG5�+�ӓ�佝`0x��4�v�g(����`м�����z�����#G�УG�jO�v��p:�^˸�#((H`�{�E{K��۷ˋ/��Ν;	Pv��<[r��1��>�Y\"�T��xw!��	��:���j\Z�{a���ueV��͛73f�����J]u��O?�Ķm�ؼy3��{���;v0m�4ՎHV����d֮]�*��/_Έ#Tc��EVV��`�6ܻ�x����ѣ�ܹ�y��)�t��Y�V+�;w�(�������ѿ�uw���^�}6���A����Z��;V�{턷�?�m9r��ݻ+iC���_��f�Zaa!���{����V�s�sp�����٬lY[U��\nu��Bq#�u��W�5p�H��:�x��Ŵh��c���\"�ûj[�ʹ]���`Μ9�9R3P\0�E��wDJJJ\"88أ/�AIFF��Ѫ{F����2�/���C�;�>%%E���˗���a�ȑDEE)���%���t:IMM��^�j�Yu�222�v�ǽS�Na�Z�֭��o|||hܸ��S���1d�ʹ�����III�lPUgΜ���Hs��k׮������Oii���n�̻v��������υ<r+//�������wB��`A��\Z8��Ӈ��\0�T���ҥKIKK#>>^��a0�ݻ�j������Z�~=���9����?*�,lݺUs{ΐ�t:���ԯ__uϝ2Uuqsu�B3B\0\0 \0IDAT�eȐ!4oޜO?��\'N(םN\'�v�b���9�?��Ϫ߹���۷���R�]��޽{7n���|�z����k�[�P5��̙3@�Paa!|�����~��QPP��M��k�ϟgܸqt�ܙ�s�ް_��Ù2e\nF���3gRXX�����M||<��A���%\'\'����RRRByy9�w�&::�s��y�����ŋ̛7��LQQ�w�f�ĉ���Ż!č�\\Zg�!�-z�wHII�j�R^^��T���*i0{��a������ҪU+,$::�#��;w.�֭#66�1c�x�Y��n�<��lfȐ!ʌD`` K�,Q�8l��4hF���T�RZZ�N�C�׳a�����9t�ӦM�b��r���t�jՊ�;w���n�Z����;w.����w�}4i҄���0�|z������bF�\ZEff���QQQL�4�޽{ӰaCƏψ#�����+W(//�^�z�}�ݬ]��!C�([x��_Aii)�������p8\n\n\"..NY����¤I�p�\\ʢ�W^yE�������ӧ���J�-���%  ���h\\�>q��o����d2q��ҠA._�L`` =z�����yXU��?��aF&eRɡ�y�됥�����,����Ri\\E#ӾY�v�s©԰L�YqH�r�8���� 3G8δ�;�r<�0(�ޯ��y�{���Z��^�F�.]лwoXXX`ذaHOO�R����=�֭�v���pURR��S��̙3��dprr°a�Я_?���s��A�~�\0�ob�е��ǈ#��k�!44����3g�l�fۉ��a�@DϜ^�Gvv6,,,���)yl$P�A7//���G)�Q�?O���T*ddd���j�\Z�W�Ʊc�пDFF��A��۷��jѸqcq�Lff&lll���V+m�������������ڊ��򐓓ww�j�q��B�@vv6�ԩ�Ϭ���,(�J������z�w�ޅ�����䴴4������Z-�ݻWWW����v\"��1X \"\"\0��[�z5����ѣGK~�����9,�h���X�`�z=^|�E���={�|�U#\"�g����H4f��ٳ�{��J��ѣG�R��u������I��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$���P��Ϻ\nDD�`�@DDFRSS�C�=��3f��+@DDϏ�����\nM�6}���������Ѻu�\'���E�6m\'������2�9s|HD�G&��+AD�w��w��ʕ+���@Æ\rMғ��q���k�������,�ڵk���5�6j�(xyy=rA��s�p��ydee���>>>x��вeK�{������,@�z���Ց���aÆA\\�v\r2��>�6h4\Z�={׮]Cff&�j5�֭�f͚�m۶hժ,--�Z}���������ǣq�ƈ��~j�&��,�@JJ\n�������!C�HVVVpuuũS�������TxzzJZ������tP(���\'\\\\\\���o�����Ѹqc���]�tAFF��݋�K��������=\n�3f�@dd$�~��G~��/^���{&iׯ_�Z���ѣ��@A���o�����Ν;�[�n�С��ʐ����˗����ϟ�l���舒����aԨQO�D���`���Ap��4o�nnn5N��N�ß��������u�֕�ѭi~s�͛�ɓ\'��/�DNN�d��M��iӦ8}�4�y�|����ϗ�\rxyy!33��^��TQNNƌ���PL�0�(���P*�&�\0����СC���~��Wt��)9r3gΔL2d��郺u���3����\\������;w��Qz߾}����V�T��/\0:w��ԟMD������j݅0r�H��͛5N�ʮ]�0|�plڴ	111\r\rE@@\0n߾]+��ٷo�Z���=++�lޜ�����b^�Ba�G�P`�ڵ�={6���$g)jjݺu\0��cǚ�egg�W�^����zܿ*��l�OH������Aqq�d^�F��˗�K�.f˓�d�S�N���=�R)YFQQQ�Nn2Է��I����;�///�_��$P0P*�x���M���h�?k�ZdggCj�� (--�v�<x�����z��r��ؠcǎ�y��DD\0g���ݻk֬� ��t���A���np��\0@�ƍ����z̚5EEEضm���\0\0���0`\0.\\�\r6<r��(�J,Y��֭���3���+\r���888���yyy&y�.]\n�m�iii�޽�dY��CJ||<���aee��}̘1ptt4�����իW�̙3�j�P�T���ǒ%K`oo\0�>}:��㑟�������سg�8��Ł��?��;v 99����߿?\0�Y�fX�f\rbcc��W_!33ݺu8�<���q��i\\�~�v������h����~���������\0\Z4_}���r���L�Z�\n������D~~>ڴi����E�U��\'�|���\",Y��ҙ�E����\0��\"++aaa:t(֬Y�ÇC\\�xVVVP�T8r�>��~�\rj�\Z���FXX��3����u�V�ݻ:�EEE(..�L&C�`kk[�m\'\"8�@D��u��غu+N�<	\'\'\'�o��h\0SU:\0���!00���&�/Z�H\\n����7����X�+�b�\n���m۶P�l\';;�l�`���\0\0www�����D?~3f̀R�DAA���Be�!�N�:�s�v��m���/\Z-�:v������g���ŋ�6m\ZN�<��;w�����ѼysX[[cѢE���áC�p��a���ǎ���1�F�ē�f͚���DDD`ʔ)\0����cܸqP��h׮�x߄	мys���`���8�<BBBp��!̚5����<y2�͛�N�:����ݻѲeK8p@�bcc1t�P�h�qqq8{�,��ۇ�w�\",,Z��Ҿ���A\\\\��ë\\^ԨQ#1�j߾=ƌ�F���B����ǏGxx8���������@\\�r�F��7�|�+V���+W�Dnn�Q��Y���\\���8u�.^��u��A�բk׮��v\"\"�@DT����___�믿�q�ʕ+�V�Z	�w�6���o�	�������%�|��___A�V?R��$&&\n��׿����ڐ!C�7�|�l��ݻZ�VA�0a�Я_?�<�G����[�����&e��s�9\"���\n���BXX�p��-�|.\\ڶm+��r������0w�\\��AAA�����Ngt���T�ҥ�н{w��\'O^�u��<z�����+��Ǜ<�o߾Bvv��u�F#���\n&emڴI�������k�ϟڴi#<x�$��9s___�ҥKf�\'�0b��C�Bqqq����߿_���/^,(�J�t�N\'(\n��˗/|}}���4�ڝ;w�W^yE���2���A���W�p�x�6�NDd�eHDT�.]�\0f׫W�>u�T����oi\rV�^\r���G����\\899�tk��A0o�<������C���W�J޳�~��V<==���(�<x������	�����Ü��@��z|�嗈��E\\\\F����pqvE�V��O?E�^�L6�޿\0�f JKKq��u�7��[[[4i�Ĩ}:��/_�����z��Ǜ,C3<g���&{oڛ7onRVaa!d2�83SRR�O>�~~~x��7M�����ݽ{׮]C߾}%��ʕ+&�E����֭��>[[[L�6\r666&�[XXHM�P(`kk�^x@�߿��H4l����&�\r��Xm\'\"����:��`u�e2���L�P�ܹs:t��q�N���dqIKM�Wf׮](((���㍮���A�R����h��V���Ç�r�J�Z����R���h��h�x�b,\\�P�W`X>c V�U8p z����hlڴ	۷o�ٳg��?�^�z8q�RSSѪU+�=ׯ_`|�Ε+W��h�J�Ҩ���;T*U����r9:t�`4���9�zI���~�:^z�%��p��aܻw��)L���OkX�ֲe+���[�\"99\n����puu�����`A.����O2P�H��!11���Cnn.~��Wt��Q�N�<��W�bŊ������-竍�U�=DT��r��~��?������th�Jz�������R������s��},[�cƌAff&RSS�����-�9s����ԩ�x�𖼠�\07nD�v��ꫯ��n݂��G�˚�S�BCCq��Qt��w����M�\0\0G����-ڴiKKK��:t耏>��h�.��aaaa�&�J�;w���#���d��B��͛7M��}RG�\Z����]�h4�z���=111\0`��ݺu2���G���\0����[�r%bbbč�6l�������HKKC��惥��$L�>�z�ºu됔��B���L�~ٿ?lll$O����Ejj�Q��h;QE�Y �Z�P(��������ҥ��4i�D2���㰱�7�4�9K�,�N�Ö-[�e�����\0�ǧV|ξ}�h��~��\0��;w�4�<��,<������4�f���+�Ν�aÆ��ݻ\0ʿݴiSL�4�Ze��r�j��h����ӧ���1h� ��^^^f�d�\0r������]���0�����(0�~�:<<<$�V�q��%t�����f�l�\0�����1�����(05�Jt�*,<x���;v,�=*�Pu��q\0���^���_~Yrv���k��DDqf��j�a hn	JU�R���\0@�8P�J��{�b	������o������3��駟0�YP�T���E``�QY�`a���=z�� Z���>v�0s�Lq��0��װ�����՞�())����%^� `˖-�֭��&[������fg���+H�g0��o<���T*�~�/&&*�\n�����\ZhР\0T��^�K�.�S�NF{9���agg\'�̭��s��E�=���ek��`�O�V#//������\n��v\"��,Q�z��\nJ�R��[^^�KA����r�Jx{{�K_����t�7o�����K/I�1lN�������������$%%!$$�(-33eee�����xXQQ.^��F�\ZI��������ȑ#��W�y�f�>v��U��6n܈��,|���7n@�R����l�R��*ۯPY�y�/���8���������70\n\n\n�b�\n<����`aa���q�a���J��Iǎ%7ϟ;w�������Ѽcǎb gccܾ}��Cnj�\Z�ϟ7���j;QE��V=�~�\\�=z�g�WԫW/���b׮]�[r�V��k��ʕ+���2Z�Q�������>��l��������1`�\0������d�������Q�a��Û�+돇�;w\Z�w��1\ZTb��p�6l� .M�۷/<x�O?�T���J�BLL֮]gT�a�K�f��k%%%X�|9~��G|��7FA���|V���III��_����+��_�2i��\0S�V��ի&e������\0{���ݺu�&MB���1�|�~����|�2331k�,\Z�߽{QQQ\0�����,�����93,k�p�����V�q��	���௿�2��gϞHOOǂ����R�\'N`��ɒϩ��U$~]ADTC�g�F\\\\T*�j5\0�_.>t�,XPi����ϟ���hDFFb	&�8y�$>��3XZZ���\n����GHH�d`R��\0�������3���X�j^y�1�F�������	�F�|�Qaa!JKK!�����;v\r�ϟ?oTN||<�O��BA ����ャG�B&�U�%&&b˖-������^|�E<x�\0<@���1e�8;;��U*fΜ�ӧO���NNN���Ûo��w�}��HϠ� \\�v\r666x��agg���L`���&k����0e�� n��8q\":u�A�!??j�\Z���x���{�n\"++� ���	;v�@�f�p��5����?ggglݺ-[���ի�y�f������ݻw�ƍ��E�����3g���\rKKK���\"$$o��V�}���~�	QQQ����K/�{{{ddd���]�vE�.]лwoXXX`ذaHOO�R����=�֭�v����URR��S��̙3��dprr°a�Я_?���s��A�~�\0�ob�����ǈ#��k�!44����3g���fۉ�\0D��(..F^^|||�������Ά��<==%��|��ϓ����t:���PTT�z����������\"\'\'u�֕\\URR�Ν;c�ĉ;v,rssQ�^=ԯ__�HZ���lܿ>>>F��>myyy��Ɂ��{��S�C�P ;;u�ԁ���c�+++J�>>>����^��ݻw���&�99--\r%%%b~�V�{�����U2m�����,���g�bҤIX�~=׹�Cq�I2|_����DD����Q�T�|�2N�>\rOOO$%%�)#\"�.C\"\"\"#4:M\0Z�h��>��Ո���DDDDD$�ː�����H�\"\"\"\"\"��`������$1X \"\"\"\"\"I�����H�\"\"\"\"\"��`������$1X \"\"\"\"\"I�����H�ճ�\0UmӦM8q�rrrPVV�3g������ɒ	� <�J�/���p��DDD�aÆ&����8r�ѵ��@���J�w��5���\Z]5j�����7n����qHOO���\r�4i���~...�]�ߝF��ٳgq��5dffB�V�nݺh֬ڶm�V�Z����է�����?~<\Z7n�����l\"���+	\"�Z������(���௿���ceeWWW$$$ &&QQQ�|��d^�V���H���`��������c�SRR��+W�A���߿?�5k�-[����/^|��/^�<VϊV�ņ\rзo_>|\r6D`` ���GGG,_�cƌAii�S����#��������]�>�g�?�!�S!.\\���͛��ͭ��5�R�����J�\r\Z�M�6�.���t���?���WWW�n����\Zϛ7�\'OƗ_~����<M�6EӦMq��i���;��/���/�7::\Z...���Bff&�{�\Z��a�����`�����\r8o��>���>}\Z���5.�ԩS8r�fΜ��u}�rsswww�ܹ���F�}��Err2�Z-�z�A\\�Ν����蟉3D��]�p#G�Dpp0n޼Y���HIIAxx8��K��/��ȑ#1h� dddH޳k�.>�6mBLLBCC�۷o������V���o�\r\0���2�7\'\'�����W�P��Q(X�v-fϞ���4�%M5u��i|���X�h�I�\0\0���1b\n\'Y� ��˃J�2I�h4X�|9�t�Re]Ax\"o��z=rrr$�W���<���;�������M�R��_��\Z�F��V�Evv6�V�ִ�<@NN�z=�r9lllбcGɼ��v\"\"s8�@DO�޽{�f�\Z�\0�Nt�С��w��\04nܸ�g�Z�\nÇǲe�`aa�^��s�⧟~��ݻ1m�41�^�ǬY�PTT�m۶���	\0����`�ذaC�ڪT*�d��[���ΰ���4Xؿ?������ .-y�ҥK��m�\"--\rݻw�,����P(0k�,<�d�[Q�֭\0���F��y�f���ppp@jj*����h�\"t��?��#v�؁��d�����\0�f͚a͚5\0�g|�9�Ç��~�Z����3���\0��_��_������ʕ+��G��^\0�ٳ\'fϞ\r\0���ĪU�KKK���M�6�?>Z�hQi�\0�\'�|���\",Y���Y�E����\0��\"++aaa:t(֬Y�ÇC\\�xVVV�jwEEEEغu+����N���\"C&��C����5���m\'\"2�3D�Ĵn�\Z[�n�ɓ\'������\rr�J���8\"<<�Z����ѳgOqɑ��^y�\0����Q�E�!11˗/\0�����������+V�G�h۶-��7����f�8p\0\0�����,$&&����1c�J%\n\n\n$gj�?˗/GQQ���J��N�V��֯_�3f`�ر8v���ك���\Z����W�\0�Q�Fhڴ)\0`֬Y���@DD��3��\0\0 \0IDATL����}`` �\\��Q�F�o���+��舕+W\"77\0�ꫯ�S�N�s��M���K���ppp���ˑ����\'�K�bcc1t�P�h�qqq8{�,��ۇ�w�\",,Z���6��� ..���U./jԨ��<�}��3f4\Z\r\n���b�?��ᰲ��v�\r3N�����p��)\\�x�֭�V�5ٯ�m\'\"�g��i޼9��7�)))&�Ԫҁ��7n�#����󰲲�t�ݶmV�Z%�.���eee�h4��������$<x��#777�3IIIP(�R����,�Z�`��}���#!!\0��/��U��)**гg�*OQ2ԥQ�F\0��MDEE᧟~�\0��d����ݻwǶm����!C�����ꊃ��������(���\0,--ѦM���O��������Um޼={��ȑ#�/c����p�B���b�-Z   \0�v�BBB:u�d���~�-���1`��J��annnpuu\0X[[���F�gM�\r���L�4	�Ǐ��ɓ��+�J\00Z�Um\'\"��\"z�.]�\0fױW�>u�T���<�F[�|I˾}���G���G��z�jxxx�O�>�������ɩ�@A̛7������������ի���߿�ROOO$&&��Daa!Ǝ\0��	ooo����?���(++C�޽+����ʗ�ܻw���n(\0�3C7n����p��eɽ@����f�<X���5\n�K��.^����X:t\0PRR�O>�~~~F�eC�=�����w��ڵk�۷�d?^�r�d����ݺu\0������ӦM����#�[DFF�aÆ\r\r5�oد`X�Wm\'\"�\n�\"z������G�*]&�=R���j�իWc�ܹ=z���P(p��9:Trm�N�Crr2ڵkW�sv�څ���?�躛�T*���Q�N�z>|X\\���,�T*h4\Zh4\Z,^�.ߨ�$H�,T�G���k ~��W4l�-[�ļy���ō��������C�RU��Y��!11���Cnn.~��Wt����*�`A�����?ǿ��o4h�\0\0p��aܻw���K���5kXnֲe+���[�\"99\n����puu�����`A.����O2P�I�O�<��W�bŊ��d����T�6�NDTD����r���M��7n�ԩSطoZ�h�={��(\0�g�N�V���			(--��-�����l�2���!33�(�0����F�&M��gΜ����Ѳé;����Ѯ];���b��[����Q�`�2�o>T�	�������EXXA��c�ЩS\'q�Me�r9\0��@RR6o��\\�6mڠY�f���Bff&F�a��A����5\n�m���bbb\0���*�u�d2���������˳�ݖ-[�h�\"lذmڴP��MKKÐ!C͖_�v�߿666�ի�I���HMM5�A���U��=Q��G�NzM9rVVV@\\\\ƍ�?�C��w0gX�Sq_����acc#n@6gɒ%��tزe�l�b�VRR���x���۷���Fo��ׯ�|�s�N�ܹӨ�;w�<�����Ű���2�ظq#������(\n���K�z�\\.����d]<���H�;G����#��L���d2�����BNN6l؀��h���ׯ����d�\0P�A�ҥK�ڵk���a�ᄥ�����dd\Zf%�v��M�I��^���_~Yr����k��DDUa�@DO��#R斦T�^S������1{�l�i�F܈k�P���Y��hϽ{�b	f����~�\r�޽{%�G����ӍNDR�T���Ŷmی�\Z�����c���F�mA����7�x�:�7���z��[��d�_�qqqX�d	����7�ՙ����f�+b�ܹ�ѣ>��c�4�z�%_�7FRR��/B�3ƨ��z=�J�٣Acbb�R�\\i�\rK�*�Ƈ^�ǥK�ЩS\'�`%>>vvv���I��j5���вeK��?�_���NDT�JDO���WP*���Gaee%.�HNN�N��j�ʕ+���-y���N�üy�d���aCk�e4111pss3i�!(IJJBHH�QZff&���$��פ�u+?>��_~�L�s�fΜ�i�>���%`�W�ƍP�T���3I;w�JKK�5���vw��Q2 iܸ1��򐘘�7n��daa�S�\n\n\n�b�\n<XrYOE���@LL�8#��?��J�����r�;v��_�v�������o�6���Z����獖��Vۉ���`����Gݯ ��ѣG��Gu��-\0���\0������صk��E��b�ڵ�r�\n���*�4����#++|���<��g���/y4���;d2\"##M�aX2������ȑ#���ŋ�?��k�Z<x��>��C����$///t��r�7n�������k��2���PXX���$101,�p�����V�q��	���௿�2;�Ըqc��j|��g����%\n`Ϟ=�[�naҤIh߾=�ϟ_e�xyy�>@ff&f͚���B���w�\"**\n��XVV����ֿ���ٳ\'��ӱ`����A�T�ĉ�<y��sj��DDU�	Rߢ\'\"z�g�F\\\\T*�8�4|��СCX�`A���?>����	&<R=RSS��[o�{���`���ɓ���`ii	(\n���!!!f���<<X��pttĪU�ď��F�������	�F�|�Qaa!JKK!�����;v��1\0ʿQ����xL�>\n�� �k��=\n�L�H�������ŋx�������\\t�����&���3g�D||<���`mm�&M�`�ĉF�m���0e�� n��8q\"^�u���`�ԩ8s�d2���0l�0���AAA���Ĝ9sЯ_?�g_�t	cǎEPP����O�M�����3g���\rKKK���\"$$o��V���য়~BTTrss��K/���pttD׮]ѥK���6l��ӡT*aoo��u�]�vF�\\մ݆��ct���1b����k\r\r���+�̙#���v\"\"s,�s���yyy���HKKChh(��ʰ{�n�M�z���ٰ�������q�ϫ���J���8;;�~��Fk�����Cnn.<==���&�\';;��߇����q�YYYP*���񁝝�z=�޽777��t���Ѱa�*O����CNN���+�kR\n���٨S�<<<$�R5mwZZ\ZJJJ��Z���݃���d��l;��,�����T8p\0[�nEǎ��W_�4\"\"�G�`����~��g,[������χ��\r�u�#F}ˀ���j���������ի��Q9DDDDD$�G��$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DD��EFFb����֭v��Q�{322���$��ʕ+;v,�x�\r���U^\'\"��	� <�J�]���b�޽\0\0�^���b������vvv���A@@\0^|�E���d9rĨ���@���J>�ڵk���5�6j�(xyyո�			8u�X�@�TB�����mڴA`` �ԩS�k\"++;w��ڵk�{�n�iӦZ����`ذa׮]�L&Cii)����.]�`͚5\0`�:Ug���L&C�:u�a��?�ڵ�o����\0x{{c���8p ~���+++���\"!!111�����˗%��j����DLL�o�x{{�����kmm\r+++DEE����x��0|�p����puu����Ç����ʯ�\r\Z ++���hٲe��~�:�j5�\r�L\0������5T*�t�\"�5w�y�x�b<x��YW���JVϺDD���.�y��pss�ѽ*�\n���P�ThРڴi��Gt:���O�������[����e�����A�>}�l�28�\r���틀�\0��CϞ=\0M�6EӦMq��i���;��/���/Y~tt4\\\\\\�����L���{5ꇇ�j�\n���X�z5ѻwo1�gϞ(**�֭[q��Ut���U�\\�N�:U��\r��>}��nݺF�����$(0w�Y:u��9��3g>�U�3D�\\�p�F����`ܼy������ <<�ҥK��_`�ȑ4h222$�ٵk��M�6!&&�����۷��L�\\\0�ڵ�IZ�&M`ii���R��999�������o\0\n�ɽ\n�k׮��ٳ�����\rV�>�S_GGG\00�	�`�sA@^^T*�IZVV���ѹsg�N���[�a&�ar����&K��]7�����ɩ��z�\Z�F��V�Evv6�V�V�?\Z�˗/�V�R��=i�Y ���޽{�f�\Z�\0�Nt���$ߝ;w\0\0�76��j�*>˖-����z=�Ν��~�	�w�ƴi�ļz��f�BQQ�m�\'\'\'\0@zz:��bÆ\rU�9>>����ݻ��thѢ���������pvvF^^�ɽK�.���?ڶm���4t��]������\\OOO�}�Ҽys�����5�J�#G�������ߠV������`���������͛7��?����RSS���E����׮]q��A�޽�.]�N�C�\r�z�j�}����ꫯ����nݺ��\\�r9:w�l2{d�zjj*V�^�3g�@��B�R���K�,�����̅\"++aaa:t(֬Y�ÇC\\�xVVV���;v�@rr2rssѿ\0@�f͌�SdffbժU������%���ѦM̟?���ѓƙ\"z��n�\Z[�n�ɓ\'����������(O\\\\nr��_��={��C���+\0�װW�h�\"$&&b���b�\0\0�������U�t��\0�=\n\0F˓\0���8p \0����df!11Ǐǌ3�T*QPP 9�PY_H�h4�z����8$$$���?����!00W�\\��Q���7�`Ŋptt�ʕ+���kT����1c��;ǎÞ={���_#33����������,����?�G���3�����۷�۾}{�7j�\Z�ڵ3JKMMENN�I��]?v������g���ŋ�6m\ZN�<��;w\Z=s̘1�h4(,,DPP���1~�x�����ʪF�ӨQ#4m�\00k�,DDD \"\"S�L����b�СhѢ���p��Y�۷w��EXX�Z�����	��=W�7o�|	NJJ\n��}�<			�����q�U����aee%��5��m�6�Z�J|�\\�����ʠ�h`mmm��7o\"??_r�P(�u�V\Z4m۶�\'%%A�P��ԯ_�d�Ԃ�������			\0�^x��5��ׯ����ڵÃ ���q��q=\Z�o���h&���4\Z������(�����ш���O?�$���C�����(�߶m[DEE�?�4i�-[f2(vss������K����3gb���FK������\Z����3]]]�o?p��QPY���޽;�m�///2�p�>��C,\\�o���x�E���]�����N�:��KD��0X ��ҥK�\0HoL�:u*BBB$���_�o�>|��G�����^�\Z�ӧ��}���prr�4P\0̯����?��G������g���~�{===���(�<x���;v,\0�{\'���M�_���X�ŋcɒ%\0\0�Z��u���^�Z�6�oaaa2�![[[1��w���� <<�(P\0�g�6n�(�ٰ_a���&�\n\n ���� >>^rYZu�+��j|���ի�Q�\0\0���`�W#>>����6m\ZlllL�T����d\\�|���&�KJJ��\'�����(P00����!\"z�,�s���(S]��X��\"::\Z�W��ܹs1z�h1M�P�ܹs:t��I<:����&�]��(��8qJ�)))HII��ﾋ�c�\ZZ���ʕ+�k��ׇJ��F��F���ŋ�p�BXY���6�I��Y�N_T$��Q�~}�����ƍ�;w.&N�����d0��鐘��{��!77���+:v�(.�ڴi�z��a�\"��^+�`}��5\0��{�\\�:�ګ�_�ĉHMME�V�L�<\\�~\0L�-�����\'(TTU�\0���n��Ç�޽{fOHR*�\0��G�=*D�\\�����r��\r�:u\n���C�-�g���ԗ/_�N�C�V�$�HHH@ii�ѱ��\\�t	�۷�/�\0�F�^x���G�$�3g�����h)���\'�����=ڵk�W_}UL�u�<<<��VŰ_��[YY�]�v�����)S��ԩS�9))	�7o�\\.G�6mЬY3XYY!33#F�\0P~бc�ЩS\'q�Ne������(��r����3��P(p��M|��F�k�_��ѣ�����\0\\����g�?;;iii2d�ٶT�*�\r��bbb\0���^ѭ[� ��̞�DD��0X ��Ne��r��XYY!  \0qqq7n>��C���aYO�&M$�8~�8lll�\r���+���b̘1ժ߾}�(~P(�Y\0��;w�4�d��,�Ʊ���\nR�ՊK�<���H�;G��U=~�8��.��ȀB��K/�T�z��r��_����r9Z�je�7��ŋ\0L���d�µk�дiSL�4�Z���M�ǜV�*����K�gy��uxxx��(_>u��%t�ڵZ�Qm�iHD��1�CZGDD���ooo̞=���bæS�2��T*��݋	&�o��1�)�n=U*bccht�,�_��G�6\ZL\n�����Z	���\' ��Я_?b�ܹ�ѣ>��cq �w�a���$���|��?<����ƍ��{��\n@������������NrITM�(?����˒��^��R�4�m����T*W��DD���=w*ۯ�T*���U����uT���\0@��+W���������Y��777�v����$����eff���L2X�I_\0�������7n�СC\n\nB�ƍq��9����|���U�;�owww��U��}��]�|z�^2X0�,�&�Wpqq�͛7��Q9�\\��;Jnr�I�\0���R�L�W囤]\\\\���e�VPP�+V`����իW��MDT�,�s���a�=�Υ�ʭ[�\0���cЫW/���b׮]��Z�k׮ŕ+WU�M×.]��������߿0�����L���H�oA�L=����}a��\nEEEؾ};���ѧODFF(�\r��Y\\\\�Z�\'N $$���Q9^^^�ܹ3�r96n�(�������k����prrB˖-M�h����G�\Z�+T�;\n����<���~*~Y�R!&&k׮3ʛ�����4��05���(U�<�-,,DRR~��1���سg�x�֭[�4iڷo����Kփ��I�	R߫\'\"z�fϞ���8�T*q�i���C��������#::\Z����0aB�e���⭷�B���e�v��I|��g������\n����*7U�7			b=mll��₝;w��͜9\'N�@ii)d2\\]]�c�4j�H�s��y��q@��y���P(2�>>>8z�(d2Y��b���HNN�Z����\r\Z4h\0kkkܿ\Z�~~~9r�ё�%%%�:u*Μ9�L\'\'\'6���CPP<==1g����\0�����3g\">>VVV���F�&M0q�D������Ð!C���AP�n]�߿���Gjj*ƌ#~���������� A�����Z\rkkk���ؼy3F�	�B�F���c�֭;v����G����*�\n3g���ӧaaa\'\'\'�����7�Ļﾋz��A6���P*����GݺuѮ];��j�?qqq�2e\nA7�O�8�E�4�\0\0 \0IDAT��:������9s��ް�����-BBB��[oU��%\"z�,��Fqq1���$��<,--\r���(++��ݻ%7���zdgg������F���w5��^������@�ѠN�:Uř���R	���A����ݻpss�܌������\\xzz�]������\"\'\'u��}� 5���lܿ>>>�S��dyyyy��Ɂ��{�{f���D�?%55�֭[ѱcG|��W<A����1X �����˖-���%���acc�nݺaĈ&k߉���f,��^AAJKKQ�^�\Zč����c�@DDDDD�xt*Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$������g]\"\"\'�����(\n�=\Z�֭{�U!��� ��=��I��Pmb�@��i�&�\Z5\n�{�F��ݡ��u�YFF���*͓���q��!--\r�[�~��yZe=��W�\\�رc��o��7�x�:��=�~�ͿR\n�L���>�g<kO��ݓ���i�&�7��\Z� ³���*55{��\0��z���eee��������/��$\'\'�ȑ#F����W�׮]Cll�ѵQ�F���K2BBN�:Ue݇\n�J�!;;�ǏG�ƍ]e�ϣ��6� �ڵk��d&y�ݻ�	&���K�.����3���*�q�/--Ezz:���ХK�Y��F�S��ُ���O��۷1e�̘1����ղ�O��ݓ��TZZ����c���5kV��I�l�Y ��L&C�:u�a��?�ڵ�o����\0x{{c���8p ~���+++���\"!!111�����˗%��j����DLL�o�x{{����l����aee%�[�~}����nݺppp�V�ETTT�f	��쌼�<t�ڵ����~�:�j5�\r&��\Z���>F������\nթ��,�qﷳ����5T*�t�R��������������4L�0S�N��\n�/ƃ$Ӟ���\'�;����Ǐ���ۑ��_k��?�@�)�J�ܹs±cǄ��A��=�r�Z����$�:uJHHH�Zm�����\"���\n�~��Iڭ[�___��w�5I���___�믿�,��o�F�-����F�]�:]�|Y���v��i����-�n�Z�h4�*���Â���p���j?�y������W�G�V?��T�>O��ڨˏ?�(���\n7n�x�r��V?��߿�<x \n˖-�������X���_7��4��=��I�����cǎ\'�����=)))ǀ�t�R|��9r$\r\Z����\'Zή]�0|�plڴ	111\r\rE@@\0n߾]�g��r\0�|�ޤIXZZ�����zNN~��w����\0���>L���;�(�������k���F�*v\rj�K�h~�آQ�h�Fc�h��\n\Zb��\n���HP J�l��Y�.����g�e�Y�Yv���9��{��s���^G,ƾ}��f�\Z�|�m۶�OU��f(�7o��۷�Q�F\Z�/))ANN\nbbb`ll��}��������~��V����<H$�\Z�@�Q��� M(\nԪS�8+\n�ґ�>�ȯ-nu�\r�t�������ƭt���>k�B���������x(\n�d2�wee%���A�܍+���fG]�Ai�����all�ŋk�[U�9995�Im�Bm�e2�o�^�\n��˝��$;;;XXX 66�V�Jmh�MP(:d��ݘ2e\n�m�CCC(\n�[�gΜ��ӧ�d��/^�\0\0t��Ik9\n�+V�@qq1�9sss\0@ZZ\ZF��~����k��GGGkl����o��rt��]��ܹs:t(����m>����1t�P888��˗<xp��(��������Y	%���>|��{qq1>��g�B.�������000@�>}`bb\0ؾ};�;�D���p�n�\Z��}ʟ|�	���`gg�k׮��OHH���/�<y333�D\"XXX��dZ��.]BHH���H�RXXX`Μ9����t�M�͛7�������8p�Zzfffb��ݸy�&������{{{|���*i�|�rDEE!??aaaHNNƩS�	�T��)4hP��Im�����Fh:��Ġ��04�_�����͛��fff8y�$��� �1}�t��8l�0,_�\\MƲe����|\\�~\n\nb;F�����T:`|�q��M�������g�}�I�&a�޽		!;v��?���g;w��z`����n�suu����Ve�ˎ��Cll,\"\"\"t��Չ��ą�ƍ�<㣛r�B$aϞ=�s�*++!�H0t�Plݺ���Z���O�8���)))����ȑ#\0]�v�޽{�Z����ڵkǶ�J����\n�5.\\ Ð�������ݻ�����IΦM����;)--U{g֬Y�w�޼�<�,\\���ف�0��Ç*�cƌ!����BF�\ZE���U�?z�8;;���\\���+�09q�/}�R)�ӧ���/U܃��Htt4�;���d�Сd���$\'\'�u�u��6���\n���ŹD���E���Ɋ+T����O����;w�0�ɓ\'�Brss�{�GV�XA.^�Hbcc��˗�|@�Qы�̼�<r��Q�0ٽ{���7n� $�&���B���Oҿ��榲M�ѣGd�������L�6�lذ�ܻw��D\"r��q�0�?>�m��Im�����Fh:�x�0C���5ƻ����^��0CΞ=�����?�$=z� .\\и��Çd�����ޞ,Z��\\�z�dgg���T�x�b�0Y�~�V����#~~~�a�y�f���F�-[Fv��A���Iee%Y�f\ra�����m�{��1�ٳ\'9q��J�Z�.;�2J?�H��(\n2~�x2g���|t#��+W��>��ܸq��:�w�^5��Bd߽{�,[��0C���Hhh(	\r\re�p}�;B�N�4i��������@i0���ШQ#vfGIBB\r\r1s�L��$$$�ȑ#ؽ{7;�T333TTT@&��͒U%55������b��Ƹq������\'%%A,��j�Jm�ԦM��h�\"X[[#!!\0ЦM^�}�����T�E�d2lݺP�/����Y�fa���*ϔ3uU�gdd��O�r^��L�v@@\0��ߏ3gΠK�.����lmm��;�\0\0Z�l�.�E�*2?~�����,��iee�8ܻwK�.�?��1cư�ݻw���;N�:������\0`oo���\n���a����L1\0t��;v�@ee��=��Im�k�UW�I���Zu�122B�=\0�>�_�L>|C�QI��888���]�vŮ]���w[[[lݺ���\r\rņ\r����\n-[�������ϳ+�J���q���m�������+���\0\0r�\\P���8�*ͫ�Ǐs�/|u����W_}___��ߟu�8q\"v�څ�O��nB�كƑ#G`gg��\'r�E�!�$�L33�\Z�P(|�g(\rBDD����b�\n��=?��sܿ�\'O�ZΞ={`cc�?�����\\����8P\04�Wx��	>��0���׫<;w����add�uW�����+̘1\0س|o�P���?���	�{�F�>}PQQ�vؔB�j�*�m�����ell�>}��n��\'���9;��;<����駟��矫4�\0ЫW/<x��mhh��Y^�LLL����J��ơ��_�5���8;�J;���n���x�����T\Ze���i�DR�5��������j�:(�{^�}��\0�����?�DHHV�ZU��J\r<Xm����	:w�W�^i���h���`ɒ%jY�[���T�cccq��M�r.��(Უ���S�4�ΥK�`nn^㖗�t�J���o����t����\0��N�!yA�l�\\����\Zo�u�k�:I�P@$��B�te�R�TVV\"  \0{����u�0m�45?��|��bDFFbҤIl��*r�)))�ݻw��*�. 44EEE�믿��_��O?Ō3T���		a�;�W$	d2d2�lق~����T�)廲�V�Z�֭[��������C||�Z|oܸ���x�ر������h8::���ƙ�1������۸:t\n��=�]KKK�+`�r9������\\ܾ}}��e;Be��ĠO�>066\0��� ==_}������VS��y��d2g���?��\\.�_�������j��ԖUe�t^A�2OT,���O�6m�Z\'�:5�x�n\\eDH<���8mp*++��������T:lB�H��5�QWqP��k�W��7n`Ȑ!���I���P�D\"���Sm��G�\0@��/$/����z}���]C�I��7***���I��,P���d���!88ݻwGPP�Z�r��� ��ѳgON			(//�|Pkx��߇��#ڴi�L�6m�`�ȑ�ӧ�@�Ν;022b����+\0PXX�cǎ�w��x����Ϟ=���M�\r��L���xv�������`kk��cǪ�?w��������=��ͅH$R�銍�E�6m�ngR��\r:��N�իWѯ_?vBM$%%���111���G׮]ѨQ#dff���S+�b����*��\\�|\0Tl\\�gϞ���@e�7&&pvvV��V��䫏���҅m\0~�D$!\'\'��w����x�����Y111044T);J$	^�x��ǅ�#;;/_��ĉ�4�ߺuk�����9333|��G*~��%���8�\"ͫ���sj�O��v��������^�Y�>}���b!yA�\0�@�O�k�:)22\0���R��Jm���^�t�\Z5jwwwܺu3g��ҥK1i��O[9�m=�;w�q��5��ãư���͛��ӧ��/88�F�R��oժ��\r�ɓ\'q��I�w^�x���T��\n\08��@||<�u�ƹRõ]B�P ..�s/�r�2쌌��b��?��U�.`ժU�1c�\\��f͚\0{[�R!2��Vm4=z�m\ZR����ǻﾫ����ĀaΕ�L1�4��G[��e��6|�A	��\nJ�4ikkk�#Pr�?���.]\n�Zߏ��AϞ=9�-<<\n��ƍ�S<�}��2;t��rrr�믿\"  @e�]H�~U��]�yu�={\05nC�M���K�.���1,%B�6�k*��(w\rQ\']�zݺu�7�R���^X�|9���,_�gϞE�v�f�\Z����\\���w$	Ξ=�ٳg�3����[\\H$ܼy�F�RqW8�iӦ�T���D\"ރ��t*))��#G\0�n����4Άq�WHMM�D\"��������9��VD^�z�u������W�f;+J�&&&�r:_�U߯\Z��U�(W���ːH$�3g���5�XYY����uM��ʯ.����J�~_�]�v�`��ɓhܸ1{(�&������#�|M���?���{O�xDGG�I�&�n%�ԩ�����������:[Bʈ��v�Wt���Q�q�y�[AA�|+$/���	9��O������)S��ҙB�\r:X��;�\Z5b+�ꃅ��\"���$���\08?s�s�N�k׎׽�5}_��˗/���J���oRRR�Ν��,33��Z�Ҹ�k�֭��J���066�����>�$�J�v^Ay~��>\n�w��Qًmmm�ƫ&\"##Q^^����Bp��=��ۗm���T�CCCXZZ�R^o۱cƏ��-����III())�=`��O]�W�UW�I��2��WPҮ];���{���ڵky���FDVV���:ţo߾�^hЩS\'���!11���j����H���Q_q�E�WGYwp�y⫛��%RSSy}NH^*;99�NNN5�E��!�}���u��j��(m��J��\\ڮz�*&&...X�`A�����011��S�ث�*++�o�><x�\0����\05�������ҹs�0z�h5wkkk`ժUhҤ��3�)>��������T��� \'\'���\r\r��������︺�\"--\r�6mB^^���\Z\Z������˗j\r�2����(//GII	�����ツ��vvv�߿?bbbp��A�k�iiiط��qU~��޽{(--�T*Ehh(�Ν��O�j%�����q:t(\nĺ={�>>>ptt�����_�ZS��`>+���F>����FH:\0��+(i߾=$	~��W\Z4��9��v�ڵ+�VVV��۷�ĉ����[]��#++�3�sѩS\'H�Rlذ�~�-gGZH��8�\"͹P��4��G��Ç����|�\r��b�D�˗/c߾_T�\n�Be?~��뉦W�^!))	�s}�;�~뤔��;w�W��\ZB�Ԇ�>�H���H��c�b���ؿ?�����#  \0�V���ٳ����hÆ\r022B� �1r�H̝;We֗��3g\"!!�m���aii��\'O��U�ꫯ\Z\Z���r�e˖����U\Z���(�k����l�2��bB���W�\\���2e\nRRRX�4���\'N��sss��g�!11\0`jj\nOOO2���C˖-�v�Zv�S\\\\ooov��Y�f�<y2,X\0�����O?eWHrrr��W_!::��_�s����O؃�eee����q������\'Oƈ#��G���k׮ň#xɔH$7n���!�JѸqct��.\\���\n�|�rܹs�ڵ���LLL0w�\\��b��Ǐg�+477������Q^^�Q�F!\'\'r����رc�EM�9rD��޽{���ئ���W:8::���b�2���ư��ƕ+Wj�|a͚5����ٳgk��䣏>�Çall�nݺ�I�&��̄��;�ϟ��כo~\Z>|8&O����4���͛7G�޽5���>f̘��>�H�Jd%|�ȸq�4�Q.��,�Hse��B,c���X�z5f͚źBx�W\"�૯�Bxx8\r\rann�&M�`̘1���OU�8	�Beߺu,\0!����O>A�~��V��N��d���B�޽�q�F�iJ��(��˗/1o�<TTT����*��KKK����떤��(Q(��Ά��!lmmk\\F�����K����C�hҤ	*++�����-[�5��<�����ԩ�A��̄��1��ۼ�<������V��ܬ�,�:(\n���߰���<��GfM���!\'\'��ּ;���b�� �Booo�7��޼�)++C�����\'�`ƌ���E�-ЪU+����T���4�m۶�Im�H}�A�L�8666jW�\n%77999h޼9��Km��J���QPP�:�iӦ�������������uR�B,P��H���������۷/�����N_r(��ٷ������~�=8�{�.|||p���+~)\r����z�j\\�v���*m�yA{~��W\\�z���:hR(\0�:��\'�_��m۶������066���q��λ��-�B��cǎ!00\0gϞ����S��C���e�ر�ƍ��~�縄B�p*++�}�v�x��.��k�`���\rggg����E�Z/��J�B�=/^DTT�<y�H�C���^!�H������p���\"))	vvv�ر�������\0;w�č7�nV�4/h�D\"A�޽5~�B�t�B�P�b�ƍx���`�^�z)�p���0\0н{w�\\�R�jR�ph^�P�l�`�B�P(\n�B�pB��@�P(\n�B�P8��\n�B�P(\n��	,P(\n�B�P(N�`�B�P(\n�B�pB\n�B�P(\n�:X�P(\n�B�P(����B�P(\n�B�(\n�B�P(\n\'t�@�P(\n�B�P8��\n�B�P(\n��	,P(\n�B�P(N�`�B�P(\n�B�pB\n�B�P(\n�:X�P(\n�B�P(����B�P(\n�B�(\n�B�P(\n\'t�@�P(\n�B�P8��\n�B�P(\n��	,P(\n�B�P(N�`�B�P(\n�B�pB\n�B�P(\n�:X�P(\n�B�P(����B�P(\n�B�(\n�B�P(\n\'t�@�P(\n�B�P8��\n�B�P(\n��	,P(\n�B�P(N�`�B�P(\n���J�\r���:X�P(\n�B�G��������V�B��F\r����X,Ɓ������B<xM�4ih�(��k׮!;;�^�Y��\0\0 \0IDAT���ݻaii��jQ(��,����7Y_�T�ŋ#;;��u�E�x�mK�teAM�4���3d2bcc�r!�_M�6mпB����V�B�h����?�Ml(}ׯ_\'\'\'DGGk��a����`�Ν=zt��D�㟖(u�,8::�{��5�}��\'���M�b����޽{jMiH�_���ݻcɒ%\r���i׮���ѻw�V�$22����aÆ�w��8p Ǝ��˗����\r��dgg��V}��Z��P�&%%����ϣ���cǎa���������O�����lC���ǉ\'�q�F:tTy~��y���7�r�7��g����	aaa(,,D���Z%ʿ���b�[�<��b�\n�l�EEEHJJºu됟��Q�F5��-�z�*BCC1iҤ�V�R=z��Ű���|>h� \\�x�7�g�(�ykV\r\raaa���Q�F*��D\"i`-)o\nb�w������!��p��ņV��/C�P`�ҥHLL��ӧ1u�T������666pssàA�дiӆV�R�^���*P�SSS�%t�@���֬,�F�֭�ջسg����`�XYY��ѣHJJ��������_�a���+W�?����)N�8�cǎ����x��)�l�www�oXX������B�����#G��RZZ��~�\r!!!HOOG�-ЧOL�8\'N��ݻw�t�R�����A.�#\"\"!!!x��233aff�A�a���l��;v ++s��ŨQ����Pddd���\n�f͂��7Ο?�K�.!11r�������Ю];6|��Caa!N�<�9s�T�pqqAǎ�޹x�\"����0��뇠� ̘1�^���ŋDJJ\nLLLлwo,[����Ν;���\r�=\Z����~�:���мysL�>����KRR������|XYYA.���k�<�DH����/���!��о}{�1�-��@���U	�ݻwq��!��y�������B�!D�Ç!�0v�X֭��G���ٳabbRk��R���ģ:ڔO!���,�i�+W�ĳg�\0@e���ӧaoo/���[�u^utQ_Ic!uBuRRR�b�\n���`�ܹ�3g�lժU���CAA���U�H.��̙3\n\n���ϡP(еkWL�0ӦM\0,Z�iii������`�uY�(i��A�@�\".^�H�!w��������	�0�իW\Z�������(ҿ2d����?�/^���M<<<���#INNVyo��}���d�̙��ߟddd���bRTT��ٺu+4h�z�*�H$$##�lܸ�0C���U䕔��I�&ooo���D$	y��	���O	�0�СCD&��B�[�\'N���瓰�0\"�Iii)���$ ���g唖�������LƍGƍGBBBHaa!���!_~�%a�6��Oqq1�u��ׯ�9s�J\\��[d	d�̙����B�B� �7o&NNN�ɓ\'��M�8��>}�B����	�0j~����ׯ\'^^^$!!����D2i�$2`�\0���C!����DFF�6��� �Ν#b����撵k��aHXX�Z�Μ9C�Ν;Izz:)**\"			d֬Y�a���&8-t���CBB���=9{�,)**\"�����������yU\n1bqss�U��)|�!Dfdd$�ի���KJJ��ѣɜ9sHyy9�𱷐xTG��)�ީ�,+\n\"�Ɉ���>}:��d�6vЄ������ĺ��B�XH����\\.\'���#Ð]�v��-,,${��%Ð{�����O?%�G�&QQQ������撏?��L�8��w��U2g�N���[Wu�}�>�#ʿ��~�P^^N���I~~>�;B\n���Y�x��{NNqrr\"���*�{��#Ð��TNy׮]#Ð۷o�=�>}:qpp YYY����/a��x�B�oAA�޽;���O��Ԧ�&6m�Dz��E�R������6m\Z���PqOOO笜���w�NJJJ�����2~�x2d����K!�����^��t�ޝ���s���������yaa!���\'�7o����t�r�\n�ӧ�Z����C�09p��Z�^^^j���bңG�a����dҫW/�������ހp��< 4�/\\��xyy��+//\'C�Q�q�o�W\'--�0C�.]Z�?�p�E]�I&!�;vL-�>}J����{� ��u����Ʌ&[�?=<<Ȍ38�	�w�Z��\Z!��D��5�4Z\'h�7??_c]t�������ۉ�����T�{��2u�T�C���]��Z����Aoo͙��,Y��������L���lll0|�p���!\'\'G���{������Ð!CԞM�:R��.]bݒ��\0@m+G���ѲeKh�Q�����Aee%^�z���e˖066Vq������!�b���.]������:�[���̞=���o�kkkH�R|��\n\nªU�����s������%\\]]q��EAyE�t������}�N�\0\0����;���j[@���`kk���\0~��W4m�Tm[�P����kkk�����ӧ����	n߾\rss�\Z�o�W\'==\0Զ)hWZ���d�G}��3gb�޽شi!�ҥ���{DFF��>�x�!��k<j�_M峺ߚ����m�]U��庆\'��5�4Z\'��T���@�3�[�Vy����*C[��R�\0o~���sx+�,|����ׯ���٫��ݺu\0�|��������dHHH���+��=z\0��\0\0Z�j�u���?V\"�@,���Y+�	!������ב�����|dee\0*++y�000���	g\'�����Ϻ\nw�x��1V�\\���믿Fhh(���0k�,���r9.\\��5k֨��?7n�@DD��+΀�t���\0P���\0hԈ�511AYY����۷���֙�������ٳg�ҥK�:u*���1m�4�iӆ�n��yu\r_���֩�oZ����]�j^�x��G��Y�fX�t)F��   \0_�5�nݪ1B�]�t�\r�򩋼Η��;�eY���:u��4֦N��?�D\"Q9ۢ��ֶ�z]z�c�7+P�ټ�)oaa���mll؎�>QV�3� �h,����\0��������O��ڵk�e�t���^�·�~�Ν;���[�޹��X�p!�<yOOO����cǎ8w����\'X�B�PsS�x(+$]�����qU7��ݹs%%%���T����`nn��� A���.�H �J1|�p|��7�~��W�K$�E��e4D�&�w��gϞ�Ν;��燃���\r˖-c;�\\���\\(�e�䋐��km�����z���۷���ƺ���\0j��jomӕ�˧��zM�5�	-˺��U������6u�.���\0AufU��7�:�M��>o�`�:���zC����ļ�<���/&V��Ю];=z���?~<`dd��#G\"00͚5��7�|���$?~����������-[�`�,[�gΜ���6mڄ9s�`�ƍh׮\r\Z���ٳgQZZ�>}�pʽu��b1Z�l�K��njj\n��bA7>�E��h�<�M�^��-[�`�ʕ8u�~��7xzz����*Ǫ���\\�o�666����T*�=�\'4-��C��\r����ѣG�\\�\0�����7���\Z6l���6��&]�P�|�g^�k�Z����ua���X�:�����VG�����TE�z�M��>o噅���������Xt��:t��Y�f�СRSS9?����\0j[���݋)S� !!�o�F\\\\6oެ��Ƚ{�����\0�u\rw������L&âE�P^^�N�:�ĉ�ҥ�,Y������7o�ľ}����c�?TVV�����\Z5B�nݐ�����\"Aq惉�	Z�j���T��4D�&�?x���V���5>��3������\Z�ҷ͹044ĸq�PVV�3g�h�W^^���(�����k����k���w�ő#G`mm\r�X�E����5������ʇ��>�z]�в��|^W��Icm�D.�t��������xǧ*��[oR���󡃅*�D\"̘1���:�����c��ޛ0a$	�\\����ԩS���S��933׮]���XXX�A�������j�\\n�D����~~~HOOǺu�\0��c\Z�w�y���Cnn.�?$$&&&��Ѐ��\Z;wU�6�Ǐ���2z�/#G��ӧO9?���\r�����+W����*�ڶm�6m��x�8��s�`����aǎ\Z��fI��\"��%K������077�\\.Ǘ_~	���#��!kB��뒮5�U>���\r4vJ�e}��ڍo\Z�4affKKK�D\"�gշYZZ��?DXX��|u��Pޔ�A���V\n*++��Ѿ}�:ݰ������x!??Ǐ��ŋ1o�<xxx�� �IU���qΜ9`�6m�իWQRR���,��㏸w�v�څ&M������Ν;����d2N�Bt����H$������+<{�+V�`g;\n��Y]��p���q����rvhaa___0\0/_�d�cĈ\Z��\Z\Zb�ȑHIIArr��3]��̙3����={�������EII	���|�rDDD�f-Z��m�bɒ%�v�\Z�������m۶�_����}*��\0�����hB,�ȑ#�D�<yr�a���\\������͛7�̙3����H���\n��b\\�x���z��ž#4-��C�L�H�	&`�Νl9)**���9�;�����P{k��J��O!��S���3�/_��X,�X,FLL;�\\�|\'�,�+�뢎�����	�6l������R���c���8x��k׮���\r|||\Z\Z���b\"<<_�u�a�Ro!�)����ǀ裕Ð�����`3~M�9;v�@bb\"�ϟ�XB�6m�.]�����\Z�uuu!&&&��Ά��9���1s�L�����JKK���ְ���a���*nEEE��_p��5���E�puu�9���[��ϟ�T*U��-,,ЫW/,Y�}��孃T*�޽{q��y��bt���/���1|||`ee�m۶����Ǐg���7o��W����ׯ_�W_}���ТE�?666X�f\rΝ;�\\�F�\Zaܸqؼy3�p��ZՅ\'O���O>A~~>���`cc???t�ܙ����OOO���A*����ӦM��ի������ؿ?._���ttt���\'{�:%%���(..�z����hժ2220q�Dv����G�e������m۶�֭[�H$�֭�O�KKK|������֭[ѯ_�������g�\"66YYYhѢ0o�<�gP���())App0BBB���C,������pss������\0�/�����m��,kB�\r�=]��O!��ѣ��5k� //vvvpvv��ٳ�|���R��^Mmb]�4�[\'�ֆ��o�ŭ[� �J�0<==���\n4n�k֬aoK�������q��M������\n����an�H��ӧC,C�P���NNN�������}�m�G�6o�`��puu���3�m�� ᇇ���o�ũS�TK��rdggcӦM���Axx��(�M4t�S(���I�P(u�܆�Ot}7_!������ݪ`dd�6m�`��ɐH$��(���ҝB��-�\n��=t��c\Zj�������5~���ݻ����u\0�\"�@G�����I�P(�C���#$	\n***PTT�z\r���Dpp0��������HLLĉ\'��������r/�f\Z:�)�fh��P(��C�,耠� �Y�F��w������U���:t7n��˗/QQQt��\rC������J�ySҝB��C�\'�B��:X�P(\n�B�P(��3\n�B�P(\n�:X�P(\n�B�P(����B�P(\n�B�(\n�B�P(\n\'t�@�P(\n�B�P8��\n�B�P(\n��	,P(\n�B�P(N�`�B�h�T*mh(\n�B��:X�P(���Ά��;���\ZZ\n�B�P(z�QC+@��DLL�]����l�z�\n�w�eC���?AG]\"�J�x�bdgg�I�&\r�\'b�@FF\nq���7VW}������P(]BW�d���prrBtt�%�>�O}۴i���������=L��t���ݰaRRR�s�N�=���O�&M����L���طn�ԛ�\'��xS�O����\'���ykV>��Cddd\0\0\r\rѺukܼy�ӯX,���!P(\0��c�b˖-����$�������κ�UVvv6�޽�I�&�Y>�2�Ѯ];�k�\"�ׯ_שlGG�Z�0x�`���o5�ѧ��Mmi���8;v�z��g��ӴiS>IIIohu�75O�W�Q_񏌌ĩS����#���iӦ����0:t(F�\Z��_&��ҥK8s��>}����j�\n����Ν;\0��ñ`��w���+��������\"\'\'�������CRR���ٳgcժU\0���{���jq111A�-гgO6cƌ�����ơhM}���6�?��@�\"��������ҥK	�0������;F<<<ȨQ�ȪU�HEE�����R������*����dƌ:х��;_8@�!iii:�)��ɱc��0����D&����9s��;�Au�o���T*�\'m�����	�0�իW\r�J������;��DB������J~��w���A���INN	#C�!�g�Vy\'77�|��Gdܸq��͛������瓰�02a����@BBB!�(\n���ҿ2r�H���M�r�����䧟~\"Ç\'D�PB),,$���#>>>���T坿����ڵK�ޫ�� 999�Ν;d��դgϞ��Ã�D\"��,!!�q>+**\"{��%�\'O&���dʔ)�_~!���:��DC����?���VmC277G^^fϞ\rCCC���p��x�\"F��6m� ??�sv���666:ѫ���^��=��˸7$������`�ߨQ#����C\"�4�����mܸq=iC���o�;\n�.]���D�>}\ZS�N���LLL`cc777\Z4M�6eߩ��Ă ������>@���ѲeK���!00={�Ċ+���t���Ǐ����!�H`h��\\���!66&L���\0\0���000���	LMMU�i߾=�t������1lll��{�a������GZZ\Z�Ν����:�K$���?���BCC՞gee���ׯ_Ǘ_~�cǎa޼y8q�f̘�W�^�)�\"��r�P�w�m�ن\0���GϞ=1h� \\�|�W�����\'++qqq���o��������Y�h��� �+++DDD`�Ν��Ά��F����@\\�~iiih޼9�O������*KIXX|}}����L����cĈX�h\Z7n�G�a�ʕx��\0�{��컧O����=���ŋDJJ\nLLLлwo,[����g�ʕ��?`jj�\'N�رc8�<�>}�-[���ݽF}�:���!99�0��?�#G��NIII���C\\\\���aee�\\��?��iC�֭���)))X�brrr0w�\\̙3�}�j�*��š��\0���*i%��q������P(�ڵ+&L��iӦ�~\"\"\"�G�!33fff4hV�^���𑩋�նp!4�|��܈��ٳ���X�`���p��Q$%%��������/�0����j;]�����رYYY�;w.F�\Z���\0���\"##VVV�5k���q��y\\�t	������ptt�w�}�v�ڱ�i�_�J���7q��]:tH�n�G�Fff&�����HLL�ٳg�:���ms6l��	�m�6�߿\0��鉣G��̙3X�b��{iiix���o�^��B�߿?�-[�͛7�رc�;w�`yyy���/�N����QRR��\'O��7m۶����L��;v`�����|������<мys888 ??�������2�]��ׯ�ʀ�����/��W�\\a����bժUj�D�sss��զ���?ħ�S5���e�U4��F����s���B	&Ð�w�����%&L ��w�>����.�*�z�*�3g���vEE���$���dܸq��Ã�;w���b���K֮]K�!aaa��\"a�\r�\0\0 \0IDAT����booOΞ=K���Hff&����R�P(�L&#d���*[h��~�z����.\'&&�I�&��-u�ݻ���ߟ̜9�������R\\\\�.kҗB�n�J\r\ZD�^�J$	��� 7n$�^it�����@v��I���IQQIHH �f��SHܸ�x�\"g>Ѕ�r��ܻw�0Cv�ڥ\"�����ݻ�0C�ݻǺWTT�O?���=�DEE���R���K>��c2q�D�߉\'����IXX�Ť���DFF����竄�W�.�V�r���8j�kR]䖕����(ҿ2d����?�/^���M<<<���#INN^]l��rSZZJ\"\"\"X}ƍGBBBHaa!���!_~�%a�6��Cqq1�u��ׯ�9s�J���.ҹ��\r�BAF�A���x���ݝז����{{{��:S�N%�V��	!d���d��露����9�����ʈ���<yr�zs!�J�ݻw�D\"!�=\"Ð3gΨ�IMM%Ð={�p�pww\'����[�����{{{�<0{�l�0����˄h�g�b1y��Ȑ!CԶa��r�}�v2h� ���G�.\'Be�E_m�!}�T�����8��/�o�\Z,ܹs�xxxB)))!}��%�W�V�3i�$r��!B���a����&�СC��������\"���*���ŤG�dÆ\r�d-\\��xyy��+//�,<<<4�ѻr�\n�ӧ�Z����C�09p����޽��0$55�S�&}�]�����Ӊ������(�B���I�^������3���B��W�Y^^N���I~~~�u����@��W�@�o�NHff���#G���S��\Z�M�6�^�z��+\"SWi�M9�W5!�̂�...d���j�999��ɉx{{k�P��ܸ���iӦ�u����5��M�6��ݻ���wM�&|ӣ>덴�4�0Y�ti��+���$è�5\\lذ�0C����M�]�~]��رcɩS�8e�u�@!^^^�W�^��]��O��q���o���|����ҳgO�<�lӪ���z��mͶm��0$!!A홧�\'���Uܸʉ�h��C�����C�����E_���[uf!==�]6nڴ)F����P�ZE�H���d�3\0X�/_����5LLLT����`kk��4]����<}��u311��۷�%F>���Qm��S�N\0������=333�a\0���/���0d��gS�N�T*ťK�j��믿�iӦ�1c�0��K�,���1p�@���@&��DG!H�Rb̘1hݺ��3www��Q����Aee%��W2�M[]�.��QW�B���\r����8�[j��\'�v�QnZ�l�vv��������j��t�B���y������z#==\0Զ��DVV��iZJ�Uo+\Z5j�5k�3gΨ�}��)D\"���	]cmm���J����E~QQ\0�研6㺽�*D�f��R/uok���```���`w�H����ӳV���Uۨ�:\\����UESG}�#oՙ�>[%\'NDpp0\"\"\"0l�0���`��hժ\0������_�~u���eee��Ξ=�.]�ԩS���iӦ�M�6��LHH\0\08Pŝ\0hԨ�Y@&�!!!�����{��\0j��U����ptt�}]�.����߳i\\XX��c��DG!<~��De��[[[��ڪ�B��ׯ#))	���lǤ��R+���U�VEH9�GmЗ\\\0�֭�דJ��*<.�5T�Q���Q�/�������ا>�<d,�JK�ăR>�U;h���;v,N�<���\\�s��C�j�Y�L&C�&MT>h���#%%E�;����uR���թzEMܹs�����U�u-3m۶���.]��իW���.�_�~5���F���}!u�&�訫�Pm製���V\r��,\0��`gg���v�0{�l��r� teA�wj�s��8{�,v��	???<xnnnX�l��\r�D�T��Ç�o����u�N( �h����C5ݪ!�HP\\\\�-Z�\nS�q���`󆍍\r�Bu�r������\\,\\�O�<���\'|||бcG�;w����J&�H���-|�(}�U�������ۮ��\r\0δT��ç�\\��w��u���-�2���W�_ey���Sq��������6		��_�[m���R9�\0;w�q\0׬Y3��ccc���rή���@��\Z�eeeh޼9�p���23u�TDDD�֭[6l��}>��Bd�G�/�/ÅPu��>ڻo�`!##C儼��&N���G�\"==/_�TYҵ�����	���\ZB]�k�[�l�ʕ+q��)���ol���ք��) ��z\r��@M��r�WMK��;X�����ǫ�	��_���eт��Z�~��7HJJ�������&C�\\�\"m��o��J��r�3_��M+7�P��w�۷o���C*���n߾=,,,����Z���šm۶��ٔ����z�BPP�Ν���D�������dff\"%%.Tq��d���,X�]�v���/>��3XXX 55۷oGtt4������G��*���n!���ʌ��lmmq��96>�X,t�\rU��mӺ���А�ݛ�[{fA����!�H��/���Օ]�TҪU�,<x�������\Z�}����ahh���@^2\Z5j�nݺ!99����5k�: 55�-LUQ.Y;;;k�abb�V�Z!55�W��7�u.�����0###v6�&�ݻ��U]er�����q|S�*���E׮]ѡC���&����>�CCC�7eeejg�R^^���(6̡C�B$�8`HLL����1u�TΎ���\'�?���D\\�~cƌQ��[�����I�&���ׅ�b���\r\rŀзo_�X��ƍ�T*ŠA�T�AU���vvv���?y�)�^�U�122���\'nݺ�D�K�.a̘1�f���h�2�O��?ć�l��tޚ�Bee%rrr��u��NNN\n\n�ܧnkk��mHBX�r%n߾��ֶm[�i�F��p�t���(++C@@��t�	&@\"������ԩS����ue�ȑx��)gǖ�c}�M$aƌ�?�:������\"�H�Y��LKKK|����\0���\n�ܫ�	��	]��6���\"\0���p��}��X}����Fu�O}������Î;4���� ������%K�����~�-�KJJ�q�F��۫�Q_e��ڵkÄ	�ҟ/^��Ç�n�:�-Q�࣏>����q��}DFF\"((�ݪ����1c�����7o�=S(Կ�!�^tWf�L����J����ƍ�2e�^d4DקMu��CC�wo:o�`!;;\n���F�	&�iӦpssS{֪U+dggs�2�������QXX�X�#G�@$a���*�������K��b��b��İ#��3g���{�������������a��刈�`�(\n�dR�������%Ι3�`ӦM�z�*JJJ��������î]�j�^��m۶X�d	�]����bdffb۶m�W�r9�ZH�jC�����h߾={`O��\00l�0���#<<���HOO��ݻq��A6l���k����>>>\r\rEqq1\n��?���\"�īW����3�X�����F�&t��� $�\r!755���(**B~~>�?�ŋc޼y����{<�4d��u�O}�������h޼9fΜ	???�D\"TTT@,��ŋ��_ЫW/�;;;�ڵ��7�1V��7o��������ۻ��(���oRq$@5+Mǎ\"��\'=J��uJ��@��&����-)25wu�2򚒲�h�ҼP��	®�F\nےZ�ʝf������2?�y�yfF��:�s�;�|��}���sqvƮ]�Z�3PϞ=1k�,=z��C��(++3^<^YY�۷o�������믿���~�6m2������\r\r\r�:!�����ٳ\'\\\\\\PYY��>�S�L��I�Z�ϒ%K0p�@�^�\Z����j�(++ç�~�#G�H�Gκl�9���\r|����ٳ����%y8j��e���xȒcG}�=蜄-�R��ŋ���\r��\0<���HHH0vxuu5~��\'�;�<y�6m�F�ASS�u�1c�`���		1����`��ш��@pp0�z=�;����ǣo߾(,,�ܹs��r)�J���A�PH����L;vYYY(..���;|||�d��\Z5ʤ~��鈌�Dyy9������E������{�n|��7())���|}}�)S�\0�s�???��`|�hAAA����o׮]HJJBii)������e˖Y|���rDEEf2dBBB�T*�r�Jxzzb���ƾ��nR\Z�V����̜9[�l���Z�6l�ٳga0�R���j8;;#22���Vyy9v�ލ3gΠ�����7^�	�9wr�Ν����F���aðb�\nt��\raaa���@TT����i����ϗ=Zz���:������F��=z���A�p����m���!\n�q܍1���f7�������k�ySXXh<M\0z����D(�J�>}\Zo���<qwww���������8q�\ZѵkW̞=���-�/{�G{�w������Ǒ��������h4�ի|}}���\0�o�_��O?�iii(..FϞ=��O`�ܹƵ�~rrr0�|�^�\Z/����6K�.Ņ��j������\"<<\r\r\rfO�m�T*ѯ_? ((�.�(<�쳒�����!++K�=���X�r%.^��#G����%\Z�[�l�w�}�N�A�a��������͛���fr\Z��u�c\0RRR�t�R�]����&���[�G3k�k�\Z�Vmj���z����2�5�\"X \"�\'���!**��E!�ͨ����U�p��%�߿��9�]�va�֭f�Y�Ӝ�DDdO�>����0��/0{�l455����v	\0�_�ٮS�:���^��,�}�={?��6l؀	&8�8DtDD2�t:455���Z���v�D$ϴi�0m�4��{g�޹��-w�!��x����=���H���C�\">>�A%\"\")���8~�������X�p�KE�11X \"\"\"\"\"I��������$1X \"\"\"\"\"I�����H�\"\"\"\"\"��`������$1X \"\"\"\"\"I�����H�;3�.�]0X��իWc�ʕ���stQ�����l����-���ƩS�0c�8;;;�8�F�Att4\nQYY�={��{��.�]t��eff\"))	%%%������ۡT*],�����A�Q�}G)\'���;IMMŖ-[0o�<DEEᡇشrt��~~~���GVV�o�t.{�mݺu=z4222�T��ׯ_?�;BdffB��۔_SS�9�?������ܹs\0���x��0y�d��X�&�������RN\"\"G�����Edd$6mڄ.]�8�HN�=0m�46��E�;{�-77555mr�ۀ0c��9�.�EDD�ܹs���q��9lٲ\0�����/�@��Ca�~,m{ׯ�())�ѣG�u�eNw�r9\nOC��nݺ!!!��Q�����^�������r_����ꫯp��a���\0���\n\0���Bjj*������f�:J�8Jbb\"���[̛7��E!\"�����0P�����G�UW�\\��½~�a�����$&&��H\"\"�J�RSS�c����`�ҥ���@\\\\rssѥK���a�ʕP�T��466\"55			�t����������㭷�2�s���q�4\Z\r�?�k��Ɉ��A^^�����#�`���X�|�U�����y�QQQ�5k\0`�ҥHII\0899!\'\'ݺu��-�Kll,��� ��J��1s�L��\"\"\"��?�����9>��3�����ի���0c�Yu������/��ѣG��/����	����?� ??�W�Fii)^y�,^����7�|��ٸu���ۇ#Fح\\rI����Tlݺ%%%ìY�p��A�>}\Z7n�@�޽���p�<sss���lTTT������-��믿�������B��#GbժU:t(\0�ܹsx���q��5\00�O\0�駟������{������Fll,\0X]���?9���?��O*..�+���?��8p�\0���[���/�������\'O����hll���/��`����՚��t�\"\"\"�}q��6G�1�eK�oOr�-�hks�Q崴����-�%�jm�wqq���37mY-�9c�-�5Q��@mm�HOOcǎ\'N~�����_Euu����j�Z������<�{>��s.����F�555�ܹsbܸq\"<<�$���D�x�b�R�č7��			bĈ�رcB�Պ��\"-T*������.UUUb	bܸqB�ә����$>��#1q�D��j��B�y�f1~�x���(t:�(,,���P�Tb߾}f�ٹ�c1v�X\Z\Z*���\'\n�^�o�\\�>��#����R���ğ��\'1k�,���.jjjDYY�X�p��;w�B���Fq��y�R�Ķm�L�_YY)v��)T*�8���咪�\\Rc���N�;wN����ٳg�Z-N�8!4\Z�(++k֬*�J$\'\'����_\n�u�Vq��M��jENN�x饗�ƳB�[�N�����j��˗ży�ĸq�Dii���8����~��P�T\"??_��׋��zc{~��\"  @̘1Ø���hi�ɭ���YSS#RSS��={�HHH������T���*�JL�:�8��z�8{��3f�\r\r5�K�՚�i��Z-BBB����r�o-[�-�%s�崴�����뼜qp�5��s��~�e-���r�T[�k���)��f�&M+V�0K/--�G������q�F1|�pa0L����kv�l�2d���۷�{0o�����B�R���L�ׂ������[�CN[$%%	�J%���̶		>>>����$}�Ώ�J�W�\\��JFr�[��<}||DQQ�I��������WTTHBq��)�`An��,!=ք�ӧAAA����&�z�^<��f�\"//O>\\��Ę�����}�:uJ�\Z5����*�JDGG�����	�J%�^�*Y�E����C�6�[���ԟ�&M,uuu&�7o�lqmܸQ6LTWW�䶫5�V�ŋ/�(Y?�����9m�:j��o�r�io[?C��rǁ%k���HK�77��9u�tL�Ǽ&j/<�w.��6m\Z���QZZ��\r\r\r���j5_OOO�����ի�4�B���4�.�l�H��ɓ&�\Z�.\\���ӭ�[�-bbb��퍉\'�m?�|��4k�|u{��/<�g�}����L^�1c�.]�r�OOO(\n�4WWW���EEE&�|�	z��_|Ѣ�8\0___�S/{�1\0��?�l}��!�-�[��ܯ?~�a�S������CA�јm?h� !PRRbL��]��>�쿭H����h[�}[�)����3Dj��v����c�ܯ-�M9s�Һ�S���D��)�Y�Đ!C\0\0ׯ_7޹E��/�������EEE���\0\r\r\r��h�\"�<y���Gpp0,X�~���\\�\'�x#G�DRR֬Yc�UkJJ\n�J%ƍgS�w����;rrr���/��O>	��y�m�ھ�駟���$���ӧ���ۻ\\�M�P����$---\r���f�-���\0<��S&���>�ڵ��z�Dn�\0�����\n��m\\�/®��1�ٳ]�O[�_K���u�^s�����m����8�;G��a��Vj�XZw9c���Ȟ,�O�E}}=\0���˖-���\",,�>�(N�8��?�آ<�q;v[�nEll,��ك��\0�Z�ʸP[k޼yX�~=2220a�\0�w�}�g�y���<���n݂��.OOO\0@uu�M��[����\0����@���999������N��^���]t:�M���k�Jn�w#��-�[?���)UN\'\'\'\0��`�v��}�9�_崵��=澽�)����3��u�Q���9�wnJ������1��yMdo������om֮]���\\:t������V3`�\0|�������Ç�����8t��[yk��j��o�ɓ\'1a�ܾ}��׿�m�6��lvw[���\0P^^.�m��N��=����ܺu��m�?�ڣ\\�vop�\Z899A��t�gȭ���tt�:j�r�ښuT��o�rZ��m�r�:��qؚ���r�n2�WP\0\0�IDAT�z�ۓH.^��?YYY<x0\08�<|||L&�.\\�\0�N��7��*�?��z���nnn�6m\ZN�>���F�������Ǐ�)_��-z�쉁�ʕ+���n���\0��ҵ���*�\n]�tAvvv���=���q�B��}�\Z��К�]�bȐ!��˃V�m���Nn�\0������Q����֮�r�~{�Sn{��g��뼣�ak�rnʩ��c�AoO\"�,\0HOO����e˖�z����J�m��Z���4������_�~f�y��O0v�XdddX��/����Jdee�̙3�:u����j��:��N�2��������6{ւ=��J��<����[�P���J�f�I�fe�1X���0s�L\\�zU�O��9s栶�h���Ln��՟r�G�:99��ݿ=ƫ������M��o�r�iok��\Z�u�A��m=7-���1� �\'�\\�.X�r�\n.^��V���\n:t+V���%K�V��۩�j`Ϟ=���µkװz�j����s����T�$66����F�����QPP�^x�d;�N�N�/����<��S���FRRRRRd�[��/�J��ƍ������j�������m�6t��ݸ}SS��\r��744�t���}�f�\Zxyy!,,�~�-�z=*++������~�d۩S�\"%%)))����͛7�}�v�ٳ�l_�\Z#���=,_�����k�����$��z!**\n���\0�<|����������;���2TWW#;;���:RSS�y766\Z/PlllDCC�Em���٫?�Ӯ�������ס�h��h���i�UP���1^嶵�������*�������,]����k|k�znʩ��c�=�5Q{q��	�@���B@�P���nnn1bBCC1i�$�m\rv�܉��xh4\Z6+V�@�n�DEE���!!!�h4hjj���F����dff�رc���Bqq1������%K�`ԨQ&����ŬY�0t�PDGG[\\��۷c�޽�޽;���Z�˂��\0\0�V�]�v!))	���pww���?�-[frw���\Z����}p`���-������F��=z���A�p����b̘1-�_^^�ݻw�̙3(++���������]�\r6��ٳ0P�T���?�j5�����{��r)��X���c-\"\"����\'{+�J��ǣo߾(,,�ܹs�ߤ+�J����Z^^���(�={:�C�AHH�J%V�\\	OOOl޼�ضz��w��7�|c7���Ĕ)S\0\07n��������_������ؼy�I�^~�eL�<Yv=\nE��On�,�Oooo̙3�xzH�޽����R�ӧO�7�0޹���������Bdd$N�8���Ft���g�ƦM�,n���|��9==���(//���7����h�\"��쿙���^sZ�:*����rZ�޶�]�:oI�,Y��:G,�777�爜9`��I[�k����???DEE9�(��̙�����X�~���EDD�gϞx�w,~σ����}O���y\"��Nw\Z҃t�����z���/����Ouu5Μ9���`��|Pۢ������c�:OD��t��C�ѣG1h� �zߧ���رc1x�`��|Pۢ������c�:OD��4�Y��thjjB]]�Z-z����\"��v�\Z�m�f��jjj��䄤�$���C���z[t6r����8^;��Dd/�⚅�G�\"22�$m�С���wP�l����ȑ#P�Tx뭷�{a�~kmADD����=u�`��������t�,�e,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD��:�\0�����DRRJJJPUU��۷C�T:,\"\"\"\"r,��@F����رc!�@ff&�z����֭��ѣ���aS>DDDD�10X �`ƌ9r��빹����A]]�M�Q��Ӑ�bqqq������rtQ�����0X ���������� \"\"\"�vҩ����d��� //���x�G0}�t,_���������իQZZ�W^y�/6���7�Dvv6nݺ�}��aĈ盚��;v���K�.�����␛��.]����+W��J�2+��_��\"??\n�#G�ĪU�0t�P\0@jj*�n݊�����a֬Y8x� N�>�7n�w��		Axx�d����\"66��٨�����\ZͶ[�|9nܸ�F��Ǐ���ê|\Z������\\�t	EEEpuu������[o��j�Z�Q�DBB�1b�8v��j����HDGG�J%����B466�����J%�m�f����J�s�N�R�����e�[[[+����رc�ĉŇ~(~��WQ]]-222�Z����\"//�d��֭AAA\"\'\'Gh�Zq��e1o�<1n�8QZZ*����N�;wN����ٳg�Z-N�8!4\Z�(++k֬*�J$\'\'��ɗ_~)|||�֭[�͛7�V�999⥗^*�Jܸqømbb�X�x�Y��|>��s.����F�555�ܹsbܸq\"<<\\v�Q��4�²e�DPP�I��۷�ĉ�V�5�UTTHBq��)�`��|�bҤIbŊf�����ѣG���`�}�\Z5�4����J����fy�۷o����z��O���כ�����Ç�����4���ݻ�,ݚ|�lܸQ>\\c���%\"\"\"\"��4wC���D~~>�^�jLS(HKK����C����´iӐ�����R\0�����kvZ�c�=\0���%ˢP(L�\\]]ѧO����\'�ѣ^|�E���{���兆�TUU�ڪψ����2�暅E���ɓ�?>����`������wȐ!\0��ׯ�O�>���\0<��S&�	!\0\0]�Z�u\n����&iiii���E�n�d���|��x�\"N�>���\\TTT���\0���`ܮ�������,�i~Yx���q��1L�<����2e\n^}�U�o��o��v}}=t:�~�i|��W&����k�����߶8o\'\'\'455���t���pww�U�{Y�OYY����h�\"���!,,;w��Ͷm�>#\"\"\"\"�t�`��>�\0���x������#00������899�I���h4\0�<����NNN�h4����׳gO��lvw`bk�Y�v-rss�w�y���x��G���*��=ږ������i��.@���s.������Ǐ㡇������=\0�4��deea���8p �v�!C� //Z���<,�P(зo_\\�r���9�<|||������j[\"\"\"\"�N�	\"\"\"���f�ֿ�����y\0���P*�(((0ˣ����|�\'==��=�-[fL�3gjkkq����k�̙�z�*����^��\"c{�ӫW/TVV��K��iۢ�\"��DDDDd�&X\0���Xddd���\Z����GAA^x���N����������7o����۱g�\0@SS�Ɂ�����+Wp��Eh�ZTTT�СCX�b�,Y�Zm�.44>>>رc���QVV���jdgg���_Gjj�Mm�|�r������\Z������QTT���($&&��\0�����V�QPP�={����\n׮]��ի���nu۾����<y2���kS��)\'�I�����ıcǐ�����b������K�,��Q�L��j�ذaΞ=��\0�J���@���C�V������x��d����!\nJJJ���#F 44�&M2+�^���ݻ��7�����E`` �L�\0���Gpp0�z=\0@�T\">>}��Eaa!�Νk��_�T\"..������rDEE��ٳ��t2dBBB�T*�r�Jxzzb������DHH4\Z\r������ѣG#&&FV>cƌ��`�Ν;�F�aÆaŊ�֭�����ၨ�(�3�ⶍ���g�}�?�O?���Fu�`�A���???DEE9�(DDDDD��T�!=�~�\0у��B;�9DDDD�Q0Xh\':�MMM���k�ۡ��YhG�Edd�I�СC����I�iHDDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,�$DDDDD$��Ib�@DDDDD�,����(:�� &\0\0\0\0IEND�B`�','Captura de pantalla de 2020-05-23 20-35-53.png¿¿image/png',NULL);
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
INSERT INTO `consulta` VALUES (16018,'2020-06-24 18:39:02',1045367088,'','dhnfhnhdh','','','','','','','','',16018,''),(16018,'2020-07-03 13:16:47',1045367073,'Curabitur sodales','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellen','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper urna. Proin nec commodo libero. Integer est urna, sagittis scelerisque purus at, pharetra pulvinar metus. Proi','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper urna. Proi','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper urna. Proin nec commodo libero. Integer est urna, sagittis scelerisque purus at, pharetra pulvinar metus. Proi','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellen',16018,'hwrthehwrejwk57fvw'),(16018,'2020-09-01 05:17:16',1045367073,'kghjkg','hjkghkj','hgjkgh','jkghjkgh','kghjkgh','hgkjgh','kghjkgh','khgkjgh','ghkjgh','kghjkg',16018,'gkhjkghjkghkj'),(16019,'2020-07-03 13:20:39',1045367073,'Curabitur sodales lorem rutrum lorem interdum','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellen','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper urna. Proin nec commodo libero. Integer est urna, sagittis scelerisque purus at, pharetra pulvinar metus. Proi','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper urna. Proi','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper urna. Proin nec commodo libero. Integer est urna, sagittis scelerisque purus at, pharetra pulvinar metus. Proi','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellen',16019,''),(16020,'2020-07-03 13:19:25',1045367073,'Curabitur sodales','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellen','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper ','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper urna. Proin nec commodo libero. Integer est urna, sagittis scelerisque purus at, pharetra pulvinar metus. Proi','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper urna. Proi','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellentesque eu pretium nulla. Fusce a molestie metus, sed semper urna. Proin nec commodo libero. Integer est urna, sagittis scelerisque purus at, pharetra pulvinar metus. Proi','Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellen',16020,'sdsdsdsdsdsdsdsdsdddsdddsd');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidoLibro`
--

LOCK TABLES `contenidoLibro` WRITE;
/*!40000 ALTER TABLE `contenidoLibro` DISABLE KEYS */;
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
INSERT INTO `contribuciones` VALUES (16018,2020,'2020-07-01','2020-07-01','2020-07-01','2020-07-01','2020-07-01','2020-07-01','2020-07-01',NULL,NULL,NULL,NULL),(16019,2020,'2020-07-01','2020-07-01','2020-07-01','2020-07-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16020,2020,'2020-07-01','2020-07-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `contribuciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delagacionCargo`
--

DROP TABLE IF EXISTS `delagacionCargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delagacionCargo` (
  `iddelagacionCargo` int(30) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `diasEstudio` VALUES (1,'Lunes',NULL),(2,'Martes',''),(3,'Miércoles',NULL),(4,'Jueves',NULL),(5,'Viernes',NULL);
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
  `estudianteDocPartida` longblob DEFAULT NULL,
  `estudianteDocCertificado` longblob DEFAULT NULL,
  `estudianteDocConducta` longblob DEFAULT NULL,
  `estudianteDocDui` longblob DEFAULT NULL,
  `estudianteDocNotas` longblob DEFAULT NULL,
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
INSERT INTO `documentos` VALUES (16018,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (2,'Santillana Polimodal',NULL),(3,'McGraw - Hill',NULL),(4,'Casals',NULL),(5,'Trillas',NULL),(6,'Prentice Hall',NULL),(7,'Ariel Ciencia',NULL),(8,'Educar Editores',NULL),(9,'Espasa Calpe',NULL);
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
INSERT INTO `editorialLibro` VALUES (2,5000040,''),(3,5000042,''),(3,5000054,''),(3,5000060,''),(4,5000044,''),(5,5000046,''),(6,5000048,''),(7,5000050,''),(8,5000052,''),(8,5000056,''),(9,5000058,'');
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
  `ejemplarMarca` varchar(150) DEFAULT NULL,
  `ejemplarSerie` varchar(150) DEFAULT NULL,
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
INSERT INTO `ejemplar` VALUES (5000040,40,2020,'',NULL,NULL,NULL),(5000040,41,2020,'',NULL,NULL,NULL),(5000042,42,2020,'',NULL,NULL,NULL),(5000042,43,2020,'',NULL,NULL,NULL),(5000044,44,2020,'',NULL,NULL,NULL),(5000044,45,2020,'',NULL,NULL,NULL),(5000046,41,2020,'',NULL,NULL,NULL),(5000046,46,2020,'',NULL,NULL,NULL),(5000048,48,2020,'',NULL,NULL,NULL),(5000048,49,2020,'',NULL,NULL,NULL),(5000050,50,2020,'',NULL,NULL,NULL),(5000050,51,2020,'',NULL,NULL,NULL),(5000052,50,2020,'',NULL,NULL,NULL),(5000052,51,2020,'',NULL,NULL,NULL),(5000054,54,2020,'',NULL,NULL,NULL),(5000054,55,2020,'',NULL,NULL,NULL),(5000056,56,2020,'',NULL,NULL,NULL),(5000056,57,2020,'',NULL,NULL,NULL),(5000058,58,2020,'',NULL,NULL,NULL),(5000058,59,2020,'',NULL,NULL,NULL),(5000060,60,2020,'',NULL,NULL,NULL),(5000060,61,2020,'',NULL,NULL,NULL),(78885488,15,2020,'','HP Compaq','CQ45',NULL),(78885488,16,2020,'','HP Compaq','CQ-43',NULL);
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
INSERT INTO `entregaUtiles` VALUES (16018,2020,1045367073,1045367070,'\0','','','\0','\0','\0',NULL),(16019,2020,1045367073,1045367070,'\0','\0','\0','\0','','\0',NULL),(16020,2020,1045367073,1045367070,'','','','\0','\0','\0',NULL);
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
INSERT INTO `estudiante` VALUES (16018,'',0,'',0,1.00,'\0','Padre#Madre¿ ','','','','Tío','','Noveno Grado','','gh,kgh,,g','','',1045367070,1000000000,1000000001,''),(16019,'',0,'',0,1.00,'\0','Padre#Madre¿ ','','','','Tío','','Noveno Grado','','gh,kgh,,g','','',1045367070,1000000000,1000000001,''),(16020,'',0,'',0,1.00,'\0','Padre#Madre','','','','Tío','','Noveno Grado','','gh,kgh,,g','','',1045367070,1000000000,1000000001,''),(1045367070,'',1,'',NULL,NULL,'',NULL,NULL,NULL,NULL,'Tío','\0','9','df',NULL,'','',NULL,NULL,NULL,'');
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
  `gradoModalidad` enum('C','S','G') NOT NULL,
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
  `actitudicionales` longtext NOT NULL,
  `resumen` varchar(250) DEFAULT NULL,
  `propuestaMejora` varchar(145) DEFAULT NULL,
  `evaluacionMaestroComentario` varchar(145) DEFAULT NULL,
  `planGrado` bit(1) NOT NULL DEFAULT b'1',
  `jornalizacion` bit(1) NOT NULL DEFAULT b'1',
  `cartaDidactica` bit(1) NOT NULL DEFAULT b'1',
  `guionClase` bit(1) NOT NULL DEFAULT b'1',
  `agendaDiaria` bit(1) NOT NULL DEFAULT b'1',
  `ColocaObjetivo` bit(1) NOT NULL DEFAULT b'1',
  `ambientacion` bit(1) NOT NULL DEFAULT b'1',
  `puntual` bit(1) NOT NULL DEFAULT b'1',
  `comites` bit(1) NOT NULL DEFAULT b'1',
  `ejesTransversales` bit(1) NOT NULL DEFAULT b'1',
  `horarioLimpiezaHOrnato` bit(1) NOT NULL DEFAULT b'1',
  `valores` bit(1) NOT NULL DEFAULT b'1',
  `asistencia` bit(1) NOT NULL DEFAULT b'1',
  `revisaTareas` bit(1) NOT NULL DEFAULT b'1',
  `repasoClaseAnterior` bit(1) NOT NULL DEFAULT b'1',
  `organizaClase` bit(1) NOT NULL DEFAULT b'1',
  `ambienteAdecuado` bit(1) NOT NULL DEFAULT b'1',
  `usaGuiaClase` bit(1) NOT NULL DEFAULT b'1',
  `presentaAgenda` bit(1) NOT NULL DEFAULT b'1',
  `presentaObjetivo` bit(1) NOT NULL DEFAULT b'1',
  `presentaContenido` bit(1) NOT NULL DEFAULT b'1',
  `ideasClaras` bit(1) NOT NULL DEFAULT b'1',
  `claseCentradaDocente` bit(1) NOT NULL DEFAULT b'1',
  `participanAlumnos` bit(1) NOT NULL DEFAULT b'1',
  `recursosDidacticos` bit(1) NOT NULL DEFAULT b'1',
  `especialidadPractica` bit(1) NOT NULL DEFAULT b'1',
  `disciplinaDigna` bit(1) NOT NULL DEFAULT b'1',
  `llamarEstudianteNombre` bit(1) NOT NULL DEFAULT b'1',
  `despazaSalon` bit(1) NOT NULL DEFAULT b'1',
  `preguntaEstudiantes` bit(1) NOT NULL DEFAULT b'1',
  `aprovechaTiempo` bit(1) NOT NULL DEFAULT b'1',
  `verificaComprensionContenido` bit(1) NOT NULL DEFAULT b'1',
  `tratoIgualitario` bit(1) NOT NULL DEFAULT b'1',
  `trabajosGrupos` bit(1) NOT NULL DEFAULT b'1',
  `tecnicasAdecuadas` bit(1) NOT NULL DEFAULT b'1',
  `aprendizajeCreativo` bit(1) NOT NULL DEFAULT b'1',
  `diferenciasIndividuaes` bit(1) NOT NULL DEFAULT b'1',
  `soloLibro` bit(1) NOT NULL DEFAULT b'1',
  `listaCotejo` bit(1) NOT NULL DEFAULT b'1',
  `copiaPizarron` bit(1) NOT NULL DEFAULT b'1',
  `ejerciciosPizarron` bit(1) NOT NULL DEFAULT b'1',
  `dominaContenido` bit(1) NOT NULL DEFAULT b'1',
  `metodoDefinido` bit(1) NOT NULL DEFAULT b'1',
  `desarrollaEjezTransv` bit(1) NOT NULL DEFAULT b'1',
  `porcentajesEvaluacion` bit(1) NOT NULL DEFAULT b'1',
  `asignaTareas` bit(1) NOT NULL DEFAULT b'1',
  `fuentesConsulta` bit(1) NOT NULL DEFAULT b'1',
  `claridadEvaluacion` bit(1) NOT NULL DEFAULT b'1',
  `refuerzoContenido` bit(1) NOT NULL DEFAULT b'1',
  `aclaraDudas` bit(1) NOT NULL DEFAULT b'1',
  `clasePlanificada` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`idMaestro`,`fechaHora`),
  KEY `fk_evaluacionMaestro_1_idx` (`idMaestro`),
  KEY `fk_evaluacionMaestro_2` (`grado`,`seccion`,`año`,`gradoModalidad`),
  KEY `fk_evaluacionMaestro_3_idx` (`evaluador`),
  KEY `fk_evaluacionMaestro_4_idx` (`materia`),
  CONSTRAINT `fk_evaluacionMaestro_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_evaluacionMaestro_2` FOREIGN KEY (`grado`, `seccion`, `año`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoAño`, `gradoModalidad`) ON UPDATE CASCADE,
  CONSTRAINT `fk_evaluacionMaestro_3` FOREIGN KEY (`evaluador`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_evaluacionMaestro_4` FOREIGN KEY (`materia`) REFERENCES `materia` (`idmateria`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacionMaestro`
--

LOCK TABLES `evaluacionMaestro` WRITE;
/*!40000 ALTER TABLE `evaluacionMaestro` DISABLE KEYS */;
INSERT INTO `evaluacionMaestro` VALUES (1045367086,'2020-06-25 03:54:40',1,'C','A',2020,7,'M',20,'07:15:00','08:00:00','3','Que los alumnos...',1045367083,'trata bien a los estudiantes','buen desempeño','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(1045367086,'2020-06-25 04:08:27',1,'C','A',2020,4,'v',45,'08:00:00','08:45:00','Unidad 2','Que los estudiantes aprendan...',1045367083,'Excelente desempeño','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','');
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
INSERT INTO `expedientePS` VALUES (16018,'padre, madre',''),(16019,'padre, madre y hermanos',''),(16020,'padre y madre','');
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
INSERT INTO `financiamiento` VALUES (4,'MINED',NULL);
/*!40000 ALTER TABLE `financiamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grado` (
  `gradoAño` int(4) NOT NULL,
  `idgrado` int(30) NOT NULL,
  `gradoSeccion` enum('A','B','C') NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `aulaGrado` int(30) NOT NULL,
  `gradoActivo` bit(1) NOT NULL,
  `gradoMaestroGuia` int(30) DEFAULT NULL,
  `gradoCoemntario` varchar(145) DEFAULT NULL COMMENT 'Historico de los grados y secciones junto a los maestros que han sido sus maestros guÃ­as.',
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
INSERT INTO `grado` VALUES (2020,1,'A','C',7,'',1045367083,NULL),(2020,2,'A','C',8,'',NULL,NULL),(2020,3,'A','C',9,'',NULL,NULL);
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
  `fechaEvaluacion` datetime NOT NULL COMMENT 'histÃ³rico de evaluaciones a cada grado del instituto.',
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
  PRIMARY KEY (`idGrado`,`gradoSeccion`,`gradoAño`,`gradoModalidad`,`fechaEvaluacion`),
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
INSERT INTO `gradoEvaluacion` VALUES (1,'A',2020,'C','2020-06-25 00:58:27',1045367083,'\0','\0','\0','\0','\0','','','','','\0','\0','','','',''),(1,'A',2020,'C','2020-06-25 01:11:39',1045367083,'','','','','','','','','','','','Excelente organización','','','');
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
INSERT INTO `horario` VALUES (1,'07:15:00','08:00:00',''),(2,'08:00:00','08:45:00',''),(3,'08:45:00','09:05:00',''),(4,'09:05:00','09:50:00',''),(5,'09:50:00','10:35:00',''),(6,'10:35:00','10:45:00',''),(7,'10:45:00','11:30:00',''),(8,'11:30:00','12:15:00',''),(9,'12:15:00','13:15:00',''),(10,'13:15:00','14:00:00',''),(11,'14:00:00','14:45:00',''),(12,'14:45:00','15:00:00',''),(13,'14:00:00','15:45:00',''),(14,'15:45:00','16:30:00',''),(15,'16:30:00','17:15:00','');
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
INSERT INTO `maestoCargo` VALUES (1045367082,5,4,4,'2020-06-23',NULL,NULL,NULL),(1045367083,3,4,4,'2020-06-20',NULL,NULL,NULL),(1045367085,4,4,4,'2020-06-23',NULL,NULL,NULL),(1045367086,6,4,4,'2020-07-01',NULL,NULL,NULL);
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
  `maestroHorasUsoTecnologia` int(30) NOT NULL DEFAULT 0,
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
INSERT INTO `maestro` VALUES (1045367082,0,0,0,0,0,0,0,'afp',0,'2222-2222',5,'2020-06-23','2020-06-23','2020-06-23','T','1','',4,'',5,'','','',''),(1045367083,0,0,0,0,0,0,0,'safvdavsd',444,'2111-1111',5,'2020-06-20','2020-06-20','2020-06-20','T','1','',4,'',0,'','','',''),(1045367085,6446548,0,566165156,648446484,656161616,0,0,'afp',0,'2222-2222',5,'2020-06-01','2020-06-02','2020-06-04','T','2','',5,'\0',0,'\0','\0','\0',''),(1045367086,65489645,56464546,5646456,54646546,48966352,0,0,'afp',0,'7777-7777',5,'2020-06-23','2020-06-11','2020-06-22','T','5','',4,'',5,'','','','');
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
INSERT INTO `materia` VALUES (1,'Matemática','MAT',1,'c0d6c8'),(2,'Lenguaje','LEN',1,'bfc4de'),(3,'Inglés','ING',1,'9dc4ae'),(4,'Informática','INF',1,'c4b0c4'),(5,'Estudios Sociales','EE.SS',1,'8e8cb3'),(6,'Educación Físiaca','EE.FF',1,'e6ddaf'),(7,'Ciencias Naturales','CC.NN',1,'cae3cb'),(8,'Moral, Urbanidad y Cívica','MUC',1,''),(9,'Orientación Para La Vida','OPV',2,'a9aed6'),(10,'Seminario','SEM',2,''),(11,'Curso de Habilidad Laboral','CHL',2,''),(12,'Tecnología I','TG1',3,''),(13,'Tecnología II','TG2',3,''),(14,'Tecnología III','TG3',3,''),(15,'Práctica Profesional I','PP1',3,''),(16,'Práctica Profesional II','PP2',3,''),(17,'Práctica Profesional III','PP3',3,''),(18,'Laboratorio de Creatividad I','LC1',3,'f0b8f0'),(19,'Laboratorio de Creatividad II','LC2',3,''),(20,'Laboratorio de Creatividad III','LC3',3,''),(21,'Contaduría','CTD',4,'b5c4ae'),(22,'General','GNL',4,'e8d0e8');
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
INSERT INTO `matricula` VALUES (16018,2020,3,'C','A','\0','R'),(16019,2020,2,'C','A','\0','R'),(16020,2020,1,'C','A','\0','R');
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
INSERT INTO `mestroHorarioMaterias` VALUES (1045367082,2,1,1,2,'C','A',2020,NULL),(1045367083,18,1,1,1,'C','A',2020,NULL),(1045367085,4,1,1,3,'C','A',2020,NULL);
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
  `irAPagina` varchar(100) DEFAULT NULL,
  `notificacionComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idnotificacion`),
  KEY `fk_notificaciones_1_idx` (`destinatario`,`remitente`),
  KEY `fk_notificaciones_2_idx` (`remitente`),
  CONSTRAINT `fk_notificaciones_1` FOREIGN KEY (`destinatario`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_notificaciones_2` FOREIGN KEY (`remitente`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,'2020-06-24 07:28:52',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(2,'2020-06-24 07:28:52',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Wednesday 01/July/2020 10:30 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(3,'2020-06-24 07:58:09',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(4,'2020-06-24 07:58:09',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Thursday 02/July/2020 08:45 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(5,'2020-06-24 16:54:22',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(6,'2020-06-24 16:54:22',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Thursday 25/June/2020 11:54 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(7,'2020-06-24 16:54:33',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(8,'2020-06-24 16:54:33',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Friday 26/June/2020 08:54 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(9,'2020-06-24 16:54:57',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(10,'2020-06-24 16:54:57',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Monday 29/June/2020 08:00 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(11,'2020-06-24 17:01:10',1045367088,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(12,'2020-06-24 17:03:35',16018,1045367088,'Nuevo anuncio disponible','Nuevo auncio publicado recientemente por Laura Pineda','',NULL,' '),(13,'2020-06-24 17:15:48',16018,16018,'Cancelación de cita','Usted ha cancelado su solicitud de cita con fecha 02/07/2020 a las 08:45 AM. La razón de la Cancelación es: ya no.','',NULL,' '),(14,'2020-06-24 17:15:48',1045367088,16018,'Cancelación de cita','La solicitud de cita con fecha 02/07/2020 a las 08:45 AM ha sido cancelada por Francisco Regalado. La razón de la Cancelación es: ya no.','',NULL,' '),(15,'2020-06-24 17:16:14',16018,1045367088,'Solicitud de cita aceptada','Su solicitud para una cita con el psicólogo institucional fue aprobada por Laura Pineda. La cita consulta se llevará a cabo el 29/06/2020 08:00 AM','\0',NULL,' '),(16,'2020-06-24 17:17:14',16018,1045367088,'Solicitud de cita pospuesta','Su solicitud para una cita con el psicólogo institucional fue aplazada por Laura PinedaLa razón del aplazamiento es :otro día mejor. Se le propone que la cita consulta se lleve a cabo el 25/06/2020 11:10 AM. Puede aceptarla, modificarla o cancelarla desde su historial de citas.','\0',NULL,' '),(17,'2020-06-24 17:32:58',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(18,'2020-06-24 17:32:58',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Friday 26/June/2020 11:10 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(19,'2020-06-24 17:33:21',16018,1045367088,'Solicitud de cita aceptada','Su solicitud para una cita con el psicólogo institucional fue aprobada por Laura Pineda. La cita consulta se llevará a cabo el 26/06/2020 11:10 AM','',NULL,' '),(20,'2020-06-24 17:50:18',1045367073,1045367073,'Solicitud exitosa','Su solicitud de recursos de Tecnológico CRA ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(21,'2020-06-24 17:50:18',1045367080,1045367073,'Nueva solicitud de recursos','Guillermo Aldolfo Delsas Murcia ha solicitado recursos','\0',NULL,' '),(22,'2020-06-24 18:38:23',16018,1045367088,'Sesión de consulta iniciada','La sesión de consulta con la psicóloga  lic. Laura Pineda ha iniciado.','',NULL,' '),(23,'2020-06-24 18:39:02',1045367088,1045367088,'Sesión de consulta terminada','La sesión de consulta psicológica con el estudiante Francisco Regalado ha terminado.','\0',NULL,' '),(24,'2020-06-24 18:39:02',16018,1045367088,'Sesión de consulta terminada','La sesión de consulta con la psicóloga  lic. Laura Pineda ha terminado.','',NULL,' '),(25,'2020-06-25 00:58:36',16018,1045367083,'Hay una nueva evaluación de su grado','El grado en el que usted está inscrito ha sido evaluado recientemente por Laura López. Vea los resultados en el historial de evaluaciones de su grado.','',NULL,' '),(26,'2020-06-25 00:58:36',1045367083,1045367083,'Hay una nueva evaluación del su grado','El grado del que usted guía ha sido evaluado recientemente por Laura López. Vea los resultados en el historial de evaluaciones de su grado.','',NULL,' '),(27,'2020-06-25 01:11:59',16018,1045367083,'Hay una nueva evaluación de su grado','El grado en el que usted está inscrito ha sido evaluado recientemente por Laura López. Vea los resultados en el historial de evaluaciones de su grado.','',NULL,' '),(28,'2020-06-25 01:11:59',1045367083,1045367083,'Hay una nueva evaluación del su grado','El grado del que usted guía ha sido evaluado recientemente por Laura López. Vea los resultados en el historial de evaluaciones de su grado.','\0',NULL,' '),(29,'2020-06-25 02:26:49',16018,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(30,'2020-06-25 02:26:58',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(31,'2020-06-25 03:53:48',1045367086,1045367083,'Recuperaciń de contraseña','Su contraseña ha sido modificada por Laura López. Recuerde cambiar su contraseña en su perfil y mantenerla en secreto','',NULL,' '),(32,'2020-06-25 03:56:17',1045367086,1045367083,'Evaluación nueva','Laura López ha realizado una nueva evaluación de su desempeño. Puede ver su historial de desempeño en la pestaña historiales del menú perfil.','',NULL,' '),(33,'2020-06-25 04:10:27',1045367086,1045367083,'Evaluación nueva','Laura López ha realizado una nueva evaluación de su desempeño. Puede ver su historial de desempeño en la pestaña historiales del menú perfil.','',NULL,' '),(34,'2020-06-25 04:21:35',1045367086,1045367086,'Solicitud exitosa','Su solicitud de recursos de Tecnológico CRA ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(35,'2020-06-25 04:21:35',1045367080,1045367086,'Nueva solicitud de recursos','Juan Manuel Bartanes Pilar ha solicitado recursos','\0',NULL,' '),(36,'2020-06-25 04:22:19',1045367086,1045367086,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(37,'2020-06-25 04:22:19',1045367081,1045367086,'Nueva solicitud de recursos','Juan Manuel Bartanes Pilar ha solicitado recursos','',NULL,' '),(38,'2020-06-25 04:23:03',1045367086,1045367086,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(39,'2020-06-25 04:23:03',1045367081,1045367086,'Nueva solicitud de recursos','Juan Manuel Bartanes Pilar ha solicitado recursos','',NULL,' '),(40,'2020-06-25 04:29:33',1045367086,1045367086,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 25/06/2020 y 25/06/2020','',NULL,' '),(41,'2020-06-25 04:29:33',1045367085,1045367086,'Solicitud de permiso nueva','Juan Manuel Bartanes Pilar ha solicitado un nuevo permiso.','',NULL,' '),(42,'2020-06-25 04:29:48',1045367086,1045367086,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 25/06/2020 y 25/06/2020','',NULL,' '),(43,'2020-06-25 04:29:48',1045367085,1045367086,'Solicitud de permiso nueva','Juan Manuel Bartanes Pilar ha solicitado un nuevo permiso.','',NULL,' '),(44,'2020-06-25 04:30:44',1045367086,1045367086,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 26/06/2020 y 30/06/2020','',NULL,' '),(45,'2020-06-25 04:30:44',1045367085,1045367086,'Solicitud de permiso nueva','Juan Manuel Bartanes Pilar ha solicitado un nuevo permiso.','',NULL,' '),(46,'2020-06-25 04:33:14',1045367085,1045367073,'Recuperaciń de contraseña','Su contraseña ha sido modificada por Guillermo Delsas. Recuerde cambiar su contraseña en su perfil y mantenerla en secreto','',NULL,' '),(47,'2020-06-25 04:35:24',1045367086,1045367086,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 29/06/2020 y 29/06/2020','',NULL,' '),(48,'2020-06-25 04:35:24',1045367085,1045367086,'Solicitud de permiso nueva','Juan Manuel Bartanes Pilar ha solicitado un nuevo permiso.','',NULL,' '),(49,'2020-06-25 04:41:22',1045367086,1045367086,'Cancelación exitosa','Ha cancelado la solicitud de permiso con fechas: 29/06/2020. La razón del cancelamiento es: ya no es necesario.','\0',NULL,' '),(50,'2020-06-25 04:41:48',1045367086,1045367085,'Aceptación de permiso','Francisco Javier Magaña Arriola ha aceptado su solicitud de permiso. ','',NULL,' '),(51,'2020-06-25 04:42:32',1045367086,1045367085,'Rechado de permiso','Francisco Javier Magaña Arriola ha rechazado su solicitud de permiso. Motivo del rechazo: necesita una constancia','',NULL,' '),(52,'2020-06-25 04:43:20',1045367086,1045367086,'Modificación de solicitud de permiso','Su permiso se ha solicitado para entre las fechas: 26/06/2020 y 30/06/2020','',NULL,' '),(53,'2020-06-25 04:43:20',1045367085,1045367086,'Modificaciones en una solicitud de permiso','Juan Manuel Bartanes Pilar ha cambiado su solicitud de permiso.','',NULL,' '),(54,'2020-06-25 04:43:47',1045367086,1045367085,'Aceptación de permiso','Francisco Javier Magaña Arriola ha aceptado su solicitud de permiso. ','',NULL,' '),(55,'2020-06-25 06:17:40',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(56,'2020-06-25 20:44:23',1045367086,1045367086,'Cancelación de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 04:20 AM ha sido cancelada por Juan Bartanes. La razón de lacancelación es: ya no habrá exposisción..','',NULL,' '),(57,'2020-06-25 20:44:23',1045367080,1045367086,'Cancelación de reserva','La solicitud de reserva de equipo con fecha 25/06/2020 a las 04:20 AM ha sido cancelada por Juan Bartanes. La razón de la cancelación es: ya no habrá exposisción..','\0',NULL,' '),(58,'2020-06-25 20:45:07',1045367086,1045367073,'Aceptación de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 04:21 AM ha sido aceptada por Guillermo Delsas.','',NULL,' '),(59,'2020-06-25 20:46:04',1045367086,1045367073,'Rechazo de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 04:22 AM ha sido rechazada por Guillermo Delsas. La razón del rechazo es: No hay equipo disponible para esa hora..','',NULL,' '),(60,'2020-06-25 20:57:50',1045367073,1045367073,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(61,'2020-06-25 20:57:50',1045367081,1045367073,'Nueva solicitud de recursos','Guillermo Aldolfo Delsas Murcia ha solicitado recursos','',NULL,' '),(62,'2020-06-25 20:58:37',1045367073,1045367073,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(63,'2020-06-25 20:58:37',1045367081,1045367073,'Nueva solicitud de recursos','Guillermo Aldolfo Delsas Murcia ha solicitado recursos','',NULL,' '),(64,'2020-06-25 20:59:44',1045367073,1045367081,'Rechazo de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 08:58 PM ha sido rechazada por Hugo Flores. La razón del rechazo es: biblioteca cerrada a esa hora..','',NULL,' '),(65,'2020-06-25 21:00:53',1045367081,1045367073,'Cancelación de reserva','La solicitud de reserva de equipo con fecha 25/06/2020 a las 08:55 PM ha sido cancelada por Guillermo Delsas. La razón de la cancelación es: Ya no quiero el recurso..','',NULL,' '),(66,'2020-06-25 21:02:15',1045367073,1045367073,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(67,'2020-06-25 21:02:15',1045367081,1045367073,'Nueva solicitud de recursos','Guillermo Aldolfo Delsas Murcia ha solicitado recursos','',NULL,' '),(68,'2020-06-25 21:10:58',1045367086,1045367073,'Entrega de equipo reservado','Los recursos que solicitó el día 25/06/2020 a las 04:21 AM han sido entregados en este momento por Guillermo Delsas','\0',NULL,' '),(69,'2020-06-25 21:11:48',1045367086,1045367073,'Devolución de equipo reservado','Los recursos que solicitó el día 25/06/2020 a las 04:21 AM han sido recibidos en este momento por Guillermo Delsas','\0',NULL,' '),(70,'2020-06-25 21:19:25',1045367086,1045367086,'Solicitud exitosa','Su solicitud de recursos de Tecnológico CRA ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(71,'2020-06-25 21:19:25',1045367080,1045367086,'Nueva solicitud de recursos','Juan Manuel Bartanes Pilar ha solicitado recursos','\0',NULL,' '),(72,'2020-06-25 21:19:45',1045367086,1045367073,'Aceptación de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 09:18 PM ha sido aceptada por Guillermo Delsas.','\0',NULL,' '),(73,'2020-06-25 21:20:02',1045367086,1045367073,'Entrega de equipo reservado','Los recursos que solicitó el día 25/06/2020 a las 09:18 PM han sido entregados en este momento por Guillermo Delsas','',NULL,' '),(74,'2020-06-25 21:30:38',1045367073,1045367073,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','\0',NULL,' '),(75,'2020-06-25 21:30:38',1045367081,1045367073,'Nueva solicitud de recursos','Guillermo Aldolfo Delsas Murcia ha solicitado recursos','\0',NULL,' '),(76,'2020-06-25 21:32:05',1045367073,1045367081,'Rechazo de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 09:01 PM ha sido rechazada por Hugo Flores. La razón del rechazo es: todos los libros están ya reservados..','',NULL,' '),(77,'2020-06-25 21:32:44',1045367073,1045367081,'Aceptación de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 09:28 PM ha sido aceptada por Hugo Flores.','',NULL,' '),(78,'2020-06-25 21:33:54',1045367073,1045367081,'Entrega de equipo reservado','Los recursos que solicitó el día 25/06/2020 a las 09:28 PM han sido entregados en este momento por Hugo Flores','',NULL,' '),(79,'2020-06-25 21:34:47',1045367073,1045367081,'Devolución de equipo reservado','Los recursos que solicitó el día 25/06/2020 a las 09:28 PM han sido recibidos en este momento por Hugo Flores','',NULL,' '),(80,'2020-06-26 00:59:02',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(81,'2020-06-26 18:20:46',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','',NULL,' '),(82,'2020-06-26 19:07:49',1045367080,1045367085,'Nueva solicitud de recursos','Francisco Javier Magaña Arriola ha solicitado recursos para proyecto pedagógico planificado. Revise la administración de reservas para más detalles.','\0',NULL,' '),(83,'2020-06-26 19:07:49',1045367085,1045367085,'Solicitud realizada','La solicitud se ha enviado con éxitos. Recibirá una notificación del encargado del CRA cuando su proyecto se haya resuelto.','',NULL,' '),(84,'2020-06-26 19:14:11',1045367080,1045367085,'Nueva solicitud de recursos','Francisco Javier Magaña Arriola ha solicitado recursos para proyecto pedagógico planificado. Revise la administración de reservas para más detalles.','\0',NULL,' '),(85,'2020-06-26 19:14:11',1045367085,1045367085,'Solicitudes realizadas','Las solicitudes se han enviado con éxitos. Recibirá una notificación del encargado del CRA cuando su proyecto se haya resuelto.','',NULL,' '),(86,'2020-06-27 02:38:36',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(87,'2020-06-27 03:03:10',1045367083,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(88,'2020-06-27 03:25:05',1045367088,1045367073,'nuevo reporte de citas psicológicas','Guillermo Delsas ha creado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Este reporte aun no es público. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(89,'2020-06-27 03:25:32',1045367083,1045367073,'nuevo reporte de citas psicológicas','Guillermo Delsas ha publicado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(90,'2020-06-27 03:25:32',1045367088,1045367073,'nuevo reporte de citas psicológicas','Guillermo Delsas ha publicado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(91,'2020-06-27 03:25:45',1045367083,1045367073,'Reporte de citas psicológicas eliminado','Guillermo Delsas ha eliminado un reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(92,'2020-06-27 03:25:45',1045367088,1045367073,'Reporte de citas psicológicas eliminado','Guillermo Delsas ha eliminado un reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(93,'2020-06-27 03:34:36',1045367082,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(94,'2020-06-27 03:34:36',1045367083,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(95,'2020-06-27 03:34:36',1045367085,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(96,'2020-06-27 03:34:36',1045367086,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(97,'2020-06-27 03:42:33',16018,1045367083,'Se ha registrado actividad en la entrega de paquetes.','Lo que se le ha entregado es: Útiles, Uniforme, Zapatos.','',NULL,' '),(98,'2020-06-27 04:06:50',1045367083,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha publicado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','\0',NULL,' '),(99,'2020-06-27 04:06:50',1045367088,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha publicado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(100,'2020-06-27 09:15:28',1045367083,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(101,'2020-07-01 18:07:13',16018,1045367073,'Se ha registrado actividad en la entrega de paquetes.','Lo que se le ha entregado es: Útiles, Uniforme.','\0',NULL,' '),(102,'2020-07-01 18:15:06',16020,1045367073,'Se ha registrado actividad en la entrega de paquetes.','Lo que se le ha entregado es: Útiles, Uniforme, Zapatos.','\0',NULL,' '),(103,'2020-07-01 18:15:13',16019,1045367073,'Se ha registrado actividad en la entrega de paquetes.','Lo que se le ha entregado es: , Uniforme.','\0',NULL,' '),(104,'2020-07-01 18:16:05',1045367083,1045367073,'Nuevo tutelaje','Guillermo Delsas le ha entregado el tutelaje del grado 1° TVC Contador Sección A año 2020','\0',NULL,' '),(105,'2020-07-01 18:17:49',16018,1045367073,'Se ha registrado un cambio de sección','Guillermo Delsas ha cambiado la sección donde usted estaba inscrito a la sección \'A\'.','\0',NULL,' '),(106,'2020-07-01 18:17:57',16019,1045367073,'Se ha registrado un cambio de sección','Guillermo Delsas ha cambiado la sección donde usted estaba inscrito a la sección \'A\'.','\0',NULL,' '),(107,'2020-07-01 18:18:03',16020,1045367073,'Se ha registrado un cambio de sección','Guillermo Delsas ha cambiado la sección donde usted estaba inscrito a la sección \'A\'.','\0',NULL,' '),(108,'2020-07-01 18:19:02',16018,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero, Marzo, Abril, Mayo.','\0',NULL,' '),(109,'2020-07-01 18:19:11',16019,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero, Marzo, Abril.','\0',NULL,' '),(110,'2020-07-01 18:19:19',16020,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero.','',NULL,' '),(111,'2020-07-01 18:20:05',16018,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero, Marzo, Abril, Mayo, Junio.','',NULL,' '),(112,'2020-07-01 18:20:16',16018,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio.','',NULL,' '),(113,'2020-07-01 18:24:15',1045367086,1045367073,'Asignación de Cargo','Guillermo Delsas le ha asignado el cargo de Profesor de planta','',NULL,' '),(114,'2020-07-01 18:25:53',16020,1045367073,'Nueva concesión de permiso','Guillermo Aldolfo Delsas Murcia le ha concedido un nuevo permiso a petición de iyyiiyyyiyi iuy kghggjgjhgjg jhgjhgjhgj.','',NULL,' '),(115,'2020-07-01 18:31:06',1045367085,1045367085,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 01/07/2020 y 03/07/2020','\0',NULL,' '),(116,'2020-07-01 18:31:06',1045367083,1045367085,'Solicitud de permiso nueva','Francisco Javier Magaña Arriola ha solicitado un nuevo permiso.','',NULL,' '),(117,'2020-07-01 18:31:18',1045367085,1045367085,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 06/07/2020 y 10/07/2020','\0',NULL,' '),(118,'2020-07-01 18:31:18',1045367083,1045367085,'Solicitud de permiso nueva','Francisco Javier Magaña Arriola ha solicitado un nuevo permiso.','',NULL,' '),(119,'2020-07-01 18:31:34',1045367085,1045367085,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 31/07/2020 y 31/07/2020','\0',NULL,' '),(120,'2020-07-01 18:31:34',1045367083,1045367085,'Solicitud de permiso nueva','Francisco Javier Magaña Arriola ha solicitado un nuevo permiso.','',NULL,' '),(121,'2020-07-01 18:32:16',1045367085,1045367085,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 20/07/2020 y 24/07/2020','\0',NULL,' '),(122,'2020-07-01 18:32:16',1045367083,1045367085,'Solicitud de permiso nueva','Francisco Javier Magaña Arriola ha solicitado un nuevo permiso.','',NULL,' '),(123,'2020-07-01 18:32:28',1045367086,1045367085,'Aceptación de permiso','Francisco Javier Magaña Arriola ha aceptado su solicitud de permiso. ','',NULL,' '),(124,'2020-07-01 18:33:26',1045367085,1045367073,'Aceptación de permiso','Guillermo Aldolfo Delsas Murcia ha aceptado su solicitud de permiso. ','\0',NULL,' '),(125,'2020-07-01 18:33:28',1045367085,1045367073,'Aceptación de permiso','Guillermo Aldolfo Delsas Murcia ha aceptado su solicitud de permiso. ','\0',NULL,' '),(126,'2020-07-01 18:33:30',1045367085,1045367073,'Aceptación de permiso','Guillermo Aldolfo Delsas Murcia ha aceptado su solicitud de permiso. ','\0',NULL,' '),(127,'2020-07-01 18:33:33',1045367085,1045367073,'Aceptación de permiso','Guillermo Aldolfo Delsas Murcia ha aceptado su solicitud de permiso. ','\0',NULL,' '),(128,'2020-07-01 18:35:09',1045367085,1045367073,'Asignación de Cargo','Guillermo Delsas le ha asignado el cargo de Profesor de planta','\0',NULL,' '),(129,'2020-07-01 18:38:25',1045367085,1045367073,'Relevación de Cargo','Ha sido relevado de su cargo como Profesor de planta Por Guillermo Delsas','\0',NULL,' '),(130,'2020-07-01 18:54:21',1045367086,1045367086,'Modificación de solicitud de permiso','Su permiso se ha solicitado para entre las fechas: 29/07/2020 y 31/07/2020','',NULL,' '),(131,'2020-07-01 18:54:21',1045367085,1045367086,'Modificaciones en una solicitud de permiso','Juan Manuel Bartanes Pilar ha cambiado su solicitud de permiso.','\0',NULL,' '),(132,'2020-07-03 13:14:22',16018,1045367073,'Solicitud de cita aceptada','Su solicitud para una cita con el psicólogo institucional fue aprobada por Guillermo Delsas. La cita consulta se llevará a cabo el 01/07/2020 10:30 AM','',NULL,' '),(133,'2020-07-03 13:14:34',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','',NULL,' '),(134,'2020-07-03 13:16:47',1045367073,1045367073,'Sesión de consulta terminada','La sesión de consulta psicológica con el estudiante Francisco Regalado ha terminado.','',NULL,' '),(135,'2020-07-03 13:16:47',16018,1045367073,'Sesión de consulta terminada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha terminado.','',NULL,' '),(136,'2020-07-03 13:17:52',16020,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','',NULL,' '),(137,'2020-07-03 13:19:25',1045367073,1045367073,'Sesión de consulta terminada','La sesión de consulta psicológica con la estudiante Mariana Regalado ha terminado.','',NULL,' '),(138,'2020-07-03 13:19:26',16020,1045367073,'Sesión de consulta terminada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha terminado.','',NULL,' '),(139,'2020-07-03 13:19:53',16019,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(140,'2020-07-03 13:20:39',1045367073,1045367073,'Sesión de consulta terminada','La sesión de consulta psicológica con el estudiante Juan Regalado ha terminado.','',NULL,' '),(141,'2020-07-03 13:20:39',16019,1045367073,'Sesión de consulta terminada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha terminado.','\0',NULL,' '),(142,'2020-07-03 15:38:24',1045367088,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha creado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Este reporte aun no es público. Reporte Desde 24/06/2020 hasta 02/07/2020','',NULL,' '),(143,'2020-07-03 15:38:50',1045367088,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha modificado un reporte sobre las citas atendidas en el consultorio de psicología. Este reporte aun no es público. Reporte Desde 24/06/2020 hasta 02/07/2020','',NULL,' '),(144,'2020-07-03 16:54:52',1045367088,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha modificado un reporte sobre las citas atendidas en el consultorio de psicología. Este reporte aun no es público. Reporte Desde 24/06/2020 hasta 02/07/2020','',NULL,' '),(145,'2020-07-03 16:56:29',1045367088,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha creado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Este reporte aun no es público. Reporte Desde 03/07/2020 hasta 03/07/2020','',NULL,' '),(146,'2020-07-05 22:08:41',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(147,'2020-08-24 01:43:11',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(148,'2020-08-24 01:43:11',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Monday 31/August/2020 08:45 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(149,'2020-08-24 01:43:43',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(150,'2020-08-24 01:43:43',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Thursday 27/August/2020 09:00 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(151,'2020-08-26 00:43:48',1045367082,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Lunes 07:15 AM - 08:00 AM Materia: Lenguaje. Profesor: José Murcia. Grado: 2° TVC Contador Sección A','\0',NULL,' '),(152,'2020-08-26 00:44:15',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Lunes 07:15 AM - 08:00 AM Materia: Informática. Profesor: Francisco Magaña. Grado: 3° TVC Contador Sección A','\0',NULL,' '),(153,'2020-08-26 00:54:28',1045367083,1045367073,'Se ha eliminado una nueva hora clase del horario','Elimnación: Lunes 08:00 AM - 08:45 AM Materia: Laboratorio de Creatividad I Profesor: Laura María López Súñiga Grado: 1° TVC Contador Sección A','\0',NULL,' '),(154,'2020-08-26 01:00:57',1045367086,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Lunes 08:00 AM - 08:45 AM Materia: Informática Profesor: Juan Manuel Bartanes Pilar Grado: 3° TVC Contador Sección A','\0',NULL,' '),(155,'2020-08-26 01:01:28',1045367085,1045367073,'Seha editado el horario','Modificación: Lunes 08:00 AM - 08:45 AM Materia: Informática Profesor: Francisco Javier Magaña Arriola Grado: 3° TVC Contador Sección A','\0',NULL,' '),(156,'2020-08-26 01:01:46',1045367085,1045367073,'Se ha eliminado una nueva hora clase del horario','Elimnación: Lunes 08:00 AM - 08:45 AM Materia: Informática Profesor: Francisco Javier Magaña Arriola Grado: 3° TVC Contador Sección A','\0',NULL,' '),(157,'2020-08-27 00:10:06',16018,1045367073,'Solicitud de cita pospuesta','Su solicitud para una cita con el psicólogo institucional fue aplazada por Guillermo DelsasLa razón del aplazamiento es :me retiro temprano. Se le propone que la cita consulta se lleve a cabo el 31/08/2020 08:00 AM. Puede aceptarla, modificarla o cancelarla desde su historial de citas.','\0',NULL,' '),(158,'2020-08-27 00:39:40',1045367088,16020,'Nueva solicitud de cita','El estudiante Mariana Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(159,'2020-08-27 00:39:40',16020,16020,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Monday 31/August/2020 09:40 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(160,'2020-08-27 00:41:30',1045367088,16020,'Nueva solicitud de cita','El estudiante Mariana Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(161,'2020-08-27 00:41:30',16020,16020,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Monday 31/August/2020 08:40 AM. Manténgase pendiente de la respuesta del psicólogo.','\0',NULL,' '),(162,'2020-08-27 00:43:04',16018,1045367088,'Solicitud de cita pospuesta','Su solicitud para una cita con el psicólogo institucional fue aplazada por Laura PinedaLa razón del aplazamiento es :no habrá clases. Se le propone que la cita consulta se lleve a cabo el 01/09/2020 08:45 AM. Puede aceptarla, modificarla o cancelarla desde su historial de citas.','\0',NULL,' '),(163,'2020-08-27 00:43:21',16018,1045367088,'Solicitud de cita aceptada','Su solicitud para una cita con el psicólogo institucional fue aprobada por Laura Pineda. La cita consulta se llevará a cabo el 31/08/2020 08:45 AM','\0',NULL,' '),(164,'2020-08-27 00:44:25',16018,1045367088,'Solicitud de cita pospuesta','Su solicitud para una cita con el psicólogo institucional fue aplazada por Laura PinedaLa razón del aplazamiento es :no hay clases. Se le propone que la cita consulta se lleve a cabo el 01/09/2020 09:45 AM. Puede aceptarla, modificarla o cancelarla desde su historial de citas.','\0',NULL,' '),(165,'2020-08-27 00:44:42',16018,1045367088,'Sesión de consulta iniciada','La sesión de consulta con la psicóloga  lic. Laura Pineda ha iniciado.','\0',NULL,' '),(166,'2020-08-27 00:46:56',16018,1045367088,'Sesión de consulta iniciada','La sesión de consulta con la psicóloga  lic. Laura Pineda ha iniciado.','\0',NULL,' '),(167,'2020-09-01 05:15:51',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(168,'2020-09-01 05:16:55',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(169,'2020-09-01 05:17:16',1045367073,1045367073,'Sesión de consulta terminada','La sesión de consulta psicológica con el estudiante Francisco Regalado ha terminado.','',NULL,' '),(170,'2020-09-01 05:17:16',16018,1045367073,'Sesión de consulta terminada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha terminado.','\0',NULL,' '),(171,'2020-09-01 05:17:29',16019,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(172,'2020-09-01 05:18:27',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(173,'2020-09-06 05:08:29',1045367073,1045367073,'MOdificación del plantel','Se ha detectado una modificación al plantel institucional.','',NULL,' '),(174,'2020-09-06 05:08:29',1045367083,1045367073,'MOdificación del plantel','Se ha detectado una modificación al plantel institucional.','\0',NULL,' '),(175,'2020-09-06 05:08:29',1045367085,1045367073,'MOdificación del plantel','Se ha detectado una modificación al plantel institucional.','\0',NULL,' '),(176,'2020-09-06 05:09:21',16018,1045367073,'Nueva concesión de permiso','Guillermo Aldolfo Delsas Murcia le ha concedido un nuevo permiso a petición de dfgbdgb dfgdfgdf dfghdfghdf fdghdfrhd.','\0',NULL,' '),(177,'2020-09-06 22:01:40',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(178,'2020-09-06 22:01:40',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(179,'2020-09-06 22:43:16',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(180,'2020-09-06 22:43:33',1045367083,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(181,'2020-09-06 22:43:42',1045367085,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(182,'2020-09-06 22:43:49',1045367082,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(183,'2020-09-06 22:43:49',1045367083,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(184,'2020-09-06 22:43:49',1045367085,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(185,'2020-09-06 22:43:49',1045367086,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(186,'2020-09-06 22:43:58',1045367081,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(187,'2020-09-06 22:44:06',1045367080,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(188,'2020-09-06 22:44:15',1045367082,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(189,'2020-09-06 22:44:32',16018,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(190,'2020-09-06 22:44:32',16019,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(191,'2020-09-06 22:44:33',16020,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(192,'2020-09-06 22:44:40',1045367070,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(193,'2020-09-06 22:44:54',1045367090,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(194,'2020-09-06 22:45:02',1045367091,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(195,'2020-09-06 22:45:09',1045367088,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' ');
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
INSERT INTO `pais` VALUES (1,'Afganistán',''),(2,'Islas Gland',''),(3,'Albania',''),(4,'Alemania',''),(5,'Andorra',''),(6,'Angola',''),(7,'Anguilla',''),(8,'Antártida',''),(9,'Antigua y Barbuda',''),(10,'Antillas Holandesas',''),(11,'Arabia Saudí',''),(12,'Argelia',''),(13,'Argentina',''),(14,'Armenia',''),(15,'Aruba',''),(16,'Australia',''),(17,'Austria',''),(18,'Azerbaiyán',''),(19,'Bahamas',''),(20,'Bahréin',''),(21,'Bangladesh',''),(22,'Barbados',''),(23,'Bielorrusia',''),(24,'Bélgica',''),(25,'Belice',''),(26,'Benin',''),(27,'Bermudas',''),(28,'Bhután',''),(29,'Bolivia',''),(30,'Bosnia y Herzegovina',''),(31,'Botsuana',''),(32,'Isla Bouvet',''),(33,'Brasil',''),(34,'Brunéi',''),(35,'Bulgaria',''),(36,'Burkina Faso',''),(37,'Burundi',''),(38,'Cabo Verde',''),(39,'Islas Caimán',''),(40,'Camboya',''),(41,'Camerún',''),(42,'Canadá',''),(43,'República Centroafricana',''),(44,'Chad',''),(45,'República Checa',''),(46,'Chile',''),(47,'China',''),(48,'Chipre',''),(49,'Isla de Navidad',''),(50,'Ciudad del Vaticano',''),(51,'Islas Cocos',''),(52,'Colombia',''),(53,'Comoras',''),(54,'República Democrática del Congo',''),(55,'Congo',''),(56,'Islas Cook',''),(57,'Corea del Norte',''),(58,'Corea del Sur',''),(59,'Costa de Marfil',''),(60,'Costa Rica',''),(61,'Croacia',''),(62,'Cuba',''),(63,'Dinamarca',''),(64,'Dominica',''),(65,'República Dominicana',''),(66,'Ecuador',''),(67,'Egipto',''),(68,'El Salvador',''),(69,'Emiratos Árabes Unidos',''),(70,'Eritrea',''),(71,'Eslovaquia',''),(72,'Eslovenia',''),(73,'España',''),(74,'Islas ultramarinas de Estados Unidos',''),(75,'Estados Unidos de América',''),(76,'Estonia',''),(77,'Etiopía',''),(78,'Islas Feroe',''),(79,'Filipinas',''),(80,'Finlandia',''),(81,'Fiyi',''),(82,'Francia',''),(83,'Gabón',''),(84,'Gambia',''),(85,'Georgia',''),(86,'Islas Georgias del Sur y Sandwich del Sur',''),(87,'Ghana',''),(88,'Gibraltar',''),(89,'Granada',''),(90,'Grecia',''),(91,'Groenlandia',''),(92,'Guadalupe',''),(93,'Guam',''),(94,'Guatemala',''),(95,'Guayana Francesa',''),(96,'Guinea',''),(97,'Guinea Ecuatorial',''),(98,'Guinea-Bissau',''),(99,'Guyana',''),(100,'Haití',''),(101,'Islas Heard y McDonald',''),(102,'Honduras',''),(103,'Hong Kong',''),(104,'Hungría',''),(105,'India',''),(106,'Indonesia',''),(107,'Irán',''),(108,'Iraq',''),(109,'Irlanda',''),(110,'Islandia',''),(111,'Israel',''),(112,'Italia',''),(113,'Jamaica',''),(114,'Japón',''),(115,'Jordania',''),(116,'Kazajstán',''),(117,'Kenia',''),(118,'Kirguistán',''),(119,'Kiribati',''),(120,'Kuwait',''),(121,'Laos',''),(122,'Lesotho',''),(123,'Letonia',''),(124,'Líbano',''),(125,'Liberia',''),(126,'Libia',''),(127,'Liechtenstein',''),(128,'Lituania',''),(129,'Luxemburgo',''),(130,'Macao',''),(131,'ARY Macedonia',''),(132,'Madagascar',''),(133,'Malasia',''),(134,'Malawi',''),(135,'Maldivas',''),(136,'Malí',''),(137,'Malta',''),(138,'Islas Malvinas',''),(139,'Islas Marianas del Norte',''),(140,'Marruecos',''),(141,'Islas Marshall',''),(142,'Martinica',''),(143,'Mauricio',''),(144,'Mauritania',''),(145,'Mayotte',''),(146,'México',''),(147,'Micronesia',''),(148,'Moldavia',''),(149,'Mónaco',''),(150,'Mongolia',''),(151,'Montserrat',''),(152,'Mozambique',''),(153,'Myanmar',''),(154,'Namibia',''),(155,'Nauru',''),(156,'Nepal',''),(157,'Nicaragua',''),(158,'Níger',''),(159,'Nigeria',''),(160,'Niue',''),(161,'Isla Norfolk',''),(162,'Noruega',''),(163,'Nueva Caledonia',''),(164,'Nueva Zelanda',''),(165,'Omán',''),(166,'Países Bajos',''),(167,'Pakistán',''),(168,'Palau',''),(169,'Palestina',''),(170,'Panamá',''),(171,'Papúa Nueva Guinea',''),(172,'Paraguay',''),(173,'Perú',''),(174,'Islas Pitcairn',''),(175,'Polinesia Francesa',''),(176,'Polonia',''),(177,'Portugal',''),(178,'Puerto Rico',''),(179,'Qatar',''),(180,'Reino Unido',''),(181,'Reunión',''),(182,'Ruanda',''),(183,'Rumania',''),(184,'Rusia',''),(185,'Sahara Occidental',''),(186,'Islas Salomón',''),(187,'Samoa',''),(188,'Samoa Americana',''),(189,'San Cristóbal y Nevis',''),(190,'San Marino',''),(191,'San Pedro y Miquelón',''),(192,'San Vicente y las Granadinas',''),(193,'Santa Helena',''),(194,'Santa Lucía',''),(195,'Santo Tomé y Príncipe',''),(196,'Senegal',''),(197,'Serbia y Montenegro',''),(198,'Seychelles',''),(199,'Sierra Leona',''),(200,'Singapur',''),(201,'Siria',''),(202,'Somalia',''),(203,'Sri Lanka',''),(204,'Suazilandia',''),(205,'Sudáfrica',''),(206,'Sudán',''),(207,'Suecia',''),(208,'Suiza',''),(209,'Surinam',''),(210,'Svalbard y Jan Mayen',''),(211,'Tailandia',''),(212,'Taiwán',''),(213,'Tanzania',''),(214,'Tayikistán',''),(215,'Territorio Británico del Océano Índico',''),(216,'Territorios Australes Franceses',''),(217,'Timor Oriental',''),(218,'Togo',''),(219,'Tokelau',''),(220,'Tonga',''),(221,'Trinidad y Tobago',''),(222,'Túnez',''),(223,'Islas Turcas y Caicos',''),(224,'Turkmenistán',''),(225,'Turquía',''),(226,'Tuvalu',''),(227,'Ucrania',''),(228,'Uganda',''),(229,'Uruguay',''),(230,'Uzbekistán',''),(231,'Vanuatu',''),(232,'Venezuela',''),(233,'Vietnam',''),(234,'Islas Vírgenes Británicas',''),(235,'Islas Vírgenes de los Estados Unidos',''),(236,'Wallis y Futuna',''),(237,'Yemen',''),(238,'Yibuti',''),(239,'Zambia',''),(240,'Zimbabue','');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `periodoReportePsicologia`
--

DROP TABLE IF EXISTS `periodoReportePsicologia`;
/*!50001 DROP VIEW IF EXISTS `periodoReportePsicologia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `periodoReportePsicologia` (
  `fechaInicio` tinyint NOT NULL,
  `fechaFin` tinyint NOT NULL,
  `estado` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
  `permisoHoraInicio` time DEFAULT NULL,
  `permisoHoraFin` time DEFAULT NULL,
  `tipoPersona` int(30) NOT NULL,
  `permisosMotivo` varchar(250) DEFAULT NULL,
  `permisosEstado` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `permisosSolicitante` int(30) NOT NULL,
  `permisosGestor` int(30) DEFAULT NULL,
  `permisosComentario` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ipPersona`,`permisoFechaSolicitud`,`tipoPermiso`,`permisoFechaInicio`),
  KEY `fk_permisos_2_idx` (`ipPersona`),
  KEY `fk_permisos_1_idx` (`tipoPersona`),
  KEY `fk_permisos_3_idx` (`permisosSolicitante`),
  KEY `fk_permisos_4_idx` (`tipoPermiso`),
  KEY `fk_permisos_5_idx` (`permisosGestor`),
  CONSTRAINT `fk_permisos_1` FOREIGN KEY (`ipPersona`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_permisos_2` FOREIGN KEY (`tipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_permisos_3` FOREIGN KEY (`permisosSolicitante`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_permisos_4` FOREIGN KEY (`tipoPermiso`) REFERENCES `tipoPermiso` (`idtipoPermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_permisos_5` FOREIGN KEY (`permisosGestor`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (16018,'2020-09-06',10,'2020-09-06','2020-09-06',NULL,NULL,8,'sfddsfgsdfgsdfgsdfgsdfgdsgsd','1',1045367073,1045367073,'34343443-4¿¿dfgbdgb dfgdfgdf¿¿dfghdfghdf fdghdfrhd¿¿ '),(16020,'2020-07-01',10,'2020-07-01','2020-07-08',NULL,NULL,8,'Enfermedad','1',1045367073,1045367073,'89898989-8¿¿Juan Alberto¿¿Cruz Mejía¿¿ '),(1045367085,'2020-07-01',4,'2020-07-01','2020-07-03',NULL,NULL,4,NULL,'1',1045367085,1045367073,'1¿¿1¿¿¿¿'),(1045367085,'2020-07-01',4,'2020-07-06','2020-07-10',NULL,NULL,4,NULL,'1',1045367085,1045367073,'1¿¿1¿¿¿¿'),(1045367085,'2020-07-01',6,'2020-07-20','2020-07-24',NULL,NULL,4,NULL,'1',1045367085,1045367073,'1¿¿1¿¿¿¿'),(1045367085,'2020-07-01',7,'2020-07-31','2020-07-31',NULL,NULL,4,NULL,'1',1045367085,1045367073,'1¿¿1¿¿¿¿'),(1045367086,'2020-06-25',4,'2020-06-25','2020-06-25',NULL,NULL,4,NULL,'1',1045367086,1045367085,'1¿¿1¿¿¿¿'),(1045367086,'2020-06-25',5,'2020-06-25','2020-06-25',NULL,NULL,4,NULL,'1',1045367086,1045367085,'1¿¿1¿¿¿¿'),(1045367086,'2020-06-25',6,'2020-06-26','2020-06-30',NULL,NULL,4,NULL,'1',1045367086,1045367085,'1¿¿1¿¿¿¿'),(1045367086,'2020-06-25',7,'2020-07-29','2020-07-31',NULL,NULL,4,NULL,'0',1045367086,NULL,'0¿¿1¿¿¿¿');
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
INSERT INTO `persona` VALUES (16018,'Francisco Antonio','Regalado Cruz','2020-06-23','Colonia colonia','',0,2,'01#01','8d2a5f7d4afa5d0530789d3066945330','',8,'','','\0',0,'Salvadoreña','','',''),(16019,'Juan Manuel','Regalado Cruz','2020-06-23','hg,hg,jhk,jhk,jhk,jhk,h','',0,2,'01#01','8d2a5f7d4afa5d0530789d3066945330','',8,'','','\0',0,'Salvadoreña','','',''),(16020,'Mariana Soledad','Regalado Cruz','2020-06-23','hg,hg,jhk,jhk,jhk,jhk,h','',0,2,'01#01','ac2a728f9f17b5d860b6dabd80a5162f','',8,'','','',0,'Salvadoreña','','',''),(1000000000,'PAdre padrew','padre ',NULL,'','',0,0,' # ','','',11,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1000000001,'Madre MAdre','MAdre poisañ',NULL,'','',0,0,' # ','','',10,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367070,'Jorge Agustín','Ragalado Pereira','2020-06-23','dbfbfdbgdfgbfdbfdgb','',0,1,'02#01','ab8a338aa2b1da6d97c11ba6e67be768','',9,'','','\0',0,'Salvadoreña','dfbdfgbfdb dbfd bfdgb fd','',''),(1045367073,'Guillermo Aldolfo','Delsas Murcia','1991-01-17','texistepeque Santa ana','7033-7878',0,0,'02#13','02951a6cb9595ef475fed783e59c687e','Ingeniero de Sistemas Informáticos',1,'','0213-170191-102-9','\0',0,'Salvadoreña','guillermox020@gmail.com',NULL,NULL),(1045367080,'María Carmen','Peña Cárcamo','1980-06-19','dirección dirección dirección dirección','7888-8888',0,1,'02#02','6e80cf219e79bc8a8d83ce9a5b757f64','Lic. CC.JJ',6,'','0000-000000-000-0','',1,'Salvadoreña','dirección@dirección.dirección','',''),(1045367081,'Hugo Daniel','Flores Díaz','1980-06-19','dirección dirección dirección dirección','8989-8989',0,1,'01#02','ad9f88eb26394a8ad9f46975cf79a133','Abogado',5,'','0000-000000-000-0','\0',1,'Salvadoreña','dirección@dirección.dirección','',''),(1045367082,'José Antonio','Murcia Pérez','2020-06-04','lkhlcls clvsdv lsdkjv l','7777-7777',325,1,'03#03','4c247985fa19ff8622ae5790fe555953','profesor',4,'','0000-000000-000-0','\0',0,'Salvadoreña','','',''),(1045367083,'Laura María','López Súñiga','1975-08-12','ljkhfchsdh lsdhlshclsd hsl hclsdc','7888-8888',213,1,'02#10','a6ba5f99ff9616298b2212c76ea111dc','Profesora',4,'','0000-000000-000-0','',1,'Salvadoreña','sscacddvsdvfsdf@sdfsfds.dds','',''),(1045367085,'Francisco Javier','Magaña Arriola','2020-06-05','ohjoñhiohio','7777-7777',0,1,'04#03','ff0c210fd0f86b21bc0497faef184c7b','profesor',4,'','0000-000000-000-0','\0',0,'Salvadoreña','','',''),(1045367086,'Juan Manuel','Bartanes Pilar','2020-06-05','hohhh','7777-7777',2356,1,'05#04','f59bc51b847690dce791fce5f7179e04','Lic. en admón. de empresas',4,'','0000-000000-000-0','\0',1,'Salvadoreña','','',''),(1045367088,'Laura Isabel','Pineda Rosell','2020-06-02','jsakcsahdkcsh .kashv ksah vash','0000-0000',0,1,'02#04','c95b8be4befbee1a550a06fd19ed251a','Lic. en Psicología',14,'','0000-000000-000-0','',1,'Salvadoreña','','',''),(1045367090,'Pablo Alejandro','Martínez Santos','2020-06-01','edjl lc lice','0000-0000',0,1,'01#01','8912074c9b782911ff4f5585c747c132','lic',12,'','0000-000000-000-0','\0',1,'Salvadoreña','kckkvcḱefǘ@{ld{ld{dl.com','',''),(1045367091,'Alba Lucía','Aybara Campos','2020-06-03','sajfsvj{ps vposfj{psdofj v{spdjovf {sdpjvf','5555-5555',0,0,'02#13','f0ee269fcf3f4b1f8883aab03e6a7919','bachilller',13,'','0000-000000-000-0','',1,'Salvadoreña','','','');
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
INSERT INTO `personasReserva` VALUES (1,1045367081,''),(2,1045367073,''),(3,1045367073,''),(4,1045367086,''),(5,1045367086,''),(6,1045367086,''),(7,1045367073,''),(8,1045367073,''),(9,1045367073,''),(10,1045367086,''),(11,1045367073,''),(12,1045367085,''),(13,1045367085,''),(14,1045367085,'');
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
  `diagnostico` text DEFAULT NULL,
  `objetivoGeneral` varchar(100) NOT NULL,
  `objetivoEspecifico` varchar(100) DEFAULT NULL,
  `justificacion` text DEFAULT NULL,
  `metodologia` text NOT NULL,
  `actividades` text NOT NULL,
  `recursoHumano` varchar(300) DEFAULT NULL,
  `recursoMaterial` varchar(300) DEFAULT NULL,
  `recursoFinanciero` varchar(300) DEFAULT NULL,
  `seguimiento` text DEFAULT NULL,
  `productoEsperado` text DEFAULT NULL,
  `proyectoPedagogicoComentario` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idproyectoPedagogico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectoPedagogico`
--

LOCK TABLES `proyectoPedagogico` WRITE;
/*!40000 ALTER TABLE `proyectoPedagogico` DISABLE KEYS */;
INSERT INTO `proyectoPedagogico` VALUES (1,'nombre',NULL,NULL,NULL,'objetivo ',NULL,NULL,'$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$',NULL,NULL,NULL,NULL,NULL,'Francisco Magaña¿¿1¿¿0¿¿¿¿0¿¿1'),(2,'nombre','beneficiarios...........',NULL,'$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$','Francisco Magaña¿¿1¿¿0¿¿¿¿0¿¿2');
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
INSERT INTO `recurso` VALUES (5000040,'Química I: Sistemas materiales, etc',500,3,4,13,'',18,'B','REAL','1',NULL),(5000042,'Química Orgánica',500,3,4,146,'',12.52,'B','REAL','1',NULL),(5000044,'Química 2',500,3,4,73,'',22.04,'B','REAL','1',NULL),(5000046,'Química Razonada',500,3,4,146,'',12.68,'B','REAL','1',NULL),(5000048,'Problemas de Química',500,3,4,146,'',6.01,'B','REAL','1',NULL),(5000050,'Química Inorgánica',500,3,4,73,'',26.77,'B','REAL','1',NULL),(5000052,'Física y Química millenio; enciclopedia temática del estudiante',500,3,4,52,'',10.06,'B','REAL','1',NULL),(5000054,'Biología; la dinámica de la vida',500,3,4,146,'',22.95,'B','REAL','1',NULL),(5000056,'Ciencias NAturales milenio enciclopedia temática del estudiante',500,3,4,52,'',10.06,'B','REAL','1',NULL),(5000058,'Enciclopedia de los animales + cd-rom',500,3,4,73,'',49.59,'B','REAL','1',NULL),(5000060,'Principios Integrales de Zoología',500,3,4,73,'',65.71,'B','REAL','1',NULL),(78885488,'Computadora Laptop',NULL,1,2,NULL,'',450,'B','REAL',NULL,NULL);
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportePsicologia`
--

DROP TABLE IF EXISTS `reportePsicologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportePsicologia` (
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `estudiante` int(30) NOT NULL,
  `psicologo` int(30) NOT NULL,
  `nConsultas` int(11) NOT NULL DEFAULT 0,
  `nCitasSolicitadas` int(11) NOT NULL DEFAULT 0,
  `motivos` varchar(500) NOT NULL,
  `diagnostico` varchar(800) DEFAULT NULL,
  `reportePublico` bit(1) NOT NULL DEFAULT b'0',
  `comentarios` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`fechaInicio`,`fechaFin`,`estudiante`),
  KEY `fk_reportePsicologia_1_idx` (`estudiante`),
  KEY `fk_reportePsicologia_2_idx` (`psicologo`),
  CONSTRAINT `fk_reportePsicologia_1` FOREIGN KEY (`estudiante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reportePsicologia_2` FOREIGN KEY (`psicologo`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportePsicologia`
--

LOCK TABLES `reportePsicologia` WRITE;
/*!40000 ALTER TABLE `reportePsicologia` DISABLE KEYS */;
INSERT INTO `reportePsicologia` VALUES ('2020-06-01','2020-06-30',16018,1045367088,1,3,'* dhnfhnhdh.\n','es necesario profundizar más.','',NULL),('2020-06-24','2020-07-02',16018,1045367088,1,3,'* dhnfhnhdh.\n','Se necesita más datos','\0',NULL),('2020-07-03','2020-07-03',16018,1045367088,1,1,'* Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellen.\n','','\0',NULL),('2020-07-03','2020-07-03',16019,1045367088,1,1,'* Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellen.\n','se necesitan más datos para dar un diagnóstico concluyente.','\0',NULL),('2020-07-03','2020-07-03',16020,1045367088,1,1,'* Curabitur sodales lorem rutrum lorem interdum, sed eleifend nisi euismod. Pellen.\n','','\0',NULL);
/*!40000 ALTER TABLE `reportePsicologia` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'2020-06-20 03:27:32','2020-06-22 09:28:00','2020-06-22 10:27:00',3,1,NULL,'D',NULL,NULL,NULL,'','','','',1045367081,1045367081,'Hugo Flores¿¿4¿¿0¿¿¿¿0'),(2,'2020-06-21 16:17:52','2020-06-29 16:19:00','2020-06-29 17:23:00',1,1,6,'D',NULL,NULL,NULL,'45','4554','dfgdfsgsdfbdsgbdfsbfdsbfdsrbdfe','dgdhfgdfeghdfhytdrfbrbfdrtgb ',1045367073,1045367073,'Guillermo Delsas¿¿4¿¿0¿¿¿¿0'),(3,'2020-06-24 17:49:35','2020-06-25 11:50:00','2020-06-25 13:50:00',1,1,5,'S',NULL,NULL,NULL,'N','N',NULL,NULL,NULL,NULL,'Guillermo Delsas¿¿2¿¿0¿¿¿¿0'),(4,'2020-06-25 04:20:35','2020-06-25 10:20:00','2020-06-25 11:20:00',1,1,6,'C',NULL,NULL,NULL,'Presentación de proyecto','N/A',NULL,NULL,NULL,NULL,'Juan Bartanes¿¿4¿¿0¿¿ya no habrá exposisción.¿¿0'),(5,'2020-06-25 04:21:42','2020-06-25 10:21:00','2020-06-25 11:21:00',3,2,NULL,'D',NULL,NULL,NULL,'','','en buenas condiciones','ok',1045367073,1045367073,'Juan Bartanes¿¿1¿¿0¿¿¿¿0'),(6,'2020-06-25 04:22:23','2020-06-25 09:22:00','2020-06-25 10:22:00',3,3,NULL,'R',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'Juan Bartanes¿¿1¿¿0¿¿No hay equipo disponible para esa hora.¿¿0'),(7,'2020-06-25 20:55:51','2020-06-26 15:00:00','2020-06-26 15:54:00',3,4,NULL,'C',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'Guillermo Delsas¿¿4¿¿0¿¿Ya no quiero el recurso.¿¿0'),(8,'2020-06-25 20:58:02','2020-06-26 08:00:00','2020-06-26 10:00:00',3,1,NULL,'R',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'Guillermo Delsas¿¿4¿¿0¿¿biblioteca cerrada a esa hora.¿¿0'),(9,'2020-06-25 21:01:50','2020-06-29 15:00:00','2020-06-29 17:00:00',3,1,NULL,'R',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'Guillermo Delsas¿¿4¿¿0¿¿todos los libros están ya reservados.¿¿0'),(10,'2020-06-25 21:18:52','2020-06-29 15:19:00','2020-06-29 16:18:00',1,1,6,'E',NULL,NULL,NULL,'u','9uoi','gggg',NULL,1045367073,NULL,'Juan Bartanes¿¿1¿¿0¿¿¿¿0'),(11,'2020-06-25 21:28:36','2020-06-30 15:30:00','2020-06-30 16:30:00',3,1,NULL,'D',NULL,NULL,NULL,'','','ok','ok',1045367081,1045367081,'Guillermo Delsas¿¿4¿¿0¿¿¿¿0'),(12,'2020-06-26 19:07:49','2020-06-29 07:15:00','2020-06-29 08:00:00',1,2,NULL,'S',NULL,1045367085,NULL,'nombre','objetivo ',NULL,NULL,NULL,NULL,'Francisco Magaña¿¿1¿¿0¿¿¿¿0¿¿1'),(13,'2020-06-26 19:14:11','2020-06-29 07:15:00','2020-06-29 08:00:00',1,2,NULL,'S',NULL,1045367085,NULL,'nombre','$$$$$$$$$$$$$$$$$$$$$$$',NULL,NULL,NULL,NULL,'Francisco Magaña¿¿1¿¿0¿¿¿¿0¿¿2'),(14,'2020-06-26 19:14:11','2020-06-29 08:00:00','2020-06-29 09:05:00',1,2,NULL,'S',NULL,1045367085,NULL,'nombre','$$$$$$$$$$$$$$$$$$$$$$$',NULL,NULL,NULL,NULL,'Francisco Magaña¿¿1¿¿0¿¿¿¿0¿¿2');
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
INSERT INTO `reservaDetalle` VALUES (5000040,40,'',1),(5000042,42,'',5),(5000044,45,'',11),(78885488,15,'',2),(78885488,15,'',10);
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
INSERT INTO `reservaXpedagogia` VALUES (1,12,''),(2,13,''),(2,14,'');
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
INSERT INTO `solicitudReserva` VALUES (5000040,1,'1'),(5000040,9,'1'),(5000042,5,'1'),(5000042,8,'1'),(5000044,11,'1'),(5000046,6,'1'),(5000050,7,'1'),(78885488,2,'1'),(78885488,3,'1'),(78885488,4,'1'),(78885488,10,'1'),(78885488,12,'10'),(78885488,13,'13'),(78885488,14,'13');
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
INSERT INTO `tema` VALUES (16018,'flick',''),(1045367073,'black-tie',''),(1045367081,'start',''),(1045367083,'excite-bike',''),(1045367086,'pepper-grinder',''),(1045367088,'excite-bike','');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoCargo`
--

LOCK TABLES `tipoCargo` WRITE;
/*!40000 ALTER TABLE `tipoCargo` DISABLE KEYS */;
INSERT INTO `tipoCargo` VALUES (1,'Entrega del Ministerio de Educación',NULL),(2,'Donaciones',NULL),(3,'Compras con Actividades de la Escuela',NULL),(4,'Bono de la Calidad Educativa',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoEspecialidades`
--

LOCK TABLES `tipoEspecialidades` WRITE;
/*!40000 ALTER TABLE `tipoEspecialidades` DISABLE KEYS */;
INSERT INTO `tipoEspecialidades` VALUES (5,'CC.SS',NULL);
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
INSERT INTO `tipoMateria` VALUES (1,'Área Básica',NULL),(2,'Área Aplicada',NULL),(3,'Área Técnica',NULL),(4,'Modalidad y Opciones',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoNombramiento`
--

LOCK TABLES `tipoNombramiento` WRITE;
/*!40000 ALTER TABLE `tipoNombramiento` DISABLE KEYS */;
INSERT INTO `tipoNombramiento` VALUES (4,'Propietario',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoPermiso`
--

LOCK TABLES `tipoPermiso` WRITE;
/*!40000 ALTER TABLE `tipoPermiso` DISABLE KEYS */;
INSERT INTO `tipoPermiso` VALUES (4,'Enfermedad sin trámite formal',15,NULL),(5,'Enfermedad con trámite formal',90,NULL),(6,'Enfermedad de pariente cercano o duelo',20,NULL),(7,'Asuntos personales',5,NULL),(8,'Maternidad',90,NULL),(9,'Paternidad',4,NULL),(10,'Faltar a clases',60,NULL),(11,'Retirarse de la institución',60,NULL),(12,'No portar el uniforme',90,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoPersona`
--

LOCK TABLES `tipoPersona` WRITE;
/*!40000 ALTER TABLE `tipoPersona` DISABLE KEYS */;
INSERT INTO `tipoPersona` VALUES (1,'Administrador','fa fa-diamond'),(2,'Director','pi pi-circle-on'),(3,'Subdirector','pi pi-circle-off'),(4,'Maestro','fa fa-street-view'),(5,'Bibliotecario','fa fa-forumbee'),(6,'Administrador CRA','fa fa-transgender-alt'),(7,'Laboratorista','fa fa-android'),(8,'Estudiante','fa fa-child'),(9,'Representante','fa fa-user-secret'),(10,'Madre de familia',''),(11,'Padre de familia',''),(12,'Colector','fa fa-cc-mastercard'),(13,'Secretaria','fa fa-database'),(14,'Psicologo',''),(15,'Ordenanza',''),(16,'Vigilante',''),(17,'Mantenimiento','');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoProyecto`
--

LOCK TABLES `tipoProyecto` WRITE;
/*!40000 ALTER TABLE `tipoProyecto` DISABLE KEYS */;
INSERT INTO `tipoProyecto` VALUES (4,'Proyecto Planificado',NULL),(5,'Exposición de Alumnos',NULL),(6,'Clase de Docente con Tecnología',NULL);
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
INSERT INTO `tipoRecurso` VALUES (1,'Tecnológico CRA',NULL),(2,'Laboratorio de CC.NN',NULL),(3,'Bibliográfico',NULL);
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
INSERT INTO `tipoReserva` VALUES (1,'Uso en Sala',NULL),(2,'Uso fuera de Sala/Aula',NULL),(3,'Uso en Aula',NULL),(4,'Uso fuera de la institución',NULL);
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
INSERT INTO `tipoReservaRecurso` VALUES (1,5000040,''),(1,5000042,''),(1,5000044,''),(1,5000046,''),(1,5000048,''),(1,5000050,''),(1,5000052,''),(1,5000054,''),(1,5000056,''),(1,5000058,''),(1,5000060,''),(1,78885488,''),(2,5000040,''),(2,5000042,''),(2,5000044,''),(2,5000046,''),(2,5000048,''),(2,5000050,''),(2,5000052,''),(2,5000054,''),(2,5000056,''),(2,5000058,''),(2,5000060,''),(3,5000040,''),(3,5000042,''),(3,5000044,''),(3,5000046,''),(3,5000048,''),(3,5000050,''),(3,5000052,''),(3,5000054,''),(3,5000056,''),(3,5000058,''),(3,5000060,''),(3,78885488,''),(4,5000040,''),(4,5000042,''),(4,5000044,''),(4,5000046,''),(4,5000048,''),(4,5000050,''),(4,5000052,''),(4,5000054,''),(4,5000056,''),(4,5000058,''),(4,5000060,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoSueldos`
--

LOCK TABLES `tipoSueldos` WRITE;
/*!40000 ALTER TABLE `tipoSueldos` DISABLE KEYS */;
INSERT INTO `tipoSueldos` VALUES (4,'Sueldo base',NULL),(5,'Horas clase',NULL),(6,'Ad Honorem',NULL);
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
INSERT INTO `tipopersonaPermiso` VALUES (1,4,''),(1,5,''),(1,6,''),(1,7,''),(1,8,''),(1,9,''),(1,10,''),(1,11,''),(1,12,''),(2,4,''),(2,5,''),(2,6,''),(2,7,''),(2,8,''),(2,9,''),(3,4,''),(3,5,''),(3,6,''),(3,7,''),(3,8,''),(3,9,''),(4,4,''),(4,5,''),(4,6,''),(4,7,''),(4,8,''),(4,9,''),(5,4,''),(5,5,''),(5,6,''),(5,7,''),(5,8,''),(5,9,''),(6,4,''),(6,5,''),(6,6,''),(6,7,''),(6,8,''),(6,9,''),(7,4,''),(7,5,''),(7,6,''),(7,7,''),(7,8,''),(7,9,''),(8,10,''),(8,11,''),(8,12,''),(12,4,''),(12,5,''),(12,6,''),(12,7,''),(12,8,''),(12,9,''),(13,4,''),(13,5,''),(13,6,''),(13,7,''),(13,8,''),(13,9,''),(14,4,''),(14,5,''),(14,6,''),(14,7,''),(14,8,''),(14,9,''),(15,4,''),(15,5,''),(15,6,''),(15,7,''),(15,8,''),(15,9,''),(16,4,''),(16,5,''),(16,6,''),(16,7,''),(16,8,''),(16,9,''),(17,4,''),(17,5,''),(17,6,''),(17,7,''),(17,8,''),(17,9,''),(17,10,''),(17,11,''),(17,12,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (4,'Zona 1',NULL),(5,'Zona 2',NULL),(6,'Zona 3',NULL);
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `periodoReportePsicologia`
--

/*!50001 DROP TABLE IF EXISTS `periodoReportePsicologia`*/;
/*!50001 DROP VIEW IF EXISTS `periodoReportePsicologia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `periodoReportePsicologia` AS select distinct `reportePsicologia`.`fechaInicio` AS `fechaInicio`,`reportePsicologia`.`fechaFin` AS `fechaFin`,`reportePsicologia`.`reportePublico` AS `estado` from `reportePsicologia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-06 23:07:24
