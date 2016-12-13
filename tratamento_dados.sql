--======================== NORMALIZAÇÃO tmp_solicitantes_pedidos ========================
select * from public.tmp_recursos;
select * from public.tmp_solicitantes_pedidos
limit 10;


select 
	distinct tipodemandante 
from public.tmp_solicitantes_pedidos;

select 
	distinct profissao 
from public.tmp_solicitantes_pedidos;


--tb_escolaridade
--carga
insert into public.tb_escolaridade (nome_escolaridade)
select 
	distinct escolaridade 
from public.tmp_solicitantes_pedidos
where escolaridade is not null
order by escolaridade;

select * from public.tb_escolaridade;
1;"Ensino Fundamental"
2;"Ensino Médio"
3;"Ensino Superior"
4;"Mestrado/Doutorado"
5;"Não se aplica"
6;"Pós-graduação"
7;"Sem instrução formal"


--update
ALTER TABLE public.tmp_solicitantes_pedidos ADD COLUMN id_escolaridade integer;

update public.tmp_solicitantes_pedidos as p 
set id_escolaridade  = r.id_escolaridade 
from
(
  select 
	sp.idsolicitante, sp.escolaridade, esc.id_escolaridade 
  from public.tmp_solicitantes_pedidos as sp
  left join public.tb_escolaridade as esc on esc.nome_escolaridade = sp.escolaridade
)  
as r
where p.idsolicitante = r.idsolicitante;


