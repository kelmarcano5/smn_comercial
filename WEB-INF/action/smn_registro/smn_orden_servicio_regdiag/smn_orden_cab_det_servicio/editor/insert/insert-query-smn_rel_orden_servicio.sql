INSERT INTO smn_comercial.smn_rel_orden_servicio
(
	smn_rel_orden_servicio_id,
	smn_orden_servicio_id,
	smn_servicios_rf,
	ocd_estatus
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_orden_servicio},
	${fld:smn_orden_servicio_id},
	${fld:smn_servicios_rf},
	'RE'
)
