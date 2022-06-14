select
		smn_comercial.smn_gestion.ges_codigo,
	smn_comercial.smn_gestion.ges_descripcion,
	smn_comercial.smn_gestion.smn_accion_id,
	smn_comercial.smn_gestion.ges_estatus,
	smn_comercial.smn_gestion.ges_vigencia,
	smn_comercial.smn_gestion.ges_fecha_registro
from
	smn_comercial.smn_gestion 
where
	smn_comercial.smn_gestion.smn_gestion_id = ${fld:id}
