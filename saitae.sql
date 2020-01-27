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
REPLACE INTO `acceso` VALUES (9,'Administración',NULL,'#','fa fa-cog'),(10,'Sistema',9,'tipopp.intex','pi pi-folder-open'),(11,'Permisos y Licencias',9,'lictp.intex','pi pi-th-large'),(12,'Académica',9,'academico.intex','fa fa-leaf'),(13,'Perfil',NULL,'#','pi pi-user'),(14,'Permisos',45,'#','pi pi-eye'),(15,'Solicitar Permiso',14,'permisoE.intex','pi pi-briefcase'),(16,'Personal',NULL,'#','pi pi-users'),(17,'Gestión de maestros',27,'agregacion.intex','pi pi-user-plus'),(18,'Gestión de administradores',16,'agAdm.intex','pi pi-plus'),(19,'Plantel Institucional',35,'plantel.intex','pi pi-table'),(20,'Inventario',23,'inventario.intex','fa fa-barcode'),(21,'Libros',23,'libros.intex','fa fa-book'),(22,'Nuevo Ingreso',36,'inscripcion.intex','pi pi-user'),(23,'Recursos',9,'#','fa fa-yelp'),(24,'Nomina de Alumnos',36,'nominaA.intex','pi pi-user'),(25,'Gestión de Recursos',23,'admRecurso.intex','fa fa-table'),(26,'Lista de Representantes',35,'listaRepresentantes.intex','pi pi-list'),(27,'Maestros',16,'#','fa fa-puzzle-piece'),(28,'Gestión de horarios',27,'horario.intex','pi pi-plus'),(29,'Gestión de permisos',14,'permiso.intex','fa fa-legal'),(30,'Solicitud de permisos',14,'permisoM.intex','fa fa-ge'),(31,'Administrador de anuncios',9,'anuncios.intex','fa fa-bell'),(32,'Matricula',36,'matricula.intex','fa fa-slideshare'),(33,'Entrega de Útiles',36,'paquetes.intex','fa fa-sliders'),(34,'Contribuciones',36,'contribuciones.intex','fa fa-money'),(35,'Listados',16,'#','fa fa-list-ul'),(36,'Alumnos',16,'#','fa fa-graduation-cap'),(37,'Reservas de Equipo',45,'#','fa fa-gamepad'),(38,'Solicitud de Reserva',37,'solicitudR.intex','fa fa-flag'),(39,'Historial de Reservas',43,'solicitudH.intex','fa fa-archive'),(40,'Gestionar Reservas de equipo',37,'srCra.intex','fa fa-certificate'),(41,'Historial de Notificaciones',43,'notifh.intex','fa fa-forumbee'),(42,'Proyecto Planificado',37,'solicitudRPP.intex','pi pi-pencil'),(43,'Historiales',13,'#','fa fa-folder-open'),(44,'Historial de permisos',43,'permisoH.intex','fa fa-database'),(45,'Solicitudes',NULL,'#','fa fa-street-view'),(46,'Área psicológica',45,'#','fa fa-ambulance'),(47,'Solicitud de cita psicológica',46,'solicitudCP.intex','pi pi-bookmark'),(48,'Adminitración citas pscológica',46,'admCitasPs.intex','pi pi-calendar'),(49,'Consulta Psicológica',46,'consultasPS.intex','pi pi-window-maximize'),(50,'Historial citas Psicológicas',43,'citasPSH.intex','fa fa-file'),(51,'Horario de clases',13,'horarioCl.intex','fa fa-calendar'),(52,'Aspecto de la aplicación',13,'temas.intex','fa fa-picture-o');
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
REPLACE INTO `constancias` VALUES (16020,'2020-01-27',4,'2020-01-27','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0e\0\0\0]f��\0\0\0sBIT|d�\0\0\0tEXtSoftware\0gnome-screenshot��>\0\0 \0IDATx���w\\S���O�{��UPĽ\'�*��f����Վ_��Uk[Z�:p��j_g���\"�p\"@@���	��܄�xޯW_�ܓs�3��y�I$	8HKO���k��+��oU@sB�A����Ru���#\'�D�u�5R��Fj!�B!�m	!�B#�(B!�F�Q$�B!�h�H!�B�F�B!�0��\"!�BaDEB!�7`�\rN	�	!�B�~Z4G>���K24R����g\Z��B!����������.=B!�T`h��0m	!�B#�(B!�F�Q$�B!�h�H!�B�:\0RZ�\ZG���fIp����	�+�0�)�\0�2p)Y�}�B���nl��5@�����1�\r�.�\0�ň?(��_��n~��\0n�q�Pڮl��	o�}��3���D���01��ٛ$����N�(�o���+*��\0x���+w�w�P�O<\0�-�G[�\n0i�;H\n��S%F٘x���V��i���b������Uc��>\0`fe����jn\n\'D�<y��Ne#�_��6!�M��bP͆���016l�3�1�.���c+s����?̰�g��N;����Z70�7K3�6�Ō������M���L��\"���X<���ڮ��!&\r���)IǲU�OC���!;��\r��ʒs�oG[r��[���1��+s�F�<�m\r�f&8q)��\nJm@��2�V<�0���*kk�C��0�Z[!�$if	!�&�Q�c�ހg\0�74Ə�mѾ�160�\0#�AS|;�F�\\��>s4���X����|Ԫc��C���d�\0�����Č��jW\'C��(]N��@X[�~Z>�l�C�G�v6GPgS|V���+3�l�S���ML��84�0�+Ӿ�\0`��9�7�g+S��\"�e���0u�\rZyc�?9ػK�91�*��+��� �}���#�a>LLy����[��с�!��]�I��\n\0����ً�����X�f&\0�?bx|7�l	��Æ�\0�Wsƺ�9ܿ)����r�Z0�cӦA�m�~^�ȇX(��#\"L��۷3�UWq�o�O�ulaA�G�� ȑ�cS������M�E+cl;\"B�\n�D@�����TZ���²����b�7�?V��;!��*:���Jދ���<�e\0`��O�#k]����sS�:k(9+����������nW�%{��Q��rQ�}D�O��k�5��������	���KkS��7B��|�b�n�-\\���}N�q�\\��pv(��у��N!��:�Xd�Jp�R���c����}k����x<�rſJ��+>KY�PN�F�J���A�\\��ZuC�������|��K�o��]KSiUc42�a�a��1�J�ՙ��1k��#�B���(�1.���		�B��j:����oP���\Z\Z�}K�n�©����^�}&S.��F�<�8\Z�Û�3qN�;Eqާ��˷pu2D�چxr_�us5�ޣب�	揲�ȾV�~�\0�c��\r��a��0k��:�4ž�˶��8w�{������g��|��EU�����v6�G#ܾJ�p&�R��b%q�o\n$@__s�Z~:u�F�c�\0+x41��9u\ZcԀ³a�n�2�gh�kb�Q�K�K/���kskX�`���r)�>]½\\����~V��b\0s�-���Ч����\0((j�����.�\rQӑyyרf�\ZuՊ���ㄸr/�},Q��q�r��2�΄�h�z͌ad�CČ���\"�s{�BHY��J���\\�#F��&�����E\0�c�E�nmW\'C,�d+����?����g�J^����G$���x I�i�����]��\\ƕ\0{����9*�okS4t3��o���r�%�ӥ��7W�E�v�9��C�?}�#���X�}k3ħ\nՎQR\0�����9v�a��K?���O�䒱��Te>����)jU7������4��B�Eg+�CE�&ʞUgK���8���� A~Aab�}��`��L䋙oΓH\n}ǟ���_>@���峹�e���!ʑ KP����ú,ܻ����C�Y����/*@�X��g�\"F�STu\'?p:���ٱ�[��^ˑ+{��]��Ę�/��?>�̔�cl`d�c-�6�B	�_���39�x_���/*���y��/љEB!Z�����j@!�B4M����8�=��2C�UCg	!�B#�(B!�F�Q$�B!�h�H!�B���u�B!DM<�κ���O\"Q�G�\n�����յ��AE��*�9!�uCw�z�:��ӑ�g\"�X���\nJ��.=B!�F�Q$�B!�h�H!�B�F�B!�0��\"!�BaDEB!�6��B!�m	!�B#�(B!�F�Q$�B!�h�H!�B�F�B!�0��\"!�BaDEB!�6��B!�m	!�B#�(B!�F�Q$�B!�h�H!�B񞤥I�����X!�B�\Z����X��z��\\]9��}-\0����ҟ+��oU@sB!�u��Txu�U�a�rp���R����cc�Jax�?W-ު��B���gIY�=��B!�m	!�B\0�����:�AEB!�\0��u���!��?��P�J�(B!�TVL�uz�6��B��c��[\0�u���HOx���jv�������/�j�<O}ϩ���%e�!��f|,\0��C��XY�ȕ\0C�=�6f��4x+�s�����uǨ!�P��-�ff�P�l�|�	c\0P��ƍ�D�FN\0��_b��KH������\\pO�*�K��P���FEB!�H)ڠ��}�j쌹�O���T|�]�L���џc޼�r�Uu�can�Րr�5j�w�nKj��\n{3<}��Z.6������Xz�E�Z�i^����f�a����[���Xg�հni�gd!t�n�x<���\'6,FĔ}x��^�|h��MW��A�:�ݣH!���x8\0�^y�<�G�MJ����M��r�>B(�e��\0\0-Z|� b��Re�h\0\0�i�\0@@�����\0�l�u\r�|1��\\���B8ؚ+l��!�`bb�U/�}�\0�^�z�E��\Zadx[��BQj�Xõ^�2�Y�ujm	!��T��\0�U���_HK�iP\r�H�hld���_�]�b�f5p��K��ʕ3�0�o�ڸ��\r�_z�{)o���6��2��\0\0iE��߽�cP�v���i��j�\0���J�؝�\0@��ɕ�07F��;Է���-Eujm	!�\"u��X���}��I$��5]�1}Tl[=1[�P��S��3��p��3�i�C�i^�<-Uλ�;L�\rq�L������\0>�u�el�\0\0��<���Xn4E�\\�c�?��lB��߃�w]X�Ņ�1-K���Q$��0zl����믏�:\ZB�,E��}x+��EI���\0�\ZWGH�������b��=ej��tL���<`oc��W�K��Yt�9j�\'�FzJ�Z��\0�y/�g��053F����:~��G;sX٘\"�}6\0�ʺp��63�TyAf6N]LE�^�!�n��Qv��:u�:�H��������c$g`���˹�9[�������\0!�͐�\"��?��w�D�5��,>~��=y�m�Հ��\0 �~��c���\0\0��6ؾ9�#�+l���g\0��-\\��5n�\0�Xt������l�g.��F��@EB�^X�c\"֬<\'MaA�/�}�G�F���F&���\0�t�F�?w%\r�\Z8�ܕ�RǺ}Q<���\"��ɳ���ݺ�\0l�s$�\Z��&�\Z�kڢ��}eK�5���c������5읭0a�\'D�y�\Zs��9)w_��{!,-���c�ש	zq�����V�G��Xٙc���<d��Ò*y?���l\\����_��c� ��f������Y�\\us7�R��sB1��y�?�\\����ե,\'�z;.㨉f\0�b�T]O\0�k@���;��c�j�U�VQ�\0�Ѥ:Ə�\\:&Wo���M�c�}��yS�?.��N�x����qYSD��c\\<�k7\\\0ot̙�۹����p�V���F�=9{6���΁_�\0�:���N� 2�5���؝בz�\r�w�#�����x�^�5�.c�6�\r\0<���ΊǄQ��u�Q\0	��~����2-S��v�\'���/8�Mј����Ŧ͜q�^�7�\Z5s�/u3�u��������j��:=�T�\0����y~X�2��q�����I��e���f��������rZ�~z�T���k=�.�X�f��Sw=)z\r�s�2u�\\]\\�VQ�n��nY0ҟ}��Ɋ�=�~Y0FL�\'����)c�%q�{�N<l�l��\"�(��Wϲ�����TW��e�t6U�wٟ#�0����m�:�^H����J�����k̜yH�s��w��C�{��s4Qgy���\Z��p��X��}\0|��̉�X�]���#�*�@$\\���_4��9*(\\9_�Hy((�r7�Z���i�X��RQ�m�)�Iŵ���%���9��XO�^���L\'kW�����m`jl�5�/}\Z��aff�C��\n��NUe�)���*!D!�n_<)�)����r����&�E̖u�B<�_x\0\0�M~��\\���\0��RXF��M��]R���X۶�!}�KN*.�թ3�\\r���CL����5����t�v�y��i^8&woˌɭ�1i�R���&p��k�;u�u��}_%�0���gCxԶ��HN{�N�a1*���A���s�a��s\n�\0������OI\n�S%w��u��+*���Z��SN�F���+M5���:�qTt/˷?�Ą����WL�\0��\"�.Iģ;����Sg=���+ٞ͡X��E�mSg���el��4&�¢1�V/ǚ������ލ�V�������g�2�S�yV�}��N�E��Hy��⏨����f��c���b�����o�L�p$v2�r��Z������T��$+��z33s��q�Iť�:�q,K3Ur�����^�����:c�..c��ͷ���h�8&oމ��J����I�owr�OJյ�%�[{l�2Ϫ�)B;�^z��V@��.8sb,������q��X���~O�������+i��S8մQXN��M\\�.�I��z/�,��kN*e���e�r���CL���D����Uwlo?(G�1�v�ӥ���\n7s�����\0��էo�k3^ey��J�yVgMB��Fq���8y�?�\\p>~�p�t\nf/<�u����<������+,�N�&�u˲w�a퐓��-E�r�I���:uǑK3ur�������e�Z�������@RjLrr�mק�c�\0\0��oSKc���\0l�{���e�{WV��S�}��L痞�7r¯+�\0Z4v��u�u�f\\����#�{4���W��)�n�&.u;sb,r�>��,��4�לT��!��2�e�a�N1U�}�_��s=���*�������$�\";`��p\0@�W��X.�ˮ�a``�>�`Ā�x�!��5gq��m���%^&ly��h3���k��?.�@����暯�*�I$7�0����=\Z\0p��8��AE��*�9!D�[B���-�����K���!��NNA���:��l�4��?W�CzF��M�������\\^L�����~��\\N�v޵��\0i��9�N��^�{_�|�Wn=�KE�oΞ��)�9��u�H��\'�!DO��\0з)���T=��7�,w0�|�U\r��B��ڿ�&\'=��^Mq8vD����Tv��7�%w0�|�U���Q$��,O�K\'a��!D���n@�����撯����\"!�Bt���b��7�%w0�|�U\r]z&�B�^�T�aUs�嫭jh�H!����|�\\ss�W[��F�B!z�8/��7��n0vn�|���9߰��)k�`�Sn�.�µg�3�\'�Ĵ1^H8�?��GK=�t�\"!�B�S�u���{��3�TW�0�zm��9�����o���Y���8k[U\r�Q$�B!�h�H!�B�F�B!�0��\"!�Ba�{��&�R�����c!�B!j���R�w3c�F�5rsu�\\8�\0�?��\\T�x��B�.�.>�:��0H90��y��T�߱Q)=��c��\"�h�V4\'��]�>Kʊ�Q$�B!�h�H!�B�F�B!�0��\"!Z�	�����t�VT��BHU�ŏ��|)�{��iX�����63�|��55��{�t|��u�8,|���c��c/0;{���<5/����a�����*0m��b��~�3����l)���q��� \"�dc�Fˣ�|�hSE{�RY(���ž��ҋ��q`in�{;��Q����?���m[бy���N-Z��ۤ��޼�[�A,V�����\n���B\")��r�ݰ���hܲ6��#*,Ʊ����3�Š\r\\��o��_*���o�G���t\rwLqs-W�W*�k��ʀ�Z���J/6���Nb�\0�ml0��N�]��6�]���]����}}���Y��w�`Ѹ	�����₽���O8�?8��#3+K�Xɳ%F^�x����a!�.�Ѕ99h\Z��2ϗu��]�E�yR�yy8�|��\\�qc���#/O|�n-\0 ��e�������rX��3����_����rX8j��-G�)���b1\\�a��?��\0x��\rzN�\n������L>_i=\0�����D�W3����\\�{GzLv~��z��Ip��/&O@��\0��n�A�z4u��v�>�q�h�qPg]����T�9n}{��Y��j�q�W�����Y9b1j��Ǐ½0܂����l8�:���ַ�\\l���f�߉h>$����f�0��v@���ZT4^l�Bر}V�b_QY��F���4���1������$U�m>���N.\0\0W\'g�gdH�M	S���b����/(\0\0H$���ON���mlУClM8,����{��{g$��߇����\0�z�iOG�Px6h���\0�Y+�c�\"�`���bڊ_8�U۔�k��U���wbv��;dg��������lH\n\n�\Zw\00c�h��G{��]�Ƙ�>Zi=\0���^�M�z e��>Q˗2����5h׸1����-0/z\r\0�����))��=�&G��MK=_�u���o�ע��7n��ĵ��y��K\\l��ejl�P�[����,�2sW�ƽ�T����QS�b`�_�6���+���-�>��C�b�U\0J�Ƙ֢��b���Z���J/6�|�R���zuČ�~�z���\\���\0\0�LL ��V��Fn�Q��[\n?�$�Du;;4u����SBB��� [���cJ(� ������0<�\'\0`X`O�O���\n�>�tu�6���	f&&��z��ү+w�`܀�������!�K<�|�����\0�sׯcF�PX[XbjH�\\VZ�>>I�^�������D߮��ac_�ݸ�)�a����ā�q19Y\Zg�@�YC����}||�T�)�T]l��|�.��kKD�f��r���#���A J����ŋׯ0gxcl��֦���s\n�߼F��?����f\\�\n�K�z	!��b_QY���Y����\n�z����%����Q� ��iaf�l�����́��y��\n	���� ��7o��9?��K\r4uwǁ����o�ٷ�-[��ə���CHIK�M�Ƿ$���p���}�_̏^��gO�]�\r��q�W�@�j6�\0\07g�Ru�88H�Dp\r\n��.{�([=l������Vi_2�Yp��\0T��+u���]�1Scc�s��`�/_ ���t,j�Iy�OY\\l�a\"�&\08��dl���f쒟���-�2a���tR:�n�0ٵ�6^��KQN���J/6�5�W_(Px����P�m�:� �U\Z��!-#�k�(S}]۴���\r�Z�;,���E�v�ʘ��C��##�|�N����!�?�+x�l��}{�t�¶6:���B�:���a��٘��O6E.\\�ƌE�Og\0�}���tUk�����8���٫�g�d��hg�\'qamaY�[=l�coc����µ�k_lm�63�x���i��D�u���ﳲ�do��kOVy��-.����������z\0\0 \0IDATY��gX7{.$	�;�Q����\nۑ]�l�j���t�������soo�u�>�m�Nth�B�mv�ؤDd	��MJD@�2�9i�`l�����!��]�Uá3��	�|�vX�|�i��j���ys�����z0֑x�2��-�6S\0���\rvV֌���k�£�����\0xԬ��n������1;P�������m��گ��\0YB!~߽��ή��cy�sr��`��FI����6>�ڷǲ�ې��cO�I���ضO��X�g�\"��T���P��V��cC��EBl���I�m%�w���b�OY��/[��Ǐ�������5k�e:(�\Z+�m���%��G���J/6��B�����?�N]����5��f��Ḑ|\rC�����>Dz���S�\rOٟ��Ew|޼9}ѝ����_b�o+�4<-�Ճ���܇�ԐP��z�0>\0��@Hw?�c!���G|�2{-A�ٳPP�kO��~���ϸ��Բ��N�#9�Q[���1c��H�\r�w˖�u.37>�ǀ�X��#����a�E�\'\"��S��K�nŪ���}�v2�\r���Ǣ/��˺P��c�cwR\"����u�F�27gܐ�w���b�OY��/[��\"Fb��M���~Z,w{I��X�~��[����>�u����x��|��x�<jF^��s�郊���X�g��[���&�$��;���g�.�z��*�B��X�zC��Y]�Aʁ��\'�{�A]���U�g����q��5�^�\nߏ��p�ڠysWt�~Y�v�n�@��h�B!��_f��\\{���-����%�ID� �^�;^�{�&X7�k�֣M�.!��\Zm���㉺���ձ�F�d����&Z�Bt�.=B!�F�\'ii���R��M��B,+L���*Z�U�	!�h��Vb��ԗY̌�\nJ����Lt��B����\\uз�	!�BH���\"!�BaDEB!�6��B!�m	�\"�H��D�ߧ�P�������/BtO/6���[�?m����{�t�\nD�Y��A �;������VZ���\'�]��x���Z���C�0��D���q�6Ek1h[���\\O\\��E�Ƹ~�u�b��r]��ѿ��^TY;�U��b���gy�w��������E�Տ_<�_�$8��G�/G���dDW9��F1��%�����A=zh��%۶�c���+�Z���;�I���y�=�X�<������S���{v���F�q�����pl<�Z��ϴ�6p헾aJ�������/�pMST�Wk�,�Ť��>˓��/�_�>��-Y��m���8�_�� ��A/6���fe��];�l��π�x�v���%��v�q��������q8Փ%���{O%�=�p�p��GfV������6�����,4\rAv��.��AӰ��y��+�-�ϓ� �����[��:����4yy�uk\0�W.�m�pT�����e��������Q�O/l9rN~�H$����\'6�	�\0?\0��7o�s�T8��_�$d��J����uf&����\0?xFF���;�c�����+�EM�K�\0|1yR_�\0\0��p�֣	��?������GK��:낭�w�����p��Ϟ�{�l���?.q����������5���G��?n�A�~�6�C���p��[��㠬����w\"�	��w�1��]P��ɴ���#��)�#U_+�bg���T�gUc���:Rvl��!~~�6�ff��Ó/�9��C�6���A��jV�������@M\'\0���3�32�Ǧ���T���p�f�\0\0$	~��\'��%�66�ѡ�&�{|��=�򂽂3�������`d`�	a��Km���(<��`�x\0�����1c�~0SBB1m�/���m��5w�*���;1�p�������`flQN6$H�;\0���W4qwǣ��Ѯqc�_���}|f�^��u=���\0����K��u�\Z�k���w���\0`jl�H�����e���㦍���κ`��7�k����cv�ڃ�\nǿ���%.��0Q�v�ejl�P�[����,�2sW�ƽ�T����QS��J_���+���-�>��C�b�U\0J�>��1�zd?Es��kEQ�L45����j���^Gʎ�:2�̊�*͉˗кa��\n��ћ�� [�ؤ$LZ.�rsa^���LL ��V��Fn�Q��[\n߸�$�Du;;4u����SBB��� [���cJ(� ������0<�\'\0`X`O�O���\n�>�tu�6���	f&&��OR9=O۸����;7` l��0yp������>������)\0����>���\Z��+�����OҿW0ep(�-,�߷+.l��ؗs7n`Jh�-,1q�`\\LN�ƙ%`֐a���D_<��G�,U�[/߻�q��������\'����,.����e�(j���A J�����_a���>��WG[;����y�p?���yCɴ���#���̑*���+�G��T�gUc���:R~�>Iż�X2a��C���t@������f�`gm].�Y��![,���)�ss`en^���BB1��%����͛�b�t�ϭ�RM��q��?���k��w�Vpsb��;�!%-\r6]|�ߒp�CÕ����1?z-R�=Ev6Țƥ_Y!���\0ܜ]J���� �Y �5(P�����l���O�[[�}��g���\0P�ήԥ��v��L��΁�낭�|�@zұ�m&��?eq���$.kG���\0�E㠬\\�\Z��\'��u�Lg{{,��έ�(�Sv��G�>)�#��Ub��|*{��\Z���ב�q3�ϛ�_�LC��\rtN��7�C�Ρ��o������Wh�ꆴ�ԮQ�L�um�66�j��03�mە*cnnq~>L�����;�c�Ç�����ݲ���E���\n��t� n��M�K����AsgcZH���\"���1c��\0`߭�*]�\Z.������\0���x���,O1G;;<�;k�R���a{[�|��՝X��`k����pvp���LN�/&��e�}��\'{{d�X{�ʻlq���$�k��hC�\Z�a�칐H$�~�F-^���*,/����#[����׊*�kj>��Gq�]_���={�\Z�����QS�ӫ��é������)h�Q������I��\n����^e�sҠ���ɃC��T��CgN�/b���yckӠ!\Zծ�A�根����`�#��eX�[�} @CW7�YY3^�q�U���#7/\0�Q�\Z��Fn^>���@M<z��n�5�k��{x`C�d	��}�.�:��k��1; �����q�\Z%=�V��tk�˶oC&��=I\'�6b8c�>�Zc՞]d��bg�[�RyL\0��BY[կ�\r��	�1>&E�]�T��c���?����c�\r�Ǐ�������5k�eI(��,�m=��I�9bk��K��|*�*���{)s֬BH���<�a�7Ō7o�Y�j��ެ��q!�\Z�ĵ��1#|���l.GU�:��;>o�����x|��/1��h\Z������R�MwjH(�^��iaC�\0�� ��㱐�~�#�tZ�=�����Y�?���5�\'LD��_�g�htj�\n_�F�ё���-\\��Ø��~$͇���eK�:���c@_��������cl���Ϣ����)�\r�%[�b��Y\n�>;������c����e](��;)M�Bкa#X��3~��w���b�,�k��hü��X�yj��Ǆ��ݚR��Y�zT6~\\�m��b/U��SY�U�]���}V�MJĢM��3�?�Óp|���xҼ`F^��s�郊���X�g������&�$��;���g�.�z��*�B��X�zC��Y]�Aʁ��\'�{�A]���U�7g����q��5�^�\nߏ��p�ڠysWt�~Y�v�n��\rʚ�G�h]B�5��2KU���lm�m�(�/��O\"za������;4����9_�m�uA!D�h���O�uF���4�\'�4U�6Ѻ ��kt�B!�0�=IK��e��nn�Tb��\\SK�UE��*�9!���٪C,��2���XAi�з��NМB�vѷ����3!�B)w�Q$�B!�h�H!�B�F�B!�0��\"!Z�	�����t\n!����(^�\0>cGù�?|ƎƵ���f&��޳��FP zϚ�������5	�=�����p;Yi}�������:&����M�L*����C�1�p���� ��5�^e�:,�d���eK�]�h���_km�ZN���ʲv����z�mOq�2N\\�HS�h�HSs���I��h�\rҋ�⸟cd��x�/�{���h��%۶�c���+�Z���;�}�g�btm����atp?D��Li}�����X����Y�c���\\��q?-Ƭ!���`.n܂Fnn���r]��Sʟ��~���k�\"Z��hj�4�>�d,�u�S��h�D\"��#GtF����O�\"�G\0,��0<�R�ӵ�汋1�kW�XZ��o�xAz,���Æ���a~~x��k]W��?[��\'EA����ɷ�u7)ii0���7��\0�\\Fۈ���-���LU�/���/�Ϸ�LLP�Z5�0f�-�Y���7o�s�T8��_�$d��\0��n�A�z4u��v�>�q����e��p�����S�\0�yy����f�)����t�����b��z��Ip��/&O@����,��T�9n}{���3��B�1�����CB���mFékW��v�bV4.�������+\0�O�FP ������Ʋ���6L��ϋ���ʜ��v�d����<�M�?{m\Z6�u��^l=�5���d����x�h��6���@M\'\0���3�3>]ތ���l�\'._B농X�Z��#L0�.?����\0\n��`�x\0�����1c�~0SBB1m�/e�[Eu\'�?��䭴܌�����;�ݏv�c��h\0���1\"�SRpk{�M��6*}���1D9ِ 5�\0�y��z%���@ʾ�3|��/e����5h׸1����-0/z\r�8K�&z-�x{�v�N\\{p��X�k�o�������ᣘ9t(�Y@�����q)��\ZB���[����X�t��\n�W�?��c\Z��Α���ʜc;�D�k�������1\Z�͇ҋ���)Ӱh�F�}��o�?M��z���\\�m�LL ��.U��T̋^�%&*�\'������0<�\'\0`X`O�O���YY�⸺ezu�3�ă\'��w��x�����J7����ع��1#|(�-,15$�W.(��AYf\rkK����S�\0�=����}����\0��$�{S�����}��M��9w����������dNq�t��]��?����,߆�>�����9��o^#����P��e#֘�m�=;;���%���k��3�S�?U篬s��=U�L]�^��>H4������\nuk|��P*#]\0\0S~Y�y_b��?v�<�I�~���Wk�M33d�Ű05Evn�����Ly�����)�Ъ~��lN8���4�t�{|K�!L\rW\Z��W����Hy���ժ���O2^���\0�{�d7���A����ll��ng��,��*{�����g�y���� ��U$��G��X����}�<(��$�@\0��X��õO��]�~ں]&����=�N�B��m˲�[��ƅk=e�{u{{\0���\r\"ce�M��9RԞ*s�.m�yz$��<f;&��0*��(�{�6����E���z�*������Wh�ꆴ�ԮQCz������,����^Y��t� n��M�K����AsgcZHx<��#.�c�\"ا3\0��[�2��b�i�\n�����gp?���hg�\'qama�R�ʞ\';Wl�boc����µ�k{��x��	g�����A����ﳲ�do����Tꓪ����f�-�!���Z�v�e,�6Fl1�2.�����p�w���,XY2?_S�MM�QI��sss���abd��%�Z�k���&=wGϝ��n��.��k��Se����Ԭ��G ��E��[�������I��\n����^�cs֬BH��Rr�\\�˰2���$@CW7�YY3^br�U���#7/\0�Q�\Z��Fn^>���@M<z��/��o��ĎcG���x���l��o���X8q��\\�v�<f�99�p0�S�ݪ�����[��X�}2�|�I:�����i�\Z��� [�;c�ݲ�\n��I����!�\0�\"!6�����	U��E��c�;��>~�{�Z�H$�c��]��Um�������_$D��X�oԘ����͒��9*I�9c�ӥZ5:s\Z|��wl����V�k���&䟿$���w�$��^l�~5�ǡNp�8��f~��6g\r�ɷ�0����C���&%bѦ�r��1�i��;���~���t���S��Y��f�B�A�7�.�0�f�q�ѩe+|��FGj���G�Z8��J�x����k��gto�9f����`�8�x��bul,�G��T�*�c��E�\'\"��S��K�nŪ���w�v2�\r���G_\Z`�g�x�NJDӰ�n�V���̀�c�ȼ��X�yj��Ǆ�c����c��]e1sm��iݺh:{��P�=��6K����$U�-�y#����V�ix(Zԫ+KK�Xk{��� !��\'���\'[AO�K7��P��*Z�U�	�Z{������蟳���#/O�Oy)�X���\Z�[/�(B!��CEB!�6���*�.;Bw�Q$�B!�xO��8}�����45�X,�KS��*Z�U�	!�h��Vb��ԗY̌�\Z����Lt��B����\\uз�	!�BH���\"!�BaDEB!�6��B!�m	��H��D�ߧ�P!���F�蝍��a����Uz�����\"R��˖���ׯ�������BSmj#v]�e�96uL���!e@E�w6��#*,Ʃ�<]��aj{�ߣW�N:�F�(�)���g��R�Q$z�ʽ��g���(���p>����ؿ�|H(���͈a8u����٘��ih9,5��#����D��n�A�z4u��v�>�q���y�W.�m�pT���q���י��j����Kw�0����+�EM�K�\0|1yR_�\0\0�m�t�I*ڍ���q���c�߼A��S��~Q����+����ێ&��oo��1\'�)�5[,�k� ,��\'��Xǆ�,���f���J�|��5Ubak�\r۸��&+G,F�>����Q���[p�;�\r�P�0��������(���� %-\rF^��f�ZƵR�~���BӰd��sr�4,ﳲ8�7!�m�^Y��#L0�K\\~��ۯ�s��x~�(f��kV1�3w�*���;1�p�������`jl�H�����e���㦍���Z�;~3�0%$�V�\"=6{�J4�끔}0g�D-_�����kЮqc<ܳ��[`^�\Z\0P�vI�D�Eoo܎ىk�����W4qwǣ��Ѯqc�_��C��?F��y�d������C��\rIAR���\rSY.��>s�+��f[k�����q��:056�P(­G�ps{�O����W�^j*nm���)��?[��s:z=��3�Ǝg\\+e��\rzt耭	��_�w��`oc�i�	!�h�H�F&���ׯax`O\0����8�|oe�8����?����k�������+w�`܀�������!�m��x�0k�0X[X���/�fdH�wu�6���	f&&��OR�ǒ���)�Cama���]qa�&ƶ�ݸ�)�a����ā�q19�S�%]�w�����%\"{˷q�:f����%���!��e��DB�\Z26�����^���>������)��0��2��3׹b�o���J,lm�a7����H(����/^�~�9�#T^�l}V%��kE������P����\"�?�SBÔ�2!D�(��9�R��`��F^����ƣ\'O�%��Y��%?���2a>���i�ܲBT��\0�9��:^��@����l��_��ƌ�K�\08�w���χ����~d�Z^\0\0\0 \0IDAT�h[X5;�R���]_ ��\rq,zN1�Hנ@yy�f�\0�~��5&Ǣ��\r\r��T�����g��)YV��6di��\\犭OlkM�X���\"l���uPLv��փ*럭Ϫ�#�V4��:.5���N�\0X�o/�[����f��!U��� �ئCq�]hR�]����4�;�B����P��gX7{.$	�;�Q���겲���\0���x�J�Y��\".�c�\"ا3\0��[W�1{[�|��՝X�p�����L8;8�mf&�\r+KK��ʂ��=2��oD���$� �-,ժ�k�<O�3�ؔ,�J�4�g�s��\'���J,��M�q��:P[�l}V5ٵ��~N��s��w�V�޷qK���BHitF���+�aen!�I���n����^��<~,v\'�@�Ǐp�YKz�����\0YB!~߽�s5k��[m���cy��tq����\0�n��c��m���\'�$�Fg�çUk�ڳ�lV쌁w�V�ۗժ~}l�?\0�H���q011��ڮ=���0\'��j�Zm�+��h�\rM���\\���m���6ƍ��@Ul����-�Z���i:r����6\r\Z�Q�:4o�{x�y]��!z�QL}�~Q���A3�!K(�z��|>zϚ�\ZA��=k:>�c�_</���?�9n+���[�?�o�RN1f�� ��㱐�~�#�0Uμ��X�yj��Ǆ�c�����a�Xl?���C��ݲ%�8O��~���ϸ��Բ��N�#\0��ODʳ��7��l݊U3g1ֱ`�8����z���Ç�q�x����3v<v\'%�iXZ7l+ss��1�p��Cx�ձ��1R�6T��ml4Ն���u���Ķ�T�E���u�*�X���ϞEK�o�,�ĜOT���\Z��W�bZؐ�� �|Vo=�P)�\'���?Ey<�47����F���j&Z5h�i���m�Nsr�ӄI\Z��)�9kV���\n}���DXX��c�dti�SB°��Ql�?�Knfm�{�(x6k��7��*+�~Ð���+Vc}��4���d�{�6��,����\nkw�	�ڳG�m�������:�Q�Y-�H�?5\nI�.V�ܮF^����R�u5s��^�Q�t�������\nA�>8~���<v�\"v�\nKK����2��B��0=l,����\'/�}���+V2��~�5�nм��;s\Z|��b��u����%y?���k��z�=F��r��:���i�PG�Uz�e�⛛�LL�\\�/�����t*�6���3�eRDD���|��%�n؈�.��^͚�*w:z}�3i�V��cǡ[���9~�V��;;w��{U^D� �^�;^�{�&X7�k]�D����fk�o#Gዶ�t)\'�>�W�����bٶ��Z���v�\Z�ם1��?��/i�MQn.̋n�731��!M��\'������z�s��6}&������o��P�C�׫[�I��1�E��ձS���y�T5o�\'�:�CL��_�v�V�[�3FV9�ť�QSq���84��03�z�ff�?����+ss��7S���YX5��+�l�%�us�B!U�����1�1����j�b����\r��܌��Э]{��Ω����E���22P�F\r�g�_c��s�l�����ZOq�������͇rJY�p���{��顄�u�B�\"�>���;��ӧJ��l���Quf����Fb��I�����Qy�h������,��I���%=6g�*�t뎠Nެup��\'�dN1us���	�����t\n!�TJl�ղ\'o�?�����RЋ�������k�p�\0�s�x��w���ǅ�[h2���ǌ�Oy��&%bѦ�0���Ǵy��OVɜb��X#��)G��eK�]�h��Х�y����\"�����F��=�h�dVm�h���PN;�)\\?�I��EEm�h�V4\'��:^l�*�k#��8lyX+J�֊8�UeϣH>��y	\n��s�a�٧�9�\0?�}��߼A��S��~Q����\0r�b�a��������`���:�����\'6�	�\0?ֲ\0�:3�_̀S�<##p���1�3$O_��_�$��\n��\' ��Nq�t�I*ڍ���q���c��Bsssl;�\0���Qw@_Ĝ8�4nUƉ�,���f���M�������CB���mFékWՊ�x,��E�1�a-���X�����&�3�%��\"�sW�B?�.����܁ ;[�_s��_������G�ƍ1}4\0��������}�UU��H쭠(�vi�&�,QA�����H�_n3s�)�����Wj�0We�栜��\\�^���z��N���������|��|ޟq��9�|Nb\"\'V�f��!|�|�*�Qs���~���y�a�6�3\0�ʕ#�v<���-�3.�֨I�����ɐY3t��Ex��9�v�_�������ظ1����=����-�)[�9N��7\'W�����WK��mN;��ה�)����o��~����j$m���n��`^�b���������6r��a&i��PZ~�%���P{\n!J�(�b���SD���Ύ��P�._���3�K7�ml\Z�Y��P�2e���dT�����ؤW�O����7z+KK��n�ًTǥ+�m�����`ﱣDw섽�-!�Z����:�����Dwꌽ�-C;r��I���v��D��bocK��A�e�ic2��յ;��5m��7L���vҵ�)mS��7������	��\')%�.>�9���	Q^���X0T^A)��l�=�%K�Xp[���,\\-������M��6����3/��<�ґ��x��_�1a�B�^������P(LZ�)M����X\\�����aR����8���-���kC�r�P�lY���mj;i��X�\n������:�O�ƴo��yT$����4��o�3;m�Ƃ��\nJa�gccDQr�DQv���gf����U��8�99qq�f�ml�ʳO�$>�ן�&Mp~��F��������ȿ�7�R����\\������7���&���-�22�����[�\ZiymC��mj;i�kN�\n������:ըX��c����CV��NĔ�ƭ3;S*����(�����ڰ�ǳ�1\"�(9�ֳ(6^�Y������⋸o5�Z�]�Y�W�u�6K7o���!&�i�:���}�~}f�\\A�B�ڽ��Vx�y4��&��~KfN6�����u���խ]���Pdg�l�F,s_7	yoC̉;�k�SFA���~3T����g7w�ߧ�ge����/����:�4WW��p\0Ev�V��Nm2[��Yև��!EQl|ү?+�o��n�i\\��Fڤ~�?w����1?>�	�L�Ӝu*\r�;y�@�^�Vh0S���y#G��cR�H�y�Z�!�~����`��|� n�^�ƛ/�����j׶0X�q�u�Os�(����o��4>�1�˩�ך�iS�=t�F�\n�/����:��z3t�l^�҉7j����VՆ�=�e}X!����(���zj*�»su�֧�B<;d��C�Q�B���ؘ{�l�ꕼ���B!D���YD����y_p#5�Wj�d���:$!��T���(6����w�:!�B�[�B!�B�2/]2�a��^^�%*�J��r�]I��4�>B��%�gK�R���,V�z�6�<�,���B.y������B!�S\'E!�B��L�B!�N2QB!�:�DQ(��h�\'�E�u(B<U2��(�d�(���ƻoo�Z��jp �c&q�֭�\Z��w�\'�\r�9����%28���(Ly-���|�E�)�����8����+豟�X�O�LE�����w�dFt�ʕ���a����0a�§\Z��e{����J�[cL]�蟤��I��]i�B�Gd�(���֬fL���x+KK�*�3g����9G��J`\0��E_\0�RR�>�6��2�4�B�ߞ�Gx+��[��N�.�<�*-9-���#���C�>�>}J��~�ʍ����/�\r��¿�\0��T��7;�Q-$�����ڵCo�N_��۽z�ծ-��A#�P������];�ֺ%�zv���~������ۋg�?u{v��߉f�o����H�t	�L̝���m��@V��A�� ��X�s;K7o�ZH^��j���>,�66w���|�:ݻ����۷R�ׇ����K��*_���P��3^��Wcy��\\�V�h,VC犮2�ܸ�M�����\0 =3���q59٬��$���(6N]���f���[�+G��>x���[\01�s^�^���6���/3a�\"����~�\'��sy�6��:1l�g��1���j��$�O`l���5Cg�,Z��/�̹��h���_�\0��˕#3;�����X��������ezc��h!���������3\Zi��m����j$m���n��`��}�YZZ���3�^G��-����UZS�Է߁EK�GW�&�`�Nϗ+GVV6\'Ο珕��=�q���ׅ�X��YC�5��Pj+�66w���?��f�9��[��:EfNeʔ�s��*_���P��3^u1�G^�Emя����2*W���jq4�?�GN�ⵚ5�,_ެ��$���(6R�Ҩ��7�L�2�+�m�������3�K7�ml\Z֙=G�������7z+KK��n�ًTi{�%�c\'�ml	iւ_�.�Y�OǏݩ3�6��ȡ�\'U�ddf2�kw�ml	lҌ+ׯ���_��	��Ɩ>m�4�0Pmn�N$�����d���������S*�D���`kK��`~;w��<�)[_�ʔ)Cfv�*-�I3�%�`l�p��h��D�;Ǝ�>Ed�P���1�R�+�Lm;�����jwsƫ����sQ[A�c^뫯���4��_�8v�/Z�����f�%�EQ ��;�p5%���<\r��������M��6���T���z�	��x�\n999\Zyd(�8:\Z�)M����\0�NN�ʽ�����Q����=Q�:Ef&ι���cJ��O�ƴo��yT$����4��o�3Z��Ώ&��dfe���9e��z�����v;\Z�Cm��`�������Q�^�z�3����76ՙ����S}y��\\�V������+�����\\��c��Ȯ�\0��G��H&��ب��K���c��4����=7\'\'.n܌��������\'��Ԥ)\0��P�9;8�o�M���`�,GGn������ʹ4�&�����r+#�\n��\\����f��jT���1�x��!+wn\'bJg��`mm���=,-,�W��TE�.�LO���Τ<M-[�9u2�Pj+�6�ǘ��-陙�9:r���+V洝v����j���빨� �QC犾2�y�U.]�����\\��/�_z(��BWr�Y#�vcη�cŎm�(�ܸu�i+���������Z���۷Y�y#��Q����̋^U�s��V���Ã�W.�~���\\��4���{���:�oR�M���̜lf�o5����S��֮��M	(��X�i#���&�A[���۳����Sݳ���	\0WW��p\0Ev�V��N����5_&l@���W�7�V�9cy�Zv�ʕ9�2w��5�N��Cm����z͚,ݔ@FV_�}�7s�N�9c���=/�z.j+�~Tg�\\�WF�2ex�f-�M��\Z5U����!DqU��5��¦Y�\'��)�5��mh;j8陙^��2����ϐA����~�����,۲	�,J��D��u�qʹ�n�X>�C�ǯ�J[?\Z�	��ŋ�>R�1��Er��9j�o���x&��R�M�\ZH��4��˻u��;�-�����I�z�Z��L����7����Vh��;ǧ�k�kR����ë��x�ŗ���VM�A���^��.��_k��Ma����z�f�ټڥoԪ���->�����Z[�j�\Z�ԩ#���I�#M��Բ�N�J�Q��bv�1ԇ�\n��������������x�[g\Zש�7s�NW�����j�����D>�ԏ���+����n�Ο�M�F\Z�.���|g._���H�۴�aD/��+~?w�&����ך&��j|/[���C}��w,SF�.��w�����?���矘�u�y�]0G;;������(�����ɧ+^Ce��L�z���̪�;X�)��_�\Z,�q�\Z��\Z?���}��1,�3���.ϊ�CB\'�SS�ޝ���u(B\0`Ӭ1��,�0\n��C��݈����ر��8��k\0\ZF��_�`�Z�b��,ۼ���J\"��I�Wc�5�$�\"��x��)&GF�L�y��-Z�`kK�f��e`ͭ�2TF���;w��ʊ�>>\\�fx]���F����ACP޽���\'t�k�9s�B/Əcc�-̙�W��/uHB�\Z�~������Z��ҵ$U��W�Х�/�VV�h�O�e�_u��DqXXg�iI7��Y���U*�s��eLa��>�X�~/f��ü��K�Z�a=�w���j߁%:n?�����Y_LQ���0~�|j�����S̊V�!	Qjt����{��֭4z���?\Z��\Z�۶���ͪ���~�\"��d+�O=g߹�u�D��Ғ�<.��2N_���EY�ɧz�IS(8��o���]�6~|�f732p5�t<Z_�?][��_����ŋ�w��vB1�wR�re�Ϟ��6+z>�2h�*�����^N �T,�z���\"\'w�ڜ;����~�e��x��1��5d(uk뿝�m��.�м	�\r�o֘�/���-&ű��c��/_*�n��\n	!��PΏ֩��MQm��l��{���{>����Ӌ0�XN��{p9wM�KׯS�bŧZ���d:|0������n�/\0�o��k����ê���e��eF����Ā��9�vW�l�_��B�Rb���V*)W�,=��8y�*�ة?��珝�\r][�Ᏻ��s^ˉb��\r�߻���,�������S-c�y��ߒ�w�\\�Gݞ�G����j�5��X�\';{����^3͜�ńB�ȶ�?3\'�dݾ��;���J������Ⱦs�ջvP�r�\"��d+����w����Fu��/\'O�bX(��9È.]�|Ce�ۻ��˗���n�s�dca-}t��҇/7m|b���i�/��SB!�!F�a��?Q#8�e[6���������զ�T\n�˄\r�9�#-يlŧ���[\ZH�!D�z��Q�=��(\n��+���J���f�6��Q58�U�v��;s�u�w�3П��o���>$G��J`\0��E�GWz�RR�>�6��2�4�B�O��=�޵n�[R�gw���WUڕ7�2_�Ņ\r��)�B<�d�(���˕#3;�����X���������+ꏛ?��f�9��[��:EfNeʔ��\\9�o����.l|�������J��_���_~�	K��>�s���!I[w0�[7�-x�|�����/sn�:\Z���-xz\r �B2Q�N�2e���dT�����ؤW�D?z���Cq��cp�0����)S�t����B�y�y\0~��wFt醽�-C�:k<`���D���IJI��Ok��;�t�8ѝ:coc��Ў:i�}�B!ĳF&���*��<��� zFf��\0x�{<q�����sfv6U�`��\0O_�SSUi�S�q3=��Q���\'�j����9>*��ɉ[Z7!��$(�of�;[[�33qst��\'_�X�L�g7\'\'.n܌����ըX��c����CV��NĔ�ƭ��ё�ii���p3-\rG�«�BQL�EQ�^�&K7%����q�\Zܷ�����zY�o�t�FZ�Jk:�?q{vs��}�{V�X �I�7���[2s�����4�S���#�BW2Q%�\'���r�6^�֙�u��wR�H��;G���τ�^���Ὀ�]NE��DM����5�;��Ij�����s|�@��G!�(�dEQ$\n�O���R/�;W7m-�����!�(����j:������b�ꕼ��E�B�L��YD����y_p#5�Wj�d���:$!��$EQ��7z�F�uB!�3On=!�B��\\�tɤ�Y�zyaii	�R�T}.	JZ����B.�=[z(��\'f�*�,���gQ$�O��p�Sϥ�<�,�B!�:�(\n!�B�d�(�B!t���B!��I&�B!�B\'�(�b���������{�V4�A�E\Z��w�\'�)��x+��?��T�k�\0\0 \0IDAT�{\Z�SnQ�\\���65������J�+ɱ!EQl\\OM�X4�֨�����m<��������}{�,.]��D͘ΰΝ�;|dDT���ԑ��B�D��ԾS�O��<��(��~�ؘ�j}��1,��j[�v��f����QBZ�W��iZ���EB��O�բA\0�G!J��(��]�~�U�w��>�G8�F�@y��C��~�g^��k���G����O�jp �}��>�;w�����YZE�3�_�����S���4�F����\r��k���6���\"bJ�B��jז�ĭ�\0�޿O��@�;r���{P�uK���ʮÇ��99-��cGS�ߗ�;wd��}\Z���-~�^��	��-�׳;�����z�۶~�^^��_G\r\')%����W�{/]�»�c&��������];��WУ�˷nV���];T�\Z�cuw����ߗ����bX(���\'`�0�������qhN��=�P\Z����Δ�@W?\Z[�ƹ��</L�kC���ksǦ)��7C�\nQXd�(����d��\r�$oiaAvNk��a�g�sm�N\0�-����+�bWpv�:<\\]��Lu\\���tkӆ�q�8�v>\rޡߔU���sy�FM�\'0�GO�̚����K�loϱ��X��*��LX��re˒���򭛉�<���/(�sf�τ��S�6��ıg�68���-c��6|��|5�C���`d�n�[0�`{����f����=g�o-�.�|�p��y���������p��O4Z�re˒��͉���c�jfEe܂����N�\\ͬ!�|���>VW�lY�rrHؿ���r>~ޯ��X�:�O�84\'m�k�?�SCL9t��1�ƹ���s^��׆�����Mu�����B�LE�����7J�LKc|x/�yT���ѷ\'�������舽�-�;�i<s��e������\n{[�w��ًU�{�%�c\'�ml	iւ_�.�Y��_�>W��\n	e����?JW(�5���<����w�@.\\���.{�!2$g*���a������4V/mn�N$�����d�������\'��rrr��\'��*�doτ�}����f�mN�ꗑ�Ɉ.ݰ��%�I3��_gL�����\\����X��G}�,_gz��e��\Zc��\Z��Ơ��c\r���q���灹��ss�7��0��������Mu�����B�|GQU<*�ϵ$��~���*V��9#3�jA\Z�\\U�O]�������3(���s�����Bc}n���Y���g77R��5��������%999z�KMO���A���[y��-~�4�}�5ͣ\"qwvfƠ!4}���J��������B�Bav���`J��;9�|�r\0��?_��F�\Z�c]�������j�5%?�q���z��v6e��b�y`.c�����=/�p_���v_��cS]~�-��y!EQl�6lȦ<1Q����ر��O\'���}N�b�����7h�qQ2v4��!|1bnNN�Q*qi�B����ȿ�7���KZ��..���Q��\r�SR(��bV=�9�;����kn��k���X��ըX��c����CV��NĔ�ƭ�Z��Tb�{�ҍ\'�x\\MI�f%O\0��J��ci(oSc�fn�1�Ǻ\\I�A��	@�[\Zq����8�Ky=�P;�u��zh36���sm}^��6%?�Ϋ���9�En=�bcd���}��	�����\";�ջw���\Z52xl�&MX�)�[(����f#��ҳsrx��Wqut���K|�t	^�*�x�\n\0�ׯ�̕+HS(X��;�\n�6ލ�v�n2s�I��dn|m�\r�fH��uY�)�4����b�/��.��zik:�?q{vs��}�{V���Ƿ�zx�u��J���ĸ�p��W�[[[3��X�ݼ�\";���l潷�6)oScpvp�����νRfn�1���,--���k7o��P�m�]?������k���:NM=�����26ε�ya��r\Z��~3�� �Dq�w��i��촂��P�v�p*����gf������ϐA����~����I��-۲	�,J��D��o���~�l�3��7�ӰO8���0>��#G�`�؉�#HJN�~���О�&&2J�>u�`zO��*m�<k�A���(�7\0�$��j�3��o�7r��r>�����D^�ԑ7�w�VFG��s�\'�O��Nh10���M������&�K���^��.��_k��Ma��᪴�C��p}<���2v4���bgk���=�޿���5~\r�i10������s|�7Ҥ�M��Q��2�:��S�1��ڔJ%~\r�yo�\0j�s��?�5(������k���:NM=������/_C�\\Wy^������L=K}s��0h���Z�j�0�;Z�=�<4�$eʔQ-\Zj�� �����q���ӿ�}\"/Ciy�+ޱ��hg���X�>Ev61�\0�*z0���#:�3�v�`�k����\"h��k�x��\'�U/�ŰP�|��:�t1�����Gi�k�f����cQ�Qh�mX�?גۭ��b^|<..�H��w�$j~E�\Z�W1U�]Q<r������PZA�y��-Z�`kK�f��u�UZ���;w��ʊ�>>\\4��*�ѿN���f��!(�����:�k\Z�O�����%�=�Zs�N�.�T�C!���+������}qvp���>��$���DQ���������	�*ܹ���A��@՗�w9̛/�d0���3�},�{���X���3��EK�G�Mʽz9j�|ү?�7o#:��f��	!��:Cs��/q�����;}�9}��S��YSjfɾs��ɠ��%Y:�28}��-dj�@���)��7z���{?�<�M=oA����+�o�.V��tm݆�2��x*J���J���Qd*8��7\'V���w#F����C*�J��86VV�(��<�<9wncgm���G�y:��g�����m��.�м�����max�.F����1&,ZH��+��B!�i�����燽�-�:u�N�:���^Q�����ܵ�.]�NՊUiW�����Xf���Ȓ˷l�5�r��aտ?��ݲ٤���Lb@���[��+[��RB!���|yYY\0<|��re�qD%W��(�iؐ��{���\"~�|z���.�G��-	x���<{���چW�U���b/����s���T�\\��W.�^8_ӳ2/zU���{�Z�\nO�_�\\\05B!J�����f�N�33��?\Z��FQ�Tb�D�»�j}A����\nʨn=���	^�3gѥ�*m��=L^�LU��w���%k�3���>|�i���N�J�Q�������M�Ⱦ�[�.���n�>T˒/?}_�8�>W��424W֩3�$%Q;4������U�%^����4��xKS�$?}W��wX4;f��W�U���MQ|<��(�Ǟ�u�(��I�Z�!�U�cBQ4d�(���4ڏME_^�ܑ���i�+����>����T��%j�T�w=����\"bJ�B��jז��-�%��������pkݒz=���o����X��ӽ�j���1�\0ݷ�շk�};w�Vу����ߗ�#9|�\0w�ߧjp �9�Z�n���:|Holy��B�g�LE�1a�B�Ԯͩ5q왻��`���%����pu�X�\nή]���+�c�����%�p���X�\nN�\\Cww&�`����j$m���n��`�޼�š/��+V��t[6~b������S�֦\rg��qn�:|\Z�C�)1\0�+[�̬,�o�L��)\\ظ�~A���3[oly��B�g�LE����\"CBqvp�����@�T�ҷ������舽�-�;��p`�Iy��� Q�Cqup��Ύ��Pvy�=?7G\'�ORJ2]|Zs�K�Pcq���1��D��/����[++�ml޹+g/^T��+L�\ZD�J��ZYѻm ���i�S!D�Tj��Ojz:���=��k�gdfR-(@c����Iy�LKó|��nn����~��:�i�|M�Hܝ��1hM߬�3/cq���1��Dݩ�0q�B~={EVw��}bR�U�񗛭,-\r.��4�)��x���(6������5wbt��\\�n��ߠ1q2UyR�Ҩ����))�wqQ�רX��c����CV��NĔ�ƭә��8����ښ�J����n\\�H7�&�BƎ&28�/F���ɉ;J%.-[��ߘ���B��In=�b�Iݺ,ݔ@�BARJ\n1˗i|�m�&,ٔ����Y�Z�����Lʻ�w#�ݳ�̜l�33�G���4П�=��{�>�=+|���8������+���{�����[�p[���kI�[0G{{��D]vNo��*�����|���.��R%�^1���c�O=�B<d�(�������y�SZ�$�iS쬭���\0{G���L��=�ݡ=��LLd�Iyї����ҩ#ot�­�>��Jދ���T�kMԴ)�:\\o^��0���F�3d/tl��!CY�>��m�;�^�m���Ey�Im�n�����1U��1x�\"���QDo��H;���S!ĳA�EB�D!\n�,�]zȂ�B!�⩓��B!��I&�B!�B\'�(\n!�B��\\�tɤ�Y�zyv,B!�\"�f�*��-^��R���gQP�O��p�Sϥ��w�\'��3�3Dn=!�B�d�(�B!t���B!��I&�B!�B\'�(\n!�B�d�(�������\'��WP\0�mZѸ_	�iL��&Sdg�Vx6��4�͋�����~�o��[\\<��.*O�xH��g�LE�q=5�aѼZ�GcW�׷�t��\'\"f���-��t-�5c:�:wf��E�~�,9�;,:���Ì(�nݑ�D�U�΁�(�s�?���ĳϢ��?3V��OP;��uVm��.�Ԍt�;JH���0:M+>���Cȷ���;���L��Y�\0�%ͳph+�sg��ĳO�(�bcס_h���\'���μ��P޻G�� ���׺����}��-���S�\ZHE_��O��ݻ�<~;w�Vу����ߗ�#9|��*=9-���#���C�>�\Zi귐2����C�� �ڵ���q+#����S58�����oݒ�=����!�uNNK����T�����Y��F��zi�/Vc���ޅ�K���n@�IF�����\r�����wU��igs�z��}<�}Y�/�����}F�zj�jC��G��7Ĝc�:���~��WQ��ca���s���޸��A��@R��5��gfR�};U�B$�(�b#)9/ww��XZX����ڽ{����\\۶�q����ʱ��]�WW&�.S5}*�ڴ�l�:έ]�O�w�7%F�>f�\\^�Q���	��ѓ!�f�,�E8��s,v\'V����;/�\\ٲdfe�|�f�&O���-�\nfĜ�z�3a�B�Ԯͩ5q왻��`ii�J7V/}��r|�j���e�\'\Z-KW��wk���ê��igs�Z�lY�rrHؿ���r>~ޯ����T��E�82�!���q���3����0��\rt�������AM��8a���e[7ӮYs�Lng!LU��Ç&��L�2�\n?Q`t��[�$�K�����g��Sӳ�j[�� ~X�%�+T\0�VF�F�~�k�Q*q�yO�z�j!AZ�w���ʎϿ�z�J\0\\�q��\r�l�:վo܌W�G��J%�}}P���@N�!���+*8;��t����3�^�\Z�E�����ݍ�[�s^�zf�jV� )%���#�{]�I�誏�ctŠ���k�8�O�k��:�)�1d�\r\nr<V�%&]�7z0\'W����q����������QQc_y�_�a����w=�P�����.�\\�(\0U<*�ϵ$��~���r��\'#3�jA\Z�\\U�O]�������3(���s�.J���g(\Z��s3-\r��T?{����u�_�\0V�������/5=]�*��[y��e�9��R�v�k�O;祮U�����D�Bar,��c�1���Xs�q~��P{�9���ǐ�6(�X�d�լ�ɛ/��ʝ��ȶ��Z���$\nQPd�(�\r߆\r��Á\'&����;���dն��i~k��Ս����z	;����1\n7\'\'�(���l�Jwvp��ԛTQ�e�KyR�Ҩ����))��q5�TN�dde�����#4V��dJY��-?휗�^I�A���V�[\Z�\Z�EW}L9&�u���q���3�^Euh+�1d�\r\n2u�f�a�;���z�a�F��y�Kc�;���ٵ;q��f��E$�����b����6�F�۶I�lJ�VF��,f�YE��a����~�U\\9{�-]�W�J$^�����3s�\n�\n������{�,��w#�ݳ�̜l�33�GoñҤn]�nJ M� )%����4��h�^������+���{�� ��O;�[���%�c�s��M�\nb�mί�K^��O�Ma�\r��~�ګ��m�9�����9Q\\o����P�*���R���^x1�y	aL�N�|��f������$|��ݯ5�{��?Ox�i\nmG\r�b@ڎ\ZNzff��_�e�\rX���4���\nr��g���������4�N���,��g��ф�<vb�����߻\'�;�g������R�O4�ޓ>�J[?ϚAD`��4��\r��I�z�Z��L�������#�r21�W:u��]�����}�\\������y�SZ�$�iS쬭����I�ʏ/F��g� ^�ؾ���O;�[�R�į�7�\r\Z@��`���\'S��K^��O�Ma�\r��~���i��*/�1d�\r�ω��{ �C�����N����+�yDiQd����q���ӿ�}\"�Vуi^��a�Y�sK7%p���<��+ޱ��hg���X�>Ev61�����\"h��k�x��\'���R�o��\\�g�<`$�KƐy�K{%���v�$m����..mP�m���\r�9d�oӳ�0�ӜGw��0K�]Q<r���\\-��ax��ZY��Ǉ�׮x�;\"�Elmi׬9������u\ZEN6�\rAy�.O�й_��~�u�&�.������Yu�wa�ZB�=�>�Y�a�X�{��{�(���>��W�����G�E�0���7��	T}�}�0o��R���t�:�<�GO�]�~=��/ް��;`��sD�����\rx����X���ю����G����Y�k�fƩ���zBQ,���O�:���_k\\��;��nhIT��ҢX?�|���/ZȚO>-����:��+KK�t,E`J�i\n~��9�����Ə�֬�fF��IVC~�z��s��m�S�u�Y���B|Z����6��kOQ�P��<��(��?��q�8>�fҺz沱�\"G�����ɹs;k�<��m��.�м�����max�.F����1&,ZH��+f�5&�B�\n{QZ��q�&\'�ჱ�]h�֫�{p�ƣ�͗�_�j�ǋ��S��-��cͷ�ט�;x�?��ݲS��3���sn�:�ly�_�B!�5OcQZˉ���{�%�>��{AiӰ!�{����E��=�6�6��=G�`gm�+ժkl��Nv��9z�c�W���+�U/���Y���r��=f�^����\\.�\Z\n!���ӘG�E6Q��n�ZKK�3���{��|�j��w��<��փ_N��ŰP~;s�]��]���	���љXK�ܴ��k\'O%x�(jw`J�@�ǌ�Id_ޭS��my�o��e�fh���V�c+-��(يzQZ�:�OSI��4x\Z}R���8�&�x6<��(�Ǟ�u�B!D�&EQ,(�ݣzH���k]�pm�>\0��,��O�jp �}��>U��N��4�F����\r��s��)U���-{��n�n�����:�ݑ�W�~;w�Vу����ߗ�#U���q�B��FFVSb��W��t��#ned�[rZ\Z�ǎ���//w�����4ҍ�Q�����\Z�wG�j�ۣ+�R�떪�6}������][�\n�c�33�jז�F��o�w�[���ٝ��Uo=<�}Y�/�����}F�zj�I�k�ܽ�ʁ�ڵ��!Ax=��|�fU��v���&��.�:!DI$EQ,XZX����ڽ{����\\۶�q����ʱ��]�WW&�.S7f�\\^�Q���	��ѓ!�f�Ҟ{�˷lfݔi\\޼�����3[�5}*�ڴ�l�:έ]�O�w�7%�-3g��b��g�o��~���dΨtJ�\0\0 \0IDAT���]���k���΄�7��2a�B�Ԯͩ5q왻��`����)uTW�lY2��X�u3q��pa��3B�^��+����F��ݶEc�ح[�k�W�u>�s���!I[w0�[7�-���Y99$����y9����`�����E�x)W�,�9ٜ8�?V�fV�P�-�ϩ������\Zͧ�u������BQ�DQ7��ދj��x���֟�w� ����ep�0�W���Q�;v��Ɩ�f-�e�rUZFf&S�f%Ol����6���T��\\F_?l�����ex箜�xQ#�;w��q��7n��^�2���A�ڇ������Q!��>����{�!2$g*���a��J�*�X��+L�\Z�Q�f���Py�:��l�&����o���Ў&���щ��ߓ��L���R�� \'\'��\"��Y�<���o�~��q��E�x���dD�n���ؤIׯ3�{O��W�����P�Yg!�(i��ۢt�V������T\n������8]���Y[�\nT��,-55?u�&.ZȯgϠ����ݻ\Z�������w4O����g���z������7���t������Vެ:��U�񗔵�e���^�^�J�+���!Z�Ӑ���ŕ�k���=~�4�}�5ͣ\"qwvfƠ!4}���X�����ɉt��ަ���x(������=�7���˕��N��.�:!DI\"EQ��}N�\"�����7hL��9;8�o�M���!7U���D��ňQ�99qG�ĥeU����i�Fw�q\\yR�Ҩ����))�wq�[���YY�W:^���d��:���ښ�J%V���/�м�f������\\���o�c��Ui�J3V�\Z+�x�8>|�ʝۉ��ٸuzc��|�\Z����[�4b2�]��K^����,�%��z�Z�&MX�)�[(����f#���߯_��+W��P�v�w���伳srx��Wqut���K|�t	^�*�x�\n/��/<1Ih�݈o��&3\'���L��������M��e��\n�RR�Y�L�;���h���n��m����%1n�<��M.����\\KIf���\\�v������Xݛ�Oܞ�ܽ�ꞕ\r����Ғɱ˹v�&i\n�۶�����]1wA�Y!J\Z��(����#�`�|���IfN�լɬ!CU�$|��Q+4��+1o�(��:h0�\'}̭�t^�U��#G�loO����LK`���\Z�l�bG�e��y�SG�<���iȬ!�z˙<` ��&3{�j��< �?���(��sF�h��C�2f�\\&,Z@ef\ZǏ��wK��}�9�3��Ϙ6$Z㪝������y_0`�T<+T`���z�T*��5��AHNM�q��|5�CUzA��!��.�:!DI#n�\"!}\"dQ�d���C�B!�O�L�B!�N2QB	��,�şL�B!�Ne.^�d��,U��\n;!�B���X�S���<^U����<�,\n��B.y����n��6s�w�ȭg!�B��L�B!�N2QB!�:�DQ!�B�$E!�B��LE�r��������\n\n��M+\Z�� ���\"�I��d��,�\n����f>����[T1�tš�M���c57��<�Jr�B�DQ�SS�ͫ5jp4v}Ow?\"b&�~��\"�K�2>Q3�3�sg�Y?�.u�;,��#�2�����~4�,&J2��@���X��>A��Y���`R3��{�(!-�+��4�����D�\'�jQ� \n�����\\Q�ƮC�Ъ�;Ol�#�y#G��w��!Al?�3�u	õ����[�QӧR58����DM�ʝ�wUy�v�,���菇�/�Fr��)UzrZ\ZA�GP�ׇ}�5��oede1%�j!Ax�kK��?�VF\0w�ߧjp �9�[�=(ߺ%u{te��Cz뜜�F�������˝;�~�>�tc���o�w�[���ٝ��Ug=�m[�o//w�/������bv����ӽ��.a�݀�1�������T`ծT	�+����[7��ծ�r��������������x1,�V�0r�SSM�O�84\'m�k�?�Sm�}g�y����-c�\\[A������t���cӔ�����c�(,2Q�FRr2^������ ;\'��{���Ϲ�m\'\0����Օc�+8�v��L�]�:.j�T��i�ٸu�[����oJ�*}����Z�&��ۣ\'Cf��Y��%�p���X�\nN�\\Cww&,^@��e���b����M��[�̈9���g��ԩ]�Sk��3w���R�n�^چ����&|H����֍q�lOu��֬��=��������ŕ�7;o}�_�\Zxtn���F�W�lY�s�9q�<�\\ͬ行[0�S��É���5$�O�����ʕ-KVN	���w�B��o���7�V\'C����Ġ��c\r���qj�)灮~4��87ws�S��P~���ܱ�.?����[�����(V<0���ii��E5��XZ<���֟�w� ����ep�0��`~���~�ZYaoc���]9{�*}ﱣDw섽�-!�Z����:����A�ڇ������Q!��>���G�\nS�Q��\'�VV�nȅk���e��#D�����@%77>��R��������щ��ߓ��L���R��R[NN�DP�B���л?���͉�X�223ѥ�6�6iF�����S����U�\Z�c]��(�/������@/���W�Bc,?]���ԙ{��v66N�1�<0��qn������X~��ڜ��.?����[����(�b��GE���D��/ݷZ�J\Z?gdfR-(@c�������0q�B~={EVw����Ó�Ph��ʹ4<�WP����Fjz��>^_���$\'\'Go~���8;8�~�t+oV���O�ƴo��yT$����4��o�3\\)5U�=T�ݝ]HS(��ۜL�_y\'\'\0�/W\0����˕�h[c}�K��rsr\"]����=�C^�5�Φ�S]L=�el�������kS���k0}l��O����\"/d�(�\r߆\r��Á\'&����;���dն��i^�pu�|��?.�BƎ&28�/F���ɉ;J%.-[�ҝ�7�&U�~I�R�Ņ��4*���oJ\n�]\\̪�:\'{2��p͍���ͪ��\Z+�x�8>|�ʝۉ��ٸu��[˷�J�ro�]�����)�Ԭ�	��[�\Z,\r�mj�̭�!��X�+�7��;H�uK#S���y�!��\Zj缎SS�m�Ɩ�q����0�צ���y��~3����ȭgQl��ڝ��v3a�\"�RRPdg�z�N�O��_�F�mۤ	K6%p+#Ev�֬\"`�0UzvNo��*�����|���.��R%�^������ri\nk�~�[�=t��ƻ���MfN6陙̍������iR�.K7%��P���B��e\Z��2V/mM�\'n�n�޿Ou��<|��V~Ub�n�R��ג�`����tkkk�|˵�7Qdg���ͼ���&�mj���r�۹W�̭�!��X���%�c�s��M�\nb�mί��9����c\r�s^ǩ��v?\Z[�ƹ��>/��uA�Cc��o���B�\"�(��n6�\Z?���kI���_k����/�,��\nڎ\ZNŀ6�5����|��l�&,��(a�i�O���c��:8�}�\\.߸N�>��j���x�M�_��c\'�� )9���{R�C{�����(U��A��=�c���c�D�@���\0L0�īW�\Z��o�a��Q:��8�/\'y�SG��ޅ[|�7�u�<` ?���:u���H��6��ښ��T/m��{���~���6��C���f����Tn�G�����o���-�{��{�>����5����Hjwh�����I�H��65�/F��g� ^��>O�3�XkS*��5��A�\Z̑?�dJԠ<��c�z��v��85�<��GCc�|\r�s]q�ya��r\Z��~3�,M�rQZ�yh�Iʔ)�Z4�»A����l��\'��D^��Ӽ^=��:�j��nJ��W�y.KW�c���Ύ��;�`}<��lb��s���E�������O�^��a���6>�uyV�\"?d����m�5&{��EF�y����»g5���B\rë���Ȯ(9}��z�������]������\r<5�W;\"�Elmi׬9������u\ZEN6�\rAy�.O�й_��~���&�?{w�Ե�\r���0$�\n�vr�[�AGD�A����28���Z�:�E@p���֡��[{E�3���\r��jLB�� ��Z�Er��������䜼~�AΕ��g���5�$� �B�|�^G�Z[(J~��������>s�>��~��_��v�����hi���2P���G�1�d�n��I��K��g\08�c�W�[����ҭ[����������M5�!���i{�R���,߽��;����~�F�\'QCC�<�@���|>�����s\0�\Z犋���r߂ �����6�3�14��qȿ{G��B��/E�T4�-Wc�#Z\n�}<Ο���<\nC�Tz���ڶi�H���᳧hodT����g���=���z��,,�:�1�s�_Ŋ�(|�@���!����^G�:yF�ai)&�\rC���G��he�����u��66�j?)+��/^��+%�Y�*=�`n�\Z̟4	���A�q�:E!��&YG�:�P�L��Q�1�����7�q�!57<�\0��9p�v�9W.��Q[|ة���=;�ô�1r�\\��O�P�����u@O{<�y���`gm������BH��눖BkE}\'G��%����$����������3}������7��yK��P��]G3�3z���}F��wǎ�y�pL<�-E��^\0�ؠ�\\�!�_�>}�?~>�bn���\'9/t�>�[te����6�$�]��uDK���(6�w-ޖ@�1i�ӕ�������v�Ns�/@���w-Ks�\"y�Y>G����v�Cm�@�1\r1gh�B�EE�3J�\\L�����>�6�y礶�ZOwظ� h]�������\'  6\Z��<`?qf�^�\'�5*�r���.c�8�����R,5��p�t��˗�S��;�/�\0�3k������kT�[���1���7{~���:�-����鎲�J��+���e�D��������y����챣0><%*�S��9:{y����x��cG1ƪ,�Ly�?n�cl�Bع�����J��2L�*�/5����>N�Dg/�{��9);Sܗ�O�˿��J�$/�)ʝ�Q�{e}�7���Q���~�p�|�|UVU�~���x��\n!����\"�+v&�O��q(9[p��y�~�%\0D%l�5������8\r�l6b��Ի���v���W�����C�he���1\0�mߊ��tEaz\"}g#$~�J���J @Rv&Rbbq�h�yxbɷ�\0\0�����n{��T�o��݌�W|����9Q	�����b�c�P��H�zOv&&3K�}==�Bd��!w[\"\nR���WoDJԭ,.C}}T�8������Q|�c��rΔ7\0Z����!?%\r��a�㧘�`Hc�W�|1��C��\Z�\n�����]����q�6��?���P�+��\\T�O��Nv�(ʽ�>ʛw��y�:x0��gIŒ������f��BH�EE�3r�\\F��7�X,�r8�zn\0D\"�x{��_�?��m���}�q>������\"�&y��b��}{yy��巟G˽z�S�¸m;x\r�_w\'�K%��ؠ`t��C�6m�?�w�|�S}Sd�����RL㌋��_ �N���L�Y��/�����)>r��B�\n�v0c�0�m�$�\02�U��b��t�����>c�L9g���������ڴ�q�vX<m���U�WIL�2�^U�L�	���>d�JJ�l�l����$I����8�s_��O����cR��J����)\0�Ǎ�|���I�SQY)u�ˎc!��WU�N��371�w}�\\.�,,ů�9TH\\����\n�W%{˷$nch���L��ƭ���bxP ��̰>8C?�W����v�������w����w���dmS��%�䘚�R��*��dc+�ZY�L9���Ɲ�X�#���_ ���\Z�Ŝ2L�2�\0�05\0�g`\0\0���{J�Wչ��8�!�������]`ka�ӗ~��p��%X��ѫKW\0��!�y��\"���,��_���[\"}�5����#u.�ַ>ss�q���p\0\0���`an.�n�2���rt��Y�X�0����;�E��˗��b����&�l��TxGF`d�ۼ)1qJ�~P�]^/8J�<��A�~굖�0�,V��3�@���,Y\n��)��D0=�A�e�/MA�q��^��yM�1��~�?x\0�&��i:n��w]z&:cH߾�},\\>Eee�N�#���	C�`ױ<���� ����w}��ǜ3�V���\n[SS0N�	��Ć�����q8�,����;Yf,\n����g{��:�K��AMm-:�uP��?������D����ף�²����INBqy9�|>��ga䀁\Z�SY�L9gR-b���mb�����j�.��ڢ����e�/MAY�d�<L}TV��g�������nq1&|��kI57BȻ��Dg��_�_���O���1t(����\0�J�\0��b��lt�<	\'.^@t`P��[��[X��NA�Y�����/��/|�\0ݼ=����T�M�XdmY\Z�1!��1e�J�-�����$ظ:#hm,6-Z�����>�v�X4u��r\"����02x>�y{��_!6(X�~*��)�L���jt��������?����L�)(˝윑������k�\Z_xxbo�1���:[��B�]��m�4&�kO�1�<��߾OVZ�Ɓ����r��	!*=�ܫW��w��*`���!�򎣛YiFl\\��61�\n�\0��g�!�h���4#�s�*O��	!�(C��	!�B�\\��޻���,���!�B�ٛY���eL��;vT�0��L\Z\n�	!�4.����wr��:�;e��3!�B����B!D.Z(B!��h�H!�B䢅\"!�B���D��-y�����a5n,>����yZ�I��d�j���b��\rMҞ��<�g�`�<�#�O�85i��]M�j�~�w�����.����DE�3J**����t���}�ߏ���ꆀ�5H?�����=�\'h�:�M����õ�bሞ���\'�-m=ވ������j;B��~Dg�?�s=&\"�g���/\'z��W�ܫW�5b����o�jm� ��\n�?��0Q�����\0�Q$:��o�b��uޏ��ö�\0���st�������t�ǎ��Rpк88x����A���F\\���16t!���`���q����\\.<\"���e��Im��D��N^��8�V��\0PS[Ow��|	��|a�<\Z}}g��������Ť�ظ���iS��wNj;S���D�wrĽ�\"�;9�c�wy��{���Tya\Zy�?U�]�����A�S�q�~�g�?~�sMm-��\\��w=}��;\n���PRQ�R���:yS�?�(����Y�Qx�����Fa_���J�\rq���&c	\0e���\\����5c*N_�\r�.cP���}%���B�茢�R�[Y)-c���j��ss��q3���\0D%l�5������8\r�l6b����Z����!?%\r��a�㧘-޾l�V|ԥ+\n�3�;!��嶿r���j�>\\����bg\"\0�@OU��3��;G�0��K�ݤ�?+v&�O��q(9[p��y\Z\Z��3��\r#CC�%��/�tyV�x�*/L�S��1իi��߯�\ZE�\'>s&��)̵@(DF^r�%� ��z�F�Dye�*����M��$������_�w��y�g�J�}U���:���G���Ȅm�ۣnN��\r����*�z�[k�WB\ZZ��/_��]ϭZ����#\rFޘp�G�0-&��3�{35]�:�������,-\0Ox<_(�#$K(�=f���:yy��I�27W\ZkOo�ܼ�ml\0?�����OI���h&�-_-x��D�p~��r�O��/�����\0���!zN���n�d�*/ϒ�1ū��Ȏ�l�o~f�S�����Ypqr¼���dm#6WIH\0\0 \0IDAT�M�|�L;���v\0���2|�e\0�I�P9��iYL�Q��R�\\�t���[پ�҆���8�d,�N�ą������Ơ9�U>�TE_��r�;9����]��xQ�����������з{Ʋ�^�}�WU�N��371�|��m�ܑ���o�/�YM\rD��_�����+R�����R�ښ�AEe�T�7���!�B���**+a�b�_�q,��WCPoS�i|a�S���?5n-���Ãaef���!��3�%r�15E%��r�@�y�n�4�O��BC@ݾ�҆\"�q�i2�Ox���� U�&}%���B���A�p����,3�7��<��ň�{s��\rk6�G�~�J�@���,Y\n��)��D0=B�݌e�G��(��Yss�q���p\0\0���`!���L�Y�	`���n���������OE\"�y}������o��0��\"L�c�W��w����eQx��%��:���h�g}�>F����\'O��U%��^ݼi2��ͅ�>.��}դ��8�4K����B|�փ\r�WB\Z\Z}F�����r�V�܁��2�8x��\\�����;a��:��\'<���:���a���B!|��&&ȿ�v�-\n��=j�@lؿ\\>�sϢ����v�9\rƏ9gP%�FeU���`���ؔҷ/v�\0��GQY���H}v��_L�������\"�).BT�6���S�i|a�S�����/��s5���l��>�chh���$�����#�xF�Q��G���l.h:�f,\n��S%gC5i���3M�rp�ވݛ�ʪ*=D����+!\r��Dg�Y,��v+�?.���~�6�����?��J�]����R����\'����o�^�5��q�+ƯG�����cp�?\0 f�>|�nޞ���l_*���_࿅��p���5Ox<����}���\0�\\�ޟ:#�c�P�72����/&B!1=&��+2s�&�}�v=�r|M���Q����2����D\'\'���Akc�i�b���D\"�r����������ؠ`�r��>��\'esA��߲4cB��c�$�e4i���3M�r킅(x�=�L��HO�n�����f�4&���9�|4�X���ӹ~����`ut3KKҘ7��EB!�	\r_���4�>ţ\'ؑ����{k;,B䢅\"!�҄6-Z���r����sf#��}l[�����z&��&@���M���=��5���!�q�EB!�\"-	!�B�\\�P$�B!r�B��4}\'G��m��7f?��ͯ���/n��h�6ḿ�\Z?�\Z\Z������h;��:��S\\�1!��ru�@������j!����41��P�2Muーv�֯Cشiغ8�Ibh�u�*�w��^�����o���������!��?��BEB����A�}�Vc��8m�A4���M]��b|��Ϙ1X<mڵi�ic��nqqG�|�B��R.�\"#`���MAz�9���j������6n.Z�g55*��ǭ|�\r];w7X��`��@\\����X<\"���e��I��	��F\'/�O��Y�W�	�\0������;�^���~��p���3p��o\0�>�����=�;9�?z\rDϟ���N\\������=v��������iS`�����QTV&�&ﲚ�{��\"YN�~ɪ�������Ρ��7�cGa|xJ**T\ZEyQw%)�\0���A�S�q�~�g�?~WX�:q��qMm-:��ǁ�\'�����~N���t��I�~�滺��_�����e��R�WVU�ˤ�R���S��&���3Mᶹ������y��|	��|���jvh�HtƊ���ӽ;nJA��=��t\0�J�k6W��!�p\Z��l�$�Q��uq�9n�S�p�p\Z�8~�y��\n�/۾u���D��FH�z񶕻v���W�����C�he�;\0zz�������X�9��y�X��&\0��}���g�J��Z(���dm܌����bdd����p��m���;+s6�JܮR���\"I�~�2�Ӄ@(DF^r�%� ��z�Fd�6qec�(/ꎣ�����n��+�FQ�I�Ϝ�(�Xe�\'==T�q��\0�?���E�J؎�o�����	ſ���ge�]�y�P�g�X�2;3ҥ�ߓ���ÆÌŪ�g]���K�=߽��;�@ۡ��軞�V���ˮ�aif\0(,z���<��:{y��;�CKK\0����(���B��1#~j\'/��;	V��u�������[���\0���c�����4q��̈́����|*��e��yr��wr���tt�� 7v}\'G������\0wKaԂ�(H=�����)�d9M�%��iG���\0PTV�Ͽ�?ir�ˎ���0�I��͞\'\'̛�N�6\n�T5vy�/��Q|�4,LM��~�G\'πcb�g55�8��i��;�\Z���E���=�#�30@��7{&��������u�}����zV4�`��(l\r���`-D�t\Z��Y�Ψ���:#aǱ��Ϋ�B\'��R��T��;��rG\"~Ͽ	�@�g55r?\0-n��WXw9�;K�kk2������6��\n�J������\"V�⟭����󕖗��/�\Z�_%�sLMQ)�*c\"�u�Q���ƭ���bxP ��̰>8C?�\'�.M�05\0�g`\0\0������|Wg<\Z��]m��I�����	���~A�nݕ..uih�/yw<,-��\"���/]z&:�Ԙ�@ ~}�D�G�lJO������<�R�^���\'�y�n<�:���Ǖ�7c��QE��m��(�rů���B��:u�V~(>,+�\\�Bj�`dd����=.��WY_$5F��>�\\���Tټ�;�������;�E�vZ�\'OA��ˑ�ġ*M�<\r��P��X�����EۼaӦ+m[��AS�ѾȄm�5\Z�?����Z(�1�o_�>�.����2D\'����!C��X��x�W�\0Ƈ��Tw�P�~��	���êݻ`ok��5p 6��.��ùg���W�m��`��sU�jTVUakj\nƩ�?V3�K-�122B��d���_-�ެL�0@����\Z��Yx*��\"D%l����J}��i�d\Z\Z\"&9	������H>������;&��G��\r��%RrΠ����:@٧r4�CU��w��<k��֫7z88�;*�;ڣ_��\n���<h��#MC��Q|����\0������=����Q�ྶB}�ѥg�3b�/@��l:t&��#f~N^��/^@�uk���W��1�6��B|ܵ+�C�Tw\\�B��Y�\'����[7l����1����i�����ݼ=�`c�m�K��V|�E�7�éSЪuk8:�!�?�n���		F������lMm-��u�F,����^��cY��̆�EX�}+V�H@kkl��׮A��9����E����%��:�	#�磴�����W|-ޮ��wU���o\"�m���q���ĦE�֥I��d�u�YC�\0B\'�`�W��޼Ei9]�M1v�i(���%|6����,D+hL�?\Z��mO�1�<��߾OVZ������YH���B��	!��L��9r�^�7��ª�y������3!��ٸ:�mb��t7)!-\0-	!��.76O�s�*O�w]z&�B!r�B�B!��EEB!�\"-	ib���f�wK�y�p��xH��9NiX�P$͆KX��RH�X����Ax�}R����]Fw=�f�v�Cm��N�UUa�\'��F�G����\"��j������6n.Z�g55\0^}����;�^���~��p���3p��o\0�>�����=�;9�?z\rDϟ���N\\������=vc\0PVY	�eK�q�^3�����`�2�/^\0\0������a��k7_�K�PاR.�\"#`���MAz�9��,��Kzo�c�ћ�B��N��WT$���<�\0�������0k�*<��\0@n>kjk��}<�>��^��x�sRv����ߞ�d�k���1���7{~���:}-����鎲�J��+���e�Dq�o�������y����챣0><%�2LcZg����y4Dϟ3�	S�e�mC�!r^���#b	,]��q��TN��Y��[��T�B4CE�3��Ú����}�?�k61�{\0\0zz�������X�9��y�X��&\0��}����g�J��Z(���dm܌���\0�Ȅm�ۣnN��\r����*�z�_*A��0s�8䧤���4�q��b��i��D���7� gk��?CCC���.��adh(����%��+w퀙�1�&��������\n+v&��|\Z��ZX���s�Ać.BT�vܸ}��D|H(����/L}]��f|��ke�D�̙�J�V��lC�bgF���{�31q�p��Xur\"\n�����m�(H=�^�)Q7Ә�ؙ��ݻ㿇Rpv�vd��<O��P_�2��-;o*O���Tײ�[�Q��(L�@��l�įoS6Wd)�o}�Sur@�-��Ⱦ��\'x�cb��p�2�牷W���\r\nFW[;�k���q��Xa}�\\.���A\'k�u�6�]��@�I`�X�bc��s�!���/~��.�hצ\r�۶��i3����r�\\F��7�X,�r8�zn�T}L�K�I:��EM��łI����ƙ�o?�(/���*,�>�m��}�0��`٬���JJT�+��y?�����8��w�̡S�!9+S|����$ge\"d����B�������X,�q��<�3PLc�{�xN�YX`�9Rc�D�1n�<iZW��+�2�m��k���;I��i�Hb�o}�Sur@�}F��^U:y��z���D굽��/9och�P���N6�j��W)uV�}��7������=�&����(]4TTJ�gǱP+��P7Go�s�������pP!s�W6�\0`aj\n\0x��\0\0�y�{Rm3�55n-���Ãaef���!*�3�]m��I�����	���~A�n����Fa�:J�cj�J>_��iL+*+�ⴷ��e��ʓ�u��|�q�2W�P�Q�8U\'���B��k6�G�\\>�ěKƪ�aܾ=WT���?��<����@O/lY�SS<�`>z���M�Y�	`�n�n�#��edd��\"ڼ�|}�q	���07G�[\0���Red���v����eQx��%��:���h䧤�-�3ޑ�\0�6oDJL�Ҷ�>F�׋��\'O�b`\ZS�1| �s�1Qw�2O��e�2���rt�X���\\yC�cF��T�B4C���Θ0dv���j����0��7c�P��>�*9�����޽�7	�UU(,z�ؽ�R�W���G`�� ��=�ڽ���(|�\0�����e��磨��I{�>��n��������\"�).BT�6���!��9\rƏ9gP%�FeU���`����`����_\"%�jjk�ٮ^�|����z�FxGE�{G{���SaYCCC�$\'���\\>�ǳ0r�@�v�1ҷ/ve�����ai)V��###��Lc��o�yېyҤ�Qb��}���8�{��|��ԙ+�3\r�B�fh�Ht�J�\0��b��lt�<	\'.^@t`���oY\Z�1!��1eR��X�`!\n>D�)�09*������^�5��q�+ƯG�����cp����b�/�/�����Nƈ��:퍌�wQ���\r!�����\\��9nо];���X��[X��NA�Y�����/4��\r��.�����$ظ:#hm,6-Z�����>�v�X4u��r\"����02x>�y{��_!6(X��iLc�/������{�H�K�Lc��o�yېyҤ���P���y{\"��-|�x�:sE�c�!r@�&��z���Z�j%�;R��Q�����]��%xWƤ�����ý�Lm�Bd��:��G�����J�5�\\{W�/i����y?k;���q�P��M=�X)(�:�H�������ӧx��;�S1�wom�E$��?G��+��]X0O��BH�F7�\"aӢ�X�e3��n\'�{�=|֧6�-�vXD���3�&&X�\0��%!���h�H��O��@��m�A�(?��V�ƸDL��	!-]z&�B!r��{�J7�8��7v,�B!�dofic��7H)�o߱�ʅk.�\00����w��oK@cB!����!��om�A����O뼧��N�>�تU+�?�޵x[\ZBi\\�{�h�>�H!�B䢅\"!�B����B!D.Z(B!��h�Ht�ݒG���o`�1V����y�8��՘���ǯ���/n��$�5M��V���.�\"ߡ���v��u�w^}\'G���]�R�7��QRQ��P�ruÆ��0��CJn���Em-�F��J\\�#h�:�M�������̑KX(Nn�V���&�6B\Z��^����Du��T�f�t���Bd�-��X`�zLD��4�{_N�D��W�hm�(ϾU���κ]�P�!BZ���@L`��M���W%�y{���K�Dg���W�u����(_?l�\0\0��?Gg/��xO�{�(\0�.�����;l�\\�.�jj�u�q+cC���\r�n.� ���!�^���#b	,]��q���6�K�<�\0�������0k�*<��\0\05��p�t��˗���Σ��wN_R�`�R.�\"#`���MAz�9��L���z.�fL�y4�͞����]n?��~.L�k7�/]���2���3k:\n�݃��#���0������������{�W?\'eg�s|��Iq;L����U�~9�������WVU�~���xR�V�Kes�i_BZɓ\n�xf��\Z6n.��%��%��B�茢�R�[Y)-c���j��ss��q3���\0D%l�5������8\r�l6b����Z����!?%\r��a�㧘-޾l�V|ԥ+\n�3�;!��嶿r���j�>\\����bg\"\0�@OU��3��;G�0��K�ݤ�?+v&�O��q(9[p��y\Z\Z��3�K��o7��_�(�$�g�DT�6���ddd����p��m���;+s6�JܮV�����2��+�`���ja5�����Q	�q��m\\��!��W���(���}6�����|<K�|rv\\�Œz_Y.��1Uǁ��nĀX2}&���W�nX�i��Czg�B��/��z����r�9�dmC�W��Ⱦ��\'x�cb��p���M0��_W�k��m�a�ȿ{W�=���N�\n���5l~ݝ$�퓿^D�$o�Y,��o� /o�����g�|>b������ڴ��w�).Vؗ�+���\r3��� �y�~�☘\"#�\'��b�g\\�N�G�P(�ʹ�`i	Scc�🋟��G㺙�����3aܶ܇CQI	�͚-~���D\\�ie5t~��<�{2���˷s8);��ԩGY.��&cLHK����`d�0n����q��j;�w}F�茎�6�]\\���{0��dc+��WU�N��371�|��m�ܑ���o�/�YM�Ԃ���K�W��˅�����5����J�2��oϊ�14�P(TX_Ee%�$�6�q,�ꗬԸ�X��^\n�����`�\'��wJ�����g+3s�K���[�>X��\0�30\0\0p^o��@*L�(�����;w���%N_�\rΟ��˗`e�F�.]�ԣ,�LsL�1&�%��V>zw��֭������B�GE�3\\\r±���P�����w�R�#~O����pk6�G���\"#��-K��cj�g\"�G�o7c��QE9:J������e\\.l9\0���2X����OI��,��I���0�KV[�\\��/_b����F~J\Z�W����Dh�����%u�XV*�K��I�ԢIY�ʨ�e��QVC痩� �I�p`?�~��`��$��(�%���8Ғ�_�ic�1��k�����h;�w]z&:#|�,��=�;w����j�9�/���u�`��N2��e�	�~�\0�`|x�x{�P�~��	���êݻ`ok�\0\0�Ć�����q8�,����mg��`��sU�jTVUakj\n�9)�M�!}�b��p�|��!:i��g��%k��/��s5���l�A�2���5����T$�?�E�J��w\Z�:\n\0\0 \0IDAT!vo2�����`oV&F�Rݒ�X,<����ϴ��e��QVC痩}��>GqY)�7����bL�|��z��i��:�4wo��(�3\0l\r_�Nd�����s�C��;��(��f�p�ۭX�#����H����aÕ��?\0_%n�@�٨\n�q׮�Y$���kV�Ie%>��\r��#`fl���(9q\Z1��o�7���	[l_*���_`��M�p��j�\ZΟB|Hh��3��`ӡ�0i�1�p��/�}�z�[3�K�r�9�ض�������-o��˶oŊ	�`m�\r�!���5��?G�V�������0bA �|>��ˢT�[Җ���/p/#S�>(�4���_���Z���X�y#ֆ��9�J.���8�;9�3I��l������On�`��V/U��h�V�ă��\"z��m	hL!�q��9��~�v�	�;9�f��GkztQ�UѥgB!�\"-	!�B�\\�P$�B!r�B�B!�����{*���`o�رB!��z�������/#P��}ǎ*���IC�1!���Ew=��ϐ|C���2t�B!��EEB!�\"-	!�B�\\�P$�B!r�B�B!��EE�S�<���}{��\Z7��@��<��$�n2~�\0��|�p�&i�)hҮ�bnhͥ��!�GE�3J**����t���}�ߏ���ꆀ�5H?�����=�\'h�:�M����õ��Q�QG.a��	y�rMi����7�؇��3M�ޗ=Q��D��+�\Z1R��I۷j��Cx\'�.z��Z�5!�!�E�3N��+�:~Z��(_?l�\0\0��?Gg/��xO�{�(\0�.�����;l�\\�.�jj�u�q+cC���\r�n.� ���!�^���#b	,]��q���6��_<�\0�������0k�*<��\0\05��p�t��˗���Σ��wN_�Ma�K�\\L�����>�6�y礶3�KV���1���7{~��w��P�^��\\|0m\n��\\�t1���Ԯ[Q�>�����=�;9�?z\rc�jjk��}<�>��^��x�sRv�8�N���4���=Ӽ�vsAz�9���{�(�CIE�J��;&�͵,UbR�oEǩ�c$I�}	!�GE�3�JKaoe�����>��B��A���(>~\n\0���l6�&�C��4X�وI�#�/h]f����4�:��1��b^l�x���[�Q��(L�@��l�į����];`fl����p}�!t����\0\0==T	H��DJL,���<O,�v����ؙ�>ݻ�ơ�lM����ahh(���/Y��݌�W|����9Q	۔�S�����~o����0����*q��u+*wm�A\0�.S�Y���zz�V�zA�����7n�����%�>Ʋ�2�L�F \"#/��Q�zN�z#R�����Z�*1)˷��T�1��ɾ�����\"�)/^0�x9���~s������>=�}��O�\0���m�a�d��`.~��.�hצ\r�۶��i3���x{��+�2�m��k���;In�\'���I�`�X0i�A^�8s����*�|����ڵi�	�S\\��/�W.#��f,l9|=7\0\"����d�,��)2�~BQY)��q���/ld	�B�����056�\n�����Ԯ[���ǫ��3aܶ܇CQI	�͚-~���D\\�i�e5e��P(Ī�/`ga3s�& O�$���	us-�)&�|ˋI�1��ɾ�����(�������з{Ʋ�ll�^���c��{�&&�oܹ��;�{�M�<���Z��|��s�������pPQY)U����Y�6��\n�\n뫨���%~mǱP�_�R��b�{1<(VffX����S�)	V�⟭�����ծ[�T韅�)\0�=\0\0�����r�4Ʋ�2��̛��cj�J�ܫ���1!K��0ŤJ�ecRw�\Zj_BH��B���A�p����,3�7��<��ň��k-}2ܚ�AA��?���\"#��-K��cj�g\"�G�o7c��QE9:J�1����e\\.l9\0���2X����OI��,��_�}��Z�����;�E��˗��b�����ե�\"ڼ��z�qI�������\0��I��BBYݪ� K��)�4Ʋ�2��̛�����ª���vU�_���U�\\+�I�|�Ƥ�5Ծ����K�Dg�Ϙ���g�b����_-��3����X��t�	C�`ױ<���� ���o�\n1�Ï�61A��{X�{�mmQ��\0`���ذ�|>�E?_��s\Z�sΠJX�ʪ*lMM�8\'�)3�o_�>�.����2D\'���S�d\r��%RrΠ����:��˷���������\"�).BT�6���!vo2�����`oV&F�Rݪ�`�b���}<}}&H��)�4Ʋ�2�L����1�I(./��G��,�0P����4�L1�������B��(��f�p�ۭX�#����H����aÕ��?\0_%n�@�٨\n�q׮�Y$���kV�Ie%>��\r��#`fl���(9q\Z1��o�7���	[l_*���_`��M�p��j�\ZΟB|H��W3��`ӡ�0i�1�p��/�}�z�[3�K�r�9�ض�������-o��˶oŊ	�`m�\r�!���5��?G�V�������0bA �|>��ˢT�[��,����`Ծx�{�j�O�1�Ք�g�7\"����02x>J+*�y���~��*�/���f�I�|�w��ؗR�^*:- [�U+�Cu��U~��.x��m	hLyK�]������Q����� M@��7�?>ӣ�򧈨�.=B!��h�H!�B䢅\"!�h�.^��Ř!M���B!D.Z(B!��h�H!�B䢅\"i����B�ӻJ^.��������[M5Β��Ւ���:{\Zm�}^�����ǐ/����3�|�������Z(�K�뻄�����\Z��\\�_��iӰuq�\"Ү�4�d�ٖ�����?��zA����\\�9&�����usCк8-D�<�B���j;�@��Z����idt̶������ ���y�\0�Ǻ�]�6������8���D\'�������y����챣0><%�2�j������6n.Z�g55\0\0������/���>`�\0H=��^3���<\Z�f��O�.�O�r��r}fMG�{�wr��\Z�8jjk��鎳�/���/,�G���������R.K`�2�s�p��rc��V>Ɔ.�����\\0|A�TYe�CY���&�^c�ST��\'  6\Z��<`?qf�^�\'<�8v�1{��ǃ��;�*+�ޯ��B�I�uJ*�r1)26n.�`��睓��4&��*9�7V��YVY	�eK�q�^3�����`�2�/^ԩ�>������$�U5���Ztp��O����=^����)�;N�T9����\\��4��?��ǳQ%�ƁS\'�ԻwFּ�B��==�Bd��!w[\"\nR���WoD&l��J�k6W��!�p\Z��l�$�\0��Z(���dm܌��\0\0��݌�W|����9Q�IRT�ھ�\0^]�ڳ|%czz�������X�9��y�X��&q[˶o�G]��0=����^nLA��0s�8䧤���4�q��b�Uʧ�|(�]��d5��1�@�xW��3cc\\Mއ�����V�L��4fo�Y,x���R������a�a�b��g��D���7� gk��?CCC��(����\\�6#��o��y8G7lDbZ*��B�V�OS��Wg|\0�Ǭ:mU�q��\0�?���E�J؎�o�����	ſ�ޖeʿ�yG\ZW|hb���t�p|��;�\r�vH�,Z(�!\n�*��YX�����	ȓ8�}��O�\0���m�a�dd��o/�r��o:Y��P_\0�11EF�O(*+��1θ���?V��S%�J>�A��jk�vm���;����^���)Saܶ��������s�=�uqE�6m`ܶO����wUK��|0Ůjl�4��1�@�xO�zA���f�`Ҿ=���q���ϭ1���ЩӐ��)>U����22�Gn��+���\r3��� ��*��(��L9W���sW� �s�,���b����o��Wg|4��WU�%�g¸m;����,�5[��AI��,S���i<�����ܟ���\0oX���Y���I-�~�9���|��5��\n�<�K�771�z���V�uj�Z��a/�����C0��~u�U���q�K����!�B�����:��q�6V�H���7��F�?�@�|0Ůjl�4��1�@�x˹\\�YX�_[s8���|�l�$u���\'=���S\'0w�;�_���uG\'k��+*+��4�q,��3�in*˹\"Lm>�I����c���_��OC�faj\n\0x��\0\0�y��=�:�*˿*�4��7���adh�����v�3�D>Z(���1��^,�>y\"��ʚ�AA����ސ�4���;�E��˗��b����Vg?U˩\Z�2f,<�(GG�? �xEF ��[�,���D\"���V[��`�]YlFFFx*���˦���)���ǔUsian�2.�\0�QY,�͕�L��TxGF`d�ۼ)1��45f�\'����wKImg���T�sE��4n��+*���U^o=x ��i.�{�hzL����R����wDu�����q�p�CgN�K���E����044DLr������|<#o�0dv���j����0�u��%RrΠ����:��˗j�3c�P��>��>�U�8$�\Z8������ܳ���+�\\�P�~��	���êݻ`ok��WS��bs��Frv��D���Q	�`bl,���ǔUs9�i0~�9�*a5*���55��+�\0�Y�����\0�Ht�h�~=z*,;�o_�>�.����2D\'���\"S^��M��+����޽�7	�UU(,z�ؽ�R�3�u�Z�cJ��1�Xm1忡�����(�QI�g\0H����ǎ���x|�q��#��;��(�!��:�	#�磴�����W|-޾�?\0_%n�@�٨\n�q׮�Y����~s�m母���%6-Z�v�-K#0&$�/^�^Ff��3��|�nޞp��Ŷ�r��/����xRY���u����cp�?JN��ꗣ:ψc�]YlBa���X�#���!8?_����0��o��cʁ��\\�mބ�NA�֭��� ćh�|���>��U$�7oQZ.f�����CaҾ=b���_P���Z�f̋��ɔsE��\\�`!���F�)�`ga�͋�sV��i.�;֚S�d���j�)��1��[�~�\rx��>cMk�R�)ق�Z�E�?N������\Z\'���a�_e�v(\0Z����:��G�����Z���r^\\^�O���Yt�t�>����y?k;���q�P�c-=�X)(���L�;*b����@m��∞?G��+��]X0O��4������ӧx��;�S1��CGH�D��	yG�����B�d����	V����~�lӢ�X�e3��n\'�{�=|֧6�-�vX�-��\"��|	�0k)�W~:G�!�5V�?���[\Z��椥�yҲѥgB!�\"-	!�B�\\�P$�B!r�B�4k�`m��\r�oS���n�#|6/\0Σ�lk��u�:�ַ_�R>!--	i�\\¤�+�|��pD����u�5�@����GBi\nt�3!���\n��0��~M\r�/e�H!���(� z���<p��|<�챣\0\0�j������6n.Z�g55��������a��k7_�K�P��R.�\"#`���MAz�9��Lm+�W���1���7{~��w��������g/_B?_X8�F_�8}�7q�@�����޽�EY�\0��`^�fP��ϐ�\\+Q�P�e7�5)M�[�x�Ҳ�5�Js�������b���nZ��j�#��\" �������3�\\����5/��<�|�93��y�3������큱���r��\0\"&=�L��w�ӯ�p�R��jx�=���:/�r|ƥ�A���8%�V���\'w�er�;�w{s��8���X��8,���~R�(�����0�ݍ�ǡ۸�?��.�X�w����|��ȳ1Q�fA�퍊+W���}�������\0�� �����!�|�9���j����f�~\r���~�I�g?���i���P�K6oBDh(N}��}omğ��J��\\n�m9��J~s=�[�9ٍ���=n|[��6�܂��r|�]H[�*���kL� 漹μ��?�Uǎ���qb����ǒ͛\0\0?���˛�/^j>�V��|��ڏG$/��-����_|�ONF��5�O�XKr�;�w{s��8��~p4[�Iͣ\\<mn�W*p��_�˶�X���p�;8u�Nlێ�I��4�爈<Ej6\n/_��ħ�J�wE�������q�tꄎ���G�W�4������Qh߶-:�k��O�̅����G��������N���)SQ]]m.�׶{qi:u�WӑSp	�Ǐ��[l\'%F#^�9�t�h߶-������݇�̇���/:u耙��7G����xt:�k��C��p��O�XK�b��w{s��87����8���^<�ee����ѱ]{$DEN~>�O�l�6�����爈<�Q�f%����viYBƍ����S\'��S��a黛�ә�0������Z�����@��k��h�j[���>{�u��������_��I\"s�`�.����m�J\\�rż]x�2�]��\Z\r�JJ�SN��h����\'w�%Gb�뻽9rf����h���H<�Ν\0>m�\0\047�}ڴ�5����gc�H��-^�Or�i��g_��ni��<��xl�3�ΝQU]\r�}�j�sG_�����f���j[���zv�a���B`۞�aꫯ�L��N�\0Z�\Z�/C��\0\0�\n\n�U�]�˒ʷ�\nl��հ�?�c2v{s��87����8���>�X��爈</=S�66:\Z���KKa�(�ڏ?�/��+�\\ATX?�u�3�z,O���tȼh�[wtd$Rw~��F#r\n\n���׺\'�^�r��5d�t���W�_G�� !������{�ɾoPv�%eex�4��=�r��/~5d���3Dqw݅?n���F|��[ܙ�����;֙��7GΌsc��Cn?�y�O<���9\"\"��3�Ԭ-}z*mzw==eW� �W/�Mz�\\������ʗP\\R�~�{㝹)Pu�{�>���항{ՌYx��UX��vt���f���C�u�	�xy�m[���\'>���7`��!�K�{>��1zi�3x~�:�Mx\n//��� �M��w�m�����ٸn2A��.��]5cW���?��]ux{�<��\'w�3��co����|?8\Z��~��X�x�9�9�{ ���ROe(\n��������\ZpN��\ZW���Qq�w�AM���8�Y�v�>=�m��^z&\"\"\"\"IL����HE\"\"\"\"��D�����$).��-f�ޭ[c�BDDDD.�^�ҶM�|i�w��`�w��w�Q����AUU��à&�P(��L~\'�������HE\"\"\"\"��D�����$1Q$\"\"\"\"IL����HE\"\"��P(�>\Z�=Ov��U̙3>>>�}�7ƅ���4i���p�¦�Ec�HDD�����^�e���Mf�1b�|��種v���yl۶\r999����k���>�����LL�������,w�Ь�����ѣ6�-�3g�@�R�G1�8p\0\0�������?nܠ=E\"\"�&VRR���~\Z���\n\n�O<���\"\0@xx8233�P(���\08v���>@��bȐ!8r�{д��}h�Z���1c\0`����׮^�\n\00�L�С\0 ##����LL�����ҥK�R�p��q�<�oc���\0��\'O�q�l�֭\0��ӧcҤI���BVV��)S��+�f+--\r����SO=�����w�\08p ��.\0��˗�b���]>�B�?�GDD��ߡ�{��7�|�=z\0\0bbb�믿J�o����:u2��>��=�O��,P�\Z��ׯ#22/^DFF����egϞEbb\"222�裏�o�JKKQ\\\\�d�7&�BQ�o=���oco���\"Q+,,D͡3V\0\0qIDATPP�y�k׮(,,����S����[�nP�TP��./��T�~�-N�<����ZI\"\0������;����n�:C�Ѹ)Җ��\"Q�j��t�y;77W��q��a�С���������<���V5�SƍW�,!!���HOOGjj*�F#��!�HL����بQ��c����������5j��\\�R��ٳ�K�8p 4\Z\rN�>��˗�[�n�K՞��{�����\0DFF�9^��!\'\'Æ\rCRR�J�y���vw\0DDD��ʕ+����>}����#F���u���o��6���`2�`0�z�jL�<EEEǦM��R����N��uk��w�,kppp��U�V!??��=:w�E�!&&��#l�������y�b���,DDDD��(�$&�DDDD$��\"I��gg;���Rt\"\"\"j��{��r&����g}v6��\\rn��%hi��r�7D�����gg���k\\�LDDDD���\"Ib�HDDDD��(�$&�DDDD$��\"Ib�HDDDD��(�$&�DDDD$��\"Ib�HDDDD��(�$&�DDDD$��\"Ib�HDDDD��(�$&�DDDD$��\"Ib�HDDDD��z�� ���1�L���0����әy��۶�n�z��;��>;5�Z>o	ZZ��焜%���/����AUU��à&�P(��P�cy陈���$1Q$\"\"\"\"IL����HE\"\"\"\"��D�����$1Q$�Ij����́3�Y�ۜ�T\rկ�<>\r1�͹͉�d¬Y���hзo_�߿��!y&�DD���Ⱦ͛7�]�v8s�^|�E,[���!y&�D�����j����\0*++���b�\n��j\0��}�п��j���cϞ=�z����J���H����lS�90`\0����s�Ze�g���ڵk�j�رc���ѷo_�8q¥��v��%�3j�\ZQQQ8r�C���љq��\'\'\'#G�������P\\\\l.��G[�[�����\ZK9��S}���}��\'�4i�j5&L��~���!y&�D�,X���(deea���X�h�_D\\^^�Ʉ�/\0�̙��+_Fnn.������d�\'99[�n�o���y��!%%�f�r��Y�h����c�~�w����(//ǉ\'�믿b	X�p�Kccm޼y�^��1k�,���3�&WOrr2���p��DEEaɒ%��lͣ����Cj|l��Wǩ>���N�>����FTT222��g���K>o	ZZ��焜e2���,\065�w�.rss�B��剐��Z����H�UUUU����1�|q��9�b��G�GnPP����Ba0:κ~k�}���:��\\����Ě��g��V|r}t�_r��t:s�yyy\"44�\\��<J͛�xXo�K��r���ϙyS*����4�۷.���b�ҥbĈ���\0�3�j=\Z\n�(Q�%���T\\\\�V\0�h4(**�U`~~��\Z4Z��Υ�/��������FTT��ڌI�9%%%��kbn���t�\0P��0\Z��ם�X�����O����K����N�B���\0\\�t�\\&7��ڷ�m{c)��q�ϼy�:`����ر#����رc��#0Q$\"���燂�\0@AAA����޿��D̚5YYY��˫�_Ϟ=�e���z$%%a��)6۔�G��������q��_�(������3ccM�V#77������L����j�(--5����E�y�׾�xXn�K)��S}�����3$�	���n��30Q$\"�5d�lذ���X�v-���m�ۻwo���UUUX�z5���p��Y\0�����c�\\�v\r�z���dr�9زe��ʐ��\n�RY���J%6o��ш�7\"**ʥ��v�}�a͚5(..�\'�|����;�\\��\\=���X�f\r***������xs��<�:o�kc��8�g�<]BB>��#\\�\\�����{�qwH���kԼG�\Z焜%u����\r�6l��h4\">>^��=zT���P�w�^�l�2�V��B�޽[���O������0�s�.�q��#�#�������o:�N|��B�R	��T�8���)�J���&����m��&222\\\Zk�.]����ܹ�����r(>�>:�/�z����رc�F�w�q�HO?h>Nn��7�mG���y��3����Q,++			B�R�!C����ϻ;�&�F�GQq������\\�yK���m\r8\'�,!������NP(�V���UUU����B����ڷ)���� u��3Ib�HDDDD��(y(^v&��b�HDDDD��z�����=�Ʉ!!����Y�^�ҶMu������S�z���9!g�\\F��T\"�p�s�!�E�\r�;�������HE\"\"\"\"��D�����$1Q$\"\"\"\"IL����HE\"�fH�P����x衇���?�;,Y�+/�Va:[�3����F�;��vwH��\"Q3%���������#<<#F���\'�Q�4m�4���B��c���={��C�L���1///���/��f̘��+W��rrr0r�H���!..���沴�4���A�R!22����}�����P��Ǟ={\0\0�����tX�b�ju�m\00����V�ELLΟ?o������0\0AAAعsW��l�%��cA�c�ĉ�;w.ڵk��\':��$��(��<�:d�NNNFXX.\\����(,Y��V�֭[��o�a޼yHII1�͙3+W����\\$\'\'#))	��/h.//��d�ŋ�l�����,<�-����\0`ѢEHHH@FF����q�ڒ��ձ �1e����\0\0��݋�9\"!tA��|���x[�	9�d2	\'~d�xR}�r��ر�y[�Ӊ��!�yyy\"44�\\!�ϟ/Ν;\'�NUUU��\0����޽����5�\"����n/((H���!�0���eWC���Q*���-N�:%BCCűc��J� Ng��z4�Q$\"j!233��h��F�:�\n��t钹�/�@aa!�������`РA�j��K��lnC��\04\Z\r�����-�^II����zm�2.Wǂ<�/������[������#0Q$\"j!��}:Լ��jQZZ\n!�����ٳ\'�l��^���$L�:�\\����Y�f!++yyyuڱ^yl���燂�\0@AA�����-מ���9�.�זe\\��y��/b���x�u=z����L���9����_~�q�{ccc�f�\ZTTT 55������cǎ�v�\Zz����d.�ݻ7��틪�*�^�\ZAAA8{��C�26l@yy9֮]���h��ȵ�-[�������P*�.���X��HII��	0v�w��Y�F�{�!qN�Y��Ś����5j����k퓟�/Ǝ+4\Z���;Dz�As��ݻE�~�����;w�2�=zT���P�w�^�l�2�V���Z�a�`0�aÆ	�F#����`����\\{Ǐ��~���t��/�*�J�L&�ڪ�Xx��v��R���� Μ9�\Z�E����gg�[pp��-AK��5��������?��Z=TUU�;j\n��3kߺѧ����K�DDDD$��\"Ib�HDDDD��(�$���w�Q�g2��#$��a5K֋Yڶ�n�z�]y�U�Ԑ8\'䬚��\\�L��zn=��$@����g\"\"\"\"��D�����$1Q$\"\"\"\"IL����HE\"\"\"\"��D����H�D�{��>�Q�uw���2��܏�f�������zVV����hp�w����n��30Q$\"je���\Ze_O��`j~�����/����}�ӦMCll,�z=�O��ٳg�!B��D��ȍ����j����\0*++���b�\n��j\0��}�п��j���cϞ=�z����J���H���K�w��\"33\n��/��Aj_�,���`�ȑ���C\\\\������ڵk�j�رc���ѷo_�8q¥������ ((;w�UfyF���R�;r�^{�5ɲ�\'b�ܹh׮&N�h~o���.����[��ok�9!g�L&�ď�f�V���?��\"%%E����ŋ��\'\n!n����W,_�\\TTT!�����v}-*++�{�\'���c�\'00P������b۶m⮻�r8.[1H�+�徏=��x���h)))b�̙.�z뭷�E����R�|�r1z�h����< �/_.JKKŋ/�X+v��r�m�J��Ch�~.|��g\">>���q\0�tf^�G����L�!qN�Y-5Q���ѽ{w���+�\"//O����:>\'\'G��:	����Źs��˒�l����N�3Ǟ��\'BCC]������|�������	!DPP����Ba0l�C���E!N�:%BCCűcǚ0��ט�\"/=5\"q�?�������j\0\Z�EEE����8�A�A��ֹ���_�����ш��Bz�A�c��%�,�F�t:(\n�ҥK.�ڥK\0�Z���ht8n˱�VRRb���)�����_~�			X�n=\"##�N��D��ȍ���PPP\0\0(((���_�r���1k�,dee!//��~={�Ė-[��둔���S�4X��b���jQZZjN�-�Qt6֚$�������-�z���לX�����R�r��E�?o���G�rw8-\ZE\"\"7\Z2d6l؀��r�]����6��ݻ7��틪�*�^�\ZAAA8{�,\0`���رc�]��^�z�d2٬�G�8{��y��\\����`)66k֬AEERSSo.s&V�R�͛7�h4b�ƍ���ri�EDD`˖-(++Cjj*�J��~�������L�0cǎqw(-��רy�\"5$�	9��ޣh�u�� �\r&4\Z��������G�\"44T�ݻW,[�L��j!��w�������\",,L�ܹ�f\\ǎ��v�����r1Xƛ��/Ǝ+4\Z���;Dz�As�3�*�J���&����m��&222\\\Z;kǏ��~���t��/�*�J�L�:�������{!s�R��Sv��7F۸Ј�(*n6`�>;݂��<o	ZZ��焜%�����㮕Q(�s��������aPP(8�Y�ֈ>=��n^z&\"\"\"\"IL����HE\"\"j�xٙȽ�(�$����]#�f�d2�GH��� \"j����mS� �z;�򔫞�!qN�Y5� ��*N\"G���d��#�x��}��P�cy陈���$1Q$\"\"\"\"IL����HE\"\"\"\"��D���l���11�vw�ADn���\0���y�p�46oX�5o}��P�j�v�*�]�i�7����η!̛� �O�k����	��E\"\"��}$�H�����Z���J��w���O�33���m�\r҆��:��q�R�����u<5����|��j��\n,/+i�<�(ɨ9Q�8sF⇃i����i���C��8�LU��뎕k�cd�N��h,�R�ľ�h�d_<�HD䢫�UX���\r�����P]U	�Fby������K�sg������������t���=��1��t�;u�+�T`ݫ/`���5$��M��j�	����ϒ����Q<7uF�cԐ@�0}4��z���a=�W�VcP�\Z��K}��\r����Ҷ`�nx�������Pߥ�J�A��hş�Y�g������k�y�Ĉ�X��c(/+m�=�(��M����6b����ۻ\r^^2\r:v¬V��ɪ:g!_i�󟟱1u/�e%xn����������P{��/�N����l�իu/�mZ��|�K^�\0��%�ԭ7����R}���_��)�?wi_�@��b̙=o���76�j�~H�3\0ˌh����o���nɧ���\n/-��w7,��59u|\r��5�r�%��q��>\0��o�B@� �a�Z7G����\"���#6�!�p�?�������}��DD�{\0\0�Ow����\0���������5\0`��Ə\0������9��O���+���z��$�1�!���#�<��������q`��1\0�?��һ�s��{�\Z֞C�8|�\n�OV��\0}���Q�L<�HD���K\0�|!p�oQ_..����C�b��E0�P}3�2\Z�龬�ƾ�-ڳTz�<���V\0�-���9��x{�|��]|��]h�`v�k1fb��Ö�*�C�[j����w�ˍF�����{�\Z��a�\0\0�/s�]�D���Ej��%�(/+ŵ��e5�.6���$��g⽏�G���C�:;�^�N(+3���(yϞֿ+��|��(}�ֻ>g�w�h�;t4�ϟŷ{>��^»�J&�\r�[\n�C�[*3�@�L;u����5�}oPÚ>)�����7?EiI\0�K�@7G�2��3��b�?\08���H�������;��\0���\0��+W\0\0>m�ⳏ7B��\0T���̕�~�w\0�;��׽�� \0���i���w18\0�v�>kr��Oz�c�Q^V���7.\'�o��$��ggc����?�}_\0�\Z���5�7�~�Yo�\r돢�BL2�1R�i!��(�������b��%Hݸ�=1���o.Ox�it��g\'\0<3{9�tH�q㞵�Ͻ�����>)ơ��MZ����b�ŸZ]�N�7�j]�v\0�8m&NN��^ƒ��㎈Ax~�]�Ϛ\\���-@��P<?cfL��]�b�l��M��qv6��5�Uj���`ӛKq[X�xn�C�K��ޠ�5=i�>�$��u�v	��g����/�;�I!jαۡ��F���:�[��ok�9!g	!����﫣fɕ��llCt�w?9v��Z�A�>8��W�>=��n�Q$\"\"����\0�.]��9���D����&<�����;��U�DDD���0�v�<�(�$��ޡ�,DD�d2��#$��a5K֋Yڶ��g9�U���r�7D�����gg���k\\�LDDDD���\"Ib�HDDDD��(�$&�DDDD$��\"I�O8\\�eM\0\0\0\0IEND�B`�','Captura de pantalla de 2019-10-21 18-46-36.png¿¿image/png',NULL);
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
REPLACE INTO `contenidoLibro` VALUES (49,'Di no a los vicios.',68,1,NULL),(1,'El poder del aire',69,1,NULL),(17,'Aprende a alimentarte',70,1,NULL),(65,'El poder de la comunicación.',71,1,NULL),(33,'Recargar Fuerzas a través del descanso',72,1,NULL),(59,'Relaciones humanas efectivas.',73,1,NULL),(25,'La riqueza del agua',74,1,NULL),(9,'La importancia del ejercicio',75,1,NULL),(73,'Confianza en el Dios Todopoderoso.',76,1,NULL),(41,'Actitud mental positiva',77,1,NULL),(9,'Los hermanos de Mowgli',83,7663,NULL),(16,'Las lecciones de Mowgli',84,7663,NULL),(22,'Los Bandar-log',85,7663,NULL);
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
REPLACE INTO `estudiante` VALUES (16018,'',1,'',4,2.00,'\0','Padre#Madre¿ ','\0','','','Padre','','Noveno Grado','','dssaaaaaaaaaaaaaaa','','',1045367070,1045367070,1045367071,''),(16019,'',1,'',0,2.00,'\0','Padre#Madre¿ ','\0','','','madre','','Noveno Grado','','centro escolar','','',1045367072,1045367074,1045367072,''),(16020,'',1,'',4,20.00,'\0','Padre#Madre#Hermano/a¿ ','\0','','','hermano','','Noveno Grado','','65cñjxj xf o uz uhzl zllzi','','',1045367075,1045367076,1045367077,''),(1045367070,'',0,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'Padre','\0','6','padre',NULL,'','',NULL,NULL,NULL,''),(1045367072,'',1,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'madre','\0','5','Domésticos',NULL,'','',NULL,NULL,NULL,''),(1045367075,'',0,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'hermano','\0','8','opǘfh ṕfci',NULL,'','',NULL,NULL,NULL,'');
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
REPLACE INTO `materia` VALUES (1,'Matemática',1,'c0d6c8'),(2,'Lenguaje',1,'bfc4de'),(3,'Inglés',1,'9dc4ae'),(4,'Informática',1,'c4b0c4'),(5,'Estudios Sociales',1,'8e8cb3'),(6,'Educación Físiaca',1,'e6ddaf'),(7,'Ciencias Naturales',1,'cae3cb'),(8,'Moral, Urbanidad y Cívica',1,''),(9,'Orientación Para La Vida',2,''),(10,'Seminario',2,''),(11,'Curso de Habilidad Laboral',2,''),(12,'Tecnología I',3,''),(13,'Tecnología II',3,''),(14,'Tecnología III',3,''),(15,'Práctica Profesional I',3,''),(16,'Práctica Profesional II',3,''),(17,'Práctica Profesional III',3,''),(18,'Laboratorio de Creatividad I',3,'f0b8f0'),(19,'Laboratorio de Creatividad II',3,''),(20,'Laboratorio de Creatividad III',3,''),(21,'Contaduría',4,''),(22,'General',4,'e8d0e8');
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
REPLACE INTO `notificaciones` VALUES (690,'2020-01-27 15:41:35',1045367084,16020,'Solicitud de permiso nueva','Andrea Johana Pleitez Alcántara ha solicitado un nuevo permiso.','\0',' '),(691,'2020-01-27 15:41:35',1045367085,16020,'Solicitud de permiso nueva','Andrea Johana Pleitez Alcántara ha solicitado un nuevo permiso.','',' '),(692,'2020-01-27 15:42:18',16020,1045367085,'Rechado de permiso','Francisco Javier Magaña Arriola ha rechazado su solicitud de permiso. Motivo del rechazo: el motivo no es válido ','',' '),(693,'2020-01-27 15:42:59',16020,16020,'Modificación de solicitud de permiso','Su permiso se ha solicitado para entre las fechas: 27/01/2020 y 27/01/2020','',' '),(694,'2020-01-27 15:42:59',1045367084,16020,'Modificaciones en una solicitud de permiso','Andrea Johana Pleitez Alcántara ha cambiado su solicitud de permiso.','\0',' '),(695,'2020-01-27 15:43:00',1045367085,16020,'Modificaciones en una solicitud de permiso','Andrea Johana Pleitez Alcántara ha cambiado su solicitud de permiso.','',' '),(696,'2020-01-27 15:44:24',16020,1045367085,'Rechado de permiso','Francisco Javier Magaña Arriola ha rechazado su solicitud de permiso. Motivo del rechazo:  debe anexar una constancia válida','',' '),(697,'2020-01-27 15:45:15',16020,16020,'Modificación de solicitud de permiso','Su permiso se ha solicitado para entre las fechas: 27/01/2020 y 27/01/2020','',' '),(698,'2020-01-27 15:45:16',1045367084,16020,'Modificaciones en una solicitud de permiso','Andrea Johana Pleitez Alcántara ha cambiado su solicitud de permiso.','\0',' '),(699,'2020-01-27 15:45:16',1045367085,16020,'Modificaciones en una solicitud de permiso','Andrea Johana Pleitez Alcántara ha cambiado su solicitud de permiso.','',' '),(700,'2020-01-27 15:46:34',16020,1045367085,'Aceptación de permiso','Francisco Javier Magaña Arriola ha aceptado su solicitud de permiso. ','',' '),(701,'2020-01-27 15:48:49',1045367087,1045367073,'Se ha agregado una nueva hora clase al horario','Agregación: Viernes 07:15 AM - 08:05 AM Materia: Estudios Sociales. Profesor: María Pineda. Grado: 2° General Sección A','',' '),(702,'2020-01-27 15:50:14',1045367087,1045367073,'Seha editado el horario','Modificación: Miércoles 07:15 AM - 08:05 AM Materia: Estudios Sociales. Profesor: María Pineda. Grado: 2° General Sección A','',' '),(703,'2020-01-27 15:50:38',1045367087,1045367073,'Seha editado el horario','Modificación: Miércoles 07:15 AM - 08:05 AM Materia: Estudios Sociales. Profesor: María Pineda. Grado: 1° TVC Contador Sección A','',' '),(704,'2020-01-27 15:51:07',1045367087,1045367073,'Seha editado el horario','Modificación: Viernes 07:15 AM - 08:05 AM Materia: Estudios Sociales. Profesor: María Pineda. Grado: 3° TVC Contador Sección B','',' ');
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
REPLACE INTO `permisos` VALUES (16020,'2020-01-27',4,'2020-01-27','2020-01-27',8,'Muerte de familiar cercano','1',16020,'0¿¿¿¿¿¿ ');
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
REPLACE INTO `persona` VALUES (16018,'Francisco Antonio','Regalado Cruz','1999-01-16','savvvvvvvv','',0,1,'02#13','8d2a5f7d4afa5d0530789d3066945330','',8,'','','\0',0,'Salvadoreña','','',''),(16019,'Rigoberto Alexander','Cárcamo Murga','1998-08-13','santa ana texistepeque','',0,2,'02#13','5218f316b3f85b751c613a06aa18010d','',8,'','','\0',0,'Salvadoreña','','',''),(16020,'Andrea Johana','Pleitez Alcántara','2000-09-23','santa ana metapán','',0,2,'02#07','ac2a728f9f17b5d860b6dabd80a5162f','',8,'','','',0,'Salvadoreña','','',''),(1045367070,'Jorge Agustín','Pereira cruz','1988-12-04','6666666666666666','7888-8888',0,0,'01#01','ab8a338aa2b1da6d97c11ba6e67be768','',9,'','','\0',0,'Salvadoreña','666666666666666','',''),(1045367071,'Sandra Andaya','Cruz Fuentes',NULL,NULL,'4564-5656',NULL,NULL,NULL,'cd9187113425eae93d8116205d03bdde',NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1045367072,'Ana Lidia','Cárcamo Flores','1975-07-15','texistepeque santa ana','6666-6666',0,1,'02#13','7845e7b45be70d2391a2b16c2ffb68e3','',9,'','','',1,'Salvadoreña','','',''),(1045367073,'Guillermo Aldolfo','Delsas Murcia','1991-01-17',NULL,NULL,0,NULL,NULL,'02951a6cb9595ef475fed783e59c687e','Ingeniero de Sistemas Informáticos',1,'','0213-170191-102-9','\0',NULL,'Salvadoreña','guillermox020@gmail.com',NULL,NULL),(1045367074,'Adán Rigoberto','Flores Colsí',NULL,'','4555-5555',0,0,' # ','630abdfb00098f16ba48450363d8d64d','',11,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367075,'Pablo José','Martínez Córdova','1985-11-22','santa ana texistepeque','9999-9999',0,0,'02#13','13f93ad73a8401c8735cc30fd70c7698','',9,'','','\0',0,'Salvadoreña','','',''),(1045367076,'Juan Sigfredo','Arriola Sagastume',NULL,'','6444-4444',0,0,' # ','ea519761c0e00b5ae877cbfce9ce697a','',11,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367077,'Venancia María','Rosales Mata',NULL,'','7856-4666',0,0,' # ','2161b146f79c6a1b733b60a8e0ef7175','',10,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367080,'María Carmen','Peña Cárcamo','1990-06-20','santa ana santa ana santa ana','9999-9999',0,1,'02#10','6e80cf219e79bc8a8d83ce9a5b757f64','Licenciada en administración de Empresas',6,'','9999-999999-999-9','',0,'Salvadoreña','99999999999@gmail.com','',''),(1045367081,'Hugo Daniel','Flores Diaz','1989-08-12','ahuachapan ahuachapan','8888-8888',0,1,'01#01','ad9f88eb26394a8ad9f46975cf79a133','Abogado',5,'','8888-888888-888-8','\0',0,'Salvadoreña','888888888@gmail.com','',''),(1045367082,'José Antonio','Murcia Pérez','1979-07-15','sonsonate sonsonate','7777-7777',0,1,'03#01','5f04b909d4b1bca2e6e57dbbf7208c51','profesor',7,'','7777-777777-777-7','\0',1,'Salvadoreña','77777777@gmail.com','',''),(1045367083,'Laura María','López Suñiga','1960-04-15','santa ana el porvenir','5555-5555',0,1,'02#05','a6ba5f99ff9616298b2212c76ea111dc','profesora',2,'','6666-666666-666-6','',1,'Salvadoreña','555555555@gmail.com','',''),(1045367084,'María Pilar','Dolores ALvarado','1956-01-13','santa ana texistepeque','4444-4444',213,1,'02#13','0c979466ac54e4b96f3f5c832e126941','profesora en matemáticas',4,'','4444-444444-444-4','',1,'Salvadoreña','444444444@gmail.com','',''),(1045367085,'Francisco Javier','Magaña Arriola','1988-05-25','santa ana coatepeque','3333-3333',206,0,'02#03','ff0c210fd0f86b21bc0497faef184c7b','profesor',4,'','3333-333333-333-3','\0',0,'Salvadoreña','333333333@gmail.com','',''),(1045367086,'Juan Manuel','Bartanes Pilar','1990-11-15','cuscatlan monte san juan','2222-2222',780,1,'05#05','f59bc51b847690dce791fce5f7179e04','Administrador de empresas',4,'','2222-222222-222-2','\0',1,'Salvadoreña','222222222@gmail.com','',''),(1045367087,'María Dolores','Pineda Mata','1983-07-15','santa ana metapán','1111-1111',210,1,'02#07','ee17cb731e48303aafe44cfe78c25853','profesora',4,'','1111-111111-111-1','',1,'Salvadoreña','111111111@gmail.com','',''),(1045367088,'Laura Isabel','Pneda Rosell','1981-05-10','santa ana santa ana','0000-0000',0,1,'02#10','c95b8be4befbee1a550a06fd19ed251a','Psicóloga',14,'','0000-000000-000-0','',1,'Salvadoreña','00000000@gmail.com','',''),(1045367089,'Álvaro Mateo','Cienfuegos Altamirano','1970-12-12','santa ana Texistepeque','4444-4444',0,0,'02#13','d5367241b0f4893393b6bc984029e999','Jornalero',15,'','4444-444444-444-4','\0',1,'Salvadoreña','444444444@gmail.com','',''),(1045367090,'Pablo Alejandro','Martínez Santos','1960-03-01','sonsonate acajutla','9999-8888',0,0,'03#01','8912074c9b782911ff4f5585c747c132','Técnico en reparación de computadoras',12,'','9999-999888-888-8','\0',1,'Salvadoreña','999988888@gmail.com','',''),(1045367091,'Alba Lucía','Aybara Campos','1988-12-30','cuscatlán cuscatlán','8888-8999',0,1,'05#02','f0ee269fcf3f4b1f8883aab03e6a7919','Secretaria',13,'','8888-888888-999-9','',1,'Salvadoreña','888888899999999@gmail.com','','');
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
REPLACE INTO `recurso` VALUES (1,'10 pasos para una mejor calidad de vida',100,3,1,68,'',10,'B','REAL','1',NULL),(2,'Cañon multimedia',NULL,1,1,NULL,'',325,'B','ESTIMADO','',NULL),(6,'Microscopio',NULL,2,3,NULL,'',356,'B','ESTIMADO','',NULL),(98,'No me agarran viva',900,3,1,68,'',3,'B','REAL','10',NULL),(1140,'Luciernagas en El Mozote',800,3,1,68,'',12.85,'B','REAL','11',NULL),(1890,'El Arte de amargarse la vida',100,3,1,68,'',20.9,'B','REAL','1',NULL),(7663,'El libro de la selva',700,3,3,73,'',19.99,'B','REAL','2',NULL);
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
REPLACE INTO `reserva` VALUES (1,'2020-01-25 22:50:12','2020-01-27 22:52:00','2020-01-27 23:50:00',1,1,2,'S',NULL,NULL,NULL,'fgd','ndfndfnd',NULL,NULL,NULL,NULL,'Francisco Regalado¿¿2¿¿0¿¿¿¿0'),(2,'2020-01-25 23:05:49','2020-01-27 21:06:00','2020-01-27 23:05:00',3,1,NULL,'S',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'Francisco Regalado¿¿2¿¿0¿¿¿¿0');
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

-- Dump completed on 2020-01-27 16:54:00
