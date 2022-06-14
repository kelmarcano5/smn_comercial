select
		smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id,
	case
	when smn_comercial.smn_clasificacion_cliente.ccl_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_clasificacion_cliente.ccl_estatus='IN' then '${lbl:b_inactive}'
	end as ccl_estatus_combo,
	smn_comercial.smn_clasificacion_cliente.ccl_codigo,
	smn_comercial.smn_clasificacion_cliente.ccl_descripcion,
	smn_comercial.smn_clasificacion_cliente.ccl_vigencia,
	smn_comercial.smn_clasificacion_cliente.ccl_estatus,
	smn_comercial.smn_clasificacion_cliente.ccl_idioma,
	smn_comercial.smn_clasificacion_cliente.ccl_usuario,
	smn_comercial.smn_clasificacion_cliente.ccl_fecha_registro,
	smn_comercial.smn_clasificacion_cliente.ccl_hora,
		smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id
	
from
	smn_comercial.smn_clasificacion_cliente
order by
		smn_clasificacion_cliente_id
