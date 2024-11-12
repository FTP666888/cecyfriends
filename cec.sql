-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cecyfriends
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `grado_grupo`
--

DROP TABLE IF EXISTS `grado_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grado_grupo` (
  `id_info_ggpt` int(11) NOT NULL,
  `id_grupo` varchar(15) NOT NULL,
  `id_grado` varchar(15) NOT NULL,
  `parcial` int(1) DEFAULT NULL,
  `turno` char(3) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_info_ggpt`),
  KEY `fk_perfil` (`id_perfil`),
  CONSTRAINT `fk_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado_grupo`
--

LOCK TABLES `grado_grupo` WRITE;
/*!40000 ALTER TABLE `grado_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grado_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id_grupo` int(11) NOT NULL,
  `id_owner` int(11) DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `descripcion_proyecto` text DEFAULT NULL,
  `recompensas` text DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  KEY `id_owner` (`id_owner`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`id_owner`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,1,'Proyecto Ciencia','Investigaci?n cient?fica en biolog?a','Certificados','2024-12-01'),(2,2,'Proyecto Matem?ticas','Competencia de matem?ticas','Reconocimientos','2024-11-15'),(3,3,'Taller de Rob?tica','Proyecto para crear un robot funcional','Medallas','2024-10-30'),(4,4,'Club de Lectura','Grupo para discutir literatura','Libros','2024-12-20'),(5,5,'Equipo de F?tbol','Grupo deportivo escolar','Trofeo','2024-10-25'),(6,6,'Club de Arte','Actividades art?sticas','Exposici?n','2024-11-30');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match` (
  `id_match` int(11) NOT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  `id_interesado` int(11) DEFAULT NULL,
  `fecha_interes` timestamp NOT NULL DEFAULT current_timestamp(),
  `match_confirmado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_match`),
  KEY `id_grupo` (`id_grupo`),
  KEY `id_interesado` (`id_interesado`),
  CONSTRAINT `match_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`),
  CONSTRAINT `match_ibfk_2` FOREIGN KEY (`id_interesado`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES (1,1,2,'2024-08-15 16:00:00',1),(2,2,3,'2024-08-16 17:00:00',1),(3,3,4,'2024-08-17 18:00:00',0),(4,4,5,'2024-08-18 19:00:00',1),(5,5,6,'2024-08-19 20:00:00',0),(6,6,1,'2024-08-20 21:00:00',1);
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensajes` (
  `id_mensaje` int(11) NOT NULL,
  `id_remitente` int(11) DEFAULT NULL,
  `id_destinatario` int(11) DEFAULT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `fecha_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_mensaje`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_destinatario` (`id_destinatario`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`id_destinatario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `mensajes_ibfk_3` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (1,1,2,1,'?Est?s listo para el proyecto?','2024-09-01 16:00:00'),(2,2,3,2,'Vamos a ganar la competencia.','2024-09-02 17:30:00'),(3,3,4,3,'La programaci?n est? en marcha.','2024-09-03 15:15:00'),(4,4,5,4,'El libro de esta semana es genial.','2024-09-04 20:45:00'),(5,5,6,5,'Entrenamiento a las 5 pm.','2024-09-05 23:00:00'),(6,6,1,6,'Exposici?n de arte el pr?ximo mes.','2024-09-06 22:00:00');
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden` (
  `id_orden` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,1,150.75,'2024-01-10 16:30:00','P'),(2,2,230.50,'2024-02-12 18:45:00','C'),(3,3,50.25,'2024-03-15 17:20:00','P'),(4,4,175.00,'2024-04-18 15:30:00','C'),(5,5,300.00,'2024-05-22 20:00:00','P'),(6,6,75.50,'2024-06-25 21:15:00','C');
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_producto`
--

DROP TABLE IF EXISTS `orden_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_producto` (
  `id_orden_producto` int(11) NOT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_orden_producto`),
  KEY `id_orden` (`id_orden`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `orden_producto_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  CONSTRAINT `orden_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_producto`
--

LOCK TABLES `orden_producto` WRITE;
/*!40000 ALTER TABLE `orden_producto` DISABLE KEYS */;
INSERT INTO `orden_producto` VALUES (1,1,1,2),(2,2,2,1),(3,3,3,1),(4,4,4,5),(5,5,5,2),(6,6,6,3);
/*!40000 ALTER TABLE `orden_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_puesto` int(11) DEFAULT NULL,
  `id_info_ggp` int(11) DEFAULT NULL,
  `talentos` text DEFAULT NULL,
  `amigos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_puesto` (`id_puesto`),
  KEY `id_info_ggp` (`id_info_ggp`),
  CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `perfil_ibfk_2` FOREIGN KEY (`id_puesto`) REFERENCES `puesto` (`id_puesto`),
  CONSTRAINT `perfil_ibfk_3` FOREIGN KEY (`id_info_ggp`) REFERENCES `grado_grupo` (`id_info_ggpt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL,
  `nombre_permiso` varchar(20) NOT NULL,
  `desc_permiso` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Cuaderno',15.00),(2,'Calculadora',250.00),(3,'Mochila',100.00),(4,'Lapicero',5.50),(5,'Libro de Matem?ticas',200.00),(6,'Comp?s',20.00);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puesto` (
  `id_puesto` int(11) NOT NULL,
  `nombre_puesto` varchar(20) NOT NULL,
  `desc_puesto` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto_permiso`
--

DROP TABLE IF EXISTS `puesto_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puesto_permiso` (
  `id_puesto_permiso` int(11) NOT NULL,
  `id_puesto` int(11) DEFAULT NULL,
  `id_permiso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_puesto_permiso`),
  KEY `id_puesto` (`id_puesto`),
  KEY `id_permiso` (`id_permiso`),
  CONSTRAINT `puesto_permiso_ibfk_1` FOREIGN KEY (`id_puesto`) REFERENCES `puesto` (`id_puesto`),
  CONSTRAINT `puesto_permiso_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto_permiso`
--

LOCK TABLES `puesto_permiso` WRITE;
/*!40000 ALTER TABLE `puesto_permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talento`
--

DROP TABLE IF EXISTS `talento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talento` (
  `id_talento` int(11) NOT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  `descripcion_talento` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_talento`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `talento_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talento`
--

LOCK TABLES `talento` WRITE;
/*!40000 ALTER TABLE `talento` DISABLE KEYS */;
INSERT INTO `talento` VALUES (1,1,'Investigaci?n Cient?fica'),(2,2,'Resoluci?n de Problemas'),(3,3,'Construcci?n de Robots'),(4,4,'Cr?tica Literaria'),(5,5,'Deportes de Alto Rendimiento'),(6,6,'Creatividad en Artes Visuales');
/*!40000 ALTER TABLE `talento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `matricula` char(14) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `matricula` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Carlos P?rez','carlos@cecyteq.edu.mx','hashedpassword1','CECYT001'),(2,'Ana Garc?a','ana@cecyteq.edu.mx','hashedpassword2','CECYT002'),(3,'Luis L?pez','luis@cecyteq.edu.mx','hashedpassword3','CECYT003'),(4,'Mar?a Ruiz','maria@cecyteq.edu.mx','hashedpassword4','CECYT004'),(5,'Pedro S?nchez','pedro@cecyteq.edu.mx','hashedpassword5','CECYT005'),(6,'Laura Torres','laura@cecyteq.edu.mx','hashedpassword6','CECYT006');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-31 16:32:40
