
-- ==================================== TRIGGERS =======================================
--FUNCTION QUE VERIFICA OS DADOS E É EXECUTADA POR MEIO DA TRIGGER
 
  CREATE FUNCTION fc_verifica_sexo() RETURNS trigger AS $fc_verifica_sexo$
    BEGIN
                IF (NEW.sexo <> 'Feminino' and NEW.sexo <> 'Masculino') THEN
                               NEW.sexo := 'Outros';
                END IF;
                RETURN NEW;         
    END;
  $fc_verifica_sexo$ LANGUAGE plpgsql;
 
--TRIGGER DISPARA A FUNCTION
 
CREATE TRIGGER tg_verifica_sexo
BEFORE INSERT ON public.tb_solicitante
FOR EACH ROW
EXECUTE PROCEDURE fc_verifica_sexo();
 
--TESTANDO O FUNCIONAMENTO DA TRIGGER
INSERT INTO public.tb_solicitante(id_solicitante, tipo_demandante, data_nascimento, sexo, id_escolaridade,
            id_profissao, id_municipio, id_pais)
    VALUES (999990, 'Pessoa Física', '09/12/2016', 'Trans', 1, 1, 1, 1);
 
--VERIFICANDO NA TABELA APÓS O INSERT
SELECT * FROM public.tb_solicitante
ORDER BY id_solicitante desc
LIMIT 10;