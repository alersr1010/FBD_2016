CREATE DATABASE  IF NOT EXISTS `db_lai` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_lai`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_lai
-- ------------------------------------------------------
-- Server version	5.5.36

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
-- Table structure for table `tb_pais`
--

DROP TABLE IF EXISTS `tb_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave Primária Tabela País',
  `nome_pais` varchar(200) DEFAULT NULL COMMENT 'Nome do páis do Solicitante',
  PRIMARY KEY (`id_pais`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pais`
--

LOCK TABLES `tb_pais` WRITE;
/*!40000 ALTER TABLE `tb_pais` DISABLE KEYS */;
INSERT INTO `tb_pais` VALUES (1,'Tfeganistão'),(2,'Tlemanha'),(3,'Tngola'),(4,'Trgentina'),(5,'Tustrália'),(6,'Tolívia'),(7,'Trasil'),(8,'Télgica'),(9,'Tabo Verde, República de'),(10,'Tanadá'),(11,'Thile'),(12,'Thristmas, Ilha (Navidad)'),(13,'Tolômbia'),(14,'Tosta Rica'),(15,'Tuba'),(16,'Tinamarca'),(17,'Tl Salvador'),(18,'Tquador'),(19,'Tscócia'),(20,'Tspanha'),(21,'Tstados Unidos'),(22,'Trança'),(23,'Trécia'),(24,'Tuadalupe'),(25,'Tuiana Francesa'),(26,'Tolanda (Países Baixos)'),(27,'Trlanda'),(28,'Tsrael'),(29,'Ttália'),(30,'Tapão'),(31,'Tuxemburgo'),(32,'Toçambique'),(33,'Tigéria'),(34,'Toruega'),(35,'Tanamá'),(36,'Taraguai'),(37,'Teru'),(38,'Tolônia, República da'),(39,'Tortugal'),(40,'Tússia'),(41,'Tuécia'),(42,'Tuíça'),(43,'Tcheca, República'),(44,'Truguai'),(45,'Tenezuela'),(46,'Tietnã'),(47,'Tirgens, Ilhas (Britânicas)'),(48,'Tustria');
/*!40000 ALTER TABLE `tb_pais` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-13 10:49:37
