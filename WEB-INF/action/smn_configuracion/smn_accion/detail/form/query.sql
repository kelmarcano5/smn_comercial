select
	case
		when smn_comercial.smn_accion.acc_require_seguimiento='S' then '${lbl:b_yes}'
		when smn_comercial.smn_accion.acc_require_seguimiento='N' then '${lbl:b_not}'
	end as acc_require_seguimiento_combo,
	(select smn_base.smn_paso.pas_codigo||' - '|| smn_base.smn_paso.pas_descripcion from  smn_base.smn_paso where smn_base.smn_paso.smn_paso_id is not null  and smn_base.smn_paso.smn_paso_id=smn_comercial.smn_accion.acc_paso_rf) as acc_paso_rf_combo,
	case
		when smn_comercial.smn_accion.acc_estatus='AC' then '${lbl:b_active}'
		when smn_comercial.smn_accion.acc_estatus='IN' then '${lbl:b_inactive}'
	end as acc_estatus_combo,
	smn_comercial.smn_accion.*
from 
	smn_comercial.smn_accion
where
	smn_accion_id = ${fld:id}
