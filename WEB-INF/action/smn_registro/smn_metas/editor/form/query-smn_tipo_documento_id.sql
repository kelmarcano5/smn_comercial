select smn_comercial.smn_tipo_documentos_fact.smn_tipo_documentos_fact_id as id, smn_comercial.smn_tipo_documentos_fact.tdf_codigo|| ' - ' || smn_comercial.smn_tipo_documentos_fact.tdf_nombre as item 
from smn_comercial.smn_tipo_documentos_fact 
where smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='LS' OR smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza='LE'
order by tdf_nombre