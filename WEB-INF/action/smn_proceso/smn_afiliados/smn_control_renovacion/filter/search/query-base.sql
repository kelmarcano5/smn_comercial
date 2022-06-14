select
	case
	when smn_comercial.smn_control_renovacion.crn_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_control_renovacion.crn_estatus='IN' then '${lbl:b_inactive}'
	end as crn_estatus_combo,
	smn_comercial.smn_control_renovacion.smn_afiliado_id,
	smn_comercial.smn_control_renovacion.smn_pedido_id,
	smn_comercial.smn_control_renovacion.crn_fecha_renovacion,
	smn_comercial.smn_control_renovacion.crn_fecha_vigencia_hasta,
	smn_comercial.smn_control_renovacion.crn_estatus,
	smn_comercial.smn_control_renovacion.crn_fecha_registro,
		smn_comercial.smn_control_renovacion.smn_control_renovacion_id
	
from
	smn_comercial.smn_control_renovacion
where
	smn_control_renovacion_id is not null
	${filter}
order by
		smn_control_renovacion_id
