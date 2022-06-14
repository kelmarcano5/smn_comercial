INSERT INTO smn_comercial.smn_afiliados
(
	smn_afiliados_id,
	afi_auxiliar_rf,
	afi_fecha_inicio,
	afi_fecha_final,
	afi_fecha_desafiliacion,
	smn_rol_id,
	smn_servicio_id,
	afi_estatus,
	afi_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_afiliados},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
