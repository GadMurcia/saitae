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
  `idacceso` int(11) NOT NULL AUTO_INCREMENT,
  `accesoNombre` varchar(30) NOT NULL,
  `accesoIndice` int(11) DEFAULT '0',
  `accesourl` varchar(100) NOT NULL,
  `accesoComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idacceso`),
  UNIQUE KEY `accesoNombre_UNIQUE` (`accesoNombre`),
  UNIQUE KEY `idacceso_UNIQUE` (`idacceso`),
  KEY `fk_acceso_1_idx` (`accesoIndice`),
  CONSTRAINT `fk_acceso_1` FOREIGN KEY (`accesoIndice`) REFERENCES `acceso` (`idacceso`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES (9,'Configuración',NULL,'#','fa fa-cog'),(10,'Administración',9,'tipopp.intex','pi pi-folder-open'),(11,'Permisos y Licencias',9,'lictp.intex','pi pi-th-large'),(12,'Académica',9,'academico.intex','fa fa-leaf'),(13,'Perfil',NULL,'#','pi pi-user'),(14,'Permisos',NULL,'#','pi pi-eye'),(15,'Solicitar Permiso',14,'permisoE.intex','pi pi-briefcase'),(16,'Personal',NULL,'#','pi pi-users'),(17,'Agregar Maestro',27,'agregacion.intex','pi pi-user-plus'),(18,'Agregar Administrador',16,'agAdm.intex','pi pi-plus'),(19,'Plantel Institucional',35,'plantel.intex','pi pi-table'),(20,'Inventario',23,'inventario.intex','fa fa-barcode'),(21,'Libros',23,'libros.intex','fa fa-book'),(22,'Nuevo Ingreso',36,'inscripcion.intex','pi pi-user'),(23,'Recursos',9,'#','fa fa-yelp'),(24,'Nomina de Alumnos',36,'nominaA.intex','pi pi-user'),(25,'Administración de Recursos',23,'recurso.intex','fa fa-table'),(26,'Lista de Representantes',35,'listaRepresentantes.intex','pi pi-list'),(27,'Maestros',16,'#','fa fa-puzzle-piece'),(28,'Asignación de materias',27,'horario.intex','pi pi-plus'),(29,'Administración de permisos',14,'permiso.intex','fa fa-legal'),(30,'Solicitud de permisos',14,'permisoM.intex','fa fa-ge'),(31,'Administrador de anuncios',9,'anuncios.intex','fa fa-bell'),(32,'Matricula',36,'matricula.intex','fa fa-slideshare'),(33,'Entrega de Útiles',36,'paquetes.intex','fa fa-sliders'),(34,'Contribuciones',36,'contribuciones.intex','fa fa-money'),(35,'Listados',16,'#','fa fa-list-ul'),(36,'Alumnos',16,'#','fa fa-graduation-cap'),(37,'Reservas de Equipo',NULL,'#','fa fa-gamepad'),(38,'Solicitud de Reserva',37,'solicitudR.intex','fa fa-flag'),(39,'Historial de Reservas',37,'solicitudH.intex','fa fa-archive');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accesoTipoPersona`
--

DROP TABLE IF EXISTS `accesoTipoPersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesoTipoPersona` (
  `idacceso` int(11) NOT NULL,
  `idTipoPersona` int(11) NOT NULL,
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
INSERT INTO `accesoTipoPersona` VALUES (9,1,''),(9,2,''),(9,3,''),(9,5,''),(9,6,''),(9,7,''),(10,1,''),(10,2,''),(11,1,''),(11,2,''),(11,3,''),(12,1,''),(12,2,''),(14,1,''),(14,2,''),(14,3,''),(14,4,''),(14,5,''),(14,6,''),(14,7,''),(14,8,''),(14,9,''),(14,12,''),(14,13,''),(14,14,''),(14,15,''),(15,8,''),(15,9,''),(16,1,''),(16,2,''),(16,3,''),(16,4,''),(16,12,''),(16,13,''),(17,1,''),(17,2,''),(18,1,''),(18,2,''),(19,1,''),(19,2,''),(19,3,''),(19,13,''),(20,1,''),(20,2,''),(20,5,''),(20,6,''),(20,7,''),(21,1,''),(21,2,''),(21,5,''),(22,1,''),(22,2,''),(22,3,''),(22,13,''),(23,1,''),(23,2,''),(23,5,''),(23,6,''),(23,7,''),(24,1,''),(24,2,''),(24,3,''),(24,4,''),(24,13,''),(25,1,''),(25,2,''),(25,5,''),(25,6,''),(25,7,''),(26,1,''),(26,2,''),(26,3,''),(26,4,''),(26,13,''),(27,1,''),(27,2,''),(28,1,''),(28,2,''),(29,1,''),(29,2,''),(29,3,''),(30,1,''),(30,2,''),(30,3,''),(30,4,''),(30,5,''),(30,6,''),(30,7,''),(30,12,''),(30,13,''),(30,14,''),(30,15,''),(31,1,''),(31,2,''),(31,3,''),(31,4,''),(31,5,''),(31,6,''),(31,7,''),(31,13,''),(32,1,''),(32,2,''),(32,13,''),(33,1,''),(33,2,''),(33,12,''),(34,1,''),(34,2,''),(34,12,''),(35,1,''),(35,2,''),(35,3,''),(35,4,''),(35,13,''),(36,1,''),(36,2,''),(36,3,''),(36,4,''),(36,13,''),(37,1,''),(37,2,''),(37,3,''),(37,4,''),(37,5,''),(37,6,''),(37,7,''),(37,8,''),(37,13,''),(37,14,''),(38,1,''),(38,2,''),(38,3,''),(38,4,''),(38,5,''),(38,6,''),(38,7,''),(38,8,''),(39,1,''),(39,2,''),(39,3,''),(39,4,''),(39,5,''),(39,6,''),(39,7,''),(39,8,'');
/*!40000 ALTER TABLE `accesoTipoPersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anuncio`
--

DROP TABLE IF EXISTS `anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncio` (
  `idanuncio` int(11) NOT NULL AUTO_INCREMENT,
  `anuncioTitulo` varchar(45) NOT NULL,
  `anuncioFechaFin` date NOT NULL,
  `anuncioTexto` text NOT NULL,
  `anuncioAnunciante` int(11) NOT NULL,
  `anuncioTipoPersona` int(11) DEFAULT '0',
  `anuncioComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idanuncio`,`anuncioFechaFin`),
  KEY `fk_anuncio_1_idx` (`anuncioAnunciante`),
  KEY `fk_anuncio_2_idx` (`anuncioTipoPersona`),
  CONSTRAINT `fk_anuncio_1` FOREIGN KEY (`anuncioAnunciante`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_anuncio_2` FOREIGN KEY (`anuncioTipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES (2,'Home','2019-10-20','Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.',1045367073,NULL,''),(3,'Profile','2019-10-20','Food truck fixie locavore, accusamus mcsweeney\'s marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.',1045367073,8,''),(4,'qwwqwq','2019-10-20','wqwq\r\nwq\r\nqw\r\nqw\r\nqw\r\n\r\nwq',1045367073,NULL,NULL),(5,'SUSPENCIÓN DE CLASES','2019-10-14','Se suspenderán las clases el próximo Viernes 11 de Octubre. \r\nClases normales al regresar el LUNES 14. \r\n',1045367073,NULL,NULL),(6,'iglliglgiguligilggilgl','2019-10-20','lvlvl lil igl igligligl gl gligligli ilglig ligli gl ili glig ilglgy',1045367073,3,NULL),(7,'anuncio ara todos','2019-10-14','oñasdchodashoñ hcñhc ñhc dh hcd hch ñcd ccoñ oc ocas hñ hñcao ñhoas ñsdchsodgvgvsduñ ñcdsagño asd gcñovsguñvoagcva ñsdcgañso cgñoasgñocgañscgñasocasdcñvgsñoasdñgcñosc gvaoñsgcñ osagdcñsodgcñosagdcvoasñvga',1045367073,NULL,NULL),(8,'ioyoyooñy','2019-10-20','ouyñouyobviyfiijklljhjhj  hl hg s ñc ñsdcv ñvfdv fñ vdf vfd vdf ñvfd ñvfwpv pv pvfe vfe vephhpf vh k vvjh vfwe ippwvfe ih{pv ihvf ihvwe iwep {ve hhfvuoeu yeyuyeutyu ew ywewyeye yey g8 y49tu u ovfh ñvhjvsdh vh ñsdhñ dvhdls',1045367073,8,NULL),(9,'Hola a todos','2019-10-22','hola k hace',1045367073,NULL,NULL);
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aula` (
  `idaula` int(11) NOT NULL AUTO_INCREMENT,
  `zonaAula` int(11) NOT NULL,
  `aulaComentario` varchar(145) DEFAULT NULL COMMENT 'Contiene la lista de las aulas del instituto',
  PRIMARY KEY (`idaula`),
  KEY `fk_aula_1_idx` (`zonaAula`),
  CONSTRAINT `fk_aula_1` FOREIGN KEY (`zonaAula`) REFERENCES `zona` (`idzona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (1,2,''),(2,1,''),(3,1,''),(4,1,''),(5,1,''),(6,2,''),(7,2,'');
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `idautor` int(11) NOT NULL AUTO_INCREMENT,
  `autorNombre` varchar(30) NOT NULL,
  `autorComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idautor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Rusou 1',''),(2,'loosss','8'),(3,'Delsas','');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorLibro`
--

DROP TABLE IF EXISTS `autorLibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorLibro` (
  `idautor` int(11) NOT NULL,
  `idLibro` int(11) NOT NULL,
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
INSERT INTO `autorLibro` VALUES (1,5,''),(1,8,''),(2,8,''),(3,1,'');
/*!40000 ALTER TABLE `autorLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacitaciones`
--

DROP TABLE IF EXISTS `capacitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capacitaciones` (
  `idMaestro` int(11) NOT NULL,
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
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `cargoNombre` varchar(50) NOT NULL COMMENT 'Lista de los cargos que el personal docente puede desempeñar.',
  `cargoTipoPersona` int(11) DEFAULT NULL,
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
INSERT INTO `cargo` VALUES (1,'Director',2,''),(2,'Subdirector',3,''),(3,'Coordinador de área bibliográfica',5,''),(4,'Coordinador de área Informática',6,''),(5,'Psicólogo',14,''),(6,'Coordinador de laboratorio de CC.NN',7,NULL);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
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
INSERT INTO `categoria` VALUES (0,'Generalidades s',NULL),(100,'Filosofías y Disciplinas afines',NULL),(300,'Ciencias Sociales',''),(400,'Leguas',''),(500,'Ciencias Puras',''),(600,'Ciencias Aplicadas',''),(700,'Bellas Artes',''),(800,' Literatura',''),(900,'Geografia e Historia','');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citaPsicologia`
--

DROP TABLE IF EXISTS `citaPsicologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citaPsicologia` (
  `estudiante` int(11) NOT NULL,
  `fechaSolicitada` datetime NOT NULL,
  `fechaSolicitud` datetime NOT NULL,
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
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `idestudiante` int(11) NOT NULL,
  `fechaHoraConsulta` datetime NOT NULL,
  `idPsicologo` int(11) NOT NULL,
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
  `consultaExpediente` int(11) DEFAULT NULL,
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
  `idLibro` int(11) NOT NULL,
  `contenidoLibroNombre` varchar(145) NOT NULL,
  `contenidoLibroPagina` int(11) NOT NULL,
  `contenidoLibroIndice` int(11) NOT NULL,
  `contenidoLibroComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idLibro`,`contenidoLibroNombre`,`contenidoLibroPagina`),
  CONSTRAINT `fk_contenidoLibro_1` FOREIGN KEY (`idLibro`) REFERENCES `recurso` (`idrecurso`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidoLibro`
--

LOCK TABLES `contenidoLibro` WRITE;
/*!40000 ALTER TABLE `contenidoLibro` DISABLE KEYS */;
INSERT INTO `contenidoLibro` VALUES (1,'455454',1,0,NULL),(1,'7878454545',2,0,NULL),(5,'5ĺ+kṕk',3,0,NULL),(5,'nhsdfhsgfdgsl',8,0,NULL),(8,'4564654646',2,0,NULL),(8,'6645464654',1,0,NULL),(8,'9789797974',4,0,NULL);
/*!40000 ALTER TABLE `contenidoLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribuciones`
--

DROP TABLE IF EXISTS `contribuciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contribuciones` (
  `idEstudiante` int(11) NOT NULL,
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
INSERT INTO `contribuciones` VALUES (16018,2019,'2019-10-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `contribuciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delagacionCargo`
--

DROP TABLE IF EXISTS `delagacionCargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delagacionCargo` (
  `iddelagacionCargo` int(11) NOT NULL,
  `idTipoPersona` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL,
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
  `idDias` int(11) NOT NULL AUTO_INCREMENT,
  `diasEstudioNombre` varchar(45) NOT NULL,
  `diasEstudioComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idDias`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
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
  `iddocumentos` int(11) NOT NULL,
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
INSERT INTO `documentos` VALUES (16018,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16022,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editorial` (
  `ideditorial` int(11) NOT NULL AUTO_INCREMENT,
  `editorialNombre` varchar(50) NOT NULL,
  `editorialComentarios` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`ideditorial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'rousoes',NULL),(2,'lessss ',NULL),(3,'Delsas',NULL);
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorialLibro`
--

DROP TABLE IF EXISTS `editorialLibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editorialLibro` (
  `ideditorial` int(11) NOT NULL,
  `idLibro` int(11) NOT NULL,
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
INSERT INTO `editorialLibro` VALUES (1,1,''),(1,5,''),(1,8,''),(2,5,''),(2,8,''),(3,8,'');
/*!40000 ALTER TABLE `editorialLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplar`
--

DROP TABLE IF EXISTS `ejemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ejemplar` (
  `idRecurso` int(11) NOT NULL,
  `ejemplarCorrelativo` int(11) NOT NULL,
  `ejemplarAnioDeIngreso` int(4) NOT NULL,
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
INSERT INTO `ejemplar` VALUES (1,1,2019,''),(1,2,2019,''),(2,2,2019,''),(3,3,2019,''),(4,4,2019,''),(5,5,2019,''),(5,6,2019,''),(6,6,2019,''),(6,7,2019,''),(6,8,2019,''),(6,9,2019,''),(6,10,2019,''),(6,11,2019,''),(6,12,2019,''),(6,13,2019,''),(6,14,2019,''),(6,15,2019,''),(7,7,2019,''),(8,8,2019,''),(8,9,2019,'');
/*!40000 ALTER TABLE `ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregaUtiles`
--

DROP TABLE IF EXISTS `entregaUtiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregaUtiles` (
  `idEstudiante` int(11) NOT NULL,
  `año` int(4) NOT NULL,
  `idEntregante` int(11) NOT NULL,
  `idRepresentante` int(11) NOT NULL,
  `zapatos` bit(1) NOT NULL,
  `uniforme` bit(1) NOT NULL,
  `utiles` bit(1) NOT NULL,
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
INSERT INTO `entregaUtiles` VALUES (16018,2019,1045367073,1045367070,'\0','\0','',NULL);
/*!40000 ALTER TABLE `entregaUtiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `idestudiante` int(11) NOT NULL,
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
  `estudianteRepresentante` int(11) DEFAULT NULL,
  `estudiantePadre` int(11) DEFAULT NULL,
  `estudianteMadre` int(11) DEFAULT NULL,
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
INSERT INTO `estudiante` VALUES (16018,'',0,'',0,1.00,'\0','Padre#Madre#Abuelo/a#Hermano/a¿ ','\0','','','Padre','','Noveno Grado','','centro de procedencia del estudiante uno','','',1045367070,1045367071,1045367072,''),(16022,'',1,'',1,1.00,'\0','Padre#Madre#Abuelo/a#Hermano/a¿ ','\0','','','aaaaaaa','','Noveno Grado','','centro','','',1045367081,1045367082,1045367083,''),(1045367070,'',1,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'Padre','\0','bachillerato','bla bla',NULL,'','',NULL,NULL,NULL,''),(1045367081,'',0,'',NULL,NULL,'\0',NULL,NULL,NULL,NULL,'aaaaaaa','\0','aa','aaaaaaaaa',NULL,'','',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacionMaestro`
--

DROP TABLE IF EXISTS `evaluacionMaestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacionMaestro` (
  `idMaestro` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `grado` int(11) NOT NULL,
  `seccion` enum('A','B','C') NOT NULL,
  `año` int(4) NOT NULL,
  `materia` int(11) NOT NULL,
  `turno` enum('M','v') NOT NULL,
  `Estudiantes` int(11) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `unidad` varchar(45) NOT NULL,
  `objetivo` varchar(80) NOT NULL,
  `evaluador` int(11) NOT NULL,
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
  `idEstudiante` int(11) NOT NULL,
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
  `idfinanciamiento` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `financiamiento` VALUES (1,'MINED',NULL),(2,'CDE',NULL),(3,'Alcaldía',NULL),(4,'ONG2',NULL);
/*!40000 ALTER TABLE `financiamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grado` (
  `idgrado` int(11) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `gradoSeccion` enum('A','B','C') NOT NULL,
  `gradoAño` int(4) NOT NULL,
  `aulaGrado` int(11) NOT NULL,
  `gradoActivo` bit(1) NOT NULL,
  `gradoMaestroGuia` int(11) DEFAULT NULL,
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
INSERT INTO `grado` VALUES (1,'C','A',2019,1,'',NULL,NULL),(1,'C','B',2019,2,'',NULL,NULL);
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradoEvaluacion`
--

DROP TABLE IF EXISTS `gradoEvaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradoEvaluacion` (
  `idGrado` int(11) NOT NULL,
  `gradoSeccion` enum('A','B','C') NOT NULL,
  `gradoAño` int(4) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `fechaEvaluacion` date NOT NULL COMMENT 'histórico de evaluaciones a cada grado del instituto.',
  `evaluador` int(11) NOT NULL,
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
  `idhorario` int(11) NOT NULL,
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
INSERT INTO `horario` VALUES (1,'07:15:00','08:05:00',NULL),(2,'08:05:00','08:55:00',NULL),(3,'09:15:00','10:05:00',NULL),(4,'10:05:00','10:55:00',NULL),(5,'11:10:00','12:00:00',NULL),(6,'13:00:00','13:50:00',NULL),(7,'13:50:00','14:40:00',NULL),(8,'14:50:00','15:40:00',NULL),(9,'15:40:00','16:30:00',NULL),(10,'16:30:00','17:20:00',NULL);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maestoCargo`
--

DROP TABLE IF EXISTS `maestoCargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maestoCargo` (
  `idMaesto` int(11) NOT NULL,
  `idCargo` int(11) NOT NULL,
  `idNombramiento` int(11) NOT NULL,
  `idFinanciamiento` int(11) NOT NULL,
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
INSERT INTO `maestoCargo` VALUES (1045367080,6,1,2,'2019-10-20',NULL,NULL,NULL);
/*!40000 ALTER TABLE `maestoCargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maestro`
--

DROP TABLE IF EXISTS `maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maestro` (
  `idmaestro` int(11) NOT NULL,
  `maestroNip` int(11) NOT NULL,
  `maestroNup` int(11) NOT NULL,
  `maestroCodigo` int(11) NOT NULL,
  `maestroPartidas` int(11) NOT NULL,
  `maestroSubnumeros` int(11) NOT NULL,
  `maestroNivel` int(11) NOT NULL,
  `maestroCategoria` int(11) NOT NULL,
  `maestroAfp` varchar(45) NOT NULL,
  `maestroBienestar` int(11) NOT NULL,
  `maestrocolTelefonoResidencia` varchar(9) NOT NULL,
  `maestroEspecialidad` int(11) NOT NULL,
  `maestroFechaMagisterio` date NOT NULL,
  `maestroFechaInstitucion` date NOT NULL,
  `maestroFechaProximoAsenso` date DEFAULT NULL,
  `maestroTurno` enum('M','V','T') NOT NULL,
  `maestroTiempoCategoria` varchar(10) NOT NULL,
  `maestroSinEscalafon` bit(1) NOT NULL DEFAULT b'1',
  `maestroTipoSalario` int(11) NOT NULL,
  `maestroUtilidadTecnologica` bit(1) NOT NULL DEFAULT b'1',
  `maestroHorasUsoTecnologia` int(11) NOT NULL DEFAULT '0',
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
INSERT INTO `maestro` VALUES (1045367080,0,0,0,0,0,0,0,'Guillermo Aldolfo Delsas Murcia',6,'8878-7878',4,'2019-10-11','2019-10-11','2019-10-11','T','2','',3,'',0,'','','','');
/*!40000 ALTER TABLE `maestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `idmateria` int(11) NOT NULL AUTO_INCREMENT,
  `materiaNombre` varchar(60) NOT NULL,
  `tipoMateria` int(11) NOT NULL COMMENT 'Listado de las materias que se imparten en la institucion.',
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
INSERT INTO `materia` VALUES (1,'Matemática',1,'20b057'),(2,'Lenguaje',1,'7184e3'),(3,'Inglés',1,'c73625'),(4,'Informática',1,'cf9dcf'),(5,'Estudios Sociales',1,'9fc7a3'),(6,'Educación Físiaca',1,''),(7,'Ciencias Naturales',1,''),(8,'Moral, Urbanidad y Cívica',1,''),(9,'Orientación Para La Vida',2,''),(10,'Seminario',2,''),(11,'Curso de Habilidad Laboral',2,''),(12,'Tecnología I',3,''),(13,'Tecnología II',3,''),(14,'Tecnología III',3,''),(15,'Práctica Profesional I',3,''),(16,'Práctica Profesional II',3,''),(17,'Práctica Profesional III',3,''),(18,'Laboratorio de Creatividad I',3,''),(19,'Laboratorio de Creatividad II',3,''),(20,'Laboratorio de Creatividad III',3,''),(21,'Contaduría',4,''),(22,'General',4,'d9b2d9');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matricula` (
  `idmatricula` int(11) NOT NULL,
  `matriculaAnyo` int(4) NOT NULL,
  `matriculaNivel` int(11) NOT NULL,
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
INSERT INTO `matricula` VALUES (16018,2019,1,'C','A','\0','R'),(16022,2019,1,'C','A','\0','N');
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mestroHorarioMaterias`
--

DROP TABLE IF EXISTS `mestroHorarioMaterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mestroHorarioMaterias` (
  `idMaestro` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL COMMENT 'Detalle de las materias y horarios que cada docente imparte en la institución.',
  `idHorario` int(11) NOT NULL,
  `diaSemana` int(11) NOT NULL,
  `idGrado` int(11) NOT NULL,
  `gradoModalidad` enum('C','S','G') NOT NULL,
  `seccionGrado` enum('A','B','C') NOT NULL,
  `añoGrado` int(4) NOT NULL,
  `mestroHorarioMateriasComentarios` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idMaestro`,`idMateria`,`idHorario`,`diaSemana`,`idGrado`,`seccionGrado`,`añoGrado`,`gradoModalidad`),
  KEY `fk_mestroHorarioMaterias_2_idx` (`idMateria`),
  KEY `fk_mestroHorarioMaterias_3_idx` (`idHorario`),
  KEY `fk_mestroHorarioMaterias_4` (`idGrado`,`seccionGrado`,`añoGrado`,`gradoModalidad`),
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
INSERT INTO `mestroHorarioMaterias` VALUES (1045367080,1,1,1,1,'C','A',2019,NULL),(1045367080,2,2,1,1,'C','A',2019,NULL),(1045367080,3,3,1,1,'C','B',2019,NULL),(1045367080,4,4,1,1,'C','B',2019,NULL);
/*!40000 ALTER TABLE `mestroHorarioMaterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificaciones` (
  `fechaHora` datetime NOT NULL,
  `destinatario` int(11) NOT NULL,
  `remitente` int(11) NOT NULL,
  `notificacionTitulo` varchar(140) NOT NULL,
  `notificacionCuerpo` varchar(140) NOT NULL,
  `vista` bit(1) NOT NULL,
  `notificacionComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`fechaHora`),
  KEY `fk_notificaciones_1_idx` (`destinatario`,`remitente`),
  KEY `fk_notificaciones_2_idx` (`remitente`),
  CONSTRAINT `fk_notificaciones_1` FOREIGN KEY (`destinatario`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_notificaciones_2` FOREIGN KEY (`remitente`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES ('2019-10-20 21:32:51',1045367080,1045367073,'Relevación de Cargo','Ha sido relevado de su cargo como Subdirector Por Guillermo Delsas','',''),('2019-10-20 21:33:38',1045367080,1045367073,'Asignación de Cargo','Guillermo Delsas le ha asignado el cargo de Subdirector','',''),('2019-10-20 21:34:11',1045367080,1045367073,'Relevación de Cargo','Ha sido relevado de su cargo como Subdirector Por Guillermo Delsas','',''),('2019-10-20 21:34:49',1045367080,1045367073,'Asignación de Cargo','Guillermo Delsas le ha asignado el cargo de Director','',''),('2019-10-20 21:35:30',1045367080,1045367073,'Asignación de Cargo','Guillermo Delsas le ha asignado el cargo de Subdirector','',''),('2019-10-20 21:36:04',1045367080,16018,'Solicitud de permiso nueva','Estudiante1 Nombre Apellido estudiante1 ha solicitado un nuevo permiso.','',''),('2019-10-20 21:36:37',16018,1045367080,'Rechado de permiso','Mestro1 Nombre Apellido Maestro1 ha rechazado su solicitud de permiso ','',''),('2019-10-20 21:37:13',1045367080,16018,'Solicitud de permiso nueva','Estudiante1 Nombre Apellido estudiante1 ha solicitado un nuevo permiso.','',''),('2019-10-20 21:37:31',16018,1045367080,'Aceptación de permiso','Mestro1 Nombre Apellido Maestro1 ha aceptado su solicitud de permiso ','\0',''),('2019-10-20 21:38:07',1045367080,1045367073,'Solicitud de permiso nueva','Guillermo Delsas ha solicitado un nuevo permiso.','',''),('2019-10-20 21:38:22',1045367073,1045367080,'Aceptación de permiso','Mestro1 Nombre Apellido Maestro1 ha aceptado su solicitud de permiso ','',''),('2019-10-20 21:39:07',1045367080,1045367073,'Solicitud de permiso nueva','Guillermo Delsas ha solicitado un nuevo permiso.','',''),('2019-10-20 21:39:25',1045367073,1045367080,'Rechado de permiso','Mestro1 Nombre Apellido Maestro1 ha rechazado su solicitud de permiso ','',''),('2019-10-26 13:23:51',1045367080,1045367073,'Relevación de Cargo','Ha sido relevado de su cargo como Director Por Guillermo Delsas','',''),('2019-10-26 14:59:23',1045367080,1045367073,'Se ha ingresado un nuevo recurso','Guillermo Delsas ha modificado el inventario.','',''),('2019-10-26 15:00:49',1045367080,1045367073,'Relevación de Cargo','Ha sido relevado de su cargo como Subdirector Por Guillermo Delsas','',''),('2019-10-26 15:40:15',1045367080,1045367073,'Se ha ingresado un nuevo recurso','Guillermo Delsas ha modificado el inventario.','',''),('2019-10-26 15:58:54',1045367080,1045367080,'Se ha ingresado un nuevo recurso','Mestro1 Nombre Apellido Maestro1 ha modificado el inventario.','',''),('2019-10-26 16:44:54',1045367080,1045367073,'Relevación de Cargo','Ha sido relevado de su cargo como Coordinador de área Informática Por Guillermo Delsas','',''),('2019-10-26 16:52:57',1045367080,1045367073,'Relevación de Cargo','Ha sido relevado de su cargo como Coordinador de área bibliográfica Por Guillermo Delsas','',''),('2019-10-26 16:52:58',1045367080,1045367073,'Asignación de Cargo','Guillermo Delsas le ha asignado el cargo de Coordinador de laboratorio de CC.NN','','');
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idpais` int(11) NOT NULL,
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
INSERT INTO `pais` VALUES (1,'Afganistán',''),(2,'Islas Gland',''),(3,'Albania',''),(4,'Alemania',''),(5,'Andorra',''),(6,'Angola',''),(7,'Anguilla',''),(8,'Antártida',''),(9,'Antigua y Barbuda',''),(10,'Antillas Holandesas',''),(11,'Arabia Saudí',''),(12,'Argelia',''),(13,'Argentina',''),(14,'Armenia',''),(15,'Aruba',''),(16,'Australia',''),(17,'Austria',''),(18,'Azerbaiyán',''),(19,'Bahamas',''),(20,'Bahréin',''),(21,'Bangladesh',''),(22,'Barbados',''),(23,'Bielorrusia',''),(24,'Bélgica',''),(25,'Belice',''),(26,'Benin',''),(27,'Bermudas',''),(28,'Bhután',''),(29,'Bolivia',''),(30,'Bosnia y Herzegovina',''),(31,'Botsuana',''),(32,'Isla Bouvet',''),(33,'Brasil',''),(34,'Brunéi',''),(35,'Bulgaria',''),(36,'Burkina Faso',''),(37,'Burundi',''),(38,'Cabo Verde',''),(39,'Islas Caimán',''),(40,'Camboya',''),(41,'Camerún',''),(42,'Canadá',''),(43,'República Centroafricana',''),(44,'Chad',''),(45,'República Checa',''),(46,'Chile',''),(47,'China',''),(48,'Chipre',''),(49,'Isla de Navidad',''),(50,'Ciudad del Vaticano',''),(51,'Islas Cocos',''),(52,'Colombia',''),(53,'Comoras',''),(54,'República Democrática del Congo',''),(55,'Congo',''),(56,'Islas Cook',''),(57,'Corea del Norte',''),(58,'Corea del Sur',''),(59,'Costa de Marfil',''),(60,'Costa Rica',''),(61,'Croacia',''),(62,'Cuba',''),(63,'Dinamarca',''),(64,'Dominica',''),(65,'República Dominicana',''),(66,'Ecuador',''),(67,'Egipto',''),(68,'El Salvador',''),(69,'Emiratos Árabes Unidos',''),(70,'Eritrea',''),(71,'Eslovaquia',''),(72,'Eslovenia',''),(73,'España',''),(74,'Islas ultramarinas de Estados Unidos',''),(75,'Estados Unidos',''),(76,'Estonia',''),(77,'Etiopía',''),(78,'Islas Feroe',''),(79,'Filipinas',''),(80,'Finlandia',''),(81,'Fiyi',''),(82,'Francia',''),(83,'Gabón',''),(84,'Gambia',''),(85,'Georgia',''),(86,'Islas Georgias del Sur y Sandwich del Sur',''),(87,'Ghana',''),(88,'Gibraltar',''),(89,'Granada',''),(90,'Grecia',''),(91,'Groenlandia',''),(92,'Guadalupe',''),(93,'Guam',''),(94,'Guatemala',''),(95,'Guayana Francesa',''),(96,'Guinea',''),(97,'Guinea Ecuatorial',''),(98,'Guinea-Bissau',''),(99,'Guyana',''),(100,'Haití',''),(101,'Islas Heard y McDonald',''),(102,'Honduras',''),(103,'Hong Kong',''),(104,'Hungría',''),(105,'India',''),(106,'Indonesia',''),(107,'Irán',''),(108,'Iraq',''),(109,'Irlanda',''),(110,'Islandia',''),(111,'Israel',''),(112,'Italia',''),(113,'Jamaica',''),(114,'Japón',''),(115,'Jordania',''),(116,'Kazajstán',''),(117,'Kenia',''),(118,'Kirguistán',''),(119,'Kiribati',''),(120,'Kuwait',''),(121,'Laos',''),(122,'Lesotho',''),(123,'Letonia',''),(124,'Líbano',''),(125,'Liberia',''),(126,'Libia',''),(127,'Liechtenstein',''),(128,'Lituania',''),(129,'Luxemburgo',''),(130,'Macao',''),(131,'ARY Macedonia',''),(132,'Madagascar',''),(133,'Malasia',''),(134,'Malawi',''),(135,'Maldivas',''),(136,'Malí',''),(137,'Malta',''),(138,'Islas Malvinas',''),(139,'Islas Marianas del Norte',''),(140,'Marruecos',''),(141,'Islas Marshall',''),(142,'Martinica',''),(143,'Mauricio',''),(144,'Mauritania',''),(145,'Mayotte',''),(146,'México',''),(147,'Micronesia',''),(148,'Moldavia',''),(149,'Mónaco',''),(150,'Mongolia',''),(151,'Montserrat',''),(152,'Mozambique',''),(153,'Myanmar',''),(154,'Namibia',''),(155,'Nauru',''),(156,'Nepal',''),(157,'Nicaragua',''),(158,'Níger',''),(159,'Nigeria',''),(160,'Niue',''),(161,'Isla Norfolk',''),(162,'Noruega',''),(163,'Nueva Caledonia',''),(164,'Nueva Zelanda',''),(165,'Omán',''),(166,'Países Bajos',''),(167,'Pakistán',''),(168,'Palau',''),(169,'Palestina',''),(170,'Panamá',''),(171,'Papúa Nueva Guinea',''),(172,'Paraguay',''),(173,'Perú',''),(174,'Islas Pitcairn',''),(175,'Polinesia Francesa',''),(176,'Polonia',''),(177,'Portugal',''),(178,'Puerto Rico',''),(179,'Qatar',''),(180,'Reino Unido',''),(181,'Reunión',''),(182,'Ruanda',''),(183,'Rumania',''),(184,'Rusia',''),(185,'Sahara Occidental',''),(186,'Islas Salomón',''),(187,'Samoa',''),(188,'Samoa Americana',''),(189,'San Cristóbal y Nevis',''),(190,'San Marino',''),(191,'San Pedro y Miquelón',''),(192,'San Vicente y las Granadinas',''),(193,'Santa Helena',''),(194,'Santa Lucía',''),(195,'Santo Tomé y Príncipe',''),(196,'Senegal',''),(197,'Serbia y Montenegro',''),(198,'Seychelles',''),(199,'Sierra Leona',''),(200,'Singapur',''),(201,'Siria',''),(202,'Somalia',''),(203,'Sri Lanka',''),(204,'Suazilandia',''),(205,'Sudáfrica',''),(206,'Sudán',''),(207,'Suecia',''),(208,'Suiza',''),(209,'Surinam',''),(210,'Svalbard y Jan Mayen',''),(211,'Tailandia',''),(212,'Taiwán',''),(213,'Tanzania',''),(214,'Tayikistán',''),(215,'Territorio Británico del Océano Índico',''),(216,'Territorios Australes Franceses',''),(217,'Timor Oriental',''),(218,'Togo',''),(219,'Tokelau',''),(220,'Tonga',''),(221,'Trinidad y Tobago',''),(222,'Túnez',''),(223,'Islas Turcas y Caicos',''),(224,'Turkmenistán',''),(225,'Turquía',''),(226,'Tuvalu',''),(227,'Ucrania',''),(228,'Uganda',''),(229,'Uruguay',''),(230,'Uzbekistán',''),(231,'Vanuatu',''),(232,'Venezuela',''),(233,'Vietnam',''),(234,'Islas Vírgenes Británicas',''),(235,'Islas Vírgenes de los Estados Unidos',''),(236,'Wallis y Futuna',''),(237,'Yemen',''),(238,'Yibuti',''),(239,'Zambia',''),(240,'Zimbabue','');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `ipPersona` int(11) NOT NULL,
  `permisoFechaSolicitud` date NOT NULL,
  `tipoPermiso` int(11) NOT NULL,
  `permisoFechaInicio` date NOT NULL,
  `permisoFechafin` date NOT NULL,
  `tipoPersona` int(11) NOT NULL,
  `permisosMotivo` varchar(250) NOT NULL,
  `permisosEstado` enum('1','2','0') NOT NULL DEFAULT '0',
  `permisosSolicitante` int(11) NOT NULL,
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
INSERT INTO `permisos` VALUES (16018,'2019-10-14',4,'2019-10-14','2019-10-14',8,'4984884884','1',1045367080,'8788787-8¿¿88787887888 88 8 87 87¿¿87877888 87 87 8778 78 8 ¿¿ '),(16018,'2019-10-20',4,'2019-10-20','2019-10-20',8,'4112242225','2',16018,'0¿¿ ¿¿ ¿¿no aplica '),(16018,'2019-10-20',5,'2019-10-20','2019-10-20',8,'456464645','1',16018,'0¿¿ ¿¿ ¿¿ '),(16022,'2019-10-14',4,'2019-10-14','2019-10-14',8,'77777777','1',1045367080,'8787888-8¿¿8787887878¿¿78788887878778¿¿ '),(1045367073,'2019-10-20',1,'2019-10-20','2019-10-20',1,' ','1',1045367073,'1¿¿1¿¿ ¿¿ '),(1045367073,'2019-10-20',1,'2019-10-22','2019-10-22',1,' ','2',1045367073,'1¿¿1¿¿ ¿¿no aplica ');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
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
  `tipoPersona` int(11) DEFAULT NULL,
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
INSERT INTO `persona` VALUES (16018,'Estudiante1 Nombre','Apellido estudiante1','1995-01-17','544554454545455454 545 454 54 54 54 5454','',0,1,'02#01','8d2a5f7d4afa5d0530789d3066945330','',8,'','','',0,'Salvadoreña','','',''),(16022,'6022 nombre','6022 Apellido','1995-10-12','Cas. LA Y Griega, Cantón Chilcuyo, Texistepeque, Santa Ana','5037-0337',0,1,'01#01','da54dd5a0398011cdfa50d559c2c0ef8','',8,'','5454-545454-545-4','\0',0,'Salvadoreña','guillermox020@gmail.com','',''),(1045367070,'Repreentante1 Nombre','Apellido Representante1','1980-10-10','fuhwuo hfohuofhouh owheof ','',0,1,'01#02','ab8a338aa2b1da6d97c11ba6e67be768','',9,'','','\0',1,'Salvadoreña','','',''),(1045367071,'Paden1 Nombre','Apellido Padre1',NULL,'','8878-7878',0,0,' # ','cd9187113425eae93d8116205d03bdde','',11,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367072,'Madre1 Nombre','Apellido Madre1',NULL,'','4554-4554',0,0,' # ','7845e7b45be70d2391a2b16c2ffb68e3','',10,'\0',NULL,'',0,'Salvadoreña',NULL,'',''),(1045367073,'Guillermo','Delsas',NULL,NULL,NULL,NULL,NULL,NULL,'02951a6cb9595ef475fed783e59c687e','Ingeniero',1,'',NULL,'\0',NULL,NULL,NULL,NULL,NULL),(1045367080,'Mestro1 Nombre','Apellido Maestro1','1969-06-11','Cas. LA Y Griega, Cantón Chilcuyo, Texistepeque, Santa Ana','5037-0337',2256,0,'01#01','6e80cf219e79bc8a8d83ce9a5b757f64','Licenciada en Ciencias jurídicas',4,'','0202-020202-020-0','',0,'Salvadoreña','guillermox020@gmail.com','',''),(1045367081,'jkkjkjkjkjkjk kjkjkj','jkkjkjkjkj kjkj kjkjk','2019-10-30','5464446546556','4554-5454',0,0,'01#03','ad9f88eb26394a8ad9f46975cf79a133','653846+8985',6,'','2121-212121-212-1','\0',0,'Salvadoreña','45646546464646','',''),(1045367082,'admin','biblios','2019-10-30','75855454','5555-5545',0,0,'02#01','5f04b909d4b1bca2e6e57dbbf7208c51','86{pjuh',5,'','4546-546654-646-5','',0,'Salvadoreña','879466666864','',''),(1045367083,'04536708-3 madre','04536708-3 apeel',NULL,'','2220-2020',0,0,' # ','a6ba5f99ff9616298b2212c76ea111dc','',10,'\0',NULL,'',0,'Salvadoreña',NULL,'','');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personasReserva`
--

DROP TABLE IF EXISTS `personasReserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personasReserva` (
  `idReserva` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL,
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
  `idproyectoPedagogico` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProyecto` varchar(100) NOT NULL,
  `beneficiarios` varchar(100) NOT NULL,
  `duracion` varchar(5) NOT NULL,
  `diagnostico` mediumtext NOT NULL,
  `objetivoGeneral` varchar(100) NOT NULL,
  `objetivoEspecifico` varchar(100) NOT NULL,
  `justificacion` varchar(45) NOT NULL,
  `metodologia` varchar(45) NOT NULL,
  `actividades` varchar(45) NOT NULL,
  `recursoHumano` varchar(100) NOT NULL,
  `recursoMaterial` varchar(100) NOT NULL,
  `recursoFinanciero` varchar(100) NOT NULL,
  `seguimiento` varchar(45) NOT NULL,
  `productoEsperado` varchar(45) NOT NULL,
  `proyectoPedagogicoComentario` varchar(140) NOT NULL,
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
  `idrecurso` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria` int(11) DEFAULT NULL,
  `idTipoRecurso` int(11) NOT NULL,
  `tipoCargo` int(11) NOT NULL,
  `pais` int(11) DEFAULT NULL,
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
INSERT INTO `recurso` VALUES (1,'libro 1',100,3,1,68,'',35.12,'B','REAL','1',''),(2,'2232323',NULL,1,1,NULL,'',70,'B','REAL','875',''),(3,'3.46',NULL,1,1,NULL,'',20,'B','REAL','78',''),(4,'46546',NULL,1,2,NULL,'',70,'B','REAL','546',''),(5,'548456641646546',300,3,1,68,'',30.25,'B','REAL','7',''),(6,'654448696464',NULL,2,1,NULL,'',0,'B','ESTIMADO','',''),(7,'64546465465',NULL,1,1,NULL,'',78,'B','REAL','45',''),(8,'89484654684',300,3,1,29,'',45,'B','REAL','45','');
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL AUTO_INCREMENT,
  `reservaFecha` datetime NOT NULL,
  `reservaEntrega` datetime NOT NULL,
  `reservaDevolucion` datetime NOT NULL,
  `tipoReserva` int(11) NOT NULL,
  `reservaEstado` enum('S','E','D') NOT NULL,
  `reservaDevuelto` datetime DEFAULT NULL,
  `docente` int(11) DEFAULT NULL,
  `maeria` int(11) DEFAULT NULL,
  `tema` varchar(45) NOT NULL,
  `objetivoTema` varchar(100) NOT NULL,
  `TipoPtoyecto` int(11) NOT NULL,
  `reservaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idreserva`),
  KEY `fk_reserva_1_idx` (`tipoReserva`),
  KEY `fk_reserva_2_idx` (`docente`),
  KEY `fk_reserva_3_idx` (`maeria`),
  KEY `fk_reserva_4_idx` (`TipoPtoyecto`),
  CONSTRAINT `fk_reserva_1` FOREIGN KEY (`tipoReserva`) REFERENCES `tipoReserva` (`idtipoReserva`) ON UPDATE CASCADE,
  CONSTRAINT `fk_reserva_2` FOREIGN KEY (`docente`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_reserva_3` FOREIGN KEY (`maeria`) REFERENCES `materia` (`idmateria`) ON UPDATE CASCADE,
  CONSTRAINT `fk_reserva_4` FOREIGN KEY (`TipoPtoyecto`) REFERENCES `tipoProyecto` (`idtipoProyecto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `idRecurso` int(11) NOT NULL,
  `ejemplarCorrelativo` int(11) NOT NULL,
  `reservaDetalleComentario` varchar(145) DEFAULT NULL,
  `idReserva` int(11) NOT NULL,
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
  `idProyectoPedagogico` int(11) NOT NULL,
  `idReserva` int(11) NOT NULL,
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
  `idRecurso` int(11) NOT NULL,
  `solicitudReservaComentario` varchar(145) DEFAULT NULL,
  `idReserva` int(11) NOT NULL,
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
-- Table structure for table `tipoCargo`
--

DROP TABLE IF EXISTS `tipoCargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoCargo` (
  `idtipoCargo` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `tipoCargo` VALUES (1,'Fondos Propios',NULL),(2,'Actividades de la institución',NULL),(3,'Donación',NULL);
/*!40000 ALTER TABLE `tipoCargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoEspecialidades`
--

DROP TABLE IF EXISTS `tipoEspecialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoEspecialidades` (
  `idtipoEspecialidades` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `tipoEspecialidades` VALUES (1,'Matemáticas',''),(2,'Ciencias Naturales',''),(3,'Educación Física',''),(4,'Ciencias de la Educación',''),(5,'Lenguaje',''),(6,'Ciencias Sociales',''),(7,'Administración y Ciencias Comerciales',''),(8,'Inglés',''),(9,'Informática','');
/*!40000 ALTER TABLE `tipoEspecialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoMateria`
--

DROP TABLE IF EXISTS `tipoMateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoMateria` (
  `idtipoMateria` int(11) NOT NULL AUTO_INCREMENT,
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
  `idtipoNombramiento` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `tipoNombramiento` VALUES (1,'Propietario',NULL),(2,'Interino',NULL),(3,'Suplente',NULL);
/*!40000 ALTER TABLE `tipoNombramiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoPermiso`
--

DROP TABLE IF EXISTS `tipoPermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoPermiso` (
  `idtipoPermiso` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `tipoPermiso` VALUES (1,'Enfermedad',8,NULL),(2,'Materindad',0,NULL),(3,'Paternidad',0,NULL),(4,'Faltar a clases',0,NULL),(5,'Salir temporalmente de la institución',0,NULL),(6,'Retirarse de la institución',0,NULL),(7,'No portar uniforme',5,NULL);
/*!40000 ALTER TABLE `tipoPermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoPersona`
--

DROP TABLE IF EXISTS `tipoPersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoPersona` (
  `idtipoPersona` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `tipoPersona` VALUES (1,'Administrador','fa fa-diamond'),(2,'Director','pi pi-circle-on'),(3,'Subdirector','pi pi-circle-off'),(4,'Maestro','fa fa-street-view'),(5,'Bibliotecario','fa fa-forumbee'),(6,'Administrador CRA','fa fa-transgender-alt'),(7,'Laboratorista','fa fa-android'),(8,'Estudiante','fa fa-child'),(9,'Representante','fa fa-user-secret'),(10,'Madre de familia',''),(11,'Padre de familia',''),(12,'Colector','fa fa-cc-mastercard'),(13,'Secretaria','fa fa-database'),(14,'Psicologo',''),(15,'Ordenanza','');
/*!40000 ALTER TABLE `tipoPersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoProyecto`
--

DROP TABLE IF EXISTS `tipoProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoProyecto` (
  `idtipoProyecto` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `tipoProyecto` VALUES (1,'Proyecto Planificado',''),(2,'Exposición De Alumnos',''),(3,'Clase De Docente Con Tecnología','');
/*!40000 ALTER TABLE `tipoProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoRecurso`
--

DROP TABLE IF EXISTS `tipoRecurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoRecurso` (
  `idtipoRecurso` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `tipoRecurso` VALUES (1,'Tecnológico CRA',NULL),(2,'Tecnológico Laboratorio de Ciencias Naturales',NULL),(3,'Bibliográfico',NULL);
/*!40000 ALTER TABLE `tipoRecurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoReserva`
--

DROP TABLE IF EXISTS `tipoReserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoReserva` (
  `idtipoReserva` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `tipoReserva` VALUES (1,'Uso en sala',NULL),(2,'Uso dentro de la institución',NULL),(3,'Uso en aula',NULL),(4,'Fuera de la institución',NULL);
/*!40000 ALTER TABLE `tipoReserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoReservaRecurso`
--

DROP TABLE IF EXISTS `tipoReservaRecurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoReservaRecurso` (
  `tipoReserva` int(11) NOT NULL,
  `tipoRecurso` int(11) NOT NULL,
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
INSERT INTO `tipoReservaRecurso` VALUES (1,1,''),(1,2,''),(1,3,''),(1,4,''),(1,5,''),(1,6,''),(2,1,''),(2,4,''),(2,5,'');
/*!40000 ALTER TABLE `tipoReservaRecurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoSueldos`
--

DROP TABLE IF EXISTS `tipoSueldos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoSueldos` (
  `idtipoSueldo` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `tipoSueldos` VALUES (1,'Sueldo Base',''),(2,'Horas Clase',''),(3,'Ad Honorem','');
/*!40000 ALTER TABLE `tipoSueldos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopersonaPermiso`
--

DROP TABLE IF EXISTS `tipopersonaPermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopersonaPermiso` (
  `idtipopersona` int(11) NOT NULL,
  `idtipoPermiso` int(11) NOT NULL,
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
INSERT INTO `tipopersonaPermiso` VALUES (1,1,''),(1,2,''),(1,3,''),(2,1,''),(2,2,''),(2,3,''),(3,1,''),(3,2,''),(3,3,''),(4,1,''),(4,2,''),(4,3,''),(5,1,''),(5,2,''),(8,4,''),(8,5,''),(8,6,''),(8,7,''),(9,5,''),(9,6,''),(9,7,'');
/*!40000 ALTER TABLE `tipopersonaPermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zona` (
  `idzona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'La Identificación de la zona geográfica (1°, 2° y 3°) en la que está dividido el instituto.',
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
INSERT INTO `zona` VALUES (1,'Zona 1',NULL),(2,'Zona 2',NULL),(3,'Zona 3',NULL),(4,'zona 4',NULL);
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

-- Dump completed on 2019-10-31 22:42:23
