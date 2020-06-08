-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: intex
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='-06:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
REPLACE INTO `acceso` VALUES (9,'Administración','#',NULL,'fa fa-cog'),(10,'Sistema','tipopp.intex',9,'pi pi-folder-open'),(11,'Permisos y Licencias','lictp.intex',9,'pi pi-th-large'),(12,'Académica','academico.intex',9,'fa fa-leaf'),(13,'Perfil','#',NULL,'pi pi-user'),(14,'Permisos','#',45,'pi pi-eye'),(15,'Solicitar Permiso','permisoE.intex',14,'pi pi-briefcase'),(16,'Personal','#',NULL,'pi pi-users'),(17,'Gestión de maestros','agregacion.intex',27,'pi pi-user-plus'),(18,'Gestión de administradores','agAdm.intex',16,'pi pi-plus'),(19,'Plantel Institucional','plantel.intex',16,'pi pi-table'),(20,'Inventario','inventario.intex',23,'fa fa-barcode'),(21,'Libros','libros.intex',23,'fa fa-book'),(22,'Nuevo Ingreso','inscripcion.intex',36,'pi pi-user'),(23,'Recursos','#',9,'fa fa-yelp'),(24,'Nomina de Alumnos','nominaA.intex',36,'pi pi-user'),(25,'Gestión de Recursos','admRecurso.intex',23,'fa fa-table'),(26,'Lista de Representantes','listaRepresentantes.intex',36,'pi pi-list'),(27,'Maestros','#',16,'fa fa-puzzle-piece'),(28,'Gestión de horarios','horario.intex',27,'pi pi-plus'),(29,'Gestión de permisos','permiso.intex',14,'fa fa-legal'),(30,'Solicitud de permisos','permisoM.intex',14,'fa fa-ge'),(31,'Administrador de anuncios','anuncios.intex',9,'fa fa-bell'),(32,'Matricula','matricula.intex',36,'fa fa-slideshare'),(33,'Entrega de Útiles','paquetes.intex',36,'fa fa-sliders'),(34,'Contribuciones','contribuciones.intex',36,'fa fa-money'),(35,'Listados','#',16,'fa fa-list-ul'),(36,'Alumnos','#',16,'fa fa-graduation-cap'),(37,'Reservas de Equipo','#',45,'fa fa-gamepad'),(38,'Solicitud de Reserva','solicitudR.intex',37,'fa fa-flag'),(39,'Historial de Reservas','solicitudH.intex',43,'fa fa-archive'),(40,'Gestionar Reservas de equipo','srCra.intex',37,'fa fa-certificate'),(41,'Historial de Notificaciones','notifh.intex',43,'fa fa-forumbee'),(42,'Proyecto Planificado','solicitudRPP.intex',37,'pi pi-pencil'),(43,'Historiales','#',13,'fa fa-folder-open'),(44,'Historial de permisos','permisoH.intex',43,'fa fa-database'),(45,'Solicitudes','#',NULL,'fa fa-street-view'),(46,'Área psicológica','#',45,'fa fa-ambulance'),(47,'Solicitud de cita psicológica','solicitudCP.intex',46,'pi pi-bookmark'),(48,'Adminitración citas pscológi','admCitasPs.intex',46,'pi pi-calendar'),(49,'Consulta Psicológica','consultasPS.intex',46,'pi pi-window-maximize'),(50,'Historial citas Psicológicas','citasPSH.intex',43,'fa fa-file'),(51,'Horario de clases','horarioCl.intex',13,'fa fa-calendar'),(52,'Aspecto de la aplicación','temas.intex',13,'fa fa-picture-o'),(53,'Mi usuario','infoPerfil.intex',13,'fa fa-android'),(54,'Administración de usuarios','admUsuarios.intex',16,'fa fa-university'),(55,'Evaluación de maestros','maestroEval.intex',27,'fa fa-list-alt'),(56,'Evaluación de grados','gradoEval.intex',36,'fa fa-flask'),(57,'Reportes','#',9,'fa fa-weibo'),(58,'Historial de evaluaciones','maEvalH.intex',43,'pi pi-bookmark'),(59,'Evaluaciones de grado','gradoEvalH.intex',43,'pi pi-folder-open'),(61,'Entrega de Paquetes','repEntrega.intex',57,'pi pi-search'),(62,'Gestión de horarios (lite)','horarioLite.intex',27,'pi pi-plus'),(63,'Pago de contribución','repContr.intex',57,'pi pi-search'),(64,'Inventario de equipo','repInv.intex',57,'pi pi-search'),(65,'Matrículas','repMatricula.intex',57,'pi pi-search'),(66,'General de Permisos','repPermisos.intex',57,'pi pi-search');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `accesoTipoPersona`
--

