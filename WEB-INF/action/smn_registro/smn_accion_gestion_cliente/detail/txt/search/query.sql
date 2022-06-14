select
	case
	when smn_comercial.smn_accion_gestion_cliente.ago_estatus_proceso='EN' then '${lbl:b_send}'
	when smn_comercial.smn_accion_gestion_cliente.ago_estatus_proceso='EP' then '${lbl:b_in_process}'
	when smn_comercial.smn_accion_gestion_cliente.ago_estatus_proceso='CE' then '${lbl:b_close}'
	when smn_comercial.smn_accion_gestion_cliente.ago_estatus_proceso='AP' then '${lbl:b_aprobated}'
	end as ago_estatus_proceso,
	smn_comercial.smn_accion_gestion_cliente.*
from
	smn_comercial.smn_accion_gestion_cliente
where
	smn_accion_gestion_cliente_id = ${fld:id}
