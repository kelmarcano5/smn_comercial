select
		smn_comercial.smn_reservas.smn_reservas_id,
	case
	when smn_comercial.smn_reservas.res_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_reservas.res_estatus='CA' then '${lbl:b_cancelled}'
	end as res_estatus,
	smn_comercial.smn_reservas.smn_evento_id,
	smn_comercial.smn_reservas.smn_afiliado_id,
	smn_comercial.smn_reservas.smn_relacionado_id,
	smn_comercial.smn_reservas.res_cantidad,
	smn_comercial.smn_reservas.res_estatus,
	smn_comercial.smn_reservas.res_fecha_registro
	
from
	smn_comercial.smn_reservas
