select
	smn_comercial.smn_accion_gestion_cliente.smn_accion_gestion_cliente_id,
	case
	when smn_comercial.smn_accion_gestion_cliente.ago_estatus_proceso='EN' then '${lbl:b_send}'
	when smn_comercial.smn_accion_gestion_cliente.ago_estatus_proceso='EP' then '${lbl:b_in_process}'
	when smn_comercial.smn_accion_gestion_cliente.ago_estatus_proceso='CE' then '${lbl:b_close}'
	when smn_comercial.smn_accion_gestion_cliente.ago_estatus_proceso='AP' then '${lbl:b_aprobated}'
	end as ago_estatus_proceso,
	smn_comercial.smn_accion_gestion_cliente.smn_rel_oferta_cliente_id,
	smn_comercial.smn_accion.acc_descripcion as smn_accion_id,
	smn_comercial.smn_accion_gestion_cliente.ago_fecha_seguimiento,
	smn_comercial.smn_accion_gestion_cliente.ago_fecha_aprobacion,
	smn_comercial.smn_accion_gestion_cliente.ago_fecha_vigencia_desde,
	smn_comercial.smn_accion_gestion_cliente.ago_fecha_vigencia_hasta,
	smn_comercial.smn_accion_gestion_cliente.ago_fecha_cierre,
	smn_comercial.smn_accion_gestion_cliente.ago_observacion,
	smn_comercial.smn_accion_gestion_cliente.ago_usuario,
	smn_comercial.smn_accion_gestion_cliente.ago_hora,
	smn_comercial.smn_accion_gestion_cliente.ago_fecha_registro
from
	smn_comercial.smn_accion_gestion_cliente
	inner join smn_comercial.smn_accion on smn_comercial.smn_accion.smn_accion_id = smn_comercial.smn_accion_gestion_cliente.smn_accion_id
where
	smn_comercial.smn_accion_gestion_cliente.smn_accion_gestion_cliente_id = ${fld:id}
