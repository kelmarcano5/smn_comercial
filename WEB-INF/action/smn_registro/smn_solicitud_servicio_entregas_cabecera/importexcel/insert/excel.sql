INSERT INTO smn_comercial.smn_solicitud_servicio_entregas_cabecera
(
	smn_solicitud_servicio_entregas_cabecera_id,
	sec_origen,
	smn_documento_id,
	smn_cliente_rf,
	smn_tipo_servicio_rf,
	sec_descripcion,
	sec_direccion_busqueda,
	sec_direccion_entrega,
	sec_fecha_solicitud,
	sec_hora_solicitud,
	sec_especificacion_servicio,
	sec_observacion_servicio,
	sec_monto_ml,
	smn_moneda_rf,
	sec_monto_ma,
	smn_forma_pago_rf,
	sec_monto_pago_efectivo,
	sec_otras_instrucciones,
	sec_estatus_proceso,
	sec_estatus_financiera,
	sec_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_solicitud_servicio_entregas_cabecera},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
