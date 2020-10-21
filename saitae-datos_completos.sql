CREATE DATABASE  IF NOT EXISTS `intex` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `intex`;
-- MariaDB dump 10.17  Distrib 10.5.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: intex
-- ------------------------------------------------------
-- Server version	10.5.6-MariaDB-1:10.5.6+maria~stretch

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
INSERT INTO `acceso` VALUES (1,'Introducción a SAITAE','#',69,'vvIoCS0OHgI',''),(9,'Administración','#',NULL,NULL,'fa fa-cog'),(10,'Sistema','tipopp.intex',9,'PRxuV1fgz2M','fa fa-folder-open'),(11,'Permisos y Licencias','lictp.intex',9,'jpoB7dhtzCE','fa fa-cube'),(12,'Académica','academico.intex',9,'xqZTZBWC4Ss','fa fa-leaf'),(13,'Perfil','#',NULL,NULL,'fa fa-user-secret'),(14,'Permisos','#',45,NULL,'fa fa-eye'),(15,'Solicitar Permiso','permisoE.intex',14,'2taqyO5-saU','fa fa-location-arrow'),(16,'Personal','#',NULL,NULL,'fa fa-users'),(17,'Gestión de maestros','agregacion.intex',27,'z95v9LAqEpk','fa fa-user-plus'),(18,'Gestión de administradores','agAdm.intex',16,'Z_9XM6mawiM','fa fa-heartbeat'),(19,'Plantel Institucional','plantel.intex',16,'kE_GK-VYKhU','fa fa-table'),(20,'Inventario','inventario.intex',23,'A2iuTIQK3UM','fa fa-barcode'),(21,'Libros','libros.intex',23,'za6PsFqJ4xw','fa fa-book'),(22,'Nuevo Ingreso','inscripcion.intex',36,'fG_pxuQiENk','fa fa-user'),(23,'Recursos','#',9,NULL,'fa fa-yelp'),(24,'Nomina de Alumnos','nominaA.intex',36,'btLM8Ap0nf8','fa fa-user'),(25,'Gestión de Recursos','admRecurso.intex',23,'hcStyHhJXJU','fa fa-table'),(26,'Lista de Representantes','listaRepresentantes.intex',36,'lz_ro4WBz7w','fa fa-list'),(27,'Maestros','#',16,NULL,'fa fa-puzzle-piece'),(28,'Gestión de horarios','horario.intex',27,'FHFxHb9KbNg','fa fa-plus'),(29,'Gestión de permisos','permiso.intex',14,'jQxOPSdKrJo','fa fa-legal'),(30,'Solicitud de permisos','permisoM.intex',14,'5KCUeTVc0dE','fa fa-ge'),(31,'Anuncios','anuncios.intex',9,'OlRPrt81ABs','fa fa-bell'),(32,'Matricula','matricula.intex',36,'gsNmACB_jhs','fa fa-slideshare'),(33,'Entrega de Útiles','paquetes.intex',36,'SzU0g7AHrC4','fa fa-sliders'),(34,'Contribuciones','contribuciones.intex',36,'6DdwbMkRVRQ','fa fa-money'),(36,'Alumnos','#',16,NULL,'fa fa-graduation-cap'),(37,'Reservas de Equipo','#',45,NULL,'fa fa-gamepad'),(38,'Solicitud de Reserva','solicitudR.intex',37,'etEs-_9C4Ps;QdicGaVmyKE;Vzl57q_AQT0','fa fa-flag'),(39,'Historial de Reservas','solicitudH.intex',43,'lfu6BuEXeEU','fa fa-archive'),(40,'Gestionar Reservas de equipo','srCra.intex',37,'bUiMPCvBZiY','fa fa-certificate'),(41,'Historial de Notificaciones','notifh.intex',43,'2AItrbWMG7k','fa fa-forumbee'),(42,'Proyecto Planificado','solicitudRPP.intex',37,'PF-RsOBMFyk','fa fa-pencil-square-o'),(43,'Historiales','#',13,NULL,'fa fa-folder-open'),(44,'Historial de permisos','permisoH.intex',43,'fbBCKYURFVI','fa fa-database'),(45,'Solicitudes','#',NULL,NULL,'fa fa-street-view'),(46,'Área psicológica','#',45,NULL,'fa fa-ambulance'),(47,'Solicitud de cita psicológica','solicitudCP.intex',46,'nz7TFDnwcBU','fa fa-bookmark-o'),(48,'Adminitración citas psicológic','admCitasPs.intex',46,'CT1WchUKyFU','fa fa-calendar'),(49,'Consulta Psicológica','consultasPS.intex',46,'iJUofSsTXTc','fa fa-umbrella'),(50,'Historial citas Psicológicas','citasPSH.intex',43,'c0n7MzrU2fI','fa fa-file'),(51,'Horario de clases','horarioCl.intex',13,'Jzf5uLibF7Y','fa fa-calendar'),(52,'Aspecto de la aplicación','temas.intex',13,'lUwlOJ0pYDY','fa fa-picture-o'),(53,'Mi usuario','infoPerfil.intex',13,'1CLiFlFRDKU','fa fa-android'),(54,'Administración de usuarios','admUsuarios.intex',16,'IfDFy7sJAXc','fa fa-university'),(55,'Evaluación de maestros','maestroEval.intex',27,'PUGwTNWXP8o','fa fa-list-alt'),(56,'Evaluación de grados','gradoEval.intex',36,'VonX5TINpJ8','fa fa-flask'),(57,'Reportes','#',9,NULL,'fa fa-weibo'),(58,'Historial de evaluaciones','maEvalH.intex',43,'WpILwjb1I9k',' fa fa-history'),(59,'Evaluaciones de grado','gradoEvalH.intex',43,'ioFuLA0i6Tg','fa fa-dashcube'),(61,'Entrega de Paquetes','repEntrega.intex',57,'m_p006iKTfg','fa fa-leanpub'),(62,'Gestión de horarios (lite)','horarioLite.intex',27,'rpzqHZh1-gM','fa fa-list-alt'),(63,'Pago de contribución','repContr.intex',57,'fe9XxpJTmM8','fa fa-server'),(64,'Inventario de equipo','repInv.intex',57,'-RwAqJ6NRsM','fa fa-linux'),(65,'Matrículas','repMatricula.intex',57,'7onjIK6pPuY','fa fa-book'),(66,'General de Permisos','repPermisos.intex',57,'trkgmy4mYSQ','fa fa-bar-chart-o'),(67,'Área de psicología','CPsReporte.intex',57,'xKqevg9d-7I','fa fa-newspaper-o'),(68,'Elaboración de reporte','CPsReporte.intex',46,'QdmLKk81No4','fa fa-paperclip'),(69,'intro','#',NULL,'','');
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
  KEY `fk_capacitaciones_1_idx` (`idMaestro`),
  CONSTRAINT `fk_capacitaciones_1` FOREIGN KEY (`idMaestro`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacitaciones`
--

LOCK TABLES `capacitaciones` WRITE;
/*!40000 ALTER TABLE `capacitaciones` DISABLE KEYS */;
INSERT INTO `capacitaciones` VALUES (1045367073,'2020-10-20','f,','f,.fc','cfy','\0','.fiy','P',NULL),(1045367083,'2020-10-01','yuyu','yuyu','yuyu','','yuyu','S',NULL),(1045367083,'2020-10-13','yuyuyuy','yuyuyu','yuyuyu','','yuyuyu','V',NULL);
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
INSERT INTO `citaPsicologia` VALUES (16018,'2020-06-24 18:39:02','2020-06-24 16:54:57','T','',''),(16018,'2020-07-02 08:45:00','2020-06-24 07:58:09','C','','ya no'),(16018,'2020-07-03 13:16:47','2020-06-24 07:28:52','T','',''),(16018,'2020-08-31 08:00:00','2020-06-24 16:54:22','P','','me retiro temprano'),(16018,'2020-09-01 05:17:16','2020-06-24 17:32:58','T','',''),(16018,'2020-09-01 08:45:00','2020-08-24 01:43:43','P','','no habrá clases'),(16018,'2020-09-01 09:45:00','2020-08-24 01:43:11','P','','no hay clases'),(16019,'2020-07-03 13:20:39','2020-07-03 13:19:51','T',NULL,NULL),(16020,'2020-07-03 13:19:25','2020-07-03 13:17:50','T',NULL,NULL),(16020,'2020-08-31 08:40:00','2020-08-27 00:41:30','S','',''),(16020,'2020-08-31 09:40:00','2020-08-27 00:39:40','A','','');
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
INSERT INTO `contribuciones` VALUES (16018,2020,'2020-07-01','2020-07-01','2020-07-01','2020-07-01','2020-07-01','2020-07-01','2020-07-01',NULL,NULL,NULL,NULL),(16019,2020,'2020-07-01','2020-07-01','2020-07-01','2020-07-01','2020-10-18','2020-10-18','2020-10-18','2020-10-18','2020-10-18','2020-10-18',NULL),(16020,2020,'2020-07-01','2020-07-01','2020-10-18','2020-10-18','2020-10-18','2020-10-18','2020-10-18','2020-10-18','2020-10-18',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
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
INSERT INTO `entregaUtiles` VALUES (16018,2020,1045367073,1045367070,'\0','','','\0','\0','\0',NULL),(16019,2020,1045367073,1045367070,'','','','\0','','\0',NULL),(16020,2020,1045367073,1045367070,'','','','\0','','\0',NULL);
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
INSERT INTO `estudiante` VALUES (16018,'',0,'',0,1.00,'\0','Padre#Madre','','','','Tío','','Noveno Grado','','gh,kgh,,g','','',1045367070,1000000000,1000000001,''),(16019,'',0,'',0,1.00,'\0','Padre#Madre¿ ','','','','Tío','','Noveno Grado','','gh,kgh,,g','','',1045367070,1000000000,1000000001,''),(16020,'',0,'',0,1.00,'\0','Padre#Madre','','','','Tío','','Noveno Grado','','gh,kgh,,g','','',1045367070,1000000000,1000000001,''),(1045367070,'',1,'',NULL,NULL,'',NULL,NULL,NULL,NULL,'Tío','\0','9','df',NULL,'','',NULL,NULL,NULL,'');
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
INSERT INTO `maestoCargo` VALUES (1045367082,5,4,4,'2020-06-23',NULL,NULL,NULL),(1045367083,3,4,4,'2020-06-20',NULL,NULL,NULL),(1045367085,4,4,4,'2020-06-23',NULL,NULL,NULL),(1045367085,6,4,4,'2020-10-20',NULL,NULL,NULL),(1045367086,6,4,4,'2020-07-01',NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,'2020-06-24 07:28:52',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(2,'2020-06-24 07:28:52',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Wednesday 01/July/2020 10:30 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(3,'2020-06-24 07:58:09',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(4,'2020-06-24 07:58:09',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Thursday 02/July/2020 08:45 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(5,'2020-06-24 16:54:22',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(6,'2020-06-24 16:54:22',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Thursday 25/June/2020 11:54 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(7,'2020-06-24 16:54:33',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(8,'2020-06-24 16:54:33',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Friday 26/June/2020 08:54 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(9,'2020-06-24 16:54:57',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(10,'2020-06-24 16:54:57',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Monday 29/June/2020 08:00 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(11,'2020-06-24 17:01:10',1045367088,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(12,'2020-06-24 17:03:35',16018,1045367088,'Nuevo anuncio disponible','Nuevo auncio publicado recientemente por Laura Pineda','',NULL,' '),(13,'2020-06-24 17:15:48',16018,16018,'Cancelación de cita','Usted ha cancelado su solicitud de cita con fecha 02/07/2020 a las 08:45 AM. La razón de la Cancelación es: ya no.','',NULL,' '),(14,'2020-06-24 17:15:48',1045367088,16018,'Cancelación de cita','La solicitud de cita con fecha 02/07/2020 a las 08:45 AM ha sido cancelada por Francisco Regalado. La razón de la Cancelación es: ya no.','',NULL,' '),(15,'2020-06-24 17:16:14',16018,1045367088,'Solicitud de cita aceptada','Su solicitud para una cita con el psicólogo institucional fue aprobada por Laura Pineda. La cita consulta se llevará a cabo el 29/06/2020 08:00 AM','\0',NULL,' '),(16,'2020-06-24 17:17:14',16018,1045367088,'Solicitud de cita pospuesta','Su solicitud para una cita con el psicólogo institucional fue aplazada por Laura PinedaLa razón del aplazamiento es :otro día mejor. Se le propone que la cita consulta se lleve a cabo el 25/06/2020 11:10 AM. Puede aceptarla, modificarla o cancelarla desde su historial de citas.','\0',NULL,' '),(17,'2020-06-24 17:32:58',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(18,'2020-06-24 17:32:58',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Friday 26/June/2020 11:10 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(19,'2020-06-24 17:33:21',16018,1045367088,'Solicitud de cita aceptada','Su solicitud para una cita con el psicólogo institucional fue aprobada por Laura Pineda. La cita consulta se llevará a cabo el 26/06/2020 11:10 AM','',NULL,' '),(20,'2020-06-24 17:50:18',1045367073,1045367073,'Solicitud exitosa','Su solicitud de recursos de Tecnológico CRA ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(21,'2020-06-24 17:50:18',1045367080,1045367073,'Nueva solicitud de recursos','Guillermo Aldolfo Delsas Murcia ha solicitado recursos','\0',NULL,' '),(22,'2020-06-24 18:38:23',16018,1045367088,'Sesión de consulta iniciada','La sesión de consulta con la psicóloga  lic. Laura Pineda ha iniciado.','',NULL,' '),(23,'2020-06-24 18:39:02',1045367088,1045367088,'Sesión de consulta terminada','La sesión de consulta psicológica con el estudiante Francisco Regalado ha terminado.','\0',NULL,' '),(24,'2020-06-24 18:39:02',16018,1045367088,'Sesión de consulta terminada','La sesión de consulta con la psicóloga  lic. Laura Pineda ha terminado.','',NULL,' '),(25,'2020-06-25 00:58:36',16018,1045367083,'Hay una nueva evaluación de su grado','El grado en el que usted está inscrito ha sido evaluado recientemente por Laura López. Vea los resultados en el historial de evaluaciones de su grado.','',NULL,' '),(26,'2020-06-25 00:58:36',1045367083,1045367083,'Hay una nueva evaluación del su grado','El grado del que usted guía ha sido evaluado recientemente por Laura López. Vea los resultados en el historial de evaluaciones de su grado.','',NULL,' '),(27,'2020-06-25 01:11:59',16018,1045367083,'Hay una nueva evaluación de su grado','El grado en el que usted está inscrito ha sido evaluado recientemente por Laura López. Vea los resultados en el historial de evaluaciones de su grado.','',NULL,' '),(28,'2020-06-25 01:11:59',1045367083,1045367083,'Hay una nueva evaluación del su grado','El grado del que usted guía ha sido evaluado recientemente por Laura López. Vea los resultados en el historial de evaluaciones de su grado.','\0',NULL,' '),(29,'2020-06-25 02:26:49',16018,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(30,'2020-06-25 02:26:58',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(31,'2020-06-25 03:53:48',1045367086,1045367083,'Recuperaciń de contraseña','Su contraseña ha sido modificada por Laura López. Recuerde cambiar su contraseña en su perfil y mantenerla en secreto','',NULL,' '),(32,'2020-06-25 03:56:17',1045367086,1045367083,'Evaluación nueva','Laura López ha realizado una nueva evaluación de su desempeño. Puede ver su historial de desempeño en la pestaña historiales del menú perfil.','',NULL,' '),(33,'2020-06-25 04:10:27',1045367086,1045367083,'Evaluación nueva','Laura López ha realizado una nueva evaluación de su desempeño. Puede ver su historial de desempeño en la pestaña historiales del menú perfil.','',NULL,' '),(34,'2020-06-25 04:21:35',1045367086,1045367086,'Solicitud exitosa','Su solicitud de recursos de Tecnológico CRA ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(35,'2020-06-25 04:21:35',1045367080,1045367086,'Nueva solicitud de recursos','Juan Manuel Bartanes Pilar ha solicitado recursos','\0',NULL,' '),(36,'2020-06-25 04:22:19',1045367086,1045367086,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(37,'2020-06-25 04:22:19',1045367081,1045367086,'Nueva solicitud de recursos','Juan Manuel Bartanes Pilar ha solicitado recursos','',NULL,' '),(38,'2020-06-25 04:23:03',1045367086,1045367086,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(39,'2020-06-25 04:23:03',1045367081,1045367086,'Nueva solicitud de recursos','Juan Manuel Bartanes Pilar ha solicitado recursos','',NULL,' '),(40,'2020-06-25 04:29:33',1045367086,1045367086,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 25/06/2020 y 25/06/2020','',NULL,' '),(41,'2020-06-25 04:29:33',1045367085,1045367086,'Solicitud de permiso nueva','Juan Manuel Bartanes Pilar ha solicitado un nuevo permiso.','',NULL,' '),(42,'2020-06-25 04:29:48',1045367086,1045367086,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 25/06/2020 y 25/06/2020','',NULL,' '),(43,'2020-06-25 04:29:48',1045367085,1045367086,'Solicitud de permiso nueva','Juan Manuel Bartanes Pilar ha solicitado un nuevo permiso.','',NULL,' '),(44,'2020-06-25 04:30:44',1045367086,1045367086,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 26/06/2020 y 30/06/2020','',NULL,' '),(45,'2020-06-25 04:30:44',1045367085,1045367086,'Solicitud de permiso nueva','Juan Manuel Bartanes Pilar ha solicitado un nuevo permiso.','',NULL,' '),(46,'2020-06-25 04:33:14',1045367085,1045367073,'Recuperaciń de contraseña','Su contraseña ha sido modificada por Guillermo Delsas. Recuerde cambiar su contraseña en su perfil y mantenerla en secreto','',NULL,' '),(47,'2020-06-25 04:35:24',1045367086,1045367086,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 29/06/2020 y 29/06/2020','',NULL,' '),(48,'2020-06-25 04:35:24',1045367085,1045367086,'Solicitud de permiso nueva','Juan Manuel Bartanes Pilar ha solicitado un nuevo permiso.','',NULL,' '),(49,'2020-06-25 04:41:22',1045367086,1045367086,'Cancelación exitosa','Ha cancelado la solicitud de permiso con fechas: 29/06/2020. La razón del cancelamiento es: ya no es necesario.','\0',NULL,' '),(50,'2020-06-25 04:41:48',1045367086,1045367085,'Aceptación de permiso','Francisco Javier Magaña Arriola ha aceptado su solicitud de permiso. ','',NULL,' '),(51,'2020-06-25 04:42:32',1045367086,1045367085,'Rechado de permiso','Francisco Javier Magaña Arriola ha rechazado su solicitud de permiso. Motivo del rechazo: necesita una constancia','',NULL,' '),(52,'2020-06-25 04:43:20',1045367086,1045367086,'Modificación de solicitud de permiso','Su permiso se ha solicitado para entre las fechas: 26/06/2020 y 30/06/2020','',NULL,' '),(53,'2020-06-25 04:43:20',1045367085,1045367086,'Modificaciones en una solicitud de permiso','Juan Manuel Bartanes Pilar ha cambiado su solicitud de permiso.','',NULL,' '),(54,'2020-06-25 04:43:47',1045367086,1045367085,'Aceptación de permiso','Francisco Javier Magaña Arriola ha aceptado su solicitud de permiso. ','',NULL,' '),(55,'2020-06-25 06:17:40',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(56,'2020-06-25 20:44:23',1045367086,1045367086,'Cancelación de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 04:20 AM ha sido cancelada por Juan Bartanes. La razón de lacancelación es: ya no habrá exposisción..','',NULL,' '),(57,'2020-06-25 20:44:23',1045367080,1045367086,'Cancelación de reserva','La solicitud de reserva de equipo con fecha 25/06/2020 a las 04:20 AM ha sido cancelada por Juan Bartanes. La razón de la cancelación es: ya no habrá exposisción..','\0',NULL,' '),(58,'2020-06-25 20:45:07',1045367086,1045367073,'Aceptación de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 04:21 AM ha sido aceptada por Guillermo Delsas.','',NULL,' '),(59,'2020-06-25 20:46:04',1045367086,1045367073,'Rechazo de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 04:22 AM ha sido rechazada por Guillermo Delsas. La razón del rechazo es: No hay equipo disponible para esa hora..','',NULL,' '),(60,'2020-06-25 20:57:50',1045367073,1045367073,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(61,'2020-06-25 20:57:50',1045367081,1045367073,'Nueva solicitud de recursos','Guillermo Aldolfo Delsas Murcia ha solicitado recursos','',NULL,' '),(62,'2020-06-25 20:58:37',1045367073,1045367073,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(63,'2020-06-25 20:58:37',1045367081,1045367073,'Nueva solicitud de recursos','Guillermo Aldolfo Delsas Murcia ha solicitado recursos','',NULL,' '),(64,'2020-06-25 20:59:44',1045367073,1045367081,'Rechazo de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 08:58 PM ha sido rechazada por Hugo Flores. La razón del rechazo es: biblioteca cerrada a esa hora..','',NULL,' '),(65,'2020-06-25 21:00:53',1045367081,1045367073,'Cancelación de reserva','La solicitud de reserva de equipo con fecha 25/06/2020 a las 08:55 PM ha sido cancelada por Guillermo Delsas. La razón de la cancelación es: Ya no quiero el recurso..','',NULL,' '),(66,'2020-06-25 21:02:15',1045367073,1045367073,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(67,'2020-06-25 21:02:15',1045367081,1045367073,'Nueva solicitud de recursos','Guillermo Aldolfo Delsas Murcia ha solicitado recursos','',NULL,' '),(68,'2020-06-25 21:10:58',1045367086,1045367073,'Entrega de equipo reservado','Los recursos que solicitó el día 25/06/2020 a las 04:21 AM han sido entregados en este momento por Guillermo Delsas','\0',NULL,' '),(69,'2020-06-25 21:11:48',1045367086,1045367073,'Devolución de equipo reservado','Los recursos que solicitó el día 25/06/2020 a las 04:21 AM han sido recibidos en este momento por Guillermo Delsas','\0',NULL,' '),(70,'2020-06-25 21:19:25',1045367086,1045367086,'Solicitud exitosa','Su solicitud de recursos de Tecnológico CRA ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','',NULL,' '),(71,'2020-06-25 21:19:25',1045367080,1045367086,'Nueva solicitud de recursos','Juan Manuel Bartanes Pilar ha solicitado recursos','\0',NULL,' '),(72,'2020-06-25 21:19:45',1045367086,1045367073,'Aceptación de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 09:18 PM ha sido aceptada por Guillermo Delsas.','\0',NULL,' '),(73,'2020-06-25 21:20:02',1045367086,1045367073,'Entrega de equipo reservado','Los recursos que solicitó el día 25/06/2020 a las 09:18 PM han sido entregados en este momento por Guillermo Delsas','',NULL,' '),(74,'2020-06-25 21:30:38',1045367073,1045367073,'Solicitud exitosa','Su solicitud de recursos de Bibliográfico ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','\0',NULL,' '),(75,'2020-06-25 21:30:38',1045367081,1045367073,'Nueva solicitud de recursos','Guillermo Aldolfo Delsas Murcia ha solicitado recursos','\0',NULL,' '),(76,'2020-06-25 21:32:05',1045367073,1045367081,'Rechazo de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 09:01 PM ha sido rechazada por Hugo Flores. La razón del rechazo es: todos los libros están ya reservados..','',NULL,' '),(77,'2020-06-25 21:32:44',1045367073,1045367081,'Aceptación de reserva','Su solicitud de reserva de equipo con fecha 25/06/2020 a las 09:28 PM ha sido aceptada por Hugo Flores.','',NULL,' '),(78,'2020-06-25 21:33:54',1045367073,1045367081,'Entrega de equipo reservado','Los recursos que solicitó el día 25/06/2020 a las 09:28 PM han sido entregados en este momento por Hugo Flores','',NULL,' '),(79,'2020-06-25 21:34:47',1045367073,1045367081,'Devolución de equipo reservado','Los recursos que solicitó el día 25/06/2020 a las 09:28 PM han sido recibidos en este momento por Hugo Flores','',NULL,' '),(80,'2020-06-26 00:59:02',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(81,'2020-06-26 18:20:46',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','',NULL,' '),(82,'2020-06-26 19:07:49',1045367080,1045367085,'Nueva solicitud de recursos','Francisco Javier Magaña Arriola ha solicitado recursos para proyecto pedagógico planificado. Revise la administración de reservas para más detalles.','\0',NULL,' '),(83,'2020-06-26 19:07:49',1045367085,1045367085,'Solicitud realizada','La solicitud se ha enviado con éxitos. Recibirá una notificación del encargado del CRA cuando su proyecto se haya resuelto.','',NULL,' '),(84,'2020-06-26 19:14:11',1045367080,1045367085,'Nueva solicitud de recursos','Francisco Javier Magaña Arriola ha solicitado recursos para proyecto pedagógico planificado. Revise la administración de reservas para más detalles.','\0',NULL,' '),(85,'2020-06-26 19:14:11',1045367085,1045367085,'Solicitudes realizadas','Las solicitudes se han enviado con éxitos. Recibirá una notificación del encargado del CRA cuando su proyecto se haya resuelto.','',NULL,' '),(86,'2020-06-27 02:38:36',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(87,'2020-06-27 03:03:10',1045367083,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(88,'2020-06-27 03:25:05',1045367088,1045367073,'nuevo reporte de citas psicológicas','Guillermo Delsas ha creado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Este reporte aun no es público. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(89,'2020-06-27 03:25:32',1045367083,1045367073,'nuevo reporte de citas psicológicas','Guillermo Delsas ha publicado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(90,'2020-06-27 03:25:32',1045367088,1045367073,'nuevo reporte de citas psicológicas','Guillermo Delsas ha publicado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(91,'2020-06-27 03:25:45',1045367083,1045367073,'Reporte de citas psicológicas eliminado','Guillermo Delsas ha eliminado un reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(92,'2020-06-27 03:25:45',1045367088,1045367073,'Reporte de citas psicológicas eliminado','Guillermo Delsas ha eliminado un reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(93,'2020-06-27 03:34:36',1045367082,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(94,'2020-06-27 03:34:36',1045367083,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(95,'2020-06-27 03:34:36',1045367085,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(96,'2020-06-27 03:34:36',1045367086,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(97,'2020-06-27 03:42:33',16018,1045367083,'Se ha registrado actividad en la entrega de paquetes.','Lo que se le ha entregado es: Útiles, Uniforme, Zapatos.','',NULL,' '),(98,'2020-06-27 04:06:50',1045367083,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha publicado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','\0',NULL,' '),(99,'2020-06-27 04:06:50',1045367088,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha publicado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Reporte Desde 01/06/2020 hasta 30/06/2020','',NULL,' '),(100,'2020-06-27 09:15:28',1045367083,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(101,'2020-07-01 18:07:13',16018,1045367073,'Se ha registrado actividad en la entrega de paquetes.','Lo que se le ha entregado es: Útiles, Uniforme.','\0',NULL,' '),(102,'2020-07-01 18:15:06',16020,1045367073,'Se ha registrado actividad en la entrega de paquetes.','Lo que se le ha entregado es: Útiles, Uniforme, Zapatos.','\0',NULL,' '),(103,'2020-07-01 18:15:13',16019,1045367073,'Se ha registrado actividad en la entrega de paquetes.','Lo que se le ha entregado es: , Uniforme.','\0',NULL,' '),(104,'2020-07-01 18:16:05',1045367083,1045367073,'Nuevo tutelaje','Guillermo Delsas le ha entregado el tutelaje del grado 1° TVC Contador Sección A año 2020','\0',NULL,' '),(105,'2020-07-01 18:17:49',16018,1045367073,'Se ha registrado un cambio de sección','Guillermo Delsas ha cambiado la sección donde usted estaba inscrito a la sección \'A\'.','\0',NULL,' '),(106,'2020-07-01 18:17:57',16019,1045367073,'Se ha registrado un cambio de sección','Guillermo Delsas ha cambiado la sección donde usted estaba inscrito a la sección \'A\'.','\0',NULL,' '),(107,'2020-07-01 18:18:03',16020,1045367073,'Se ha registrado un cambio de sección','Guillermo Delsas ha cambiado la sección donde usted estaba inscrito a la sección \'A\'.','\0',NULL,' '),(108,'2020-07-01 18:19:02',16018,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero, Marzo, Abril, Mayo.','\0',NULL,' '),(109,'2020-07-01 18:19:11',16019,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero, Marzo, Abril.','\0',NULL,' '),(110,'2020-07-01 18:19:19',16020,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero.','',NULL,' '),(111,'2020-07-01 18:20:05',16018,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero, Marzo, Abril, Mayo, Junio.','',NULL,' '),(112,'2020-07-01 18:20:16',16018,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio.','',NULL,' '),(113,'2020-07-01 18:24:15',1045367086,1045367073,'Asignación de Cargo','Guillermo Delsas le ha asignado el cargo de Profesor de planta','',NULL,' '),(114,'2020-07-01 18:25:53',16020,1045367073,'Nueva concesión de permiso','Guillermo Aldolfo Delsas Murcia le ha concedido un nuevo permiso a petición de iyyiiyyyiyi iuy kghggjgjhgjg jhgjhgjhgj.','',NULL,' '),(115,'2020-07-01 18:31:06',1045367085,1045367085,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 01/07/2020 y 03/07/2020','\0',NULL,' '),(116,'2020-07-01 18:31:06',1045367083,1045367085,'Solicitud de permiso nueva','Francisco Javier Magaña Arriola ha solicitado un nuevo permiso.','',NULL,' '),(117,'2020-07-01 18:31:18',1045367085,1045367085,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 06/07/2020 y 10/07/2020','\0',NULL,' '),(118,'2020-07-01 18:31:18',1045367083,1045367085,'Solicitud de permiso nueva','Francisco Javier Magaña Arriola ha solicitado un nuevo permiso.','',NULL,' '),(119,'2020-07-01 18:31:34',1045367085,1045367085,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 31/07/2020 y 31/07/2020','\0',NULL,' '),(120,'2020-07-01 18:31:34',1045367083,1045367085,'Solicitud de permiso nueva','Francisco Javier Magaña Arriola ha solicitado un nuevo permiso.','',NULL,' '),(121,'2020-07-01 18:32:16',1045367085,1045367085,'Solicitud exitosa','Su permiso se ha solicitado para entre las fechas: 20/07/2020 y 24/07/2020','\0',NULL,' '),(122,'2020-07-01 18:32:16',1045367083,1045367085,'Solicitud de permiso nueva','Francisco Javier Magaña Arriola ha solicitado un nuevo permiso.','',NULL,' '),(123,'2020-07-01 18:32:28',1045367086,1045367085,'Aceptación de permiso','Francisco Javier Magaña Arriola ha aceptado su solicitud de permiso. ','',NULL,' '),(124,'2020-07-01 18:33:26',1045367085,1045367073,'Aceptación de permiso','Guillermo Aldolfo Delsas Murcia ha aceptado su solicitud de permiso. ','\0',NULL,' '),(125,'2020-07-01 18:33:28',1045367085,1045367073,'Aceptación de permiso','Guillermo Aldolfo Delsas Murcia ha aceptado su solicitud de permiso. ','\0',NULL,' '),(126,'2020-07-01 18:33:30',1045367085,1045367073,'Aceptación de permiso','Guillermo Aldolfo Delsas Murcia ha aceptado su solicitud de permiso. ','\0',NULL,' '),(127,'2020-07-01 18:33:33',1045367085,1045367073,'Aceptación de permiso','Guillermo Aldolfo Delsas Murcia ha aceptado su solicitud de permiso. ','\0',NULL,' '),(128,'2020-07-01 18:35:09',1045367085,1045367073,'Asignación de Cargo','Guillermo Delsas le ha asignado el cargo de Profesor de planta','\0',NULL,' '),(129,'2020-07-01 18:38:25',1045367085,1045367073,'Relevación de Cargo','Ha sido relevado de su cargo como Profesor de planta Por Guillermo Delsas','\0',NULL,' '),(130,'2020-07-01 18:54:21',1045367086,1045367086,'Modificación de solicitud de permiso','Su permiso se ha solicitado para entre las fechas: 29/07/2020 y 31/07/2020','',NULL,' '),(131,'2020-07-01 18:54:21',1045367085,1045367086,'Modificaciones en una solicitud de permiso','Juan Manuel Bartanes Pilar ha cambiado su solicitud de permiso.','\0',NULL,' '),(132,'2020-07-03 13:14:22',16018,1045367073,'Solicitud de cita aceptada','Su solicitud para una cita con el psicólogo institucional fue aprobada por Guillermo Delsas. La cita consulta se llevará a cabo el 01/07/2020 10:30 AM','',NULL,' '),(133,'2020-07-03 13:14:34',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','',NULL,' '),(134,'2020-07-03 13:16:47',1045367073,1045367073,'Sesión de consulta terminada','La sesión de consulta psicológica con el estudiante Francisco Regalado ha terminado.','',NULL,' '),(135,'2020-07-03 13:16:47',16018,1045367073,'Sesión de consulta terminada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha terminado.','',NULL,' '),(136,'2020-07-03 13:17:52',16020,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','',NULL,' '),(137,'2020-07-03 13:19:25',1045367073,1045367073,'Sesión de consulta terminada','La sesión de consulta psicológica con la estudiante Mariana Regalado ha terminado.','',NULL,' '),(138,'2020-07-03 13:19:26',16020,1045367073,'Sesión de consulta terminada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha terminado.','',NULL,' '),(139,'2020-07-03 13:19:53',16019,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(140,'2020-07-03 13:20:39',1045367073,1045367073,'Sesión de consulta terminada','La sesión de consulta psicológica con el estudiante Juan Regalado ha terminado.','',NULL,' '),(141,'2020-07-03 13:20:39',16019,1045367073,'Sesión de consulta terminada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha terminado.','\0',NULL,' '),(142,'2020-07-03 15:38:24',1045367088,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha creado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Este reporte aun no es público. Reporte Desde 24/06/2020 hasta 02/07/2020','',NULL,' '),(143,'2020-07-03 15:38:50',1045367088,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha modificado un reporte sobre las citas atendidas en el consultorio de psicología. Este reporte aun no es público. Reporte Desde 24/06/2020 hasta 02/07/2020','',NULL,' '),(144,'2020-07-03 16:54:52',1045367088,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha modificado un reporte sobre las citas atendidas en el consultorio de psicología. Este reporte aun no es público. Reporte Desde 24/06/2020 hasta 02/07/2020','',NULL,' '),(145,'2020-07-03 16:56:29',1045367088,1045367088,'nuevo reporte de citas psicológicas','Laura Pineda ha creado un nuevo reporte sobre las citas atendidas en el consultorio de psicología. Este reporte aun no es público. Reporte Desde 03/07/2020 hasta 03/07/2020','',NULL,' '),(146,'2020-07-05 22:08:41',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(147,'2020-08-24 01:43:11',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(148,'2020-08-24 01:43:11',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Monday 31/August/2020 08:45 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(149,'2020-08-24 01:43:43',1045367088,16018,'Nueva solicitud de cita','El estudiante Francisco Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(150,'2020-08-24 01:43:43',16018,16018,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Thursday 27/August/2020 09:00 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(151,'2020-08-26 00:43:48',1045367082,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Lunes 07:15 AM - 08:00 AM Materia: Lenguaje. Profesor: José Murcia. Grado: 2° TVC Contador Sección A','\0',NULL,' '),(152,'2020-08-26 00:44:15',1045367085,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Lunes 07:15 AM - 08:00 AM Materia: Informática. Profesor: Francisco Magaña. Grado: 3° TVC Contador Sección A','\0',NULL,' '),(153,'2020-08-26 00:54:28',1045367083,1045367073,'Se ha eliminado una nueva hora clase del horario','Elimnación: Lunes 08:00 AM - 08:45 AM Materia: Laboratorio de Creatividad I Profesor: Laura María López Súñiga Grado: 1° TVC Contador Sección A','\0',NULL,' '),(154,'2020-08-26 01:00:57',1045367086,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Lunes 08:00 AM - 08:45 AM Materia: Informática Profesor: Juan Manuel Bartanes Pilar Grado: 3° TVC Contador Sección A','\0',NULL,' '),(155,'2020-08-26 01:01:28',1045367085,1045367073,'Seha editado el horario','Modificación: Lunes 08:00 AM - 08:45 AM Materia: Informática Profesor: Francisco Javier Magaña Arriola Grado: 3° TVC Contador Sección A','\0',NULL,' '),(156,'2020-08-26 01:01:46',1045367085,1045367073,'Se ha eliminado una nueva hora clase del horario','Elimnación: Lunes 08:00 AM - 08:45 AM Materia: Informática Profesor: Francisco Javier Magaña Arriola Grado: 3° TVC Contador Sección A','\0',NULL,' '),(157,'2020-08-27 00:10:06',16018,1045367073,'Solicitud de cita pospuesta','Su solicitud para una cita con el psicólogo institucional fue aplazada por Guillermo DelsasLa razón del aplazamiento es :me retiro temprano. Se le propone que la cita consulta se lleve a cabo el 31/08/2020 08:00 AM. Puede aceptarla, modificarla o cancelarla desde su historial de citas.','\0',NULL,' '),(158,'2020-08-27 00:39:40',1045367088,16020,'Nueva solicitud de cita','El estudiante Mariana Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(159,'2020-08-27 00:39:40',16020,16020,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Monday 31/August/2020 09:40 AM. Manténgase pendiente de la respuesta del psicólogo.','',NULL,' '),(160,'2020-08-27 00:41:30',1045367088,16020,'Nueva solicitud de cita','El estudiante Mariana Regalado ha hecho una solicitud de cita. Revise la administración de las citas para más detalles','',NULL,' '),(161,'2020-08-27 00:41:30',16020,16020,'Solicitud exitosa','Su solicitud de citas con el psicólogo de la institución se ha realizado con éxito. su solicitud es para el día Monday 31/August/2020 08:40 AM. Manténgase pendiente de la respuesta del psicólogo.','\0',NULL,' '),(162,'2020-08-27 00:43:04',16018,1045367088,'Solicitud de cita pospuesta','Su solicitud para una cita con el psicólogo institucional fue aplazada por Laura PinedaLa razón del aplazamiento es :no habrá clases. Se le propone que la cita consulta se lleve a cabo el 01/09/2020 08:45 AM. Puede aceptarla, modificarla o cancelarla desde su historial de citas.','\0',NULL,' '),(163,'2020-08-27 00:43:21',16018,1045367088,'Solicitud de cita aceptada','Su solicitud para una cita con el psicólogo institucional fue aprobada por Laura Pineda. La cita consulta se llevará a cabo el 31/08/2020 08:45 AM','\0',NULL,' '),(164,'2020-08-27 00:44:25',16018,1045367088,'Solicitud de cita pospuesta','Su solicitud para una cita con el psicólogo institucional fue aplazada por Laura PinedaLa razón del aplazamiento es :no hay clases. Se le propone que la cita consulta se lleve a cabo el 01/09/2020 09:45 AM. Puede aceptarla, modificarla o cancelarla desde su historial de citas.','\0',NULL,' '),(165,'2020-08-27 00:44:42',16018,1045367088,'Sesión de consulta iniciada','La sesión de consulta con la psicóloga  lic. Laura Pineda ha iniciado.','\0',NULL,' '),(166,'2020-08-27 00:46:56',16018,1045367088,'Sesión de consulta iniciada','La sesión de consulta con la psicóloga  lic. Laura Pineda ha iniciado.','\0',NULL,' '),(167,'2020-09-01 05:15:51',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(168,'2020-09-01 05:16:55',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(169,'2020-09-01 05:17:16',1045367073,1045367073,'Sesión de consulta terminada','La sesión de consulta psicológica con el estudiante Francisco Regalado ha terminado.','',NULL,' '),(170,'2020-09-01 05:17:16',16018,1045367073,'Sesión de consulta terminada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha terminado.','',NULL,' '),(171,'2020-09-01 05:17:29',16019,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','\0',NULL,' '),(172,'2020-09-01 05:18:27',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','',NULL,' '),(173,'2020-09-06 05:08:29',1045367073,1045367073,'MOdificación del plantel','Se ha detectado una modificación al plantel institucional.','',NULL,' '),(174,'2020-09-06 05:08:29',1045367083,1045367073,'MOdificación del plantel','Se ha detectado una modificación al plantel institucional.','',NULL,' '),(175,'2020-09-06 05:08:29',1045367085,1045367073,'MOdificación del plantel','Se ha detectado una modificación al plantel institucional.','',NULL,' '),(176,'2020-09-06 05:09:21',16018,1045367073,'Nueva concesión de permiso','Guillermo Aldolfo Delsas Murcia le ha concedido un nuevo permiso a petición de dfgbdgb dfgdfgdf dfghdfghdf fdghdfrhd.','',NULL,' '),(177,'2020-09-06 22:01:40',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','',NULL,' '),(178,'2020-09-06 22:01:40',16018,1045367073,'Sesión de consulta iniciada','La sesión de consulta con el psicólogo lic. Guillermo Delsas ha iniciado.','',NULL,' '),(179,'2020-09-06 22:43:16',1045367073,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(180,'2020-09-06 22:43:33',1045367083,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(181,'2020-09-06 22:43:42',1045367085,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(182,'2020-09-06 22:43:49',1045367082,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(183,'2020-09-06 22:43:49',1045367083,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(184,'2020-09-06 22:43:49',1045367085,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(185,'2020-09-06 22:43:49',1045367086,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(186,'2020-09-06 22:43:58',1045367081,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(187,'2020-09-06 22:44:06',1045367080,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(188,'2020-09-06 22:44:15',1045367082,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(189,'2020-09-06 22:44:32',16018,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(190,'2020-09-06 22:44:32',16019,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(191,'2020-09-06 22:44:33',16020,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(192,'2020-09-06 22:44:40',1045367070,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(193,'2020-09-06 22:44:54',1045367090,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(194,'2020-09-06 22:45:02',1045367091,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','\0',NULL,' '),(195,'2020-09-06 22:45:09',1045367088,1045367073,'Cambios en el menú','La barra de menús ha sufrido cambios y los verá cuando actualice o cambie de página. Notificación del sistema.','',NULL,' '),(196,'2020-10-16 00:28:59',16018,1045367073,'Nueva concesión de permiso','Guillermo Aldolfo Delsas Murcia le ha concedido un nuevo permiso a petición de dfgbdgb dfgdfgdf dfghdfghdf fdghdfrhd.','\0',NULL,' '),(197,'2020-10-18 20:11:01',1045367085,1045367073,'Aceptación de reserva','Su solicitud de reserva de equipo con fecha 26/06/2020 a las 07:14 PM ha sido aceptada por Guillermo Delsas.','\0',NULL,' '),(198,'2020-10-18 20:11:47',1045367085,1045367073,'Rechazo de reserva','Su solicitud de reserva de equipo con fecha 26/06/2020 a las 07:14 PM ha sido rechazada por Guillermo Delsas. La razón del rechazo es: NO habrá servicio a esa hora.','\0',NULL,' '),(199,'2020-10-18 20:20:53',16020,1045367073,'Solicitud de cita aceptada','Su solicitud para una cita con el psicólogo institucional fue aprobada por Guillermo Delsas. La cita consulta se llevará a cabo el 31/08/2020 09:40 AM','\0',NULL,' '),(200,'2020-10-18 20:22:11',1045367073,1045367073,'MOdificación del plantel','Se ha detectado una modificación al plantel institucional.','',NULL,' '),(201,'2020-10-18 20:22:11',1045367083,1045367073,'MOdificación del plantel','Se ha detectado una modificación al plantel institucional.','',NULL,' '),(202,'2020-10-18 20:22:11',1045367085,1045367073,'MOdificación del plantel','Se ha detectado una modificación al plantel institucional.','\0',NULL,' '),(203,'2020-10-18 20:27:51',16020,1045367073,'Se ha registrado un cambio de sección','Guillermo Delsas ha cambiado la sección donde usted estaba inscrito a la sección \'A\'.','\0',NULL,' '),(204,'2020-10-18 20:28:31',16020,1045367073,'Se ha registrado actividad en la entrega de paquetes.','Lo que se le ha entregado es: Útiles, Uniforme, Zapatos.','\0',NULL,' '),(205,'2020-10-18 20:28:43',16019,1045367073,'Se ha registrado actividad en la entrega de paquetes.','Lo que se le ha entregado es: Útiles, Uniforme, Zapatos.','\0',NULL,' '),(206,'2020-10-18 20:29:17',16020,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio, Agosto, Septiembre.','\0',NULL,' '),(207,'2020-10-18 20:29:32',16019,1045367073,'Actividad en las contribuciones registrado.','Los meses que ya ha pagado son : Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio, Agosto, Septiembre, Octubre.','\0',NULL,' '),(208,'2020-10-18 20:32:22',16018,1045367073,'Asignación de cargo','Guillermo Delsas le ha asignado el cargo de Administrador CRA. Los cambios en su menú lo verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(209,'2020-10-18 20:35:20',16018,1045367073,'Relevación de cargo','Guillermo Delsas le ha relevado del cargo de Administrador CRA. Los cambios en su menú los verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(210,'2020-10-18 20:39:28',16019,16018,'Solicitud exitosa','Su solicitud de recursos de Tecnológico CRA ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','\0',NULL,' '),(211,'2020-10-18 20:39:28',16018,16018,'Solicitud exitosa','Su solicitud de recursos de Tecnológico CRA ha sido guardada con éxito. Recibirá una notificación cuando sea aprobada por el encargado de área correspondiente.','\0',NULL,' '),(212,'2020-10-18 20:39:28',1045367080,16018,'Nueva solicitud de recursos','Francisco Antonio Regalado Cruz ha solicitado recursos','\0',NULL,' '),(213,'2020-10-18 20:40:23',16018,1045367073,'Asignación de cargo','Guillermo Delsas le ha asignado el cargo de Bibliotecario. Los cambios en su menú lo verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(214,'2020-10-18 20:42:03',16018,1045367073,'Asignación de cargo','Guillermo Delsas le ha asignado el cargo de Administrador CRA. Los cambios en su menú lo verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(215,'2020-10-18 20:43:00',16018,1045367073,'Relevación de cargo','Guillermo Delsas le ha relevado del cargo de Bibliotecario. Los cambios en su menú los verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(216,'2020-10-18 21:22:23',16018,1045367073,'Asignación de cargo','Guillermo Delsas le ha asignado el cargo de Bibliotecario. Los cambios en su menú lo verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(217,'2020-10-18 21:49:11',16018,1045367073,'Relevación de cargo','Guillermo Delsas le ha relevado del cargo de Bibliotecario. Los cambios en su menú los verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(218,'2020-10-18 21:49:18',16018,1045367073,'Relevación de cargo','Guillermo Delsas le ha relevado del cargo de Administrador CRA. Los cambios en su menú los verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(219,'2020-10-18 21:49:45',16018,16018,'Aceptación de reserva','Su solicitud de reserva de equipo con fecha 18/10/2020 a las 08:37 PM ha sido aceptada por Francisco Regalado.','\0',NULL,' '),(220,'2020-10-18 21:49:45',16019,16018,'Aceptación de reserva','Su solicitud de reserva de equipo con fecha 18/10/2020 a las 08:37 PM ha sido aceptada por Francisco Regalado.','\0',NULL,' '),(221,'2020-10-18 21:50:33',16018,1045367073,'Asignación de cargo','Guillermo Delsas le ha asignado el cargo de Bibliotecario. Los cambios en su menú lo verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(222,'2020-10-18 21:51:29',16018,1045367073,'Asignación de cargo','Guillermo Delsas le ha asignado el cargo de Psicologo. Los cambios en su menú lo verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(223,'2020-10-18 21:53:54',16018,1045367073,'Relevación de cargo','Guillermo Delsas le ha relevado del cargo de Psicologo. Los cambios en su menú los verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(224,'2020-10-18 21:54:56',16018,1045367073,'Relevación de cargo','Guillermo Delsas le ha relevado del cargo de Bibliotecario. Los cambios en su menú los verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(225,'2020-10-18 22:20:58',16018,1045367073,'Asignación de cargo','Guillermo Delsas le ha asignado el cargo de Administrador CRA. Los cambios en su menú lo verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(226,'2020-10-18 22:40:08',16018,1045367073,'Relevación de cargo','Guillermo Delsas le ha relevado del cargo de Administrador CRA. Los cambios en su menú los verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(227,'2020-10-18 22:41:13',16018,1045367073,'Asignación de cargo','Guillermo Delsas le ha asignado el cargo de Laboratorista. Los cambios en su menú lo verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(228,'2020-10-18 22:41:46',16018,1045367073,'Relevación de cargo','Guillermo Delsas le ha relevado del cargo de Laboratorista. Los cambios en su menú los verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(229,'2020-10-18 22:50:37',16018,1045367073,'Asignación de cargo','Guillermo Delsas le ha asignado el cargo de Secretaria. Los cambios en su menú lo verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(230,'2020-10-18 22:51:28',16018,1045367073,'Asignación de cargo','Guillermo Delsas le ha asignado el cargo de Colector. Los cambios en su menú lo verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(231,'2020-10-18 22:52:02',16018,1045367073,'Relevación de cargo','Guillermo Delsas le ha relevado del cargo de Secretaria. Los cambios en su menú los verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(232,'2020-10-18 22:52:08',16018,1045367073,'Relevación de cargo','Guillermo Delsas le ha relevado del cargo de Colector. Los cambios en su menú los verá cuando actualice o cambie de págiba. Compruebe sus asignaciones de cargos en su perfil de usuario.','\0',NULL,' '),(233,'2020-10-20 22:54:35',1045367085,1045367083,'Asignación de Cargo','Laura López le ha asignado el cargo de Profesor de planta','',NULL,' ');
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
INSERT INTO `permisos` VALUES (16018,'2020-09-06',10,'2020-09-06','2020-09-06',NULL,NULL,8,'sfddsfgsdfgsdfgsdfgsdfgdsgsd','1',1045367073,1045367073,'34343443-4¿¿dfgbdgb dfgdfgdf¿¿dfghdfghdf fdghdfrhd¿¿ '),(16018,'2020-10-16',11,'2020-10-16','2020-10-16',NULL,NULL,8,'sfddsfgsdfgsdfgsdfgsdfgdsgsd','1',1045367073,1045367073,'64646566-6¿¿dfgbdgb dfgdfgdf¿¿dfghdfghdf fdghdfrhd¿¿ '),(16020,'2020-07-01',10,'2020-07-01','2020-07-08',NULL,NULL,8,'Enfermedad','1',1045367073,1045367073,'89898989-8¿¿Juan Alberto¿¿Cruz Mejía¿¿ '),(1045367085,'2020-07-01',4,'2020-07-01','2020-07-03',NULL,NULL,4,NULL,'1',1045367085,1045367073,'1¿¿1¿¿¿¿'),(1045367085,'2020-07-01',4,'2020-07-06','2020-07-10',NULL,NULL,4,NULL,'1',1045367085,1045367073,'1¿¿1¿¿¿¿'),(1045367085,'2020-07-01',6,'2020-07-20','2020-07-24',NULL,NULL,4,NULL,'1',1045367085,1045367073,'1¿¿1¿¿¿¿'),(1045367085,'2020-07-01',7,'2020-07-31','2020-07-31',NULL,NULL,4,NULL,'1',1045367085,1045367073,'1¿¿1¿¿¿¿'),(1045367086,'2020-06-25',4,'2020-06-25','2020-06-25',NULL,NULL,4,NULL,'1',1045367086,1045367085,'1¿¿1¿¿¿¿'),(1045367086,'2020-06-25',5,'2020-06-25','2020-06-25',NULL,NULL,4,NULL,'1',1045367086,1045367085,'1¿¿1¿¿¿¿'),(1045367086,'2020-06-25',6,'2020-06-26','2020-06-30',NULL,NULL,4,NULL,'1',1045367086,1045367085,'1¿¿1¿¿¿¿'),(1045367086,'2020-06-25',7,'2020-07-29','2020-07-31',NULL,NULL,4,NULL,'0',1045367086,NULL,'0¿¿1¿¿¿¿');
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
INSERT INTO `persona` VALUES (16018,'Francisco Antonio','Regalado Cruz','2020-06-23','Colonia colonia','',0,2,'01#01','8d2a5f7d4afa5d0530789d3066945330','',8,'','','\0',0,'Salvadoreña','6018','',''),(16019,'Juan Manuel','Regalado Cruz','2020-06-23','hg,hg,jhk,jhk,jhk,jhk,h','',0,2,'01#01','8d2a5f7d4afa5d0530789d3066945330','',8,'','','\0',0,'Salvadoreña','','',''),(16020,'Mariana Soledad','Regalado Cruz','2020-06-23','hg,hg,jhk,jhk,jhk,jhk,h','',0,2,'01#01','ac2a728f9f17b5d860b6dabd80a5162f','',8,'','','',0,'Salvadoreña','','',''),(1000000000,'PAdre padrew','padre ',NULL,'','',0,0,' # ','','',11,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1000000001,'Madre MAdre','MAdre poisañ',NULL,'','',0,0,' # ','','',10,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367070,'Jorge Agustín','Ragalado Pereira','2020-06-23','dbfbfdbgdfgbfdbfdgb','',0,1,'02#01','ab8a338aa2b1da6d97c11ba6e67be768','',9,'','','\0',0,'Salvadoreña','dfbdfgbfdb dbfd bfdgb fd','',''),(1045367073,'Guillermo Aldolfo','Delsas Murcia','1991-01-17','texistepeque Santa ana','7033-7878',0,0,'02#13','02951a6cb9595ef475fed783e59c687e','Ingeniero de Sistemas Informáticos',1,'','0213-170191-102-9','\0',0,'Salvadoreña','guillermox020@gmail.com',NULL,NULL),(1045367080,'María Carmen','Peña Cárcamo','1980-06-19','dirección dirección dirección dirección','7888-8888',0,1,'02#02','6e80cf219e79bc8a8d83ce9a5b757f64','Lic. CC.JJ',6,'','0000-000000-000-0','',1,'Salvadoreña','dirección@dirección.dirección','',''),(1045367081,'Hugo Daniel','Flores Díaz','1980-06-19','dirección dirección dirección dirección','8989-8989',0,1,'01#02','ad9f88eb26394a8ad9f46975cf79a133','Abogado',5,'','0000-000000-000-0','\0',1,'Salvadoreña','dirección@dirección.dirección','',''),(1045367082,'José Antonio','Murcia Pérez','2020-06-04','lkhlcls clvsdv lsdkjv l','7777-7777',325,1,'03#03','4c247985fa19ff8622ae5790fe555953','profesor',4,'','0000-000000-000-0','\0',0,'Salvadoreña','','',''),(1045367083,'Laura María','López Súñiga','1975-08-12','ljkhfchsdh lsdhlshclsd hsl hclsdc','7888-8888',213,1,'02#10','a6ba5f99ff9616298b2212c76ea111dc','Profesora',4,'','0000-000000-000-0','',1,'Salvadoreña','sscacddvsdvfsdf@sdfsfds.dds','',''),(1045367085,'Francisco Javier','Magaña Arriola','2020-06-05','ohjoñhiohio','7777-7777',0,1,'04#03','ff0c210fd0f86b21bc0497faef184c7b','profesor',4,'','0000-000000-000-0','\0',0,'Salvadoreña','','',''),(1045367086,'Juan Manuel','Bartanes Pilar','2020-06-05','hohhh','7777-7777',2356,1,'05#04','f59bc51b847690dce791fce5f7179e04','Lic. en admón. de empresas',4,'','0000-000000-000-0','\0',1,'Salvadoreña','','',''),(1045367088,'Laura Isabel','Pineda Rosell','2020-06-02','jsakcsahdkcsh .kashv ksah vash','0000-0000',0,1,'02#04','c95b8be4befbee1a550a06fd19ed251a','Lic. en Psicología',14,'','0000-000000-000-0','',1,'Salvadoreña','','',''),(1045367090,'Pablo Alejandro','Martínez Santos','2020-06-01','edjl lc lice','0000-0000',0,1,'01#01','8912074c9b782911ff4f5585c747c132','lic',12,'','0000-000000-000-0','\0',1,'Salvadoreña','kckkvcḱefǘ@{ld{ld{dl.com','',''),(1045367091,'Alba Lucía','Aybara Campos','2020-06-03','sajfsvj{ps vposfj{psdofj v{spdjovf {sdpjvf','5555-5555',0,0,'02#13','f0ee269fcf3f4b1f8883aab03e6a7919','bachilller',13,'','0000-000000-000-0','',1,'Salvadoreña','','','');
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
INSERT INTO `personasReserva` VALUES (1,1045367081,''),(2,1045367073,''),(3,1045367073,''),(4,1045367086,''),(5,1045367086,''),(6,1045367086,''),(7,1045367073,''),(8,1045367073,''),(9,1045367073,''),(10,1045367086,''),(11,1045367073,''),(12,1045367085,''),(13,1045367085,''),(14,1045367085,''),(15,16018,''),(15,16019,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'2020-06-20 03:27:32','2020-06-22 09:28:00','2020-06-22 10:27:00',3,1,NULL,'D',NULL,NULL,NULL,'','','','',1045367081,1045367081,'Hugo Flores¿¿4¿¿0¿¿¿¿0'),(2,'2020-06-21 16:17:52','2020-06-29 16:19:00','2020-06-29 17:23:00',1,1,6,'D',NULL,NULL,NULL,'45','4554','dfgdfsgsdfbdsgbdfsbfdsbfdsrbdfe','dgdhfgdfeghdfhytdrfbrbfdrtgb ',1045367073,1045367073,'Guillermo Delsas¿¿4¿¿0¿¿¿¿0'),(3,'2020-06-24 17:49:35','2020-06-25 11:50:00','2020-06-25 13:50:00',1,1,5,'S',NULL,NULL,NULL,'N','N',NULL,NULL,NULL,NULL,'Guillermo Delsas¿¿2¿¿0¿¿¿¿0'),(4,'2020-06-25 04:20:35','2020-06-25 10:20:00','2020-06-25 11:20:00',1,1,6,'C',NULL,NULL,NULL,'Presentación de proyecto','N/A',NULL,NULL,NULL,NULL,'Juan Bartanes¿¿4¿¿0¿¿ya no habrá exposisción.¿¿0'),(5,'2020-06-25 04:21:42','2020-06-25 10:21:00','2020-06-25 11:21:00',3,2,NULL,'D',NULL,NULL,NULL,'','','en buenas condiciones','ok',1045367073,1045367073,'Juan Bartanes¿¿1¿¿0¿¿¿¿0'),(6,'2020-06-25 04:22:23','2020-06-25 09:22:00','2020-06-25 10:22:00',3,3,NULL,'R',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'Juan Bartanes¿¿1¿¿0¿¿No hay equipo disponible para esa hora.¿¿0'),(7,'2020-06-25 20:55:51','2020-06-26 15:00:00','2020-06-26 15:54:00',3,4,NULL,'C',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'Guillermo Delsas¿¿4¿¿0¿¿Ya no quiero el recurso.¿¿0'),(8,'2020-06-25 20:58:02','2020-06-26 08:00:00','2020-06-26 10:00:00',3,1,NULL,'R',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'Guillermo Delsas¿¿4¿¿0¿¿biblioteca cerrada a esa hora.¿¿0'),(9,'2020-06-25 21:01:50','2020-06-29 15:00:00','2020-06-29 17:00:00',3,1,NULL,'R',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'Guillermo Delsas¿¿4¿¿0¿¿todos los libros están ya reservados.¿¿0'),(10,'2020-06-25 21:18:52','2020-06-29 15:19:00','2020-06-29 16:18:00',1,1,6,'E',NULL,NULL,NULL,'u','9uoi','gggg',NULL,1045367073,NULL,'Juan Bartanes¿¿1¿¿0¿¿¿¿0'),(11,'2020-06-25 21:28:36','2020-06-30 15:30:00','2020-06-30 16:30:00',3,1,NULL,'D',NULL,NULL,NULL,'','','ok','ok',1045367081,1045367081,'Guillermo Delsas¿¿4¿¿0¿¿¿¿0'),(12,'2020-06-26 19:07:49','2020-06-29 07:15:00','2020-06-29 08:00:00',1,2,NULL,'S',NULL,1045367085,NULL,'nombre','objetivo ',NULL,NULL,NULL,NULL,'Francisco Magaña¿¿1¿¿0¿¿¿¿0¿¿1'),(13,'2020-06-26 19:14:11','2020-06-29 07:15:00','2020-06-29 08:00:00',1,2,NULL,'R',NULL,1045367085,NULL,'nombre','$$$$$$$$$$$$$$$$$$$$$$$',NULL,NULL,NULL,NULL,'Francisco Magaña¿¿1¿¿0¿¿NO habrá servicio a esa hora¿¿0¿¿2'),(14,'2020-06-26 19:14:11','2020-06-29 08:00:00','2020-06-29 09:05:00',1,2,NULL,'A',NULL,1045367085,NULL,'nombre','$$$$$$$$$$$$$$$$$$$$$$$',NULL,NULL,NULL,NULL,'Francisco Magaña¿¿1¿¿0¿¿¿¿0¿¿2'),(15,'2020-10-18 20:37:59','2020-10-19 08:38:00','2020-10-19 09:38:00',1,3,5,'A',NULL,1045367085,4,'fhnm','nmfghmfgmg',NULL,NULL,NULL,NULL,'Francisco Regalado¿¿3¿¿0¿¿¿¿0');
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
INSERT INTO `reservaDetalle` VALUES (5000040,40,'',1),(5000042,42,'',5),(5000044,45,'',11),(78885488,15,'',2),(78885488,15,'',10),(78885488,15,'',14),(78885488,15,'',15),(78885488,16,'',14);
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
INSERT INTO `solicitudReserva` VALUES (5000040,1,'1'),(5000040,9,'1'),(5000042,5,'1'),(5000042,8,'1'),(5000044,11,'1'),(5000046,6,'1'),(5000050,7,'1'),(78885488,2,'1'),(78885488,3,'1'),(78885488,4,'1'),(78885488,10,'1'),(78885488,12,'10'),(78885488,13,'13'),(78885488,14,'13'),(78885488,15,'1');
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
INSERT INTO `tema` VALUES (16018,'flick',''),(1045367073,'cupertino',''),(1045367081,'start',''),(1045367083,'excite-bike',''),(1045367086,'pepper-grinder',''),(1045367088,'excite-bike','');
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
-- Dumping events for database 'intex'
--

--
-- Dumping routines for database 'intex'
--

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

-- Dump completed on 2020-10-20 23:35:21
