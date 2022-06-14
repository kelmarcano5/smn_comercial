INSERT INTO smn_comercial.smn_orden_cab_det_servicio
(
	smn_orden_cab_det_servicio_id,
	smn_orden_servicio_id,
	ocd_estatus,
	ocd_observacion,
	ocd_idioma,
	ocd_usuario,
	ocd_fecha_registro,
	ocd_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_orden_cab_det_servicio},
	${fld:smn_orden_servicio_id},
	${fld:ocd_estatus},
	${fld:ocd_observacion},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
