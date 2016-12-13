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
-- Table structure for table `tb_subcategoria`
--

DROP TABLE IF EXISTS `tb_subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subcategoria` (
  `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria tabela subcategoria',
  `nome_subcategoria` varchar(200) DEFAULT NULL COMMENT 'subcategoria do pedido atribuída pel SIC de acordo com o VCGE (Vocabulário Controlado do Governo Eletrônico);',
  `id_categoria` int(11) DEFAULT NULL COMMENT 'Chave estrangeira referente a tabela categoria',
  PRIMARY KEY (`id_subcategoria`),
  KEY `fk_subcategoria_categoria` (`id_categoria`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subcategoria`
--

LOCK TABLES `tb_subcategoria` WRITE;
/*!40000 ALTER TABLE `tb_subcategoria` DISABLE KEYS */;
INSERT INTO `tb_subcategoria` VALUES (1,'Tbastecimento',1),(2,'Tdministração financeira',6),(3,'Tdministração pública',8),(4,'Tgricultura de subsistência',1),(5,'Tgricultura familiar',1),(6,'Tgricultura orgânica',1),(7,'Tlimentação e nutrição',15),(8,'Tlimento',1),(9,'Tmbiente e saúde',15),(10,'Tmbientes ocupados pelo homem',12),(11,'Trquitetura e engenharia em saúde',15),(12,'Tssistência ao estudante',7),(13,'Tssistência e desenvolvimento social',13),(14,'Tssistência técnica',1),(15,'Tuditoria em saúde',15),(16,'Tiodiversidade',12),(17,'Tidadania ambiental',12),(18,'Tiência e Tecnologia',2),(19,'Tiência e tecnologia em saúde',15),(20,'Tomunicação',2),(21,'Tomunidade e sociedade',13),(22,'Tomércio e Serviços',3),(23,'Tultura',4),(24,'Tefesa Nacional',5),(25,'Tefesa Vegetal',1),(26,'Tconomia',6),(27,'Tconomia e meio ambiente',12),(28,'Tducação ambiental',7),(29,'Tducação básica',7),(30,'Tducação de jovens e adultos',7),(31,'Tducação do campo',7),(32,'Tducação indígena',7),(33,'Tducação para a saúde',15),(34,'Tducação para quilombolas',7),(35,'Tducação profissional e tecnológica',7),(36,'Tducação superior',7),(37,'Tducação à distância',7),(38,'Tmergências e Urgências',15),(39,'Tncargos financeiros',6),(40,'Tngenharia agrícola',1),(41,'Tsporte',4),(42,'Tstrangeiro',14),(43,'Txtensão rural',1),(44,'Txtrativismo',1),(45,'Tamília',13),(46,'Tarmácia',15),(47,'Tinanciamento da educação',7),(48,'Tinanças',6),(49,'Tiscalização do estado',8),(50,'Tiscalização do trabalho',16),(51,'Tlorestas',12),(52,'Testão de meio ambiente',12),(53,'Testão escolar',7),(54,'Toverno eletrônico',8),(55,'Tabitação',9),(56,'Tumanização na saúde',15),(57,'Tnfecção hospitalar',15),(58,'Tnformação - Gestão, preservação e acesso',2),(59,'Tnfrações ambientais',12),(60,'Tustiça',11),(61,'Tazer',4),(62,'Tegislação de saúde',15),(63,'Tegislação e jurisprudência',11),(64,'Tegislação educacional',7),(65,'Tegislação trabalhista',16),(66,'Tedicamentos',15),(67,'Tedicina natural',15),(68,'Tercado de trabalho',16),(69,'Tétodos e meios de ensino e aprendizagem',7),(70,'Trganização agrária',1),(71,'Trganização do estado',8),(72,'Trganizações internacionais',14),(73,'Trçamento de saúde',15),(74,'Tarticipação e controle social em saúde',15),(75,'Tarâmetros e diretrizes curriculares nacionais',7),(76,'Tecuária',1),(77,'Tesca',1),(78,'Tessoa',13),(79,'Tlanejamento urbano',9),(80,'Tolítica',8),(81,'Tolítica agrícola',1),(82,'Tolítica e gestão industrial',10),(83,'Tolítica externa',14),(84,'Tolítica trabalhista',16),(85,'Trevidência social',13),(86,'Troduto vegetal',1),(87,'Trodução Industrial',10),(88,'Trodução vegetal',1),(89,'Trofissionais da educação',7),(90,'Trofissões e ocupações',16),(91,'Tromoção comercial internacional',14),(92,'Troteção e defesa do cidadão',13),(93,'Tualidade ambiental',12),(94,'Tualificação e aprendizagem profissional',16),(95,'Tecursos energéticos',10),(96,'Tecursos humanos em saúde',15),(97,'Telações diplomáticas',14),(98,'Taneamento urbano',9),(99,'Tangue e hemoderivados',15),(100,'Taúde bucal',15),(101,'Taúde da criança',15),(102,'Taúde da família',15),(103,'Taúde da mulher',15),(104,'Taúde da população negra',15),(105,'Taúde do adolescente e do jovem',15),(106,'Taúde do homem',15),(107,'Taúde do idoso',15),(108,'Taúde do indígena',15),(109,'Taúde do trabalhador',15),(110,'Taúde dos portadores de deficiências',15),(111,'Taúde mental',15),(112,'Taúde no sistema penitenciário',15),(113,'Taúde ocular',15),(114,'Taúde reprodutiva',15),(115,'Tegurança Nacional',5),(116,'Tegurança pública',5),(117,'Terviço de Inteligência',5),(118,'Terviços Urbanos',9),(119,'Terviços consulares',14),(120,'Tistema de informação em saúde',15),(121,'Tistema de saúde',15),(122,'Tistema educacional - Avaliação',7),(123,'Tociedade Civil - Organização e participação',13),(124,'Tolos',1),(125,'Trabalho estrangeiro',16),(126,'Transgenia e sequenciamento',1),(127,'Transplantes de órgãos e tecidos',15),(128,'Transporte aquaviário',17),(129,'Transporte aéreo',17),(130,'Transporte dutoviário',17),(131,'Transporte especial',17),(132,'Transporte ferroviário',17),(133,'Transporte internacional',17),(134,'Transporte multimodal',17),(135,'Transporte rodoviário',17),(136,'Trânsito',17),(137,'Turismo',3),(138,'Tnidades de saúde',15),(139,'Trbanismo',9),(140,'Tacinação',15),(141,'Tigilância sanitária',15),(142,'Tiolência',15),(143,'Tguas',12),(144,'Treas protegidas',12),(145,'Ttica de profissionais de saúde',15);
/*!40000 ALTER TABLE `tb_subcategoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-13 10:49:50
