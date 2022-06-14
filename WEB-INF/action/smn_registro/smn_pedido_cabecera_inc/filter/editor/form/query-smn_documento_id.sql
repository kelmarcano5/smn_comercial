select smn_comercial.smn_documento.smn_documento_id as id, 
<<<<<<< HEAD
<<<<<<< HEAD
smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as item 
=======
smn_comercial.smn_documento.dcf_codigo ||'-'|| smn_comercial.smn_documento.dcf_descripcion as item 
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
=======
smn_comercial.smn_documento.dcf_codigo ||'-'|| smn_comercial.smn_documento.dcf_descripcion as item 
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
from smn_comercial.smn_documento
LEFT OUTER JOIN smn_comercial.smn_tipo_documentos_fact on smn_comercial.smn_documento.smn_tipo_documentos_fact_id = smn_comercial.smn_tipo_documentos_fact.smn_tipo_documentos_fact_id
where smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='PD' and smn_comercial.smn_documento.dcf_estatus='AC' --and smn_comercial.smn_documento.dcf_tipo_movimiento='DE'