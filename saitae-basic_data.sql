-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: intex
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~stretch

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
INSERT INTO `acceso` VALUES (1,'Introducción a SAITAE','#',69,'vvIoCS0OHgI',''),(9,'Administración','#',NULL,NULL,'fa fa-cog'),(10,'Sistema','tipopp.intex',9,'PRxuV1fgz2M','fa fa-folder-open'),(11,'Permisos y Licencias','lictp.intex',9,'jpoB7dhtzCE','fa fa-cube'),(12,'Académica','academico.intex',9,'xqZTZBWC4Ss','fa fa-leaf'),(13,'Perfil','#',NULL,NULL,'fa fa-user-secret'),(14,'Permisos','#',45,NULL,'fa fa-eye'),(15,'Solicitar Permiso','permisoE.intex',14,'2taqyO5-saU','fa fa-location-arrow'),(16,'Personal','#',NULL,NULL,'fa fa-users'),(17,'Gestión de maestros','agregacion.intex',27,'z95v9LAqEpk','fa fa-user-plus'),(18,'Gestión de administradores','agAdm.intex',16,'Z_9XM6mawiM','fa fa-heartbeat'),(19,'Plantel Institucional','plantel.intex',16,'kE_GK-VYKhU','fa fa-table'),(20,'Inventario','inventario.intex',23,'A2iuTIQK3UM','fa fa-barcode'),(21,'Libros','libros.intex',23,'za6PsFqJ4xw','fa fa-book'),(22,'Nuevo Ingreso','inscripcion.intex',36,'fG_pxuQiENk','fa fa-user'),(23,'Recursos','#',9,NULL,'fa fa-yelp'),(24,'Nomina de Alumnos','nominaA.intex',36,'btLM8Ap0nf8','fa fa-user'),(25,'Gestión de Recursos','admRecurso.intex',23,'hcStyHhJXJU','fa fa-table'),(26,'Lista de Representantes','listaRepresentantes.intex',36,'lz_ro4WBz7w','fa fa-list'),(27,'Maestros','#',16,NULL,'fa fa-puzzle-piece'),(28,'Gestión de horarios','horario.intex',27,'FHFxHb9KbNg','fa fa-plus'),(29,'Gestión de permisos','permiso.intex',14,'jQxOPSdKrJo','fa fa-legal'),(30,'Solicitud de permisos','permisoM.intex',14,'5KCUeTVc0dE','fa fa-ge'),(31,'Anuncios','anuncios.intex',9,'OlRPrt81ABs','fa fa-bell'),(32,'Matricula','matricula.intex',36,'gsNmACB_jhs','fa fa-slideshare'),(33,'Entrega de Útiles','paquetes.intex',36,'SzU0g7AHrC4','fa fa-sliders'),(34,'Contribuciones','contribuciones.intex',36,'6DdwbMkRVRQ','fa fa-money'),(36,'Alumnos','#',16,NULL,'fa fa-graduation-cap'),(37,'Reservas de Equipo','#',45,NULL,'fa fa-gamepad'),(38,'Solicitud de Reserva','solicitudR.intex',37,'etEs-_9C4Ps;QdicGaVmyKE;Vzl57q_AQT0','fa fa-flag'),(39,'Historial de Reservas','solicitudH.intex',43,'lfu6BuEXeEU','fa fa-archive'),(40,'Gestionar Reservas de equipo','srCra.intex',37,'bUiMPCvBZiY','fa fa-certificate'),(41,'Historial de Notificaciones','notifh.intex',43,'2AItrbWMG7k','fa fa-forumbee'),(42,'Proyecto Planificado','solicitudRPP.intex',37,'PF-RsOBMFyk','fa fa-pencil-square-o'),(43,'Historiales','#',13,NULL,'fa fa-folder-open'),(44,'Historial de permisos','permisoH.intex',43,'fbBCKYURFVI','fa fa-database'),(45,'Solicitudes','#',NULL,NULL,'fa fa-street-view'),(46,'Área psicológica','#',45,NULL,'fa fa-ambulance'),(47,'Solicitud de cita psicológica','solicitudCP.intex',46,'nz7TFDnwcBU','fa fa-bookmark-o'),(48,'Adminitración citas psicológic','admCitasPs.intex',46,'CT1WchUKyFU','fa fa-calendar'),(49,'Consulta Psicológica','consultasPS.intex',46,'iJUofSsTXTc','fa fa-umbrella'),(50,'Historial citas Psicológicas','citasPSH.intex',43,'c0n7MzrU2fI','fa fa-file'),(51,'Horario de clases','horarioCl.intex',13,'Jzf5uLibF7Y','fa fa-calendar'),(52,'Aspecto de la aplicación','temas.intex',13,'lUwlOJ0pYDY','fa fa-picture-o'),(53,'Mi usuario','infoPerfil.intex',13,'1CLiFlFRDKU','fa fa-android'),(54,'Administración de usuarios','admUsuarios.intex',16,'IfDFy7sJAXc','fa fa-university'),(55,'Evaluación de maestros','maestroEval.intex',27,'PUGwTNWXP8o','fa fa-list-alt'),(56,'Evaluación de grados','gradoEval.intex',36,'VonX5TINpJ8','fa fa-flask'),(57,'Reportes','#',9,NULL,'fa fa-weibo'),(58,'Historial de evaluaciones','maEvalH.intex',43,'WpILwjb1I9k',' fa fa-history'),(59,'Evaluaciones de grado','gradoEvalH.intex',43,'ioFuLA0i6Tg','fa fa-dashcube'),(61,'Entrega de Paquetes','repEntrega.intex',57,'m_p006iKTfg','fa fa-leanpub'),(62,'Gestión de horarios (lite)','horarioLite.intex',27,'rpzqHZh1-gM','fa fa-list-alt'),(63,'Pago de contribución','repContr.intex',57,'fe9XxpJTmM8','fa fa-server'),(64,'Inventario de equipo','repInv.intex',57,'-RwAqJ6NRsM','fa fa-linux'),(65,'Matrículas','repMatricula.intex',57,'7onjIK6pPuY','fa fa-book'),(66,'General de Permisos','repPermisos.intex',57,'trkgmy4mYSQ','fa fa-bar-chart-o'),(67,'Área de psicología','CPsReporte.intex',57,'xKqevg9d-7I','fa fa-newspaper-o'),(68,'Elaboración de reporte','CPsReporte.intex',46,'QdmLKk81No4','fa fa-paperclip'),(69,'intro','#',NULL,'','');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `accesoTipoPersona`
--

