INSERT INTO smn_entrega.smn_solicitud_afiliacion
(
	smn_solicitud_afiliacion_id,
	smn_prospecto_rf,
	saf_observacion,
	saf_status,
	saf_idioma,
	saf_usuario,
	saf_fecha_registro,
	saf_hora
)
VALUES
(
	${seq:currval@smn_entrega.seq_smn_solicitud_afiliacion},
	${fld:smn_prospecto_id},
	${fld:lla_observacion},
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
