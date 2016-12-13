--DADOS PEDIDOS
CREATE VIEW vw_dados_pedidos AS
SELECT 
	ped.id_pedido, ped.protocolo_pedido, ped.data_registro, ped.prazo_atendimento, 
	ped.foi_prorrogado, ped.foi_reencaminhado, ped.origem_solicitacao, ped.numero_perguntas, 
	ped.data_resposta, 
	ped.id_solicitante, --solic.tipo_demandante, solic.data_nascimento, solic.sexo,
	ped.id_orgao_destino, org.nome_orgao AS nome_orgao_destino,
	ped.id_forma_resposta, fr.nome_forma_resposta,
	ped.id_categoria, cat.nome_categoria,
	ped.id_tipo_resposta, tr.nome_tipo_resposta,
	ped.id_classificacao_tipo_resposta, ctr.nome_classificacao_tipo_resposta,
	ped.id_situacao_pedido, sp.nome_situacao AS nome_situacao_pedido
FROM public.tb_pedido as ped --101905
--LEFT JOIN public.tb_solicitante as solic on solic.id_solicitante = ped.id_solicitante
LEFT JOIN public.tb_orgao as org on org.id_orgao = ped.id_orgao_destino
LEFT JOIN public.tb_forma_resposta as fr on fr.id_forma_resposta = ped.id_forma_resposta
LEFT JOIN public.tb_categoria as cat on cat.id_categoria = ped.id_categoria
LEFT JOIN public.tb_tipo_resposta as tr on tr.id_tipo_resposta = ped.id_tipo_resposta
LEFT JOIN public.tb_classificacao_tipo_resposta as ctr on ctr.id_classificacao_tipo_resposta = ped.id_classificacao_tipo_resposta
LEFT JOIN public.tb_situacao as sp on sp.id_situacao = ped.id_situacao_pedido
--LIMIT 10;
