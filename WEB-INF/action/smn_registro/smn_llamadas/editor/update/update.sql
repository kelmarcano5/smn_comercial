UPDATE smn_comercial.smn_llamadas SET
	smn_cliente_id=${fld:smn_cliente_id},
	smn_prospecto_id=${fld:smn_prospecto_id},
	smn_solicitud_afiliacion_id=${fld:smn_solicitud_afiliacion_id},
	smn_tipo_documento_id=${fld:smn_tipo_documento_id},
	smn_documento_id=${fld:smn_documento_id},
	lla_descripcion=${fld:lla_descripcion},
	smn_cita_id=${fld:smn_cita_id},
	smn_orden_pedido_id=${fld:smn_orden_pedido_id},
	smn_oferta_id=${fld:smn_oferta_id},
	smn_solicitud_servicio_entrega_rf=${fld:smn_solicitud_servicio_entrega_rf},
	smn_gestion_id=${fld:smn_gestion_id},
	lla_observacion=${fld:lla_observacion},
	lla_estatus=${fld:lla_estatus},
	lla_idioma='${def:locale}',
	lla_usuario='${def:user}',
	lla_fecha_registro={d '${def:date}'},
	lla_hora='${def:time}'

WHERE
	smn_llamadas_id=${fld:id}

