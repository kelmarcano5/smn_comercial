select
		smn_comercial.smn_control_cupo.smn_control_cupo_id,
	case
	when smn_comercial.smn_control_cupo.ccu_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_control_cupo.ccu_estatus='CA' then '${lbl:b_cancelled}'
	end as ccu_estatus,
	smn_comercial.smn_evento.eve_descripcion_corta as smn_evento_id,
	smn_comercial.smn_control_cupo.ccu_cupo,
	smn_comercial.smn_control_cupo.ccu_reservas,
	smn_comercial.smn_control_cupo.ccu_saldo,
	smn_comercial.smn_control_cupo.ccu_fecha_registro
	
from
	smn_comercial.smn_control_cupo
	inner join smn_comercial.smn_evento on smn_comercial.smn_evento.smn_evento_id = smn_comercial.smn_control_cupo.smn_evento_id

where
	smn_control_cupo_id = ${fld:id}
