select
		smn_comercial.smn_tipo_documentos_fact.tdf_codigo,
	smn_comercial.smn_tipo_documentos_fact.tdf_nombre,
	smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza,
	smn_comercial.smn_tipo_documentos_fact.tdf_vigencia,
	smn_comercial.smn_tipo_documentos_fact.tdf_estatus,
	smn_comercial.smn_tipo_documentos_fact.tdf_fecha_registro
from
	smn_comercial.smn_tipo_documentos_fact 
where
	smn_comercial.smn_tipo_documentos_fact.smn_tipo_documentos_fact_id = ${fld:id}
