select smn_comercial.smn_documento.smn_documento_id as id, smn_comercial.smn_documento.dcf_codigo|| ' - ' || smn_comercial.smn_documento.dcf_descripcion as item 
from smn_comercial.smn_documento 
left join smn_comercial.smn_rel_cliente_documento on smn_comercial.smn_rel_cliente_documento.smn_documento_id = smn_comercial.smn_documento.smn_documento_id
order by dcf_descripcion