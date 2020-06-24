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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES (9,'Administración','#',NULL,NULL,'fa fa-cog'),(10,'Sistema','tipopp.intex',9,NULL,'fa fa-folder-open'),(11,'Permisos y Licencias','lictp.intex',9,'jpoB7dhtzCE','fa fa-cube'),(12,'Académica','academico.intex',9,'xqZTZBWC4Ss','fa fa-leaf'),(13,'Perfil','#',NULL,NULL,'fa fa-user-secret'),(14,'Permisos','#',45,NULL,'fa fa-eye'),(15,'Solicitar Permiso','permisoE.intex',14,'2taqyO5-saU','fa fa-location-arrow'),(16,'Personal','#',NULL,NULL,'fa fa-users'),(17,'Gestión de maestros','agregacion.intex',27,NULL,'fa fa-user-plus'),(18,'Gestión de administradores','agAdm.intex',16,'Z_9XM6mawiM','fa fa-heartbeat'),(19,'Plantel Institucional','plantel.intex',16,'kE_GK-VYKhU','fa fa-table'),(20,'Inventario','inventario.intex',23,'A2iuTIQK3UM','fa fa-barcode'),(21,'Libros','libros.intex',23,'za6PsFqJ4xw','fa fa-book'),(22,'Nuevo Ingreso','inscripcion.intex',36,'fG_pxuQiENk','fa fa-user'),(23,'Recursos','#',9,NULL,'fa fa-yelp'),(24,'Nomina de Alumnos','nominaA.intex',36,'btLM8Ap0nf8','fa fa-user'),(25,'Gestión de Recursos','admRecurso.intex',23,'hcStyHhJXJU','fa fa-table'),(26,'Lista de Representantes','listaRepresentantes.intex',36,'lz_ro4WBz7w','fa fa-list'),(27,'Maestros','#',16,NULL,'fa fa-puzzle-piece'),(28,'Gestión de horarios','horario.intex',27,NULL,'fa fa-plus'),(29,'Gestión de permisos','permiso.intex',14,'jQxOPSdKrJo','fa fa-legal'),(30,'Solicitud de permisos','permisoM.intex',14,NULL,'fa fa-ge'),(31,'Anuncios','anuncios.intex',9,'OlRPrt81ABs','fa fa-bell'),(32,'Matricula','matricula.intex',36,'gsNmACB_jhs','fa fa-slideshare'),(33,'Entrega de Útiles','paquetes.intex',36,'SzU0g7AHrC4','fa fa-sliders'),(34,'Contribuciones','contribuciones.intex',36,'6DdwbMkRVRQ','fa fa-money'),(36,'Alumnos','#',16,NULL,'fa fa-graduation-cap'),(37,'Reservas de Equipo','#',45,NULL,'fa fa-gamepad'),(38,'Solicitud de Reserva','solicitudR.intex',37,'QdicGaVmyKE;Vzl57q_AQT0','fa fa-flag'),(39,'Historial de Reservas','solicitudH.intex',43,NULL,'fa fa-archive'),(40,'Gestionar Reservas de equipo','srCra.intex',37,NULL,'fa fa-certificate'),(41,'Historial de Notificaciones','notifh.intex',43,NULL,'fa fa-forumbee'),(42,'Proyecto Planificado','solicitudRPP.intex',37,NULL,'fa fa-pencil-square-o'),(43,'Historiales','#',13,NULL,'fa fa-folder-open'),(44,'Historial de permisos','permisoH.intex',43,NULL,'fa fa-database'),(45,'Solicitudes','#',NULL,NULL,'fa fa-street-view'),(46,'Área psicológica','#',45,NULL,'fa fa-ambulance'),(47,'Solicitud de cita psicológica','solicitudCP.intex',46,NULL,'fa fa-bookmark-o'),(48,'Adminitración citas pscológi','admCitasPs.intex',46,NULL,'fa fa-calendar'),(49,'Consulta Psicológica','consultasPS.intex',46,NULL,'fa fa-umbrella'),(50,'Historial citas Psicológicas','citasPSH.intex',43,NULL,'fa fa-file'),(51,'Horario de clases','horarioCl.intex',13,'Jzf5uLibF7Y','fa fa-calendar'),(52,'Aspecto de la aplicación','temas.intex',13,'lUwlOJ0pYDY','fa fa-picture-o'),(53,'Mi usuario','infoPerfil.intex',13,'1CLiFlFRDKU','fa fa-android'),(54,'Administración de usuarios','admUsuarios.intex',16,'IfDFy7sJAXc','fa fa-university'),(55,'Evaluación de maestros','maestroEval.intex',27,NULL,'fa fa-list-alt'),(56,'Evaluación de grados','gradoEval.intex',36,'VonX5TINpJ8','fa fa-flask'),(57,'Reportes','#',9,NULL,'fa fa-weibo'),(58,'Historial de evaluaciones','maEvalH.intex',43,NULL,' fa fa-history'),(59,'Evaluaciones de grado','gradoEvalH.intex',43,NULL,'fa fa-dashcube'),(61,'Entrega de Paquetes','repEntrega.intex',57,NULL,'fa fa-leanpub'),(62,'Gestión de horarios (lite)','horarioLite.intex',27,NULL,'fa fa-list-alt'),(63,'Pago de contribución','repContr.intex',57,NULL,'fa fa-server'),(64,'Inventario de equipo','repInv.intex',57,NULL,'fa fa-linux'),(65,'Matrículas','repMatricula.intex',57,NULL,'fa fa-book'),(66,'General de Permisos','repPermisos.intex',57,NULL,'fa fa-bar-chart-o'),(67,'Área de psicología','CPsReporte.intex',57,NULL,'fa fa-newspaper-o'),(68,'Elaboración de reporte','CPsReporte.intex',46,NULL,'fa fa-paperclip');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `accesoTipoPersona`
--

