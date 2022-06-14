select
		smn_comercial.smn_metas.smn_tipo_documento_id,
	smn_comercial.smn_metas.smn_documento_id,
	smn_comercial.smn_metas.smn_clase_auxiliar_rf,
	smn_comercial.smn_metas.smn_auxiliar_rf,
	smn_comercial.smn_metas.smn_rol_id,
	smn_comercial.smn_metas.met_fecha_desde,
	smn_comercial.smn_metas.met_fecha_hasta,
	smn_comercial.smn_metas.met_dias_habiles,
	smn_comercial.smn_metas.met_fecha_estadistica,
	smn_comercial.smn_metas.met_cantidad_diaria,
	smn_comercial.smn_metas.met_estatus,
	smn_comercial.smn_metas.met_fecha_registro
from
	smn_comercial.smn_metas 
where
	smn_comercial.smn_metas.smn_metas_id = ${fld:id}
