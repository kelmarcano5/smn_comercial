INSERT INTO smn_comercial.smn_orden_cab_det_servicio
(
	smn_orden_cab_det_servicio_id,
	smn_orden_servicio_id,
	ocd_observacion,
	ocd_estatus,
	ocd_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_orden_cab_det_servicio},
	?,
	?,
	?,
	{d '${def:date}'}
)
