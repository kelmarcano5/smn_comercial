select
		smn_comercial.smn_llamadas.smn_llamadas_id,
	case
	when smn_comercial.smn_llamadas.lla_estatus='RE' then '${lbl:b_registry}'
	when smn_comercial.smn_llamadas.lla_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_llamadas.lla_estatus='VE' then '${lbl:b_expired}'
	end as lla_estatus_combo,
	smn_base.smn_auxiliar.aux_codigo||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id_combo,
	smn_comercial.smn_prospecto.pro_codigo ||' - '|| smn_comercial.smn_prospecto.pro_descripcion as smn_prospecto_id_combo,
	smn_comercial.smn_tipo_documentos_fact.tdf_naturaleza ||' - '|| smn_comercial.smn_tipo_documentos_fact.tdf_nombre as smn_tipo_documento_id_combo,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id_combo,
	smn_comercial.smn_llamadas.lla_descripcion,
	smn_comercial.smn_gestion.ges_codigo ||' - '|| smn_comercial.smn_gestion.ges_descripcion as smn_gestion_id_combo,
	smn_comercial.smn_llamadas.lla_estatus,
	smn_comercial.smn_llamadas.lla_fecha_registro
from
	smn_comercial.smn_llamadas
	inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_llamadas.smn_documento_id
	inner join smn_comercial.smn_tipo_documentos_fact on smn_comercial.smn_tipo_documentos_fact.smn_tipo_documentos_fact_id = smn_comercial.smn_llamadas.smn_tipo_documento_id
	left outer join smn_comercial.smn_gestion on smn_comercial.smn_gestion.smn_gestion_id = smn_comercial.smn_llamadas.smn_gestion_id
	left outer join smn_comercial.smn_prospecto on smn_comercial.smn_prospecto.smn_prospecto_id = smn_comercial.smn_llamadas.smn_prospecto_id
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_llamadas.smn_cliente_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf

where
	smn_llamadas_id is not null
	${filter}
order by
		smn_llamadas_id