--=========================== tb_profissao ====================================
--update na id na tmp
ALTER TABLE public.tmp_solicitantes_pedidos ADD COLUMN id_profissao integer;
--cria sequencia
CREATE SEQUENCE public.tb_producao_id_producao_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_producao_id_producao_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_profissao
(
  id_profissao integer NOT NULL DEFAULT nextval('tb_producao_id_producao_seq'::regclass),
  nome_profissao character varying(200) 
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_profissao
  OWNER TO postgres;
--carga
insert into public.tb_profissao (nome_profissao)
select 
	distinct profissao 
from public.tmp_solicitantes_pedidos
where profissao is not null
order by profissao;

select * from public.tb_profissao;
1;"Empregado - setor privado"
2;"Empresário/empreendedor"
3;"Estudante"
4;"Jornalista"
5;"Membro de ONG internacional"
6;"Membro de ONG nacional"
7;"Membro de partido político"
8;"Não se aplica"
9;"Outra"
10;"Pesquisador"
11;"Professor"
12;"Profis. Liberal/autônomo"
13;"Representante de sindicato"
14;"Servidor público estadual"
15;"Servidor público federal"
16;"Servidor público municipal"

--atualizando
update public.tmp_solicitantes_pedidos as p 
set id_profissao  = r.id_profissao 
from
(
  select 
	sp.idsolicitante, sp.profissao, prof.id_profissao 
  from public.tmp_solicitantes_pedidos as sp
  left join public.tb_profissao as prof on prof.nome_profissao = sp.profissao
)  
as r
where p.idsolicitante = r.idsolicitante;

select * from public.tmp_solicitantes_pedidos;

--=========================== tb_municipio ====================================
--update na id na tmp
ALTER TABLE public.tmp_solicitantes_pedidos ADD COLUMN id_municipio integer;
--cria sequencia
CREATE SEQUENCE public.tb_municipio_id_municipio_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_municipio_id_municipio_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_municipio
(
  id_municipio integer NOT NULL DEFAULT nextval('tb_municipio_id_municipio_seq'::regclass),
  nome_municipio character varying(200),
  id_uf integer 
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_municipio
  OWNER TO postgres;
--carga
insert into public.tb_municipio (nome_municipio)
select 
	distinct municipio
from public.tmp_solicitantes_pedidos
where municipio is not null
order by municipio;

--atualizando tmp
update public.tmp_solicitantes_pedidos as p 
set id_municipio  = r.id_municipio 
from
(
  select 
	sp.idsolicitante, sp.municipio, munic.id_municipio 
  from public.tmp_solicitantes_pedidos as sp
  left join public.tb_municipio as munic on munic.nome_municipio = sp.municipio
)  
as r
where p.idsolicitante = r.idsolicitante;

--atualizando id_uf
update public.tb_municipio as m 
set id_uf  = r.id_uf
from
(
  select 
	 DISTINCT  sp.id_municipio,  sp.id_uf
  from public.tmp_solicitantes_pedidos as sp
  where id_municipio is not null
  --left join public.tb_municipio as munic on munic.nome_municipio = sp.municipio
)  
as r
where m.id_municipio = r.id_municipio;

select * from public.tb_municipio;


--=========================== tb_uf ====================================
--update na id na tmp
ALTER TABLE public.tmp_solicitantes_pedidos ADD COLUMN id_uf integer;
--cria sequencia
CREATE SEQUENCE public.tb_uf_id_uf_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_uf_id_uf_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_uf
(
  id_uf integer NOT NULL DEFAULT nextval('tb_uf_id_uf_seq'::regclass),
  nome_uf character varying(200),
  id_pais integer 
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_uf
  OWNER TO postgres;
--carga
insert into public.tb_uf (nome_uf)
select 
	distinct uf 
from public.tmp_solicitantes_pedidos
where uf is not null
order by uf;

select * from public.tb_uf;


--atualizando
update public.tmp_solicitantes_pedidos as p 
set id_uf  = r.id_uf 
from
(
  select 
	sp.idsolicitante, sp.uf, munic.id_uf 
  from public.tmp_solicitantes_pedidos as sp
  left join public.tb_uf as munic on munic.nome_uf = sp.uf
)  
as r
where p.idsolicitante = r.idsolicitante;

--atualizando id_pais
update public.tb_municipio as m 
set id_pais  = r.id_pais
from
(
  select 
	 DISTINCT  sp.id_uf,  sp.id_pais
  from public.tmp_solicitantes_pedidos as sp
  where id_uf is not null and id_uf <> 7
  --left join public.tb_municipio as munic on munic.nome_municipio = sp.municipio
)  
as r
where m.id_municipio = r.id_municipio;



select * from public.tmp_solicitantes_pedidos
where id_uf = 7;


--=========================== tb_pais ====================================
--update na id na tmp
ALTER TABLE public.tmp_solicitantes_pedidos ADD COLUMN id_pais integer;
--cria sequencia
CREATE SEQUENCE public.tb_pais_id_pais_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_pais_id_pais_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_pais
(
  id_pais integer NOT NULL DEFAULT nextval('tb_pais_id_pais_seq'::regclass),
  nome_pais character varying(200) 
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_pais
  OWNER TO postgres;
--carga
insert into public.tb_pais (nome_pais)
select 
	distinct pais 
from public.tmp_solicitantes_pedidos
where pais is not null
order by pais;

select * from public.tb_pais;


--atualizando
update public.tmp_solicitantes_pedidos as p 
set id_pais  = r.id_pais 
from
(
  select 
	sp.idsolicitante, sp.pais, munic.id_pais 
  from public.tmp_solicitantes_pedidos as sp
  left join public.tb_pais as munic on munic.nome_pais = sp.pais
)  
as r
where p.idsolicitante = r.idsolicitante;

select * from public.tmp_solicitantes_pedidos;


--=========================== tb_solicitante ====================================
SELECT idsolicitante, tipodemandante, datanascimento, sexo, id_escolaridade, 
       id_profissao, id_municipio, id_pais 
INTO public.tb_solicitante
FROM  public.tmp_solicitantes_pedidos
--where id_pais <> 7
limit 10;

SELECT datanascimento
--INTO public.tb_solicitante
FROM  public.tmp_solicitantes_pedidos

COMMENT ON TABLE public.tb_solicitante
  IS 'Tabela Solicitante - Solicitantes da informação pública';
COMMENT ON COLUMN public.tb_solicitante.idsolicitante IS 'Chave primária da Tabela solicitante';
COMMENT ON COLUMN public.tb_solicitante.tipodemandante IS 'Pessoa Fìsica ou Pessoa Jurídica';
COMMENT ON COLUMN public.tb_solicitante.datanascimento IS 'data de nascimento do solicitante';
COMMENT ON COLUMN public.tb_solicitante.sexo IS 'Masculino ou Feminino ';
COMMENT ON COLUMN public.tb_solicitante.id_escolaridade IS 'Chave estrangeira referente a tabela escolaridade';
COMMENT ON COLUMN public.tb_solicitante.id_profissao IS 'Chave estrangeira referente a tabela Profissional';
COMMENT ON COLUMN public.tb_solicitante.id_municipio IS 'Chave estrangeira referente a tabela Municipio';
COMMENT ON COLUMN public.tb_solicitante.id_pais IS 'Chave estrangeira referente a tabela país';


--======================== NORMALIZAÇÃO tmp_pedidos ========================
--tab_pedidos
select * from tmp_pedidos
limit 10;

--=========================== tb_orgao ====================================
--update na id na tmp
ALTER TABLE public.tmp_pedidos ADD COLUMN id_orgao_destino integer;
ALTER TABLE public.tmp_pedidos ADD COLUMN id_orgao_destino_sup integer;
--cria sequencia
CREATE SEQUENCE public.tb_orgao_id_orgao_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_orgao_id_orgao_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_orgao
(
  id_orgao integer NOT NULL DEFAULT nextval('tb_orgao_id_orgao_seq'::regclass),
  nome_orgao character varying(200),
  id_orgao_superior integer
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_orgao
  OWNER TO postgres;
--carga
insert into public.tb_orgao (nome_orgao)
select 
	distinct orgaodestinatario
from public.tmp_pedidos
where orgaodestinatario is not null
order by orgaodestinatario;

select * from public.tb_orgao;

--atualizando orgao_destino id_orgao_destino
update public.tmp_pedidos as p 
set id_orgao_destino  = r.id_orgao 
from
(
  select 
	ped.idpedido, ped.orgaodestinatario, org.id_orgao 
  from public.tmp_pedidos as ped
  left join public.tb_orgao as org on org.nome_orgao = ped.orgaodestinatario
)  
as r
where p.idpedido = r.idpedido;


--atualizando orgao_destino id_orgao_destino_sup
update public.tmp_pedidos as p 
set id_orgao_destino_sup  = r.id_orgao 
from
(
  select 
	ped.idpedido, ped.orgaosuperiorassociadoaodestinatario, org.id_orgao 
  from public.tmp_pedidos as ped
  left join public.tb_orgao as org on org.nome_orgao = ped.orgaosuperiorassociadoaodestinatario
)  
as r
where p.idpedido = r.idpedido;


--atualizando id_orgao_destino_sup na tab orgao
update public.tb_orgao as p 
set id_orgao_superior  = r.id_orgao_destino_sup 
from
(
  select 
	DISTINCT ped.id_orgao_destino, ped.id_orgao_destino_sup 
  from public.tmp_pedidos as ped
  --left join public.tb_orgao as org on org.nome_orgao = ped.orgaosuperiorassociadoaodestinatario
)  
as r
where p.id_orgao = r.id_orgao_destino;


select * from public.tb_orgao;

select idpedido, protocolopedido, orgaosuperiorassociadoaodestinatario, 
       orgaodestinatario, situacao, dataregistro, prazoatendimento, 
       foiprorrogado, foireencaminhado, formaresposta, origemsolicitacao, 
       idsolicitante, categoriapedido, subcategoriapedido, numeroperguntas, 
       dataresposta, tiporesposta, classificacaotiporesposta, id_orgao_destino, id_orgao_destino_sup 
from public.tmp_pedidos
limit 10;

--=========================== tb_forma_resposta ====================================
--update na id na tmp
ALTER TABLE public.tmp_pedidos ADD COLUMN id_forma_resposta integer;
--cria sequencia
CREATE SEQUENCE public.tb_forma_resposta_id_forma_resposta_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_forma_resposta_id_forma_resposta_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_forma_resposta
(
  id_forma_resposta integer NOT NULL DEFAULT nextval('tb_forma_resposta_id_forma_resposta_seq'::regclass),
  nome_forma_resposta character varying(200)
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_forma_resposta
  OWNER TO postgres;
--carga
insert into public.tb_forma_resposta (nome_forma_resposta)
select 
	distinct formaresposta
from public.tmp_pedidos
where formaresposta is not null
order by formaresposta;

select * from public.tb_forma_resposta;

--atualizando forma_resposta_destino id_forma_resposta_destino
update public.tmp_pedidos as p 
set id_forma_resposta  = r.id_forma_resposta 
from
(
  select 
	ped.idpedido, ped.formaresposta, fr.id_forma_resposta 
  from public.tmp_pedidos as ped
  left join public.tb_forma_resposta as fr on fr.nome_forma_resposta = ped.formaresposta
)  
as r
where p.idpedido = r.idpedido;


--=========================== tb_categoria ====================================
--update na id na tmp
ALTER TABLE public.tmp_pedidos ADD COLUMN id_categoria integer;
--cria sequencia
CREATE SEQUENCE public.tb_categoria_id_categoria_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_categoria_id_categoria_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_categoria
(
  id_categoria integer NOT NULL DEFAULT nextval('tb_categoria_id_categoria_seq'::regclass),
  nome_categoria character varying(200)
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_categoria
  OWNER TO postgres;
--carga
insert into public.tb_categoria (nome_categoria)
select 
	distinct categoriapedido
from public.tmp_pedidos
where categoriapedido is not null
order by categoriapedido;

select * from public.tb_categoria;

--atualizando categoria
update public.tmp_pedidos as p 
set id_categoria  = r.id_categoria 
from
(
  select 
	ped.idpedido, ped.categoriapedido, c.id_categoria 
  from public.tmp_pedidos as ped
  left join public.tb_categoria as c on c.nome_categoria = ped.categoriapedido
)  
as r
where p.idpedido = r.idpedido;



--=========================== tb_subcategoria ====================================
--update na id na tmp
ALTER TABLE public.tmp_pedidos ADD COLUMN id_subcategoria integer;
--cria sequencia
CREATE SEQUENCE public.tb_subcategoria_id_subcategoria_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_subcategoria_id_subcategoria_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_subcategoria
(
  id_subcategoria integer NOT NULL DEFAULT nextval('tb_subcategoria_id_subcategoria_seq'::regclass),
  nome_subcategoria character varying(200),
  id_categoria integer
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_subcategoria
  OWNER TO postgres;
--carga
insert into public.tb_subcategoria (nome_subcategoria, id_categoria)
select 
	distinct subcategoriapedido, id_categoria
from public.tmp_pedidos
where subcategoriapedido is not null
order by subcategoriapedido;

select * from public.tb_subcategoria;

--atualizando subcategoria
--NÃO NECESSITA NA TB_PEDIDO


select 
	idpedido, categoriapedido, subcategoriapedido
from public.tmp_pedidos
order by subcategoriapedido
limit 10;



--=========================== tb_tipo_resposta ====================================
--update na id na tmp
ALTER TABLE public.tmp_pedidos ADD COLUMN id_tipo_resposta integer;
--cria sequencia
CREATE SEQUENCE public.tb_tipo_resposta_id_tipo_resposta_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_tipo_resposta_id_tipo_resposta_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_tipo_resposta
(
  id_tipo_resposta integer NOT NULL DEFAULT nextval('tb_tipo_resposta_id_tipo_resposta_seq'::regclass),
  nome_tipo_resposta character varying(200)
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_tipo_resposta
  OWNER TO postgres;
--carga
insert into public.tb_tipo_resposta (nome_tipo_resposta)
select 
	distinct tiporesposta
from public.tmp_pedidos
where tiporesposta is not null
order by tiporesposta;

select * from public.tb_tipo_resposta;

--atualizando tipo_resposta
update public.tmp_pedidos as p 
set id_tipo_resposta  = r.id_tipo_resposta 
from
(
  select 
	ped.idpedido, ped.tiporesposta, tr.id_tipo_resposta
  from public.tmp_pedidos as ped
  left join public.tb_tipo_resposta as tr on tr.nome_tipo_resposta = ped.tiporesposta
)  
as r
where p.idpedido = r.idpedido;


--=========================== tb_classificacao_tipo_resposta ====================================
--update na id na tmp
ALTER TABLE public.tmp_pedidos ADD COLUMN id_classificacao_tipo_resposta integer;
--cria sequencia
CREATE SEQUENCE public.tb_classificacao_tipo_resposta_id_classificacao_tipo_resposta_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_classificacao_tipo_resposta_id_classificacao_tipo_resposta_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_classificacao_tipo_resposta
(
  id_classificacao_tipo_resposta integer NOT NULL DEFAULT nextval('tb_classificacao_tipo_resposta_id_classificacao_tipo_resposta_seq'::regclass),
  nome_classificacao_tipo_resposta character varying(200)
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_classificacao_tipo_resposta
  OWNER TO postgres;
--carga
insert into public.tb_classificacao_tipo_resposta (nome_classificacao_tipo_resposta)
select 
	distinct classificacaotiporesposta
from public.tmp_pedidos
where classificacaotiporesposta is not null
order by classificacaotiporesposta;

select * from public.tb_classificacao_tipo_resposta;

--atualizando classificacao_tipo_resposta
update public.tmp_pedidos as p 
set id_classificacao_tipo_resposta  = r.id_classificacao_tipo_resposta 
from
(
  select 
	ped.idpedido, ped.classificacaotiporesposta, ctr.id_classificacao_tipo_resposta
  from public.tmp_pedidos as ped
  left join public.tb_classificacao_tipo_resposta as ctr on ctr.nome_classificacao_tipo_resposta = ped.classificacaotiporesposta
)  
as r
where p.idpedido = r.idpedido;


--Confirmacao relacao N X N tiporesposta e classificacaotiporesposta
select 
	DISTINCT tiporesposta, classificacaotiporesposta
from public.tmp_pedidos
order by classificacaotiporesposta
limit 10;


--=========================== CRIACAO tb_pedido ====================================
SELECT
	idpedido as id_pedido, protocolopedido as protocolo_pedido, situacao as situacao_pedido, 
	to_date(dataregistro, 'DD/MM/YYYY') as data_registro, to_date(prazoatendimento, 'DD/MM/YYYY') as prazo_atendimento, 
        foiprorrogado as foi_prorrogado, foireencaminhado as foi_reencaminhado, 
        origemsolicitacao as origem_solicitacao, numeroperguntas::integer as numero_perguntas, to_date(dataresposta, 'DD/MM/YYYY') as data_resposta, 
        idsolicitante as id_solicitante, id_orgao_destino, id_forma_resposta, id_categoria, 
	id_tipo_resposta, id_classificacao_tipo_resposta
INTO tb_pedido
FROM public.tmp_pedidos
--LIMIT 10;



--BKP
SELECT 
	idpedido as id_pedido, protocolopedido as protocolo_pedido, situacao as situacao_pedido, 
	dataregistro as data_registro, prazoatendimento as prazo_atendimento, 
        foiprorrogado as foi_prorrogado, foireencaminhado as foi_reencaminhado, 
        origemsolicitacao as origem_solicitacao, numeroperguntas::integer as numero_perguntas, dataresposta as data_resposta, 
        idsolicitante as id_solicitante, id_orgao_destino, id_forma_resposta, id_categoria, 
	id_tipo_resposta, id_classificacao_tipo_resposta
	--INTO tb_pedido
FROM public.tmp_pedidos
LIMIT 10;


--where id_pais <> 7
limit 10;


--======================== NORMALIZAÇÃO tmp_recursos ========================
select * from public.tmp_recursos
limit 10;

--=========================== tb_instancia ====================================
--update na id na tmp
ALTER TABLE public.tmp_recursos ADD COLUMN id_instancia integer;
--cria sequencia
CREATE SEQUENCE public.tb_instancia_id_instancia_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_instancia_id_instancia_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_instancia
(
  id_instancia integer NOT NULL DEFAULT nextval('tb_instancia_id_instancia_seq'::regclass),
  nome_instancia character varying(200)
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_instancia
  OWNER TO postgres;
--carga
insert into public.tb_instancia (nome_instancia)
select 
	distinct instancia
from public.tmp_recursos
where instancia is not null
order by instancia;

select * from public.tb_instancia;

--atualizando instancia
update public.tmp_recursos as p 
set id_instancia  = r.id_instancia 
from
(
  select 
	rec.idrecurso, rec.instancia, inst.id_instancia
  from public.tmp_recursos as rec
  left join public.tb_instancia as inst on inst.nome_instancia = rec.instancia
)  
as r
where p.idrecurso = r.idrecurso;


--=========================== tb_situacao ====================================
--update na id na tmp
ALTER TABLE public.tmp_recursos ADD COLUMN id_situacao_recurso integer;
--cria sequencia
CREATE SEQUENCE public.tb_situacao_id_situacao_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_situacao_id_situacao_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_situacao
(
  id_situacao integer NOT NULL DEFAULT nextval('tb_situacao_id_situacao_seq'::regclass),
  nome_situacao character varying(200)
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_situacao
  OWNER TO postgres;
--carga
insert into public.tb_situacao (nome_situacao)
select 
	distinct situacao
from public.tmp_recursos
where situacao is not null
order by situacao;

select * from public.tb_situacao;

--atualizando situacao
update public.tmp_recursos as p 
set id_situacao_recurso  = r.id_situacao 
from
(
  select 
	rec.idrecurso, rec.situacao, sit.id_situacao
  from public.tmp_recursos as rec
  left join public.tb_situacao as sit on sit.nome_situacao = rec.situacao
)  
as r
where p.idrecurso = r.idrecurso;


--=========================== tb_tipo_recurso ====================================
--update na id na tmp
ALTER TABLE public.tmp_recursos ADD COLUMN id_tipo_recurso integer;
--cria sequencia
CREATE SEQUENCE public.tb_tipo_recurso_id_tipo_recurso_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_tipo_recurso_id_tipo_recurso_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_tipo_recurso
(
  id_tipo_recurso integer NOT NULL DEFAULT nextval('tb_tipo_recurso_id_tipo_recurso_seq'::regclass),
  nome_tipo_recurso character varying(200)
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_tipo_recurso
  OWNER TO postgres;
--carga
insert into public.tb_tipo_recurso (nome_tipo_recurso)
select 
	distinct tiporecurso
from public.tmp_recursos
where tiporecurso is not null
order by tiporecurso;

select * from public.tb_tipo_recurso;

--atualizando tipo_recurso
update public.tmp_recursos as p 
set id_tipo_recurso  = r.id_tipo_recurso 
from
(
  select 
	rec.idrecurso, rec.tiporecurso, sit.id_tipo_recurso
  from public.tmp_recursos as rec
  left join public.tb_tipo_recurso as sit on sit.nome_tipo_recurso = rec.tiporecurso
)  
as r
where p.idrecurso = r.idrecurso;


--ATUALIZANDO TIPORESPOSTA NA TB_RECRUSO
--update na id na tmp
ALTER TABLE public.tmp_recursos ADD COLUMN id_tipo_resposta integer;
--carga
insert into public.tb_tipo_resposta (nome_tipo_resposta)
select 
	distinct tiporesposta
from public.tmp_recursos
where tiporesposta is not null 
and tiporesposta not in (select nome_tipo_resposta from tb_tipo_resposta)
order by tiporesposta;

--atualizando tipo_resposta
update public.tmp_recursos as p 
set id_tipo_resposta  = r.id_tipo_resposta 
from
(
  select 
	rec.idrecurso, rec.tiporesposta, tr.id_tipo_resposta
  from public.tmp_recursos as rec
  left join public.tb_tipo_resposta as tr on tr.nome_tipo_resposta = rec.tiporesposta
)  
as r
where p.idrecurso = r.idrecurso;


--=========================== tb_tipo_recurso ====================================
--update na id na tmp
ALTER TABLE public.tmp_recursos ADD COLUMN id_tipo_recurso integer;
--cria sequencia
CREATE SEQUENCE public.tb_tipo_recurso_id_tipo_recurso_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.tb_tipo_recurso_id_tipo_recurso_seq
  OWNER TO postgres;
--cria tabela
CREATE TABLE public.tb_tipo_recurso
(
  id_tipo_recurso integer NOT NULL DEFAULT nextval('tb_tipo_recurso_id_tipo_recurso_seq'::regclass),
  nome_tipo_recurso character varying(200)
)
WITH (
  OIDS=FALSE
)
TABLESPACE dados;
ALTER TABLE public.tb_tipo_recurso
  OWNER TO postgres;
--carga
insert into public.tb_tipo_recurso (nome_tipo_recurso)
select 
	distinct tiporecurso
from public.tmp_recursos
where tiporecurso is not null
order by tiporecurso;

select * from public.tb_tipo_recurso;

--atualizando tipo_recurso
update public.tmp_recursos as p 
set id_tipo_recurso  = r.id_tipo_recurso 
from
(
  select 
	rec.idrecurso, rec.tiporecurso, sit.id_tipo_recurso
  from public.tmp_recursos as rec
  left join public.tb_tipo_recurso as sit on sit.nome_tipo_recurso = rec.tiporecurso
)  
as r
where p.idrecurso = r.idrecurso;


--ATUALIZANDO TIPORESPOSTA NA TB_RECRUSO
--update na id na tmp
ALTER TABLE public.tmp_recursos ADD COLUMN id_tipo_resposta integer;
--carga
insert into public.tb_tipo_resposta (nome_tipo_resposta)
select 
	distinct tiporesposta
from public.tmp_recursos
where tiporesposta is not null 
and tiporesposta not in (select nome_tipo_resposta from tb_tipo_resposta)
order by tiporesposta;

--atualizando tipo_resposta
update public.tmp_recursos as p 
set id_tipo_resposta  = r.id_tipo_resposta 
from
(
  select 
	rec.idrecurso, rec.tiporesposta, tr.id_tipo_resposta
  from public.tmp_recursos as rec
  left join public.tb_tipo_resposta as tr on tr.nome_tipo_resposta = rec.tiporesposta
)  
as r
where p.idrecurso = r.idrecurso;

--=========================== CRIACAO tb_recurso ====================================
SELECT 
	idrecurso::integer AS id_recurso, to_date(dataregistro, 'DD/MM/YYYY') AS data_registro, to_date(prazoatendimento, 'DD/MM/YYYY')  AS prazo_atendimento, 
	origemsolicitacao AS origem_solicitacao, to_date(dataresposta, 'DD/MM/YYYY')  AS data_resposta, idrecursoprecedente::integer AS id_recurso_precedente, 
	idpedido AS id_pedido, idsolicitante AS id_solicitante, id_instancia, id_situacao_recurso, id_tipo_recurso, id_tipo_resposta
--INTO tb_recurso
FROM public.tmp_recursos;


drop table tb_recurso;

--ATUALIZANDO SITUACAO NA TB_PEDIDO
SELECT * FROM tb_pedido
limit 10;
--atualizando situacao
ALTER TABLE public.tb_pedido ADD COLUMN id_situacao_pedido integer;
update public.tb_pedido as p 
set id_situacao_pedido  = r.id_situacao 
from
(
  select 
	ped.id_pedido, ped.situacao_pedido, sit.id_situacao
  from public.tb_pedido as ped
  left join public.tb_situacao as sit on sit.nome_situacao = ped.situacao_pedido
)  
as r
where p.id_pedido = r.id_pedido;



--======================================== VIEWS =======================================
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

--FUNCTION
CREATE FUNCTION extended_sales(p_itemno int)
RETURNS TABLE(quantity int, total numeric) AS $
BEGIN
    RETURN QUERY SELECT s.quantity, s.quantity * s.price FROM sales AS s
                 WHERE s.itemno = p_itemno;
END;


DROP FUNCTION qtde_pedido(parametro text);


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


--RELATORIO
--QTDE DE PEDIDOS POR ORGAO
SELECT id_orgao_destino, nome_orgao_destino, count(id_pedido) AS qtde_pedido
FROM VW_DADOS_PEDIDOS
GROUP BY id_orgao_destino, nome_orgao_destino
ORDER BY count(id_pedido) DESC;

--QTDE DE PEDIDOS POR TIPO DE RESPOSTA
SELECT id_tipo_resposta, nome_tipo_resposta, count(id_pedido) AS qtde_pedido
FROM VW_DADOS_PEDIDOS
GROUP BY id_tipo_resposta, nome_tipo_resposta
ORDER BY nome_tipo_resposta;


SELECT * FROM VW_DADOS_PEDIDOS
LIMIT 10;



--========================================= AJUSTES / CONSTRAINT ======================================

/* Add Primary Key */
ALTER TABLE tb_categoria ADD CONSTRAINT pktb_categoria
	PRIMARY KEY (id_categoria);

/* Add Primary Key */
ALTER TABLE tb_pedido ADD CONSTRAINT pktb_pedido
	PRIMARY KEY (id_pedido);


/* Add Primary Key */
ALTER TABLE tb_situacao ADD CONSTRAINT pktb_situacao
	PRIMARY KEY (id_situacao);


/* Add Primary Key */
ALTER TABLE tb_subcategoria ADD CONSTRAINT pktb_subcategoria
	PRIMARY KEY (id_subcategoria);

/* Add Primary Key */
ALTER TABLE tb_tipo_resposta ADD CONSTRAINT pktb_tipo_resposta
	PRIMARY KEY (id_tipo_resposta);





/************ Add Foreign Keys ***************/

/* Add Foreign Key: fk_pedido_categoria */
ALTER TABLE tb_pedido ADD CONSTRAINT fk_pedido_categoria
	FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id_categoria)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

--NÃO É UNICO NA TB_ORGAO
/* Add Foreign Key: fk_pedido_orgao */
ALTER TABLE tb_pedido ADD CONSTRAINT fk_pedido_orgao
	FOREIGN KEY (id_orgao_destino) REFERENCES tb_orgao (id_orgao)
	ON UPDATE NO ACTION ON DELETE NO ACTION;


/* Add Foreign Key: fk_pedido_situacao */
ALTER TABLE tb_pedido ADD CONSTRAINT fk_pedido_situacao
	FOREIGN KEY (id_situacao_pedido) REFERENCES tb_situacao (id_situacao)
	ON UPDATE NO ACTION ON DELETE NO ACTION;


/* Add Foreign Key: fk_subcategoria_categoria */
ALTER TABLE tb_subcategoria ADD CONSTRAINT fk_subcategoria_categoria
	FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id_categoria)
	ON UPDATE NO ACTION ON DELETE NO ACTION;	

--AQUI

/************ Add Foreign Keys ***************/

/* Add Foreign Key: fk_classificacao_tipo_resposta */
ALTER TABLE tb_pedido ADD CONSTRAINT fk_classificacao_tipo_resposta
	FOREIGN KEY (id_classificacao_tipo_resposta) REFERENCES tb_classificacao_tipo_resposta (id_classificacao_tipo_resposta)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_forma_resposta */
ALTER TABLE tb_pedido ADD CONSTRAINT fk_forma_resposta
	FOREIGN KEY (id_forma_resposta) REFERENCES tb_forma_resposta (id_forma_resposta)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_pedido_solicitante */
ALTER TABLE tb_pedido ADD CONSTRAINT fk_pedido_solicitante
	FOREIGN KEY (id_solicitante) REFERENCES tb_solicitante (id_solicitante)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_pedido_tipo_resposta */
ALTER TABLE tb_pedido ADD CONSTRAINT fk_pedido_tipo_resposta
	FOREIGN KEY (id_tipo_resposta) REFERENCES tb_tipo_resposta (id_tipo_resposta)
	ON UPDATE NO ACTION ON DELETE NO ACTION;	

/* Add Primary Key */
ALTER TABLE tb_solicitante ADD CONSTRAINT pktb_solicitante
	PRIMARY KEY (id_solicitante);


ALTER TABLE tb_solicitante ALTER COLUMN id_solicitante DROP NOT NULL;





/************ Update: Tables ***************/


