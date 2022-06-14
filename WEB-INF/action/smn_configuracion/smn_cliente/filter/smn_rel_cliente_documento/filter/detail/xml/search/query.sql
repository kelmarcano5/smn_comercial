select
	smn_comercial.smn_documento.smn_documento_id,
	smn_comercial.smn_documento.dcf_codigo as dcf_codigo_pl0,
	smn_comercial.smn_cliente.smn_cliente_id,
	smn_comercial.smn_cliente.cli_nacional_ext as cli_nacional_ext_pl1,
select
select
	smn_comercial.smn_rel_cliente_documento.*
from
	smn_comercial.smn_documento,
	smn_comercial.smn_cliente,
	smn_comercial.smn_rel_cliente_documento
where
	smn_comercial.smn_documento.smn_documento_id=smn_comercial.smn_rel_cliente_documento.smn_documento_id and
	smn_comercial.smn_cliente.smn_cliente_id=smn_comercial.smn_rel_cliente_documento.smn_cliente_id
	and
	smn_rel_cliente_documento_id = ${fld:id}
