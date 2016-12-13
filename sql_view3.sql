--DADOS SOLICITANTES
CREATE VIEW vw_dados_solicitantes AS
SELECT 
	sol.id_solicitante, sol.tipo_demandante, sol.data_nascimento, sol.sexo, 
	sol.id_escolaridade, esc.nome_escolaridade,
	sol.id_profissao, prof.nome_profissao,
	sol.id_municipio, munic.nome_municipio,
	munic.id_uf, uf.nome_uf--, sol.id_pais, p.nome_pais
FROM public.tb_solicitante AS sol
LEFT JOIN public.tb_escolaridade AS esc on esc.id_escolaridade = sol.id_escolaridade
LEFT JOIN public.tb_profissao AS prof on prof.id_profissao = sol.id_profissao
LEFT JOIN public.tb_municipio AS munic on munic.id_municipio = sol.id_municipio
LEFT JOIN public.tb_uf AS uf on uf.id_uf = munic.id_uf
--LEFT JOIN public.tb_pais AS p on p.id_pais = sol.id_pais
--WHERE sol.id_pais <> 7
;
