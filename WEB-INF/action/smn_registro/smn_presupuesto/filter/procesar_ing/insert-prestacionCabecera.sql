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
	(select smn_comercial.smn_presupuesto.smn_ingresos_id from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:smn_presupuesto_id}),
	0,
	${fld:gpp_unidad_servicio},
	'PE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	'PE'
)