LOCK TABLES `accesoTipoPersona` WRITE;
/*!40000 ALTER TABLE `accesoTipoPersona` DISABLE KEYS */;
REPLACE INTO `accesoTipoPersona` VALUES (9,1,''),(9,2,''),(9,3,''),(9,4,''),(9,5,''),(9,6,''),(9,7,''),(9,12,''),(9,13,''),(9,17,''),(10,1,''),(10,2,''),(10,17,''),(11,1,''),(11,2,''),(11,3,''),(11,17,''),(12,1,''),(12,2,''),(12,17,''),(13,1,''),(13,2,''),(13,3,''),(13,4,''),(13,5,''),(13,6,''),(13,7,''),(13,8,''),(13,9,''),(13,12,''),(13,13,''),(13,14,''),(13,15,''),(13,16,''),(13,17,''),(14,1,''),(14,2,''),(14,3,''),(14,4,''),(14,5,''),(14,6,''),(14,7,''),(14,8,''),(14,9,''),(14,12,''),(14,13,''),(14,14,''),(14,15,''),(14,16,''),(14,17,''),(15,8,''),(15,9,''),(15,17,''),(16,1,''),(16,2,''),(16,3,''),(16,4,''),(16,12,''),(16,13,''),(16,17,''),(17,1,''),(17,2,''),(17,17,''),(18,1,''),(18,2,''),(18,17,''),(19,1,''),(19,2,''),(19,3,''),(19,13,''),(19,17,''),(20,1,''),(20,2,''),(20,5,''),(20,6,''),(20,7,''),(20,17,''),(21,1,''),(21,2,''),(21,5,''),(21,17,''),(22,1,''),(22,2,''),(22,3,''),(22,4,''),(22,13,''),(22,17,''),(23,1,''),(23,2,''),(23,5,''),(23,6,''),(23,7,''),(23,17,''),(24,1,''),(24,2,''),(24,3,''),(24,4,''),(24,13,''),(24,17,''),(25,1,''),(25,2,''),(25,5,''),(25,6,''),(25,7,''),(25,17,''),(26,1,''),(26,2,''),(26,3,''),(26,4,''),(26,13,''),(26,17,''),(27,1,''),(27,2,''),(27,17,''),(28,1,''),(28,2,''),(28,17,''),(29,1,''),(29,2,''),(29,3,''),(29,17,''),(30,1,''),(30,2,''),(30,3,''),(30,4,''),(30,5,''),(30,6,''),(30,7,''),(30,12,''),(30,13,''),(30,14,''),(30,15,''),(30,16,''),(30,17,''),(31,1,''),(31,2,''),(31,3,''),(31,4,''),(31,5,''),(31,6,''),(31,7,''),(31,12,''),(31,13,''),(31,17,''),(32,1,''),(32,2,''),(32,13,''),(32,17,''),(33,1,''),(33,2,''),(33,12,''),(33,17,''),(34,1,''),(34,2,''),(34,12,''),(34,17,''),(35,13,''),(35,17,''),(36,1,''),(36,2,''),(36,3,''),(36,4,''),(36,12,''),(36,13,''),(36,17,''),(37,1,''),(37,2,''),(37,3,''),(37,4,''),(37,5,''),(37,6,''),(37,7,''),(37,8,''),(37,13,''),(37,17,''),(38,1,''),(38,2,''),(38,3,''),(38,4,''),(38,5,''),(38,6,''),(38,7,''),(38,8,''),(38,17,''),(39,1,''),(39,2,''),(39,3,''),(39,4,''),(39,5,''),(39,6,''),(39,7,''),(39,8,''),(39,17,''),(40,1,''),(40,2,''),(40,5,''),(40,6,''),(40,7,''),(40,17,''),(41,1,''),(41,2,''),(41,3,''),(41,4,''),(41,5,''),(41,6,''),(41,7,''),(41,8,''),(41,9,''),(41,12,''),(41,14,''),(41,15,''),(41,16,''),(41,17,''),(42,1,''),(42,2,''),(42,4,''),(42,17,''),(43,1,''),(43,2,''),(43,3,''),(43,4,''),(43,5,''),(43,6,''),(43,7,''),(43,8,''),(43,9,''),(43,12,''),(43,13,''),(43,14,''),(43,15,''),(43,16,''),(43,17,''),(44,1,''),(44,2,''),(44,3,''),(44,4,''),(44,5,''),(44,6,''),(44,7,''),(44,8,''),(44,9,''),(44,12,''),(44,13,''),(44,14,''),(44,15,''),(44,16,''),(44,17,''),(45,1,''),(45,2,''),(45,3,''),(45,4,''),(45,5,''),(45,6,''),(45,7,''),(45,8,''),(45,9,''),(45,12,''),(45,13,''),(45,14,''),(45,15,''),(45,17,''),(46,1,''),(46,8,''),(46,14,''),(46,17,''),(47,1,''),(47,8,''),(47,17,''),(48,1,''),(48,14,''),(48,17,''),(49,1,''),(49,14,''),(49,17,''),(50,8,''),(50,17,''),(51,4,''),(51,8,''),(51,9,''),(51,17,''),(52,1,''),(52,2,''),(52,3,''),(52,4,''),(52,5,''),(52,6,''),(52,7,''),(52,8,''),(52,9,''),(52,12,''),(52,13,''),(52,14,''),(52,15,''),(52,16,''),(52,17,''),(53,1,''),(53,2,''),(53,3,''),(53,4,''),(53,5,''),(53,6,''),(53,7,''),(53,8,''),(53,9,''),(53,12,''),(53,13,''),(53,14,''),(53,15,''),(53,16,''),(53,17,''),(54,1,''),(54,2,''),(54,13,''),(54,17,''),(55,1,''),(55,2,''),(55,17,''),(56,1,''),(56,2,''),(56,3,''),(56,17,''),(57,1,''),(57,2,''),(57,3,''),(57,4,''),(57,5,''),(57,6,''),(57,7,''),(57,12,''),(57,13,''),(57,17,''),(58,4,''),(58,17,''),(59,1,''),(59,2,''),(59,3,''),(59,4,''),(59,8,''),(59,17,''),(61,1,''),(61,2,''),(61,3,''),(61,4,''),(61,12,''),(61,13,''),(61,17,''),(62,1,''),(62,2,''),(62,17,''),(63,1,''),(63,2,''),(63,3,''),(63,4,''),(63,13,''),(63,17,''),(64,1,''),(64,2,''),(64,3,''),(64,5,''),(64,6,''),(64,7,''),(64,13,''),(64,17,''),(65,1,''),(65,2,''),(65,3,''),(65,13,''),(65,17,''),(66,1,''),(66,2,''),(66,3,''),(66,17,'');
/*!40000 ALTER TABLE `accesoTipoPersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `diasEstudio`
--

LOCK TABLES `diasEstudio` WRITE;
/*!40000 ALTER TABLE `diasEstudio` DISABLE KEYS */;
REPLACE INTO `diasEstudio` VALUES (1,'Lunes',NULL),(2,'Martes',''),(3,'Miércoles',NULL),(4,'Jueves',NULL),(5,'Viernes',NULL);
/*!40000 ALTER TABLE `diasEstudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
REPLACE INTO `horario` VALUES (1,'07:15:00','08:00:00',''),(2,'08:00:00','08:45:00',''),(3,'08:45:00','09:05:00',''),(4,'09:05:00','09:50:00',''),(5,'09:50:00','10:35:00',''),(6,'10:35:00','10:45:00',''),(7,'10:45:00','11:30:00',''),(8,'11:30:00','12:15:00',''),(9,'12:15:00','13:15:00',''),(10,'13:15:00','14:00:00',''),(11,'14:00:00','14:45:00',''),(12,'14:45:00','15:00:00',''),(13,'14:00:00','15:45:00',''),(14,'15:45:00','16:30:00',''),(15,'16:30:00','17:15:00','');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
REPLACE INTO `materia` VALUES (1,'MatemÃ¡tica','MAT',1,'c0d6c8'),(2,'Lenguaje','LEN',1,'bfc4de'),(3,'Inglés','ING',1,'9dc4ae'),(4,'InformÃ¡tica','INF',1,'c4b0c4'),(5,'Estudios Sociales','EE.SS',1,'8e8cb3'),(6,'Educación Físiaca','EE.FF',1,'e6ddaf'),(7,'Ciencias Naturales','CC.NN',1,'cae3cb'),(8,'Moral, Urbanidad y Cívica','MUC',1,''),(9,'Orientación Para La Vida','OPV',2,'a9aed6'),(10,'Seminario','SEM',2,''),(11,'Curso de Habilidad Laboral','CHL',2,''),(12,'Tecnología I','TG1',3,''),(13,'Tecnología II','TG2',3,''),(14,'Tecnología III','TG3',3,''),(15,'PrÃ¡ctica Profesional I','PP1',3,''),(16,'PrÃ¡ctica Profesional II','PP2',3,''),(17,'PrÃ¡ctica Profesional III','PP3',3,''),(18,'Laboratorio de Creatividad I','LC1',3,'f0b8f0'),(19,'Laboratorio de Creatividad II','LC2',3,''),(20,'Laboratorio de Creatividad III','LC3',3,''),(21,'Contaduría','CTD',4,'b5c4ae'),(22,'General','GNL',4,'e8d0e8');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
REPLACE INTO `pais` VALUES (1,'AfganistÃ¡n',''),(2,'Islas Gland',''),(3,'Albania',''),(4,'Alemania',''),(5,'Andorra',''),(6,'Angola',''),(7,'Anguilla',''),(8,'AntÃ¡rtida',''),(9,'Antigua y Barbuda',''),(10,'Antillas Holandesas',''),(11,'Arabia Saudí',''),(12,'Argelia',''),(13,'Argentina',''),(14,'Armenia',''),(15,'Aruba',''),(16,'Australia',''),(17,'Austria',''),(18,'AzerbaiyÃ¡n',''),(19,'Bahamas',''),(20,'Bahréin',''),(21,'Bangladesh',''),(22,'Barbados',''),(23,'Bielorrusia',''),(24,'Bélgica',''),(25,'Belice',''),(26,'Benin',''),(27,'Bermudas',''),(28,'BhutÃ¡n',''),(29,'Bolivia',''),(30,'Bosnia y Herzegovina',''),(31,'Botsuana',''),(32,'Isla Bouvet',''),(33,'Brasil',''),(34,'Brunéi',''),(35,'Bulgaria',''),(36,'Burkina Faso',''),(37,'Burundi',''),(38,'Cabo Verde',''),(39,'Islas CaimÃ¡n',''),(40,'Camboya',''),(41,'CamerÃºn',''),(42,'CanadÃ¡',''),(43,'RepÃºblica Centroafricana',''),(44,'Chad',''),(45,'RepÃºblica Checa',''),(46,'Chile',''),(47,'China',''),(48,'Chipre',''),(49,'Isla de Navidad',''),(50,'Ciudad del Vaticano',''),(51,'Islas Cocos',''),(52,'Colombia',''),(53,'Comoras',''),(54,'RepÃºblica DemocrÃ¡tica del Congo',''),(55,'Congo',''),(56,'Islas Cook',''),(57,'Corea del Norte',''),(58,'Corea del Sur',''),(59,'Costa de Marfil',''),(60,'Costa Rica',''),(61,'Croacia',''),(62,'Cuba',''),(63,'Dinamarca',''),(64,'Dominica',''),(65,'RepÃºblica Dominicana',''),(66,'Ecuador',''),(67,'Egipto',''),(68,'El Salvador',''),(69,'Emiratos Árabes Unidos',''),(70,'Eritrea',''),(71,'Eslovaquia',''),(72,'Eslovenia',''),(73,'EspaÃ±a',''),(74,'Islas ultramarinas de Estados Unidos',''),(75,'Estados Unidos',''),(76,'Estonia',''),(77,'Etiopía',''),(78,'Islas Feroe',''),(79,'Filipinas',''),(80,'Finlandia',''),(81,'Fiyi',''),(82,'Francia',''),(83,'Gabón',''),(84,'Gambia',''),(85,'Georgia',''),(86,'Islas Georgias del Sur y Sandwich del Sur',''),(87,'Ghana',''),(88,'Gibraltar',''),(89,'Granada',''),(90,'Grecia',''),(91,'Groenlandia',''),(92,'Guadalupe',''),(93,'Guam',''),(94,'Guatemala',''),(95,'Guayana Francesa',''),(96,'Guinea',''),(97,'Guinea Ecuatorial',''),(98,'Guinea-Bissau',''),(99,'Guyana',''),(100,'Haití',''),(101,'Islas Heard y McDonald',''),(102,'Honduras',''),(103,'Hong Kong',''),(104,'Hungría',''),(105,'India',''),(106,'Indonesia',''),(107,'IrÃ¡n',''),(108,'Iraq',''),(109,'Irlanda',''),(110,'Islandia',''),(111,'Israel',''),(112,'Italia',''),(113,'Jamaica',''),(114,'Japón',''),(115,'Jordania',''),(116,'KazajstÃ¡n',''),(117,'Kenia',''),(118,'KirguistÃ¡n',''),(119,'Kiribati',''),(120,'Kuwait',''),(121,'Laos',''),(122,'Lesotho',''),(123,'Letonia',''),(124,'Líbano',''),(125,'Liberia',''),(126,'Libia',''),(127,'Liechtenstein',''),(128,'Lituania',''),(129,'Luxemburgo',''),(130,'Macao',''),(131,'ARY Macedonia',''),(132,'Madagascar',''),(133,'Malasia',''),(134,'Malawi',''),(135,'Maldivas',''),(136,'Malí',''),(137,'Malta',''),(138,'Islas Malvinas',''),(139,'Islas Marianas del Norte',''),(140,'Marruecos',''),(141,'Islas Marshall',''),(142,'Martinica',''),(143,'Mauricio',''),(144,'Mauritania',''),(145,'Mayotte',''),(146,'México',''),(147,'Micronesia',''),(148,'Moldavia',''),(149,'Mónaco',''),(150,'Mongolia',''),(151,'Montserrat',''),(152,'Mozambique',''),(153,'Myanmar',''),(154,'Namibia',''),(155,'Nauru',''),(156,'Nepal',''),(157,'Nicaragua',''),(158,'Níger',''),(159,'Nigeria',''),(160,'Niue',''),(161,'Isla Norfolk',''),(162,'Noruega',''),(163,'Nueva Caledonia',''),(164,'Nueva Zelanda',''),(165,'OmÃ¡n',''),(166,'Países Bajos',''),(167,'PakistÃ¡n',''),(168,'Palau',''),(169,'Palestina',''),(170,'PanamÃ¡',''),(171,'PapÃºa Nueva Guinea',''),(172,'Paraguay',''),(173,'PerÃº',''),(174,'Islas Pitcairn',''),(175,'Polinesia Francesa',''),(176,'Polonia',''),(177,'Portugal',''),(178,'Puerto Rico',''),(179,'Qatar',''),(180,'Reino Unido',''),(181,'Reunión',''),(182,'Ruanda',''),(183,'Rumania',''),(184,'Rusia',''),(185,'Sahara Occidental',''),(186,'Islas Salomón',''),(187,'Samoa',''),(188,'Samoa Americana',''),(189,'San Cristóbal y Nevis',''),(190,'San Marino',''),(191,'San Pedro y Miquelón',''),(192,'San Vicente y las Granadinas',''),(193,'Santa Helena',''),(194,'Santa Lucía',''),(195,'Santo Tomé y Príncipe',''),(196,'Senegal',''),(197,'Serbia y Montenegro',''),(198,'Seychelles',''),(199,'Sierra Leona',''),(200,'Singapur',''),(201,'Siria',''),(202,'Somalia',''),(203,'Sri Lanka',''),(204,'Suazilandia',''),(205,'SudÃ¡frica',''),(206,'SudÃ¡n',''),(207,'Suecia',''),(208,'Suiza',''),(209,'Surinam',''),(210,'Svalbard y Jan Mayen',''),(211,'Tailandia',''),(212,'TaiwÃ¡n',''),(213,'Tanzania',''),(214,'TayikistÃ¡n',''),(215,'Territorio BritÃ¡nico del Océano Ãndico',''),(216,'Territorios Australes Franceses',''),(217,'Timor Oriental',''),(218,'Togo',''),(219,'Tokelau',''),(220,'Tonga',''),(221,'Trinidad y Tobago',''),(222,'TÃºnez',''),(223,'Islas Turcas y Caicos',''),(224,'TurkmenistÃ¡n',''),(225,'Turquía',''),(226,'Tuvalu',''),(227,'Ucrania',''),(228,'Uganda',''),(229,'Uruguay',''),(230,'UzbekistÃ¡n',''),(231,'Vanuatu',''),(232,'Venezuela',''),(233,'Vietnam',''),(234,'Islas Vírgenes BritÃ¡nicas',''),(235,'Islas Vírgenes de los Estados Unidos',''),(236,'Wallis y Futuna',''),(237,'Yemen',''),(238,'Yibuti',''),(239,'Zambia',''),(240,'Zimbabue','');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
REPLACE INTO `persona` VALUES (1045367073,'Guillermo Aldolfo','Delsas Murcia','1991-01-17','texistepeque Santa ana','7033-7878',0,0,'02#13','02951a6cb9595ef475fed783e59c687e','Ingeniero de Sistemas InformÃ¡ticos',1,'','0213-170191-102-9','\0',0,'SalvadoreÃ±a','guillermox020@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoMateria`
--

LOCK TABLES `tipoMateria` WRITE;
/*!40000 ALTER TABLE `tipoMateria` DISABLE KEYS */;
REPLACE INTO `tipoMateria` VALUES (1,'Área BÃ¡sica',NULL),(2,'Área Aplicada',NULL),(3,'Área Técnica',NULL),(4,'Modalidad y Opciones',NULL);
/*!40000 ALTER TABLE `tipoMateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoPersona`
--

LOCK TABLES `tipoPersona` WRITE;
/*!40000 ALTER TABLE `tipoPersona` DISABLE KEYS */;
REPLACE INTO `tipoPersona` VALUES (1,'Administrador','fa fa-diamond'),(2,'Director','pi pi-circle-on'),(3,'Subdirector','pi pi-circle-off'),(4,'Maestro','fa fa-street-view'),(5,'Bibliotecario','fa fa-forumbee'),(6,'Administrador CRA','fa fa-transgender-alt'),(7,'Laboratorista','fa fa-android'),(8,'Estudiante','fa fa-child'),(9,'Representante','fa fa-user-secret'),(10,'Madre de familia',''),(11,'Padre de familia',''),(12,'Colector','fa fa-cc-mastercard'),(13,'Secretaria','fa fa-database'),(14,'Psicologo',''),(15,'Ordenanza',''),(16,'Vigilante',''),(17,'Mantenimiento','');
/*!40000 ALTER TABLE `tipoPersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoProyecto`
--

LOCK TABLES `tipoProyecto` WRITE;
/*!40000 ALTER TABLE `tipoProyecto` DISABLE KEYS */;
REPLACE INTO `tipoProyecto` VALUES (1,'Proyecto Planificado',''),(2,'Exposición De Alumnos',''),(3,'Clase De Docente Con Tecnología','');
/*!40000 ALTER TABLE `tipoProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoRecurso`
--

LOCK TABLES `tipoRecurso` WRITE;
/*!40000 ALTER TABLE `tipoRecurso` DISABLE KEYS */;
REPLACE INTO `tipoRecurso` VALUES (1,'Tecnológico CRA',NULL),(2,'Laboratorio de Ciencias Naturales',NULL),(3,'BibliogrÃ¡fico',NULL);
/*!40000 ALTER TABLE `tipoRecurso` ENABLE KEYS */;
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

-- Dump completed on 2020-05-15 11:59:12
