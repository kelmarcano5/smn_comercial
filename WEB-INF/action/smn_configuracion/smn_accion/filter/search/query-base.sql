select
	smn_base.smn_paso.pas_descripcion,
	case
	when smn_comercial.smn_accion.acc_require_seguimiento='S' then '${lbl:b_yes}'
	when smn_comercial.smn_accion.acc_require_seguimiento='N' then '${lbl:b_not}'
	end as acc_require_seguimiento_combo,
	case
	when smn_comercial.smn_accion.acc_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_accion.acc_estatus='IN' then '${lbl:b_inactive}'
	end as acc_estatus_combo,
	smn_comercial.smn_accion.acc_codigo,
	smn_comercial.smn_accion.acc_descripcion,
	smn_comercial.smn_accion.acc_require_seguimiento,
	smn_comercial.smn_accion.acc_dias_seguimiento,
	smn_comercial.smn_accion.acc_paso_rf,
	smn_comercial.smn_accion.acc_estatus,
	smn_comercial.smn_accion.acc_vigencia,
	smn_comercial.smn_accion.acc_fecha_registro,
		smn_comercial.smn_accion.smn_accion_id
	
from
	smn_base.smn_paso,
	smn_comercial.smn_accion
where
	smn_base.smn_paso.smn_paso_id = smn_comercial.smn_accion.acc_paso_rf and
	smn_accion_id is not null
	${filter}
order by
		smn_accion_id
