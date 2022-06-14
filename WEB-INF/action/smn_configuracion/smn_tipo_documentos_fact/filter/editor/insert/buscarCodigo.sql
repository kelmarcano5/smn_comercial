select
		smn_comercial.smn_tipo_documentos_fact.tdf_codigo
from
		smn_comercial.smn_tipo_documentos_fact
where
		upper(smn_comercial.smn_tipo_documentos_fact.tdf_codigo) = upper(${fld:tdf_codigo})
