select
		smn_comercial.smn_accion.acc_codigo,
	smn_comercial.smn_accion.acc_descripcion,
	smn_comercial.smn_accion.acc_tipo,
	smn_comercial.smn_accion.smn_mensajes_rf,
	smn_comercial.smn_accion.acc_metodo,
	smn_comercial.smn_accion.acc_tipo_acto_rol,
	smn_comercial.smn_accion.acc_fecha_registro,
	smn_comercial.smn_accion.acc_codigo,
	smn_comercial.smn_accion.acc_descripcion,
	smn_comercial.smn_accion.acc_tipo,
	smn_comercial.smn_accion.smn_mensajes_rf,
	smn_comercial.smn_accion.acc_metodo,
	smn_comercial.smn_accion.acc_tipo_acto_rol,
	smn_comercial.smn_accion.acc_fecha_registro,
	smn_comercial.smn_accion.acc_codigo,
	smn_comercial.smn_accion.acc_descripcion,
	smn_comercial.smn_accion.acc_tipo,
	smn_comercial.smn_accion.smn_mensajes_rf,
	smn_comercial.smn_accion.acc_metodo,
	smn_comercial.smn_accion.acc_tipo_acto_rol,
	smn_comercial.smn_accion.acc_fecha_registro,
	smn_comercial.smn_accion.acc_codigo,
	smn_comercial.smn_accion.acc_descripcion,
	smn_comercial.smn_accion.acc_require_seguimiento,
	smn_comercial.smn_accion.acc_dias_seguimiento,
	smn_comercial.smn_accion.acc_paso_rf,
	smn_comercial.smn_accion.acc_estatus,
	smn_comercial.smn_accion.acc_vigencia,
	smn_comercial.smn_accion.acc_fecha_registro
from
	smn_comercial.smn_accion 
where
	smn_comercial.smn_accion.smn_accion_id = ${fld:id}