LOCK TABLES `accesoTipoPersona` WRITE;
/*!40000 ALTER TABLE `accesoTipoPersona` DISABLE KEYS */;
INSERT INTO `accesoTipoPersona` VALUES (1,1,''),(1,2,''),(1,3,''),(1,4,''),(1,5,''),(1,6,''),(1,7,''),(1,8,''),(1,9,''),(1,12,''),(1,13,''),(1,14,''),(1,15,''),(1,16,''),(1,17,''),(9,1,''),(9,2,''),(9,3,''),(9,4,''),(9,5,''),(9,6,''),(9,7,''),(9,12,''),(9,13,''),(9,14,''),(10,1,''),(10,2,''),(11,1,''),(11,2,''),(11,3,''),(12,1,''),(12,2,''),(13,1,''),(13,2,''),(13,3,''),(13,4,''),(13,5,''),(13,6,''),(13,7,''),(13,8,''),(13,9,''),(13,12,''),(13,13,''),(13,14,''),(13,15,''),(13,16,''),(13,17,''),(14,1,''),(14,2,''),(14,3,''),(14,4,''),(14,5,''),(14,6,''),(14,7,''),(14,8,''),(14,9,''),(14,12,''),(14,13,''),(14,14,''),(14,15,''),(14,16,''),(15,1,''),(15,8,''),(15,9,''),(16,1,''),(16,2,''),(16,3,''),(16,4,''),(16,12,''),(16,13,''),(17,1,''),(17,2,''),(18,1,''),(18,2,''),(19,1,''),(19,2,''),(19,3,''),(19,13,''),(20,1,''),(20,2,''),(20,5,''),(20,6,''),(20,7,''),(21,1,''),(21,2,''),(21,5,''),(22,1,''),(22,2,''),(22,3,''),(22,4,''),(22,13,''),(23,1,''),(23,2,''),(23,5,''),(23,6,''),(23,7,''),(24,1,''),(24,2,''),(24,3,''),(24,4,''),(24,13,''),(25,1,''),(25,2,''),(25,5,''),(25,6,''),(25,7,''),(26,1,''),(26,2,''),(26,3,''),(26,4,''),(26,13,''),(27,1,''),(27,2,''),(28,1,''),(28,2,''),(29,1,''),(29,2,''),(29,3,''),(30,1,''),(30,2,''),(30,3,''),(30,4,''),(30,5,''),(30,6,''),(30,7,''),(30,12,''),(30,13,''),(30,14,''),(30,15,''),(30,16,''),(31,1,''),(31,2,''),(31,3,''),(31,4,''),(31,5,''),(31,6,''),(31,7,''),(31,12,''),(31,13,''),(31,14,''),(32,1,''),(32,2,''),(32,13,''),(33,1,''),(33,2,''),(33,12,''),(34,1,''),(34,2,''),(34,12,''),(36,1,''),(36,2,''),(36,3,''),(36,4,''),(36,12,''),(36,13,''),(37,1,''),(37,2,''),(37,3,''),(37,4,''),(37,5,''),(37,6,''),(37,7,''),(37,8,''),(37,13,''),(37,14,''),(38,1,''),(38,2,''),(38,3,''),(38,4,''),(38,5,''),(38,6,''),(38,7,''),(38,8,''),(38,14,''),(39,1,''),(39,2,''),(39,3,''),(39,4,''),(39,5,''),(39,6,''),(39,7,''),(39,8,''),(39,14,''),(40,1,''),(40,2,''),(40,5,''),(40,6,''),(40,7,''),(41,1,''),(41,2,''),(41,3,''),(41,4,''),(41,5,''),(41,6,''),(41,7,''),(41,8,''),(41,9,''),(41,12,''),(41,14,''),(41,15,''),(41,16,''),(42,1,''),(42,2,''),(42,4,''),(43,1,''),(43,2,''),(43,3,''),(43,4,''),(43,5,''),(43,6,''),(43,7,''),(43,8,''),(43,9,''),(43,12,''),(43,13,''),(43,14,''),(43,15,''),(43,16,''),(44,1,''),(44,2,''),(44,3,''),(44,4,''),(44,5,''),(44,6,''),(44,7,''),(44,8,''),(44,9,''),(44,12,''),(44,13,''),(44,14,''),(44,15,''),(44,16,''),(45,1,''),(45,2,''),(45,3,''),(45,4,''),(45,5,''),(45,6,''),(45,7,''),(45,8,''),(45,9,''),(45,12,''),(45,13,''),(45,14,''),(45,15,''),(46,1,''),(46,8,''),(46,14,''),(47,1,''),(47,8,''),(48,1,''),(48,14,''),(49,1,''),(49,14,''),(50,1,''),(50,8,''),(51,1,''),(51,4,''),(51,8,''),(51,9,''),(52,1,''),(52,2,''),(52,3,''),(52,4,''),(52,5,''),(52,6,''),(52,7,''),(52,8,''),(52,9,''),(52,12,''),(52,13,''),(52,14,''),(52,15,''),(52,16,''),(52,17,''),(53,1,''),(53,2,''),(53,3,''),(53,4,''),(53,5,''),(53,6,''),(53,7,''),(53,8,''),(53,9,''),(53,12,''),(53,13,''),(53,14,''),(53,15,''),(53,16,''),(53,17,''),(54,1,''),(54,2,''),(54,13,''),(55,1,''),(55,2,''),(56,1,''),(56,2,''),(56,3,''),(57,1,''),(57,2,''),(57,3,''),(57,4,''),(57,5,''),(57,6,''),(57,7,''),(57,12,''),(57,13,''),(58,1,''),(58,4,''),(59,1,''),(59,2,''),(59,3,''),(59,4,''),(59,8,''),(61,1,''),(61,2,''),(61,3,''),(61,4,''),(61,12,''),(61,13,''),(62,1,''),(62,2,''),(63,1,''),(63,2,''),(63,3,''),(63,4,''),(63,13,''),(64,1,''),(64,2,''),(64,3,''),(64,5,''),(64,6,''),(64,7,''),(64,13,''),(65,1,''),(65,2,''),(65,3,''),(65,13,''),(66,1,''),(66,2,''),(66,3,''),(67,1,''),(67,2,''),(68,1,''),(68,14,'');
/*!40000 ALTER TABLE `accesoTipoPersona` ENABLE KEYS */;
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
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Afganistán',''),(2,'Islas Gland',''),(3,'Albania',''),(4,'Alemania',''),(5,'Andorra',''),(6,'Angola',''),(7,'Anguilla',''),(8,'Antártida',''),(9,'Antigua y Barbuda',''),(10,'Antillas Holandesas',''),(11,'Arabia Saudí',''),(12,'Argelia',''),(13,'Argentina',''),(14,'Armenia',''),(15,'Aruba',''),(16,'Australia',''),(17,'Austria',''),(18,'Azerbaiyán',''),(19,'Bahamas',''),(20,'Bahréin',''),(21,'Bangladesh',''),(22,'Barbados',''),(23,'Bielorrusia',''),(24,'Bélgica',''),(25,'Belice',''),(26,'Benin',''),(27,'Bermudas',''),(28,'Bhután',''),(29,'Bolivia',''),(30,'Bosnia y Herzegovina',''),(31,'Botsuana',''),(32,'Isla Bouvet',''),(33,'Brasil',''),(34,'Brunéi',''),(35,'Bulgaria',''),(36,'Burkina Faso',''),(37,'Burundi',''),(38,'Cabo Verde',''),(39,'Islas Caimán',''),(40,'Camboya',''),(41,'Camerún',''),(42,'Canadá',''),(43,'República Centroafricana',''),(44,'Chad',''),(45,'República Checa',''),(46,'Chile',''),(47,'China',''),(48,'Chipre',''),(49,'Isla de Navidad',''),(50,'Ciudad del Vaticano',''),(51,'Islas Cocos',''),(52,'Colombia',''),(53,'Comoras',''),(54,'República Democrática del Congo',''),(55,'Congo',''),(56,'Islas Cook',''),(57,'Corea del Norte',''),(58,'Corea del Sur',''),(59,'Costa de Marfil',''),(60,'Costa Rica',''),(61,'Croacia',''),(62,'Cuba',''),(63,'Dinamarca',''),(64,'Dominica',''),(65,'República Dominicana',''),(66,'Ecuador',''),(67,'Egipto',''),(68,'El Salvador',''),(69,'Emiratos Árabes Unidos',''),(70,'Eritrea',''),(71,'Eslovaquia',''),(72,'Eslovenia',''),(73,'España',''),(74,'Islas ultramarinas de Estados Unidos',''),(75,'Estados Unidos de América',''),(76,'Estonia',''),(77,'Etiopía',''),(78,'Islas Feroe',''),(79,'Filipinas',''),(80,'Finlandia',''),(81,'Fiyi',''),(82,'Francia',''),(83,'Gabón',''),(84,'Gambia',''),(85,'Georgia',''),(86,'Islas Georgias del Sur y Sandwich del Sur',''),(87,'Ghana',''),(88,'Gibraltar',''),(89,'Granada',''),(90,'Grecia',''),(91,'Groenlandia',''),(92,'Guadalupe',''),(93,'Guam',''),(94,'Guatemala',''),(95,'Guayana Francesa',''),(96,'Guinea',''),(97,'Guinea Ecuatorial',''),(98,'Guinea-Bissau',''),(99,'Guyana',''),(100,'Haití',''),(101,'Islas Heard y McDonald',''),(102,'Honduras',''),(103,'Hong Kong',''),(104,'Hungría',''),(105,'India',''),(106,'Indonesia',''),(107,'Irán',''),(108,'Iraq',''),(109,'Irlanda',''),(110,'Islandia',''),(111,'Israel',''),(112,'Italia',''),(113,'Jamaica',''),(114,'Japón',''),(115,'Jordania',''),(116,'Kazajstán',''),(117,'Kenia',''),(118,'Kirguistán',''),(119,'Kiribati',''),(120,'Kuwait',''),(121,'Laos',''),(122,'Lesotho',''),(123,'Letonia',''),(124,'Líbano',''),(125,'Liberia',''),(126,'Libia',''),(127,'Liechtenstein',''),(128,'Lituania',''),(129,'Luxemburgo',''),(130,'Macao',''),(131,'ARY Macedonia',''),(132,'Madagascar',''),(133,'Malasia',''),(134,'Malawi',''),(135,'Maldivas',''),(136,'Malí',''),(137,'Malta',''),(138,'Islas Malvinas',''),(139,'Islas Marianas del Norte',''),(140,'Marruecos',''),(141,'Islas Marshall',''),(142,'Martinica',''),(143,'Mauricio',''),(144,'Mauritania',''),(145,'Mayotte',''),(146,'México',''),(147,'Micronesia',''),(148,'Moldavia',''),(149,'Mónaco',''),(150,'Mongolia',''),(151,'Montserrat',''),(152,'Mozambique',''),(153,'Myanmar',''),(154,'Namibia',''),(155,'Nauru',''),(156,'Nepal',''),(157,'Nicaragua',''),(158,'Níger',''),(159,'Nigeria',''),(160,'Niue',''),(161,'Isla Norfolk',''),(162,'Noruega',''),(163,'Nueva Caledonia',''),(164,'Nueva Zelanda',''),(165,'Omán',''),(166,'Países Bajos',''),(167,'Pakistán',''),(168,'Palau',''),(169,'Palestina',''),(170,'Panamá',''),(171,'Papúa Nueva Guinea',''),(172,'Paraguay',''),(173,'Perú',''),(174,'Islas Pitcairn',''),(175,'Polinesia Francesa',''),(176,'Polonia',''),(177,'Portugal',''),(178,'Puerto Rico',''),(179,'Qatar',''),(180,'Reino Unido',''),(181,'Reunión',''),(182,'Ruanda',''),(183,'Rumania',''),(184,'Rusia',''),(185,'Sahara Occidental',''),(186,'Islas Salomón',''),(187,'Samoa',''),(188,'Samoa Americana',''),(189,'San Cristóbal y Nevis',''),(190,'San Marino',''),(191,'San Pedro y Miquelón',''),(192,'San Vicente y las Granadinas',''),(193,'Santa Helena',''),(194,'Santa Lucía',''),(195,'Santo Tomé y Príncipe',''),(196,'Senegal',''),(197,'Serbia y Montenegro',''),(198,'Seychelles',''),(199,'Sierra Leona',''),(200,'Singapur',''),(201,'Siria',''),(202,'Somalia',''),(203,'Sri Lanka',''),(204,'Suazilandia',''),(205,'Sudáfrica',''),(206,'Sudán',''),(207,'Suecia',''),(208,'Suiza',''),(209,'Surinam',''),(210,'Svalbard y Jan Mayen',''),(211,'Tailandia',''),(212,'Taiwán',''),(213,'Tanzania',''),(214,'Tayikistán',''),(215,'Territorio Británico del Océano Índico',''),(216,'Territorios Australes Franceses',''),(217,'Timor Oriental',''),(218,'Togo',''),(219,'Tokelau',''),(220,'Tonga',''),(221,'Trinidad y Tobago',''),(222,'Túnez',''),(223,'Islas Turcas y Caicos',''),(224,'Turkmenistán',''),(225,'Turquía',''),(226,'Tuvalu',''),(227,'Ucrania',''),(228,'Uganda',''),(229,'Uruguay',''),(230,'Uzbekistán',''),(231,'Vanuatu',''),(232,'Venezuela',''),(233,'Vietnam',''),(234,'Islas Vírgenes Británicas',''),(235,'Islas Vírgenes de los Estados Unidos',''),(236,'Wallis y Futuna',''),(237,'Yemen',''),(238,'Yibuti',''),(239,'Zambia',''),(240,'Zimbabue','');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1045367073,'Guillermo Aldolfo','Delsas Murcia','1991-01-17','texistepeque Santa ana','7033-7878',0,0,'02#13','02951a6cb9595ef475fed783e59c687e','Ingeniero de Sistemas Informáticos',1,'','0213-170191-102-9','\0',0,'Salvadoreña','guillermox020@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
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
-- Dumping data for table `tipoPermiso`
--

LOCK TABLES `tipoPermiso` WRITE;
/*!40000 ALTER TABLE `tipoPermiso` DISABLE KEYS */;
INSERT INTO `tipoPermiso` VALUES (1,'Inasistencia injustificada',0,NULL),(2,'Impuntualidad en la mañana',0,NULL),(3,'Impuntualidad en la tarde',0,NULL),(4,'Enfermedad sin trámite formal',15,NULL),(5,'Enfermedad con trámite formal',90,NULL),(6,'Enfermedad de pariente cercano o duelo',20,NULL),(7,'Asuntos personales',5,NULL),(8,'Maternidad',90,NULL),(9,'Paternidad',4,NULL),(10,'Faltar a clases',60,NULL),(11,'Retirarse de la institución',60,NULL),(12,'No portar el uniforme',90,NULL);
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

-- Dump completed on 2020-12-09 16:48:38
