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
-- Table structure for table `tb_classificacao_tipo_resposta`
--

DROP TABLE IF EXISTS `tb_classificacao_tipo_resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_classificacao_tipo_resposta` (
  `id_classificacao_tipo_resposta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria da tabela classificação tipo resposta\n',
  `nome_classificacao_tipo_resposta` varchar(200) DEFAULT NULL COMMENT 'subtipo da resposta dada ao pedido ',
  PRIMARY KEY (`id_classificacao_tipo_resposta`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_classificacao_tipo_resposta`
--

LOCK TABLES `tb_classificacao_tipo_resposta` WRITE;
/*!40000 ALTER TABLE `tb_classificacao_tipo_resposta` DISABLE KEYS */;
INSERT INTO `tb_classificacao_tipo_resposta` VALUES (1,'Tomunicada necessidade de pagamento de custos de postagem e/ou reprodução'),(2,'Toncedido acesso a sistema corporativo para consulta da informação'),(3,'Tados pessoais'),(4,'Tata, hora e local para consulta agendados'),(5,'Tnformação sigilosa classificada conforme a Lei 12.527/2011'),(6,'Tnformação sigilosa de acordo com legislação específica'),(7,'Tnformações enviadas pelo correio'),(8,'Tnformações enviadas por e-mail'),(9,'Trientação sobre como encontrar a informação solicitada na Internet ou em publicações existentes'),(10,'Tarte da informação contém dados pessoais'),(11,'Tarte da informação demandará mais tempo para produção'),(12,'Tarte da informação inexistente'),(13,'Tarte da informação é de competência de outro órgão/entidade'),(14,'Tarte da informação é sigilosa de acordo com legislação específica'),(15,'Tarte da informação é sigilosa e classificada conforme a Lei 12.527/2011'),(16,'Tarte do pedido é desproporcional ou desarrazoado'),(17,'Tarte do pedido é genérico'),(18,'Tarte do pedido é incompreensível'),(19,'Tedido desproporcional ou desarrazoado'),(20,'Tedido exige tratamento adicional de dados'),(21,'Tedido genérico'),(22,'Tedido incompreensível'),(23,'Trocesso decisório em curso'),(24,'Tesposta solicitada inserida no e-SIC');
/*!40000 ALTER TABLE `tb_classificacao_tipo_resposta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-13 10:49:34
