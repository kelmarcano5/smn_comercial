select
		smn_comercial.smn_gestion.smn_gestion_id,
	smn_comercial.smn_accion.smn_accion_id,
	smn_comercial.smn_accion.acc_codigo as acc_codigo_pl0,
select
		smn_comercial.smn_gestion.smn_gestion_id,
	case
	when smn_comercial.smn_gestion.ges_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_gestion.ges_estatus='IN' then '${lbl:b_inactive}'
	end as ges_estatus_combo,
	smn_comercial.smn_gestion.ges_codigo,
	smn_comercial.smn_gestion.ges_descripcion,
	smn_comercial.smn_gestion.smn_accion_id,
	smn_comercial.smn_gestion.ges_estatus,
	smn_comercial.smn_gestion.ges_vigencia,
	smn_comercial.smn_gestion.ges_fecha_registro
	
from
	smn_comercial.smn_accion,
	smn_comercial.smn_gestion
where
	smn_comercial.smn_accion.smn_accion_id=smn_comercial.smn_gestion.smn_accion_id