LOCK TABLES `accesoTipoPersona` WRITE;
/*!40000 ALTER TABLE `accesoTipoPersona` DISABLE KEYS */;
INSERT INTO `accesoTipoPersona` VALUES (9,1,''),(9,2,''),(9,3,''),(9,4,''),(9,5,''),(9,6,''),(9,7,''),(9,12,''),(9,13,''),(9,17,''),(10,1,''),(10,2,''),(10,17,''),(11,1,''),(11,2,''),(11,3,''),(11,17,''),(12,1,''),(12,2,''),(12,17,''),(13,1,''),(13,2,''),(13,3,''),(13,4,''),(13,5,''),(13,6,''),(13,7,''),(13,8,''),(13,9,''),(13,12,''),(13,13,''),(13,14,''),(13,15,''),(13,16,''),(13,17,''),(14,1,''),(14,2,''),(14,3,''),(14,4,''),(14,5,''),(14,6,''),(14,7,''),(14,8,''),(14,9,''),(14,12,''),(14,13,''),(14,14,''),(14,15,''),(14,16,''),(14,17,''),(15,8,''),(15,9,''),(15,17,''),(16,1,''),(16,2,''),(16,3,''),(16,4,''),(16,12,''),(16,13,''),(16,17,''),(17,1,''),(17,2,''),(17,17,''),(18,1,''),(18,2,''),(18,17,''),(19,1,''),(19,2,''),(19,3,''),(19,13,''),(19,17,''),(20,1,''),(20,2,''),(20,5,''),(20,6,''),(20,7,''),(20,17,''),(21,1,''),(21,2,''),(21,5,''),(21,17,''),(22,1,''),(22,2,''),(22,3,''),(22,4,''),(22,13,''),(22,17,''),(23,1,''),(23,2,''),(23,5,''),(23,6,''),(23,7,''),(23,17,''),(24,1,''),(24,2,''),(24,3,''),(24,4,''),(24,13,''),(24,17,''),(25,1,''),(25,2,''),(25,5,''),(25,6,''),(25,7,''),(25,17,''),(26,1,''),(26,2,''),(26,3,''),(26,4,''),(26,13,''),(26,17,''),(27,1,''),(27,2,''),(27,17,''),(28,1,''),(28,2,''),(28,17,''),(29,1,''),(29,2,''),(29,3,''),(29,17,''),(30,1,''),(30,2,''),(30,3,''),(30,4,''),(30,5,''),(30,6,''),(30,7,''),(30,12,''),(30,13,''),(30,14,''),(30,15,''),(30,16,''),(30,17,''),(31,1,''),(31,2,''),(31,3,''),(31,4,''),(31,5,''),(31,6,''),(31,7,''),(31,12,''),(31,13,''),(31,14,''),(31,17,''),(32,1,''),(32,2,''),(32,13,''),(32,17,''),(33,1,''),(33,2,''),(33,12,''),(33,17,''),(34,1,''),(34,2,''),(34,12,''),(34,17,''),(36,1,''),(36,2,''),(36,3,''),(36,4,''),(36,12,''),(36,13,''),(36,17,''),(37,1,''),(37,2,''),(37,3,''),(37,4,''),(37,5,''),(37,6,''),(37,7,''),(37,8,''),(37,13,''),(37,17,''),(38,1,''),(38,2,''),(38,3,''),(38,4,''),(38,5,''),(38,6,''),(38,7,''),(38,8,''),(38,17,''),(39,1,''),(39,2,''),(39,3,''),(39,4,''),(39,5,''),(39,6,''),(39,7,''),(39,8,''),(39,17,''),(40,1,''),(40,2,''),(40,5,''),(40,6,''),(40,7,''),(40,17,''),(41,1,''),(41,2,''),(41,3,''),(41,4,''),(41,5,''),(41,6,''),(41,7,''),(41,8,''),(41,9,''),(41,12,''),(41,14,''),(41,15,''),(41,16,''),(41,17,''),(42,1,''),(42,2,''),(42,4,''),(42,17,''),(43,1,''),(43,2,''),(43,3,''),(43,4,''),(43,5,''),(43,6,''),(43,7,''),(43,8,''),(43,9,''),(43,12,''),(43,13,''),(43,14,''),(43,15,''),(43,16,''),(43,17,''),(44,1,''),(44,2,''),(44,3,''),(44,4,''),(44,5,''),(44,6,''),(44,7,''),(44,8,''),(44,9,''),(44,12,''),(44,13,''),(44,14,''),(44,15,''),(44,16,''),(44,17,''),(45,1,''),(45,2,''),(45,3,''),(45,4,''),(45,5,''),(45,6,''),(45,7,''),(45,8,''),(45,9,''),(45,12,''),(45,13,''),(45,14,''),(45,15,''),(45,17,''),(46,1,''),(46,8,''),(46,14,''),(46,17,''),(47,8,''),(47,17,''),(48,1,''),(48,14,''),(48,17,''),(49,1,''),(49,14,''),(49,17,''),(50,8,''),(50,17,''),(51,4,''),(51,8,''),(51,9,''),(51,17,''),(52,1,''),(52,2,''),(52,3,''),(52,4,''),(52,5,''),(52,6,''),(52,7,''),(52,8,''),(52,9,''),(52,12,''),(52,13,''),(52,14,''),(52,15,''),(52,16,''),(52,17,''),(53,1,''),(53,2,''),(53,3,''),(53,4,''),(53,5,''),(53,6,''),(53,7,''),(53,8,''),(53,9,''),(53,12,''),(53,13,''),(53,14,''),(53,15,''),(53,16,''),(53,17,''),(54,1,''),(54,2,''),(54,13,''),(54,17,''),(55,1,''),(55,2,''),(55,17,''),(56,1,''),(56,2,''),(56,3,''),(56,17,''),(57,1,''),(57,2,''),(57,3,''),(57,4,''),(57,5,''),(57,6,''),(57,7,''),(57,12,''),(57,13,''),(57,17,''),(58,4,''),(58,17,''),(59,2,''),(59,3,''),(59,4,''),(59,8,''),(59,17,''),(61,1,''),(61,2,''),(61,3,''),(61,4,''),(61,12,''),(61,13,''),(61,17,''),(62,1,''),(62,2,''),(62,17,''),(63,1,''),(63,2,''),(63,3,''),(63,4,''),(63,13,''),(63,17,''),(64,1,''),(64,2,''),(64,3,''),(64,5,''),(64,6,''),(64,7,''),(64,13,''),(64,17,''),(65,1,''),(65,2,''),(65,3,''),(65,13,''),(65,17,''),(66,1,''),(66,2,''),(66,3,''),(66,17,''),(67,1,''),(67,2,''),(68,1,''),(68,14,'');
/*!40000 ALTER TABLE `accesoTipoPersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES (1,'jd','2020-06-22','dfjjydtrydt',1045367073,NULL,NULL);
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (7,4,'');
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (2,'Mónica P. Alegría',NULL),(3,'Herbert Meislich',NULL),(4,'Otros',NULL),(5,'M. D. Masjuan',NULL),(6,'J. M. Dou',NULL),(7,'J. Pelegrin',NULL),(8,'Michel Lewis',NULL),(9,'Guy Waller',NULL),(10,'J. A. Chamizo',NULL),(11,'A. Garritz R. Vilar',NULL),(12,'Lothar Beyer',NULL),(13,'V. Fernández H.',NULL),(14,'G. E. Educar',NULL),(15,'Biggs',NULL),(16,'Kapicka',NULL),(17,'Lundgren',NULL),(18,'Espasa',NULL),(19,'Hickman',NULL),(20,'Roberts',NULL),(21,'Larson',NULL);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `autorLibro`
--

LOCK TABLES `autorLibro` WRITE;
/*!40000 ALTER TABLE `autorLibro` DISABLE KEYS */;
INSERT INTO `autorLibro` VALUES (2,5000040,''),(3,5000042,''),(4,5000040,''),(4,5000042,''),(5,5000044,''),(6,5000044,''),(7,5000044,''),(8,5000046,''),(9,5000046,''),(10,5000048,''),(11,5000048,''),(12,5000050,''),(13,5000050,''),(14,5000052,''),(14,5000056,''),(15,5000054,''),(16,5000054,''),(17,5000054,''),(18,5000058,''),(19,5000060,''),(20,5000060,''),(21,5000060,'');
/*!40000 ALTER TABLE `autorLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `capacitaciones`
--

LOCK TABLES `capacitaciones` WRITE;
/*!40000 ALTER TABLE `capacitaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `capacitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (3,'Director',2,NULL),(4,'Subdirector',3,NULL),(5,'Administrador de área CC.NN',7,NULL);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (0,'Generalidades',NULL),(100,'Filosofías y Disciplinas A Fines',NULL),(300,'Ciencias Sociales',NULL),(400,'Leguas',NULL),(500,'Ciencias Puras',NULL),(600,'Ciencias Aplicadas',NULL),(700,'Bellas Artes',NULL),(800,'Literatura',NULL),(900,'Geografia e Historia',NULL);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `citaPsicologia`
--

LOCK TABLES `citaPsicologia` WRITE;
/*!40000 ALTER TABLE `citaPsicologia` DISABLE KEYS */;
/*!40000 ALTER TABLE `citaPsicologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `constancias`
--

LOCK TABLES `constancias` WRITE;
/*!40000 ALTER TABLE `constancias` DISABLE KEYS */;
/*!40000 ALTER TABLE `constancias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `contenidoLibro`
--

LOCK TABLES `contenidoLibro` WRITE;
/*!40000 ALTER TABLE `contenidoLibro` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidoLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `contribuciones`
--

LOCK TABLES `contribuciones` WRITE;
/*!40000 ALTER TABLE `contribuciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `contribuciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `delagacionCargo`
--

LOCK TABLES `delagacionCargo` WRITE;
/*!40000 ALTER TABLE `delagacionCargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `delagacionCargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `diasEstudio`
--

LOCK TABLES `diasEstudio` WRITE;
/*!40000 ALTER TABLE `diasEstudio` DISABLE KEYS */;
INSERT INTO `diasEstudio` VALUES (1,'Lunes',NULL),(2,'Martes',''),(3,'Miércoles',NULL),(4,'Jueves',NULL),(5,'Viernes',NULL);
/*!40000 ALTER TABLE `diasEstudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
INSERT INTO `documentos` VALUES (16018,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (2,'Santillana Polimodal',NULL),(3,'McGraw - Hill',NULL),(4,'Casals',NULL),(5,'Trillas',NULL),(6,'Prentice Hall',NULL),(7,'Ariel Ciencia',NULL),(8,'Educar Editores',NULL),(9,'Espasa Calpe',NULL);
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `editorialLibro`
--

LOCK TABLES `editorialLibro` WRITE;
/*!40000 ALTER TABLE `editorialLibro` DISABLE KEYS */;
INSERT INTO `editorialLibro` VALUES (2,5000040,''),(3,5000042,''),(3,5000054,''),(3,5000060,''),(4,5000044,''),(5,5000046,''),(6,5000048,''),(7,5000050,''),(8,5000052,''),(8,5000056,''),(9,5000058,'');
/*!40000 ALTER TABLE `editorialLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ejemplar`
--

LOCK TABLES `ejemplar` WRITE;
/*!40000 ALTER TABLE `ejemplar` DISABLE KEYS */;
INSERT INTO `ejemplar` VALUES (5000040,40,2020,'',NULL,NULL,NULL),(5000040,41,2020,'',NULL,NULL,NULL),(5000042,42,2020,'',NULL,NULL,NULL),(5000042,43,2020,'',NULL,NULL,NULL),(5000044,44,2020,'',NULL,NULL,NULL),(5000044,45,2020,'',NULL,NULL,NULL),(5000046,41,2020,'',NULL,NULL,NULL),(5000046,46,2020,'',NULL,NULL,NULL),(5000048,48,2020,'',NULL,NULL,NULL),(5000048,49,2020,'',NULL,NULL,NULL),(5000050,50,2020,'',NULL,NULL,NULL),(5000050,51,2020,'',NULL,NULL,NULL),(5000052,50,2020,'',NULL,NULL,NULL),(5000052,51,2020,'',NULL,NULL,NULL),(5000054,54,2020,'',NULL,NULL,NULL),(5000054,55,2020,'',NULL,NULL,NULL),(5000056,56,2020,'',NULL,NULL,NULL),(5000056,57,2020,'',NULL,NULL,NULL),(5000058,58,2020,'',NULL,NULL,NULL),(5000058,59,2020,'',NULL,NULL,NULL),(5000060,60,2020,'',NULL,NULL,NULL),(5000060,61,2020,'',NULL,NULL,NULL),(78885488,15,2020,'','HP Compaq','CQ45',NULL),(78885488,16,2020,'','HP Compaq','CQ-43',NULL);
/*!40000 ALTER TABLE `ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entregaUtiles`
--

LOCK TABLES `entregaUtiles` WRITE;
/*!40000 ALTER TABLE `entregaUtiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `entregaUtiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (16018,'',0,'',0,1.00,'\0','Padre#Madre¿ ','','','','Tío','','Noveno Grado','','gh,kgh,,g','','',1045367070,1000000000,1000000001,''),(1045367070,'',1,'',NULL,NULL,'',NULL,NULL,NULL,NULL,'Tío','\0','9','df',NULL,'','',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `evaluacionMaestro`
--

LOCK TABLES `evaluacionMaestro` WRITE;
/*!40000 ALTER TABLE `evaluacionMaestro` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacionMaestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `expedientePS`
--

LOCK TABLES `expedientePS` WRITE;
/*!40000 ALTER TABLE `expedientePS` DISABLE KEYS */;
/*!40000 ALTER TABLE `expedientePS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `financiamiento`
--

LOCK TABLES `financiamiento` WRITE;
/*!40000 ALTER TABLE `financiamiento` DISABLE KEYS */;
INSERT INTO `financiamiento` VALUES (4,'MINED',NULL);
/*!40000 ALTER TABLE `financiamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO `grado` VALUES (2020,1,'A','C',7,'',1045367083,NULL);
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gradoEvaluacion`
--

LOCK TABLES `gradoEvaluacion` WRITE;
/*!40000 ALTER TABLE `gradoEvaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradoEvaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,'07:15:00','08:00:00',''),(2,'08:00:00','08:45:00',''),(3,'08:45:00','09:05:00',''),(4,'09:05:00','09:50:00',''),(5,'09:50:00','10:35:00',''),(6,'10:35:00','10:45:00',''),(7,'10:45:00','11:30:00',''),(8,'11:30:00','12:15:00',''),(9,'12:15:00','13:15:00',''),(10,'13:15:00','14:00:00',''),(11,'14:00:00','14:45:00',''),(12,'14:45:00','15:00:00',''),(13,'14:00:00','15:45:00',''),(14,'15:45:00','16:30:00',''),(15,'16:30:00','17:15:00','');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `maestoCargo`
--

LOCK TABLES `maestoCargo` WRITE;
/*!40000 ALTER TABLE `maestoCargo` DISABLE KEYS */;
INSERT INTO `maestoCargo` VALUES (1045367082,5,4,4,'2020-06-23',NULL,NULL,NULL),(1045367083,3,4,4,'2020-06-20',NULL,NULL,NULL),(1045367085,4,4,4,'2020-06-23',NULL,NULL,NULL);
/*!40000 ALTER TABLE `maestoCargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `maestro`
--

LOCK TABLES `maestro` WRITE;
/*!40000 ALTER TABLE `maestro` DISABLE KEYS */;
INSERT INTO `maestro` VALUES (1045367082,0,0,0,0,0,0,0,'afp',0,'2222-2222',5,'2020-06-23','2020-06-23','2020-06-23','T','1','',4,'',5,'','','',''),(1045367083,0,0,0,0,0,0,0,'safvdavsd',0,'2111-1111',5,'2020-06-20','2020-06-20','2020-06-20','T','1','',4,'',0,'\0','\0','\0',''),(1045367085,0,0,0,0,0,0,0,'afp',0,'2222-2222',5,'2020-06-01','2020-06-02','2020-06-04','T','2','',5,'\0',0,'\0','\0','\0',''),(1045367086,0,0,0,0,0,0,0,'afp',0,'7777-7777',5,'2020-06-23','2020-06-11','2020-06-22','T','5','',4,'\0',0,'\0','\0','\0','');
/*!40000 ALTER TABLE `maestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Matemática','MAT',1,'c0d6c8'),(2,'Lenguaje','LEN',1,'bfc4de'),(3,'Inglés','ING',1,'9dc4ae'),(4,'Informática','INF',1,'c4b0c4'),(5,'Estudios Sociales','EE.SS',1,'8e8cb3'),(6,'Educación Físiaca','EE.FF',1,'e6ddaf'),(7,'Ciencias Naturales','CC.NN',1,'cae3cb'),(8,'Moral, Urbanidad y Cívica','MUC',1,''),(9,'Orientación Para La Vida','OPV',2,'a9aed6'),(10,'Seminario','SEM',2,''),(11,'Curso de Habilidad Laboral','CHL',2,''),(12,'Tecnología I','TG1',3,''),(13,'Tecnología II','TG2',3,''),(14,'Tecnología III','TG3',3,''),(15,'Práctica Profesional I','PP1',3,''),(16,'Práctica Profesional II','PP2',3,''),(17,'Práctica Profesional III','PP3',3,''),(18,'Laboratorio de Creatividad I','LC1',3,'f0b8f0'),(19,'Laboratorio de Creatividad II','LC2',3,''),(20,'Laboratorio de Creatividad III','LC3',3,''),(21,'Contaduría','CTD',4,'b5c4ae'),(22,'General','GNL',4,'e8d0e8');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (16018,2020,1,'C','A','\0','R');
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mestroHorarioMaterias`
--

LOCK TABLES `mestroHorarioMaterias` WRITE;
/*!40000 ALTER TABLE `mestroHorarioMaterias` DISABLE KEYS */;
INSERT INTO `mestroHorarioMaterias` VALUES (1045367083,18,1,1,1,'C','A',2020,NULL),(1045367083,18,2,1,1,'C','A',2020,NULL);
/*!40000 ALTER TABLE `mestroHorarioMaterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Afganistán',''),(2,'Islas Gland',''),(3,'Albania',''),(4,'Alemania',''),(5,'Andorra',''),(6,'Angola',''),(7,'Anguilla',''),(8,'Antártida',''),(9,'Antigua y Barbuda',''),(10,'Antillas Holandesas',''),(11,'Arabia Saudí',''),(12,'Argelia',''),(13,'Argentina',''),(14,'Armenia',''),(15,'Aruba',''),(16,'Australia',''),(17,'Austria',''),(18,'Azerbaiyán',''),(19,'Bahamas',''),(20,'Bahréin',''),(21,'Bangladesh',''),(22,'Barbados',''),(23,'Bielorrusia',''),(24,'Bélgica',''),(25,'Belice',''),(26,'Benin',''),(27,'Bermudas',''),(28,'Bhután',''),(29,'Bolivia',''),(30,'Bosnia y Herzegovina',''),(31,'Botsuana',''),(32,'Isla Bouvet',''),(33,'Brasil',''),(34,'Brunéi',''),(35,'Bulgaria',''),(36,'Burkina Faso',''),(37,'Burundi',''),(38,'Cabo Verde',''),(39,'Islas Caimán',''),(40,'Camboya',''),(41,'Camerún',''),(42,'Canadá',''),(43,'República Centroafricana',''),(44,'Chad',''),(45,'República Checa',''),(46,'Chile',''),(47,'China',''),(48,'Chipre',''),(49,'Isla de Navidad',''),(50,'Ciudad del Vaticano',''),(51,'Islas Cocos',''),(52,'Colombia',''),(53,'Comoras',''),(54,'República Democrática del Congo',''),(55,'Congo',''),(56,'Islas Cook',''),(57,'Corea del Norte',''),(58,'Corea del Sur',''),(59,'Costa de Marfil',''),(60,'Costa Rica',''),(61,'Croacia',''),(62,'Cuba',''),(63,'Dinamarca',''),(64,'Dominica',''),(65,'República Dominicana',''),(66,'Ecuador',''),(67,'Egipto',''),(68,'El Salvador',''),(69,'Emiratos Árabes Unidos',''),(70,'Eritrea',''),(71,'Eslovaquia',''),(72,'Eslovenia',''),(73,'España',''),(74,'Islas ultramarinas de Estados Unidos',''),(75,'Estados Unidos de América',''),(76,'Estonia',''),(77,'Etiopía',''),(78,'Islas Feroe',''),(79,'Filipinas',''),(80,'Finlandia',''),(81,'Fiyi',''),(82,'Francia',''),(83,'Gabón',''),(84,'Gambia',''),(85,'Georgia',''),(86,'Islas Georgias del Sur y Sandwich del Sur',''),(87,'Ghana',''),(88,'Gibraltar',''),(89,'Granada',''),(90,'Grecia',''),(91,'Groenlandia',''),(92,'Guadalupe',''),(93,'Guam',''),(94,'Guatemala',''),(95,'Guayana Francesa',''),(96,'Guinea',''),(97,'Guinea Ecuatorial',''),(98,'Guinea-Bissau',''),(99,'Guyana',''),(100,'Haití',''),(101,'Islas Heard y McDonald',''),(102,'Honduras',''),(103,'Hong Kong',''),(104,'Hungría',''),(105,'India',''),(106,'Indonesia',''),(107,'Irán',''),(108,'Iraq',''),(109,'Irlanda',''),(110,'Islandia',''),(111,'Israel',''),(112,'Italia',''),(113,'Jamaica',''),(114,'Japón',''),(115,'Jordania',''),(116,'Kazajstán',''),(117,'Kenia',''),(118,'Kirguistán',''),(119,'Kiribati',''),(120,'Kuwait',''),(121,'Laos',''),(122,'Lesotho',''),(123,'Letonia',''),(124,'Líbano',''),(125,'Liberia',''),(126,'Libia',''),(127,'Liechtenstein',''),(128,'Lituania',''),(129,'Luxemburgo',''),(130,'Macao',''),(131,'ARY Macedonia',''),(132,'Madagascar',''),(133,'Malasia',''),(134,'Malawi',''),(135,'Maldivas',''),(136,'Malí',''),(137,'Malta',''),(138,'Islas Malvinas',''),(139,'Islas Marianas del Norte',''),(140,'Marruecos',''),(141,'Islas Marshall',''),(142,'Martinica',''),(143,'Mauricio',''),(144,'Mauritania',''),(145,'Mayotte',''),(146,'México',''),(147,'Micronesia',''),(148,'Moldavia',''),(149,'Mónaco',''),(150,'Mongolia',''),(151,'Montserrat',''),(152,'Mozambique',''),(153,'Myanmar',''),(154,'Namibia',''),(155,'Nauru',''),(156,'Nepal',''),(157,'Nicaragua',''),(158,'Níger',''),(159,'Nigeria',''),(160,'Niue',''),(161,'Isla Norfolk',''),(162,'Noruega',''),(163,'Nueva Caledonia',''),(164,'Nueva Zelanda',''),(165,'Omán',''),(166,'Países Bajos',''),(167,'Pakistán',''),(168,'Palau',''),(169,'Palestina',''),(170,'Panamá',''),(171,'Papúa Nueva Guinea',''),(172,'Paraguay',''),(173,'Perú',''),(174,'Islas Pitcairn',''),(175,'Polinesia Francesa',''),(176,'Polonia',''),(177,'Portugal',''),(178,'Puerto Rico',''),(179,'Qatar',''),(180,'Reino Unido',''),(181,'Reunión',''),(182,'Ruanda',''),(183,'Rumania',''),(184,'Rusia',''),(185,'Sahara Occidental',''),(186,'Islas Salomón',''),(187,'Samoa',''),(188,'Samoa Americana',''),(189,'San Cristóbal y Nevis',''),(190,'San Marino',''),(191,'San Pedro y Miquelón',''),(192,'San Vicente y las Granadinas',''),(193,'Santa Helena',''),(194,'Santa Lucía',''),(195,'Santo Tomé y Príncipe',''),(196,'Senegal',''),(197,'Serbia y Montenegro',''),(198,'Seychelles',''),(199,'Sierra Leona',''),(200,'Singapur',''),(201,'Siria',''),(202,'Somalia',''),(203,'Sri Lanka',''),(204,'Suazilandia',''),(205,'Sudáfrica',''),(206,'Sudán',''),(207,'Suecia',''),(208,'Suiza',''),(209,'Surinam',''),(210,'Svalbard y Jan Mayen',''),(211,'Tailandia',''),(212,'Taiwán',''),(213,'Tanzania',''),(214,'Tayikistán',''),(215,'Territorio Británico del Océano Índico',''),(216,'Territorios Australes Franceses',''),(217,'Timor Oriental',''),(218,'Togo',''),(219,'Tokelau',''),(220,'Tonga',''),(221,'Trinidad y Tobago',''),(222,'Túnez',''),(223,'Islas Turcas y Caicos',''),(224,'Turkmenistán',''),(225,'Turquía',''),(226,'Tuvalu',''),(227,'Ucrania',''),(228,'Uganda',''),(229,'Uruguay',''),(230,'Uzbekistán',''),(231,'Vanuatu',''),(232,'Venezuela',''),(233,'Vietnam',''),(234,'Islas Vírgenes Británicas',''),(235,'Islas Vírgenes de los Estados Unidos',''),(236,'Wallis y Futuna',''),(237,'Yemen',''),(238,'Yibuti',''),(239,'Zambia',''),(240,'Zimbabue','');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (16018,'Francisco Antonio','Regalado Cruz','2020-06-23','hg,hg,jhk,jhk,jhk,jhk,h','',0,2,'01#01','8d2a5f7d4afa5d0530789d3066945330','',8,'','','\0',0,'Salvadoreña','','',''),(1000000000,'PAdre padrew','padre ',NULL,'','',0,0,' # ','','',11,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1000000001,'Madre MAdre','MAdre poisañ',NULL,'','',0,0,' # ','','',10,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367070,'Jorge Agustín','Ragalado Pereira','2020-06-23','dbfbfdbgdfgbfdbfdgb','',0,1,'02#01','ab8a338aa2b1da6d97c11ba6e67be768','',9,'','','\0',0,'Salvadoreña','dfbdfgbfdb dbfd bfdgb fd','',''),(1045367073,'Guillermo Aldolfo','Delsas Murcia','1991-01-17','texistepeque Santa ana','7033-7878',0,0,'02#13','02951a6cb9595ef475fed783e59c687e','Ingeniero de Sistemas Informáticos',1,'','0213-170191-102-9','\0',0,'Salvadoreña','guillermox020@gmail.com',NULL,NULL),(1045367080,'María Carmen','Peña Cárcamo','1980-06-19','dirección dirección dirección dirección','7888-8888',0,1,'02#02','6e80cf219e79bc8a8d83ce9a5b757f64','Lic. CC.JJ',6,'','0000-000000-000-0','',1,'Salvadoreña','dirección@dirección.dirección','',''),(1045367081,'Hugo Daniel','Flores Díaz','1980-06-19','dirección dirección dirección dirección','8989-8989',0,1,'01#02','ad9f88eb26394a8ad9f46975cf79a133','Abogado',5,'','0000-000000-000-0','\0',1,'Salvadoreña','dirección@dirección.dirección','',''),(1045367082,'José Antonio','Murcia Pérez','2020-06-04','lkhlcls clvsdv lsdkjv l','7777-7777',325,1,'03#03','4c247985fa19ff8622ae5790fe555953','profesor',4,'','0000-000000-000-0','\0',0,'Salvadoreña','','',''),(1045367083,'Laura María','López Súñiga','1975-08-12','ljkhfchsdh lsdhlshclsd hsl hclsdc','7888-8888',213,1,'02#10','a6ba5f99ff9616298b2212c76ea111dc','Profesora',4,'','0000-000000-000-0','',1,'Salvadoreña','sscacddvsdvfsdf@sdfsfds.dds','',''),(1045367085,'Francisco Javier','Magaña Arriola','2020-06-05','ohjoñhiohio','7777-7777',0,1,'04#03','b5664bd4412a50cb8bd29afe0fb168eb','profesor',4,'','0000-000000-000-0','\0',0,'Salvadoreña','','',''),(1045367086,'Juan Manuel','Bartanes Pilar','2020-06-05','hohhh','7777-7777',2356,1,'05#04','2f15e8410592b3dfe6205a4314e96bd2','Lic. en admón. de empresas',4,'','0000-000000-000-0','\0',1,'Salvadoreña','','',''),(1045367088,'Laura Isabel','Pineda Rosell','2020-06-02','jsakcsahdkcsh .kashv ksah vash','0000-0000',0,1,'02#04','c95b8be4befbee1a550a06fd19ed251a','Lic. en Psicología',14,'','0000-000000-000-0','',1,'Salvadoreña','','',''),(1045367090,'Pablo Alejandro','Martínez Santos','2020-06-01','edjl lc lice','0000-0000',0,1,'01#01','8912074c9b782911ff4f5585c747c132','lic',12,'','0000-000000-000-0','\0',1,'Salvadoreña','kckkvcḱefǘ@{ld{ld{dl.com','',''),(1045367091,'Alba Lucía','Aybara Campos','2020-06-03','sajfsvj{ps vposfj{psdofj v{spdjovf {sdpjvf','5555-5555',0,0,'02#13','f0ee269fcf3f4b1f8883aab03e6a7919','bachilller',13,'','0000-000000-000-0','',1,'Salvadoreña','','','');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personasReserva`
--

LOCK TABLES `personasReserva` WRITE;
/*!40000 ALTER TABLE `personasReserva` DISABLE KEYS */;
INSERT INTO `personasReserva` VALUES (1,1045367081,''),(2,1045367073,'');
/*!40000 ALTER TABLE `personasReserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proyectoPedagogico`
--

LOCK TABLES `proyectoPedagogico` WRITE;
/*!40000 ALTER TABLE `proyectoPedagogico` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyectoPedagogico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
INSERT INTO `recurso` VALUES (5000040,'Química I: Sistemas materiales, etc',500,3,4,13,'',18,'B','REAL','1',NULL),(5000042,'Química Orgánica',500,3,4,146,'',12.52,'B','REAL','1',NULL),(5000044,'Química 2',500,3,4,73,'',22.04,'B','REAL','1',NULL),(5000046,'Química Razonada',500,3,4,146,'',12.68,'B','REAL','1',NULL),(5000048,'Problemas de Química',500,3,4,146,'',6.01,'B','REAL','1',NULL),(5000050,'Química Inorgánica',500,3,4,73,'',26.77,'B','REAL','1',NULL),(5000052,'Física y Química millenio; enciclopedia temática del estudiante',500,3,4,52,'',10.06,'B','REAL','1',NULL),(5000054,'Biología; la dinámica de la vida',500,3,4,146,'',22.95,'B','REAL','1',NULL),(5000056,'Ciencias NAturales milenio enciclopedia temática del estudiante',500,3,4,52,'',10.06,'B','REAL','1',NULL),(5000058,'Enciclopedia de los animales + cd-rom',500,3,4,73,'',49.59,'B','REAL','1',NULL),(5000060,'Principios Integrales de Zoología',500,3,4,73,'',65.71,'B','REAL','1',NULL),(78885488,'Computadora Laptop',NULL,1,2,NULL,'',450,'B','REAL',NULL,NULL);
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reportePsicologia`
--

LOCK TABLES `reportePsicologia` WRITE;
/*!40000 ALTER TABLE `reportePsicologia` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportePsicologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'2020-06-20 03:27:32','2020-06-22 09:28:00','2020-06-22 10:27:00',3,1,NULL,'D',NULL,NULL,NULL,'','','','',1045367081,1045367081,'Hugo Flores¿¿4¿¿0¿¿¿¿0'),(2,'2020-06-21 16:17:52','2020-06-29 16:19:00','2020-06-29 17:23:00',1,1,6,'D',NULL,NULL,NULL,'45','4554','dfgdfsgsdfbdsgbdfsbfdsbfdsrbdfe','dgdhfgdfeghdfhytdrfbrbfdrtgb ',1045367073,1045367073,'Guillermo Delsas¿¿4¿¿0¿¿¿¿0');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reservaDetalle`
--

LOCK TABLES `reservaDetalle` WRITE;
/*!40000 ALTER TABLE `reservaDetalle` DISABLE KEYS */;
INSERT INTO `reservaDetalle` VALUES (5000040,40,'',1),(78885488,15,'',2);
/*!40000 ALTER TABLE `reservaDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reservaXpedagogia`
--

LOCK TABLES `reservaXpedagogia` WRITE;
/*!40000 ALTER TABLE `reservaXpedagogia` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservaXpedagogia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `solicitudReserva`
--

LOCK TABLES `solicitudReserva` WRITE;
/*!40000 ALTER TABLE `solicitudReserva` DISABLE KEYS */;
INSERT INTO `solicitudReserva` VALUES (5000040,1,'1'),(78885488,2,'1');
/*!40000 ALTER TABLE `solicitudReserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` VALUES (1045367073,'luna-amber',''),(1045367081,'pepper-grinder','');
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoCargo`
--

LOCK TABLES `tipoCargo` WRITE;
/*!40000 ALTER TABLE `tipoCargo` DISABLE KEYS */;
INSERT INTO `tipoCargo` VALUES (1,'Entrega del Ministerio de Educación',NULL),(2,'Donaciones',NULL),(3,'Compras con Actividades de la Escuela',NULL),(4,'Bono de la Calidad Educativa',NULL);
/*!40000 ALTER TABLE `tipoCargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoEspecialidades`
--

LOCK TABLES `tipoEspecialidades` WRITE;
/*!40000 ALTER TABLE `tipoEspecialidades` DISABLE KEYS */;
INSERT INTO `tipoEspecialidades` VALUES (5,'CC.SS',NULL);
/*!40000 ALTER TABLE `tipoEspecialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoMateria`
--

LOCK TABLES `tipoMateria` WRITE;
/*!40000 ALTER TABLE `tipoMateria` DISABLE KEYS */;
INSERT INTO `tipoMateria` VALUES (1,'Área Básica',NULL),(2,'Área Aplicada',NULL),(3,'Área Técnica',NULL),(4,'Modalidad y Opciones',NULL);
/*!40000 ALTER TABLE `tipoMateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoNombramiento`
--

LOCK TABLES `tipoNombramiento` WRITE;
/*!40000 ALTER TABLE `tipoNombramiento` DISABLE KEYS */;
INSERT INTO `tipoNombramiento` VALUES (4,'Propietario',NULL);
/*!40000 ALTER TABLE `tipoNombramiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoPermiso`
--

LOCK TABLES `tipoPermiso` WRITE;
/*!40000 ALTER TABLE `tipoPermiso` DISABLE KEYS */;
INSERT INTO `tipoPermiso` VALUES (4,'Enfermedad sin trámite formal',15,NULL),(5,'Enfermedad con trámite formal',90,NULL),(6,'Enfermedad de pariente cercano o duelo',20,NULL),(7,'Asuntos personales',5,NULL),(8,'Maternidad',90,NULL),(9,'Paternidad',4,NULL),(10,'Faltar a clases',60,NULL),(11,'Retirarse de la institución',60,NULL),(12,'No portar el uniforme',90,NULL);
/*!40000 ALTER TABLE `tipoPermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoPersona`
--

LOCK TABLES `tipoPersona` WRITE;
/*!40000 ALTER TABLE `tipoPersona` DISABLE KEYS */;
INSERT INTO `tipoPersona` VALUES (1,'Administrador','fa fa-diamond'),(2,'Director','pi pi-circle-on'),(3,'Subdirector','pi pi-circle-off'),(4,'Maestro','fa fa-street-view'),(5,'Bibliotecario','fa fa-forumbee'),(6,'Administrador CRA','fa fa-transgender-alt'),(7,'Laboratorista','fa fa-android'),(8,'Estudiante','fa fa-child'),(9,'Representante','fa fa-user-secret'),(10,'Madre de familia',''),(11,'Padre de familia',''),(12,'Colector','fa fa-cc-mastercard'),(13,'Secretaria','fa fa-database'),(14,'Psicologo',''),(15,'Ordenanza',''),(16,'Vigilante',''),(17,'Mantenimiento','');
/*!40000 ALTER TABLE `tipoPersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoProyecto`
--

LOCK TABLES `tipoProyecto` WRITE;
/*!40000 ALTER TABLE `tipoProyecto` DISABLE KEYS */;
INSERT INTO `tipoProyecto` VALUES (4,'Proyecto Planificado',NULL),(5,'Exposición de Alumnos',NULL),(6,'Clase de Docente con Tecnología',NULL);
/*!40000 ALTER TABLE `tipoProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoRecurso`
--

LOCK TABLES `tipoRecurso` WRITE;
/*!40000 ALTER TABLE `tipoRecurso` DISABLE KEYS */;
INSERT INTO `tipoRecurso` VALUES (1,'Tecnológico CRA',NULL),(2,'Laboratorio de CC.NN',NULL),(3,'Bibliográfico',NULL);
/*!40000 ALTER TABLE `tipoRecurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoReserva`
--

LOCK TABLES `tipoReserva` WRITE;
/*!40000 ALTER TABLE `tipoReserva` DISABLE KEYS */;
INSERT INTO `tipoReserva` VALUES (1,'Uso en Sala',NULL),(2,'Uso fuera de Sala/Aula',NULL),(3,'Uso en Aula',NULL),(4,'Uso fuera de la institución',NULL);
/*!40000 ALTER TABLE `tipoReserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoReservaRecurso`
--

LOCK TABLES `tipoReservaRecurso` WRITE;
/*!40000 ALTER TABLE `tipoReservaRecurso` DISABLE KEYS */;
INSERT INTO `tipoReservaRecurso` VALUES (1,5000040,''),(1,5000042,''),(1,5000044,''),(1,5000046,''),(1,5000048,''),(1,5000050,''),(1,5000052,''),(1,5000054,''),(1,5000056,''),(1,5000058,''),(1,5000060,''),(1,78885488,''),(2,5000040,''),(2,5000042,''),(2,5000044,''),(2,5000046,''),(2,5000048,''),(2,5000050,''),(2,5000052,''),(2,5000054,''),(2,5000056,''),(2,5000058,''),(2,5000060,''),(3,5000040,''),(3,5000042,''),(3,5000044,''),(3,5000046,''),(3,5000048,''),(3,5000050,''),(3,5000052,''),(3,5000054,''),(3,5000056,''),(3,5000058,''),(3,5000060,''),(3,78885488,''),(4,5000040,''),(4,5000042,''),(4,5000044,''),(4,5000046,''),(4,5000048,''),(4,5000050,''),(4,5000052,''),(4,5000054,''),(4,5000056,''),(4,5000058,''),(4,5000060,'');
/*!40000 ALTER TABLE `tipoReservaRecurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoSueldos`
--

LOCK TABLES `tipoSueldos` WRITE;
/*!40000 ALTER TABLE `tipoSueldos` DISABLE KEYS */;
INSERT INTO `tipoSueldos` VALUES (4,'Sueldo base',NULL),(5,'Horas clase',NULL),(6,'Ad Honorem',NULL);
/*!40000 ALTER TABLE `tipoSueldos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipopersonaPermiso`
--

LOCK TABLES `tipopersonaPermiso` WRITE;
/*!40000 ALTER TABLE `tipopersonaPermiso` DISABLE KEYS */;
INSERT INTO `tipopersonaPermiso` VALUES (1,4,''),(1,5,''),(1,6,''),(1,7,''),(1,8,''),(1,9,''),(1,10,''),(1,11,''),(1,12,''),(2,4,''),(2,5,''),(2,6,''),(2,7,''),(2,8,''),(2,9,''),(3,4,''),(3,5,''),(3,6,''),(3,7,''),(3,8,''),(3,9,''),(4,4,''),(4,5,''),(4,6,''),(4,7,''),(4,8,''),(4,9,''),(5,4,''),(5,5,''),(5,6,''),(5,7,''),(5,8,''),(5,9,''),(6,4,''),(6,5,''),(6,6,''),(6,7,''),(6,8,''),(6,9,''),(7,4,''),(7,5,''),(7,6,''),(7,7,''),(7,8,''),(7,9,''),(8,10,''),(8,11,''),(8,12,''),(12,4,''),(12,5,''),(12,6,''),(12,7,''),(12,8,''),(12,9,''),(13,4,''),(13,5,''),(13,6,''),(13,7,''),(13,8,''),(13,9,''),(14,4,''),(14,5,''),(14,6,''),(14,7,''),(14,8,''),(14,9,''),(15,4,''),(15,5,''),(15,6,''),(15,7,''),(15,8,''),(15,9,''),(16,4,''),(16,5,''),(16,6,''),(16,7,''),(16,8,''),(16,9,''),(17,4,''),(17,5,''),(17,6,''),(17,7,''),(17,8,''),(17,9,''),(17,10,''),(17,11,''),(17,12,'');
/*!40000 ALTER TABLE `tipopersonaPermiso` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-24  0:19:28
