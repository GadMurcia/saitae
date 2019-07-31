CREATE DATABASE  IF NOT EXISTS `intex` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `intex`;
-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: intex
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0+deb9u1

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES (9,'Configuración',NULL,'#','pi pi-key'),(10,'Tipos del sistema',9,'tipopp.intex','pi pi-folder-open'),(11,'Materia',9,'materia.intex','pi pi-th-large'),(12,'Aulas',9,'aulas.intex','pi pi-circle-on'),(13,'Perfil',NULL,'#','pi pi-user'),(14,'Permisos',NULL,'#','pi pi-eye'),(15,'Solicitar Permiso',14,'permiso.intex','pi pi-briefcase'),(16,'Personal',NULL,'#','pi pi-users'),(17,'Agregar Maestro',16,'agregacion.intex','pi pi-user-plus'),(18,'Agregar Administrador',NULL,'#','pi pi-plus');
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
INSERT INTO `accesoTipoPersona` VALUES (9,1,''),(9,2,''),(10,1,''),(10,2,''),(11,1,''),(11,2,''),(12,1,''),(12,2,''),(13,8,''),(14,8,''),(15,8,''),(16,1,''),(17,1,''),(18,1,'');
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
  `anuncioFechaFin` datetime NOT NULL,
  `anuncioTexto` text NOT NULL,
  `anuncioTipoPersona` int(11) DEFAULT '0',
  `anuncioComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`idanuncio`),
  KEY `fk_anuncio_1_idx` (`anuncioTipoPersona`),
  CONSTRAINT `fk_anuncio_1` FOREIGN KEY (`anuncioTipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES (1,'Anuncio 1','2019-12-25 00:00:00','Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.',8,NULL),(2,'Anuncio 2','2019-07-10 00:00:00','<div class=\"list-group\">\n  <a href=\"#\" class=\"list-group-item list-group-item-action flex-column align-items-start active\">\n    <div class=\"d-flex w-100 justify-content-between\">\n      <h5 class=\"mb-1\">List group item heading</h5>\n      <small>3 days ago</small>\n    </div>\n    <p class=\"mb-1\">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>\n    <small>Donec id elit non mi porta.</small>\n  </a>\n  <a href=\"#\" class=\"list-group-item list-group-item-action flex-column align-items-start\">\n    <div class=\"d-flex w-100 justify-content-between\">\n      <h5 class=\"mb-1\">List group item heading</h5>\n      <small class=\"text-muted\">3 days ago</small>\n    </div>\n    <p class=\"mb-1\">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>\n    <small class=\"text-muted\">Donec id elit non mi porta.</small>\n  </a>\n</div>',8,NULL),(3,'Anuncio 3','2019-12-20 00:00:00','Header\nPrimary card title\nSome quick example text to build on the card title and make up the bulk of the card\'s content.',8,NULL),(4,'Anuncio 4','2019-12-31 00:00:00','Hello, world!\nThis is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.\n\nIt uses utility classes for typography and spacing to space content out within the larger container.\n\n\n',2,NULL);
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
INSERT INTO `aula` VALUES (1,1,''),(2,1,''),(3,1,''),(4,1,''),(5,1,''),(6,2,''),(7,2,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
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
  `cargoComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Director',''),(2,'Profesor',''),(3,'Subdirector',''),(4,'Profesor Auxiliar',''),(5,'Coordinador de área',''),(6,'Psicólogo','');
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
/*!40000 ALTER TABLE `contenidoLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribuciones`
--

DROP TABLE IF EXISTS `contribuciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contribuciones` (
  `fechaHora` datetime NOT NULL,
  `mes` int(2) NOT NULL,
  `año` year(4) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  `idColector` int(11) NOT NULL,
  `contribucionesComentario` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`fechaHora`,`mes`,`año`),
  KEY `fk_contribuciones_1` (`idEstudiante`),
  KEY `fk_contribuciones_2` (`idColector`),
  CONSTRAINT `fk_contribuciones_1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE,
  CONSTRAINT `fk_contribuciones_2` FOREIGN KEY (`idColector`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE
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
  `estudianteExtencionPartida` varchar(10) DEFAULT NULL,
  `estudianteExtencionCertificado` varchar(10) DEFAULT NULL,
  `estudianteExtencionConducta` varchar(10) DEFAULT NULL,
  `estudianteExtencionNotas` varchar(10) DEFAULT NULL,
  `estudianteExtencionDui` varchar(10) DEFAULT NULL,
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
  `ideditorial` int(11) NOT NULL AUTO_INCREMENT,
  `editorialNombre` varchar(50) NOT NULL,
  `editorialComentarios` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`ideditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregaUtiles`
--

DROP TABLE IF EXISTS `entregaUtiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregaUtiles` (
  `idEntregante` int(11) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  `idRepresentante` int(11) NOT NULL,
  `zapatos` bit(1) NOT NULL,
  `uniforme` bit(1) NOT NULL,
  `utiles` bit(1) NOT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEntregante`,`idEstudiante`),
  KEY `fk_entregaUtiles_1_idx` (`idEstudiante`),
  KEY `fk_entregaUtiles_3_idx` (`idRepresentante`),
  CONSTRAINT `fk_entregaUtiles_1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entregaUtiles_2` FOREIGN KEY (`idEntregante`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_entregaUtiles_3` FOREIGN KEY (`idRepresentante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE
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
INSERT INTO `estudiante` VALUES (1045367075,'',0,'',0,3.00,'\0','Padre#Madre#Hermano/a¿ * ','','','',NULL,'','Noveno Grado','Estudiante','Centro Excolar de procedencia',NULL,NULL,1999999999,1888888888,1999999999,NULL),(1999999999,'',0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','Sexo grado','Ama de casa',NULL,NULL,'',NULL,NULL,NULL,NULL);
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
  `año` year(4) NOT NULL,
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
  `gradoModalidad` enum('C','G') NOT NULL,
  PRIMARY KEY (`idMaestro`,`fechaHora`,`gradoModalidad`),
  KEY `fk_evaluacionMaestro_1_idx` (`idMaestro`),
  KEY `fk_evaluacionMaestro_2_idx` (`grado`,`seccion`,`año`),
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
INSERT INTO `financiamiento` VALUES (1,'MINED',NULL),(2,'CDE',NULL),(3,'Alcaldía',NULL),(4,'ONG',NULL);
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
  `gradoModalidad` enum('C','G') NOT NULL,
  `gradoSeccion` enum('A','B','C') NOT NULL,
  `gradoAño` year(4) NOT NULL,
  `aulaGrado` int(11) NOT NULL,
  `gradoActivo` bit(1) NOT NULL,
  `gradoMaestroGuia` int(11) NOT NULL,
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
  `gradoSeccion` enum('A','B','c') NOT NULL,
  `gradoAño` year(4) NOT NULL,
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
  `gradoModalidad` enum('C','G') NOT NULL,
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
INSERT INTO `maestoCargo` VALUES (1111111111,2,1,1,'2019-07-30',NULL,NULL,NULL),(1111111111,3,2,2,'2019-07-30',NULL,NULL,NULL),(1111111111,4,3,3,'2019-07-30',NULL,NULL,NULL);
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
  `maestroEspecialidad` varchar(80) NOT NULL,
  `maestroFechaMagisterio` date NOT NULL,
  `maestroFechaInstitucion` date NOT NULL,
  `maestroFechaProximoAsenso` date DEFAULT NULL,
  `maestroTurno` enum('M','V','T') NOT NULL,
  `maestroTiempoCategoria` varchar(10) NOT NULL,
  `maestroSinEscalafon` bit(1) NOT NULL DEFAULT b'1',
  `maestroTipoSalario` varchar(45) NOT NULL,
  `maestroUtilidadTecnologica` bit(1) NOT NULL DEFAULT b'1',
  `maestroHorasUsoTecnologia` int(11) NOT NULL DEFAULT '0',
  `maestroUsoVideoconferencias` bit(1) NOT NULL DEFAULT b'0',
  `maestroRecursosWeb` bit(1) NOT NULL DEFAULT b'1',
  `maestroCapacitacionesVirtuales` bit(1) NOT NULL DEFAULT b'1',
  `maestroComentario` varchar(45) DEFAULT NULL COMMENT 'Detalle de la información de todos los docentes de la institución.',
  PRIMARY KEY (`idmaestro`),
  CONSTRAINT `fk_maestro_1` FOREIGN KEY (`idmaestro`) REFERENCES `persona` (`idpersona`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maestro`
--

LOCK TABLES `maestro` WRITE;
/*!40000 ALTER TABLE `maestro` DISABLE KEYS */;
INSERT INTO `maestro` VALUES (1111111111,89,898989,8989898,9898989,898989,89898,1,'9898989',8989898,'2222-2222','Informática','2019-07-30','2019-07-30','2019-07-30','T','98','','Sueldo Base','',0,'','','','');
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
INSERT INTO `materia` VALUES (1,'Matemática',1,''),(2,'Lenguaje',1,''),(3,'Inglés',1,''),(4,'Informática',1,''),(5,'Estudios Sociales',1,''),(6,'Educación Físiaca',1,''),(7,'Ciencias Naturales',1,''),(8,'Moral, Urbanidad y Cívica',1,''),(9,'Orientación Para La Vida',2,''),(10,'Seminario',2,''),(11,'Curso de Habilidad Laboral',2,''),(12,'Tecnología I',3,''),(13,'Tecnología II',3,''),(14,'Tecnología III',3,''),(15,'Práctica Profesional I',3,''),(16,'Práctica Profesional II',3,''),(17,'Práctica Profesional III',3,''),(18,'Laboratorio de Creatividad I',3,''),(19,'Laboratorio de Creatividad II',3,''),(20,'Laboratorio de Creatividad III',3,''),(21,'Contaduría',4,''),(22,'General',4,'');
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
  `matriculaAnyo` year(4) NOT NULL,
  `matriculaNivel` int(11) NOT NULL,
  `gradoModalidad` enum('C','G') NOT NULL,
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
  `diaSemana` enum('L','M','X','J','V') NOT NULL,
  `idGrado` int(11) NOT NULL,
  `seccionGrado` enum('A','B','C') NOT NULL,
  `añoGrado` year(4) NOT NULL,
  `gradoModalidad` enum('C','G') NOT NULL,
  `mestroHorarioMateriasComentarios` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idMaestro`,`idMateria`,`idHorario`,`diaSemana`,`idGrado`,`seccionGrado`,`añoGrado`),
  KEY `fk_mestroHorarioMaterias_2_idx` (`idMateria`),
  KEY `fk_mestroHorarioMaterias_3_idx` (`idHorario`),
  KEY `fk_mestroHorarioMaterias_4` (`idGrado`,`seccionGrado`,`añoGrado`,`gradoModalidad`),
  CONSTRAINT `fk_mestroHorarioMaterias_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idmaestro`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idmateria`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_3` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idhorario`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mestroHorarioMaterias_4` FOREIGN KEY (`idGrado`, `seccionGrado`, `añoGrado`, `gradoModalidad`) REFERENCES `grado` (`idgrado`, `gradoSeccion`, `gradoAño`, `gradoModalidad`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mestroHorarioMaterias`
--

LOCK TABLES `mestroHorarioMaterias` WRITE;
/*!40000 ALTER TABLE `mestroHorarioMaterias` DISABLE KEYS */;
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
  `idPersona` int(11) NOT NULL,
  `notificacion` varchar(100) NOT NULL,
  `vista` bit(1) NOT NULL,
  `comentario` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`fechaHora`),
  KEY `fk_notificaciones_1_idx` (`idPersona`),
  CONSTRAINT `fk_notificaciones_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
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
  `permisosAceptado` int(1) NOT NULL,
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
INSERT INTO `permisos` VALUES (1045367075,'2019-07-24',5,'2019-07-24','2019-07-25',8,'guillermox020@gmail.com',0,1999999999,NULL),(1045367075,'2019-07-25',4,'2019-07-25','2019-07-25',8,'guillermox020@gmail.com',0,1045367075,NULL);
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
  UNIQUE KEY `personaEmail_UNIQUE` (`personaEmail`),
  UNIQUE KEY `personaNit_UNIQUE` (`personaNit`),
  KEY `fk_persona_1_idx` (`tipoPersona`),
  CONSTRAINT `fk_persona_1` FOREIGN KEY (`tipoPersona`) REFERENCES `tipoPersona` (`idtipoPersona`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1045367073,'Guillermo','Delsas',NULL,NULL,NULL,NULL,NULL,NULL,'02951a6cb9595ef475fed783e59c687e','Ingeniero',1,'',NULL,'\0',NULL,NULL,NULL,NULL,NULL),(1045367074,'Director','Directivo',NULL,NULL,NULL,NULL,NULL,NULL,'02951a6cb9595ef475fed783e59c687e','Director',2,'',NULL,'',NULL,NULL,NULL,NULL,NULL),(1045367075,'Estudiante','Estudioso',NULL,NULL,NULL,NULL,NULL,NULL,'02951a6cb9595ef475fed783e59c687e','Estudiante',8,'',NULL,'',NULL,NULL,NULL,NULL,NULL),(1111111111,'Quintus Sestus','Septimus Octavios','1991-02-17','878787878787878','7777-7777',0,0,' #9','bbb8aae57c104cda40c93843ad5e6db8','Primus Secuntus Tercius',4,'','1111-111111-111-1','\0',0,'Extrangera','878788888888888','',''),(1888888888,'padre padre1','padre2 padre3',NULL,NULL,NULL,NULL,NULL,NULL,'02951a6cb9595ef475fed783e59c687e',NULL,11,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1999999999,'representante','apellidos','1980-01-25','la dirección del representante','7999-9999',NULL,0,'Santa Ana#Texistepeque','02951a6cb9595ef475fed783e59c687e',NULL,9,'','9999-999999-999-9','\0',1,'parentesco','representante@correo.com',NULL,NULL);
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
  `categoria` int(11) NOT NULL,
  `idTipoRecurso` int(11) NOT NULL,
  `tipoCargo` int(11) DEFAULT NULL,
  `pais` int(11) DEFAULT NULL,
  `tipoPrestamo` int(11) NOT NULL,
  `activo` bit(1) NOT NULL,
  `valorUnitario` float NOT NULL,
  `estadoFisico` enum('R','B') DEFAULT NULL,
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
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `reservaFecha` datetime NOT NULL,
  `reservaEntrega` datetime NOT NULL,
  `reservaDevolucion` datetime NOT NULL,
  `tipoReserva` int(11) NOT NULL,
  `reservaEstado` enum('S','E','D') NOT NULL,
  `reservaDevuelto` datetime DEFAULT NULL,
  `reservaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idreserva`),
  KEY `fk_reserva_1_idx` (`tipoReserva`),
  CONSTRAINT `fk_reserva_1` FOREIGN KEY (`tipoReserva`) REFERENCES `tipoReserva` (`idtipoReserva`) ON UPDATE CASCADE
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
  `idreserva` int(11) NOT NULL,
  `idRecurso` int(11) NOT NULL,
  `ejemplarCorrelativo` int(11) NOT NULL,
  `reservaDetalleComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idreserva`,`idRecurso`,`ejemplarCorrelativo`),
  KEY `fk_reservaDetalle_2_idx` (`idRecurso`,`ejemplarCorrelativo`),
  CONSTRAINT `fk_reservaDetalle_1` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`) ON UPDATE CASCADE,
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
  KEY `fk_reservaXpedagogia_2` (`idReserva`),
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
  `idReserva` int(11) NOT NULL,
  `idRecurso` int(11) NOT NULL,
  `solicitudReservaComentario` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idReserva`,`idRecurso`),
  KEY `fk_solicitudReserva_2_idx` (`idRecurso`),
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
INSERT INTO `tipoPermiso` VALUES (1,'Enfermedad',0,NULL),(2,'Materindad',0,NULL),(3,'Paternidad',0,NULL),(4,'Faltar a clases',0,NULL),(5,'Salir temporalmente de la institución',0,NULL),(6,'Retirarse de la institución',0,NULL),(7,'No portar uniforme',5,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoPersona`
--

LOCK TABLES `tipoPersona` WRITE;
/*!40000 ALTER TABLE `tipoPersona` DISABLE KEYS */;
INSERT INTO `tipoPersona` VALUES (1,'Administrador',''),(2,'Director',''),(3,'Subdirector',''),(4,'Maestro',''),(5,'Bibliotecario',''),(6,'Administrador CRA',''),(7,'Laboratorista',''),(8,'Estudiante',''),(9,'Representante',''),(10,'Madre de familia',''),(11,'Padre de familia','');
/*!40000 ALTER TABLE `tipoPersona` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `tipoReservaRecurso` ENABLE KEYS */;
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
INSERT INTO `tipopersonaPermiso` VALUES (1,1,''),(1,2,''),(1,3,''),(2,1,''),(2,2,''),(8,4,''),(8,5,''),(8,6,''),(8,7,''),(9,5,''),(9,6,''),(9,7,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (1,'Zona 1',NULL),(2,'Zona 2',NULL),(3,'Zona 3',NULL);
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

-- Dump completed on 2019-07-30 19:23:57
