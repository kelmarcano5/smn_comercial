select
		smn_comercial.smn_tipo_documentos_fact.tdf_nombre
from
		smn_comercial.smn_tipo_documentos_fact
where
		upper(smn_comercial.smn_tipo_documentos_fact.tdf_nombre) = upper(${fld:tdf_nombre})
