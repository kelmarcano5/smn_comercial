UPDATE smn_entrega.smn_solicitud_servicio_entregas_cabecera SET
	sec_origen=${fld:sec_origen},
	smn_documento_id=${fld:smn_documento_id},
	smn_cliente_rf=${fld:smn_cliente_rf},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_tipo_servicio_rf=${fld:smn_tipo_servicio_rf},
	sec_descripcion=${fld:sec_descripcion},
	sec_direccion_busqueda=${fld:sec_direccion_busqueda},
	sec_direccion_entrega=${fld:sec_direccion_entrega},
	sec_fecha_solicitud=${fld:sec_fecha_solicitud},
	sec_hora_solicitud=${fld:sec_hora_solicitud},
	sec_especificacion_servicio=${fld:sec_especificacion_servicio},
	sec_observacion_servicio=${fld:sec_observacion_servicio},
	sec_monto_ml=${fld:sec_monto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	sec_monto_ma=${fld:sec_monto_ma},
	smn_forma_pago_rf=${fld:smn_forma_pago_rf},
	sec_monto_pago_efectivo=${fld:sec_monto_pago_efectivo},
	sec_otras_instrucciones=${fld:sec_otras_instrucciones},
	sec_estatus_proceso=${fld:sec_estatus_proceso},
	sec_estatus_financiera=${fld:sec_estatus_financiera},
	sec_idioma='${def:locale}',
	sec_usuario='${def:user}',
	sec_fecha_registro={d '${def:date}'},
	sec_hora='${def:time}'

WHERE
	smn_solicitud_servicio_entregas_cabecera_id=${fld:id}

