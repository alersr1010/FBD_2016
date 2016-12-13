--Quais os órgãos que mais foram solicitados pedidos de acesso a informação?
--QTDE DE PEDIDOS POR ORGAO
SELECT id_orgao_destino, nome_orgao_destino, count(id_pedido) AS qtde_pedido
FROM VW_DADOS_PEDIDOS
GROUP BY id_orgao_destino, nome_orgao_destino
ORDER BY count(id_pedido) DESC;

--Quais tiveram mais pedidos negados ou aceitos?
--QTDE DE PEDIDOS POR TIPO DE RESPOSTA
SELECT id_tipo_resposta, nome_tipo_resposta, count(id_pedido) AS qtde_pedido
FROM VW_DADOS_PEDIDOS
GROUP BY id_tipo_resposta, nome_tipo_resposta
ORDER BY nome_tipo_resposta;
