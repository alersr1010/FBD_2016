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
-- Temporary view structure for view `vw_dados_solicitantes`
--

DROP TABLE IF EXISTS `vw_dados_solicitantes`;
/*!50001 DROP VIEW IF EXISTS `vw_dados_solicitantes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_dados_solicitantes` AS SELECT 
 1 AS `id_solicitante`,
 1 AS `tipo_demandante`,
 1 AS `data_nascimento`,
 1 AS `sexo`,
 1 AS `id_escolaridade`,
 1 AS `nome_escolaridade`,
 1 AS `id_profissao`,
 1 AS `nome_profissao`,
 1 AS `id_municipio`,
 1 AS `nome_municipio`,
 1 AS `id_uf`,
 1 AS `nome_uf`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_dados_recursos`
--

DROP TABLE IF EXISTS `vw_dados_recursos`;
/*!50001 DROP VIEW IF EXISTS `vw_dados_recursos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_dados_recursos` AS SELECT 
 1 AS `id_recurso`,
 1 AS `data_registro`,
 1 AS `prazo_atendimento`,
 1 AS `origem_solicitacao`,
 1 AS `data_resposta`,
 1 AS `id_recurso_precedente`,
 1 AS `id_pedido`,
 1 AS `id_instancia`,
 1 AS `nome_instancia`,
 1 AS `id_situacao_recurso`,
 1 AS `nome_situacao_recurso`,
 1 AS `id_tipo_recurso`,
 1 AS `nome_tipo_recurso`,
 1 AS `id_tipo_resposta`,
 1 AS `nome_tipo_resposta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_dados_pedidos`
--

DROP TABLE IF EXISTS `vw_dados_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vw_dados_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_dados_pedidos` AS SELECT 
 1 AS `id_pedido`,
 1 AS `protocolo_pedido`,
 1 AS `data_registro`,
 1 AS `prazo_atendimento`,
 1 AS `foi_prorrogado`,
 1 AS `foi_reencaminhado`,
 1 AS `origem_solicitacao`,
 1 AS `numero_perguntas`,
 1 AS `data_resposta`,
 1 AS `id_solicitante`,
 1 AS `id_orgao_destino`,
 1 AS `nome_orgao_destino`,
 1 AS `id_forma_resposta`,
 1 AS `nome_forma_resposta`,
 1 AS `id_categoria`,
 1 AS `nome_categoria`,
 1 AS `id_tipo_resposta`,
 1 AS `nome_tipo_resposta`,
 1 AS `id_classificacao_tipo_resposta`,
 1 AS `nome_classificacao_tipo_resposta`,
 1 AS `id_situacao_pedido`,
 1 AS `nome_situacao_pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_dados_solicitantes`
--

/*!50001 DROP VIEW IF EXISTS `vw_dados_solicitantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dados_solicitantes` AS select `sol`.`id_solicitante` AS `id_solicitante`,`sol`.`tipo_demandante` AS `tipo_demandante`,`sol`.`data_nascimento` AS `data_nascimento`,`sol`.`sexo` AS `sexo`,`sol`.`id_escolaridade` AS `id_escolaridade`,`esc`.`nome_escolaridade` AS `nome_escolaridade`,`sol`.`id_profissao` AS `id_profissao`,`prof`.`nome_profissao` AS `nome_profissao`,`sol`.`id_municipio` AS `id_municipio`,`munic`.`nome_municipio` AS `nome_municipio`,`munic`.`id_uf` AS `id_uf`,`uf`.`nome_uf` AS `nome_uf` from ((((`tb_solicitante` `sol` left join `tb_escolaridade` `esc` on((`esc`.`id_escolaridade` = `sol`.`id_escolaridade`))) left join `tb_profissao` `prof` on((`prof`.`id_profissao` = `sol`.`id_profissao`))) left join `tb_municipio` `munic` on((`munic`.`id_municipio` = `sol`.`id_municipio`))) left join `tb_uf` `uf` on((`uf`.`id_uf` = `munic`.`id_uf`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dados_recursos`
--

/*!50001 DROP VIEW IF EXISTS `vw_dados_recursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dados_recursos` AS select `rec`.`id_recurso` AS `id_recurso`,`rec`.`data_registro` AS `data_registro`,`rec`.`prazo_atendimento` AS `prazo_atendimento`,`rec`.`origem_solicitacao` AS `origem_solicitacao`,`rec`.`data_resposta` AS `data_resposta`,`rec`.`id_recurso_precedente` AS `id_recurso_precedente`,`rec`.`id_pedido` AS `id_pedido`,`rec`.`id_instancia` AS `id_instancia`,`inst`.`nome_instancia` AS `nome_instancia`,`rec`.`id_situacao_recurso` AS `id_situacao_recurso`,`sr`.`nome_situacao` AS `nome_situacao_recurso`,`rec`.`id_tipo_recurso` AS `id_tipo_recurso`,`trec`.`nome_tipo_recurso` AS `nome_tipo_recurso`,`rec`.`id_tipo_resposta` AS `id_tipo_resposta`,`tresp`.`nome_tipo_resposta` AS `nome_tipo_resposta` from ((((`tb_recurso` `rec` left join `tb_instancia` `inst` on((`inst`.`id_instancia` = `rec`.`id_instancia`))) left join `tb_situacao` `sr` on((`sr`.`id_situacao` = `rec`.`id_situacao_recurso`))) left join `tb_tipo_recurso` `trec` on((`trec`.`id_tipo_recurso` = `rec`.`id_tipo_recurso`))) left join `tb_tipo_resposta` `tresp` on((`tresp`.`id_tipo_resposta` = `rec`.`id_tipo_resposta`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dados_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_dados_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dados_pedidos` AS select `ped`.`id_pedido` AS `id_pedido`,`ped`.`protocolo_pedido` AS `protocolo_pedido`,`ped`.`data_registro` AS `data_registro`,`ped`.`prazo_atendimento` AS `prazo_atendimento`,`ped`.`foi_prorrogado` AS `foi_prorrogado`,`ped`.`foi_reencaminhado` AS `foi_reencaminhado`,`ped`.`origem_solicitacao` AS `origem_solicitacao`,`ped`.`numero_perguntas` AS `numero_perguntas`,`ped`.`data_resposta` AS `data_resposta`,`ped`.`id_solicitante` AS `id_solicitante`,`ped`.`id_orgao_destino` AS `id_orgao_destino`,`org`.`nome_orgao` AS `nome_orgao_destino`,`ped`.`id_forma_resposta` AS `id_forma_resposta`,`fr`.`nome_forma_resposta` AS `nome_forma_resposta`,`ped`.`id_categoria` AS `id_categoria`,`cat`.`nome_categoria` AS `nome_categoria`,`ped`.`id_tipo_resposta` AS `id_tipo_resposta`,`tr`.`nome_tipo_resposta` AS `nome_tipo_resposta`,`ped`.`id_classificacao_tipo_resposta` AS `id_classificacao_tipo_resposta`,`ctr`.`nome_classificacao_tipo_resposta` AS `nome_classificacao_tipo_resposta`,`ped`.`id_situacao_pedido` AS `id_situacao_pedido`,`sp`.`nome_situacao` AS `nome_situacao_pedido` from ((((((`tb_pedido` `ped` left join `tb_orgao` `org` on((`org`.`id_orgao` = `ped`.`id_orgao_destino`))) left join `tb_forma_resposta` `fr` on((`fr`.`id_forma_resposta` = `ped`.`id_forma_resposta`))) left join `tb_categoria` `cat` on((`cat`.`id_categoria` = `ped`.`id_categoria`))) left join `tb_tipo_resposta` `tr` on((`tr`.`id_tipo_resposta` = `ped`.`id_tipo_resposta`))) left join `tb_classificacao_tipo_resposta` `ctr` on((`ctr`.`id_classificacao_tipo_resposta` = `ped`.`id_classificacao_tipo_resposta`))) left join `tb_situacao` `sp` on((`sp`.`id_situacao` = `ped`.`id_situacao_pedido`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'db_lai'
--

--
-- Dumping routines for database 'db_lai'
--
/*!50003 DROP PROCEDURE IF EXISTS `qtde_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `qtde_pedido`(parametro text)
BEGIN  
	IF parametro  = 'prorrogado' THEN
		  
		SELECT  foi_prorrogado, count(id_pedido)
		FROM tb_pedido
		GROUP BY foi_prorrogado;
	ELSE 
		 
		SELECT  foi_reencaminhado, count(id_pedido)
		FROM tb_pedido
		GROUP BY foi_reencaminhado;
 END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-13 10:49:52
