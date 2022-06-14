select smn_comercial.smn_documento.smn_documento_id as id, 
smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as item 
from smn_comercial.smn_documento
where 
	smn_comercial.smn_documento.smn_tipo_documentos_fact_id=${fld:id}