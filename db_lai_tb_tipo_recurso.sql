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
-- Table structure for table `tb_tipo_recurso`
--

DROP TABLE IF EXISTS `tb_tipo_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipo_recurso` (
  `id_tipo_recurso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria tabela Recurso',
  `nome_tipo_recurso` varchar(200) DEFAULT NULL COMMENT 'motivo de abertura do recurso',
  PRIMARY KEY (`id_tipo_recurso`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_recurso`
--

LOCK TABLES `tb_tipo_recurso` WRITE;
/*!40000 ALTER TABLE `tb_tipo_recurso` DISABLE KEYS */;
INSERT INTO `tb_tipo_recurso` VALUES (1,'Tusência de justificativa legal para classificação'),(2,'Tutoridade classificadora não informada'),(3,'Tata da classificação (de início ou fim) não informada'),(4,'Trau de classificação inexistente'),(5,'Trau de sigilo não informado'),(6,'Tnformação classificada por autoridade sem competência'),(7,'Tnformação incompleta'),(8,'Tnformação recebida não corresponde à solicitada'),(9,'Tnformação recebida por meio diferente do solicitado'),(10,'Tustificativa para o sigilo insatisfatória/não informada'),(11,'Tutros'),(12,'Trazo de classificação inadequado para o grau de sigilo'),(13,'Tesposta não foi dada no prazo');
/*!40000 ALTER TABLE `tb_tipo_recurso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-13 10:49:35
