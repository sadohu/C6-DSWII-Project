CREATE DATABASE  IF NOT EXISTS `db_institucion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_institucion`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_institucion
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_condicion`
--

DROP TABLE IF EXISTS `tb_condicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_condicion` (
  `cod_condi` int NOT NULL AUTO_INCREMENT,
  `nom_condi` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_condi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_condicion`
--

LOCK TABLES `tb_condicion` WRITE;
/*!40000 ALTER TABLE `tb_condicion` DISABLE KEYS */;
INSERT INTO `tb_condicion` VALUES (1,'Nombrado'),(2,'Contratado'),(3,'CAS'),(4,'Bolsa');
/*!40000 ALTER TABLE `tb_condicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_docente`
--

DROP TABLE IF EXISTS `tb_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_docente` (
  `cod_doc` int NOT NULL AUTO_INCREMENT,
  `nom_doc` varchar(30) DEFAULT NULL,
  `pat_doc` varchar(30) DEFAULT NULL,
  `mat_doc` varchar(30) DEFAULT NULL,
  `sex_doc` varchar(15) DEFAULT NULL,
  `num_hijo_doc` int DEFAULT NULL,
  `sue_doc` double DEFAULT NULL,
  `cod_condi` int DEFAULT NULL,
  PRIMARY KEY (`cod_doc`),
  KEY `FK01` (`cod_condi`),
  CONSTRAINT `FK01` FOREIGN KEY (`cod_condi`) REFERENCES `tb_condicion` (`cod_condi`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_docente`
--

LOCK TABLES `tb_docente` WRITE;
/*!40000 ALTER TABLE `tb_docente` DISABLE KEYS */;
INSERT INTO `tb_docente` VALUES (1,'Mark Jorge','Julca','Salazar','Masculino',10,20000.5,1),(2,'Jansy Piedad','BOCANEGRA','PÉREZ','Masculino',0,1500.8,1),(3,'Salin Roque','CARRASCO','TORRES','Masculino',0,1500.8,1),(5,'Edith Carmen','CHUYES','MARAVI','Femenino',0,2500.12,1),(9,'Katherine Paola','DE LOS SANTOS','GARCIA','Masculino',0,1500.8,1),(12,'Salor Amor Mohamed','FARFAN','SANJINEZ','Masculino',0,1500.8,1),(13,'Eduardo Rodrigo','GARAY','TASAYCO','Masculino',0,1500.8,1),(14,'Lindenber Erwin','GARCIA','PAUCAR','Masculino',0,1500.8,1),(15,'Margoth Kimi','LEON','HUAMANI','Masculino',0,1500.8,1),(16,'Christian Gustavo','LLANCARI','YBARRA','Masculino',0,1500.8,1),(17,'Noemi Noelia','LOVATON','FLORES','Masculino',0,1500.8,1),(18,'Junior Alejandro','MEDINA','HUAMAN','Masculino',0,1500.8,1),(19,'Johnny Luis','NAUPAY','SALAZAR','Masculino',0,1500.8,1),(20,'Percy Antony','OLIVARES','RUEDA','Masculino',0,1500.8,1),(21,'Paola Lucia','PINEDO','DE PAZ','Masculino',0,1500.8,1),(22,'LUIS ALEJANDRO','PINEIRO','PAIVA','Masculino',0,1500.8,1),(23,'Yonathan Ismael','QUISPE','SARMIENTO','Masculino',0,1500.8,1),(24,'Richar Serafh','SARMIENTO','CUYUTUPA','Masculino',0,1500.8,1),(25,'Mauro Job','ZEGARRA','ORTIZ','Masculino',0,1500.8,1),(26,'Abraham','ACHING','ZARRIA','Masculino',0,1500.8,1),(27,'Josh Bertin Jesus','ANCAIMA','MORA','Masculino',0,1500.8,1),(28,'Rolando Martin','BARRIENTOS','QUIROZ','Masculino',0,1500.8,1),(30,'Jose Junior','CARMEN','QUESQUEN','Masculino',0,1500.8,1),(31,'Camilo Claudio','CESPEDES','CIERTO','Masculino',0,1500.8,1),(32,'Wendy Dayan','CHAFALOTE','JARAMILLO','Masculino',0,1500.8,1),(33,'Jesus Eduardo','CHAUCA','CRUZ','Masculino',0,1500.8,1),(34,'Gustavo Alfredo','CHIMOY','GARCÍA','Masculino',0,1500.8,1),(35,'GUILLERMO','CONDE','GUIZADA','Masculino',0,1500.8,1),(36,'Maury Dionicio','CORZO','TRANCA','Masculino',0,1500.8,1),(37,'Gerson Omar','COTRINA','SALDAÑA','Masculino',0,1500.8,1),(38,'ENRIQUEZ','GUTIERREZ','MALCA','Masculino',0,1500.8,1),(39,'Miryam Vilma','ESCARCENA','TECSI','Masculino',0,1500.8,1),(40,'Catherine Adelayda','FARFAN','HUILLCA','Masculino',0,1500.8,1),(41,'Lucia','Periona','Mora','Femenino',0,3500,1),(42,'Michael','Phelps','Marlon','Masculino',2,5402.2,1),(43,'Big Show','Phelps','Marlon','Masculino',5,5402.2,1),(44,'Ramsey','Phelps','Marlon','Masculino',2,5402.21,1),(45,'Aylin','Lopez','Torres','Femenino',6,5000.12,1),(46,'Mauricio','Diez','Canseso','Masculino',20,1000.21,1);
/*!40000 ALTER TABLE `tb_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `cod_usu` int NOT NULL AUTO_INCREMENT,
  `log_usu` varchar(15) DEFAULT NULL,
  `pas_usu` varchar(15) DEFAULT NULL,
  `nom_usu` varchar(30) DEFAULT NULL,
  `ape_usu` varchar(50) DEFAULT NULL,
  `eda_usu` smallint DEFAULT NULL,
  `est_usu` char(1) DEFAULT NULL,
  PRIMARY KEY (`cod_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'pepe','pepe','Juan','Perez Ayala',30,'1'),(2,'maria','maria','Maria','Fernandez',28,'1'),(3,'sonia','sonia','Sonia','Fabiola',35,'1'),(4,'pedro','pedro','Pedro','Ayala',40,'1'),(5,'prueba123','789',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'instituto_2021_t4dn'
--

--
-- Dumping routines for database 'instituto_2021_t4dn'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-15 20:26:22
