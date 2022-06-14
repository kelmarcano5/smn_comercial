INSERT INTO smn_comercial.smn_prestacion_servicio_medico_cabecera
(
	smn_prestacion_servicio_medico_cabecera_id,
	smn_ingresos_id,
	smn_mov_caja_cabecera_id,
	smn_unidades_servicios_rf,
	psc_estatus,
	psc_idioma,
	psc_usuario,
	psc_fecha_registro,
	psc_hora,
	psc_estatus_financiero
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_prestacion_servicio_medico_cabecera},
	${fld:smn_ingresos_id},
	${fld:smn_mov_caja_cabecera_id},
	${fld:smn_unidades_servicios_rf},
	'PE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	'PE'
)
