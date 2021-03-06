INSERT INTO smn_comercial.smn_orden_servicio
(
	smn_orden_servicio_id,
	smn_documento_id,
	ors_numero,
	smn_cliente_id,
	ors_descripcion,
	ors_fecha_inicial,
	ors_fecha_final,
	ors_hora_inicial,
	ors_hora_final,
	smn_prestador_servicio_rf,
	ors_observacion,
	ors_estatus,
	ors_idioma,
	ors_usuario,
	ors_fecha_registro,
	ors_hora,
	smn_tipo_servicio_rf,
	smn_centro_facturacion_id
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_orden_servicio},
	${fld:smn_documento_id},
	${seq:nextval@smn_comercial.seq_smn_rel_orden_presupuesto},
	${fld:smn_cliente_id},
	${fld:ors_descripcion},
	${fld:ors_fecha_inicial},
	${fld:ors_fecha_final},
	${fld:ors_hora_inicial},
	${fld:ors_hora_final},
	${fld:smn_prestador_servicio_rf},
	${fld:ors_observacion},
	${fld:ors_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_tipo_servicio_rf},
	${fld:smn_centro_facturacion_id}
)
