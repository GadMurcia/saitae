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
  `jornalización` bit(1) NOT NULL DEFAULT b'1',
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
