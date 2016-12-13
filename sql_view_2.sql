--DADOS RECURSOS
CREATE VIEW vw_dados_recursos AS
SELECT 
	rec.id_recurso, rec.data_registro, rec.prazo_atendimento, rec.origem_solicitacao, 
	rec.data_resposta, rec.id_recurso_precedente, rec.id_pedido, 
	rec.id_instancia, inst.nome_instancia,
	rec.id_situacao_recurso, sr.nome_situacao AS nome_situacao_recurso,
	rec.id_tipo_recurso, trec.nome_tipo_recurso, 
	rec.id_tipo_resposta, tresp.nome_tipo_resposta
FROM public.tb_recurso AS rec
LEFT JOIN public.tb_instancia as inst on inst.id_instancia = rec.id_instancia
LEFT JOIN public.tb_situacao as sr on sr.id_situacao = rec.id_situacao_recurso
LEFT JOIN public.tb_tipo_recurso as trec on trec.id_tipo_recurso = rec.id_tipo_recurso
LEFT JOIN public.tb_tipo_resposta as tresp on tresp.id_tipo_resposta = rec.id_tipo_resposta
limit 10;
