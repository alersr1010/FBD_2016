--FUNCTION

CREATE OR REPLACE FUNCTION qtde_pedido(parametro text)
RETURNS TABLE(tipo char(3), qtde bigint) AS 
$$
BEGIN
	IF parametro  = 'prorrogado' THEN
		RETURN QUERY 
		SELECT  foi_prorrogado, count(id_pedido)
		FROM public.tb_pedido
		GROUP BY foi_prorrogado;
	ELSE 
		RETURN QUERY
		SELECT  foi_reencaminhado, count(id_pedido)
		FROM public.tb_pedido
		GROUP BY foi_reencaminhado;
	END IF;
END;
$$ LANGUAGE 'plpgsql';


select qtde_pedido('prorrogado');
select qtde_pedido('reencaminhado');
