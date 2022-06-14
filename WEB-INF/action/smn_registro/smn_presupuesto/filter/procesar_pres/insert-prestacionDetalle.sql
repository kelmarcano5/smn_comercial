INSERT INTO smn_comercial.smn_prestacion_servicio_medico_detalle
(
	smn_prestacion_servicio_medico_detalle_id,
	smn_prestacion_servicio_medico_cabecera_id,
	smn_ingresos_mov_id,
	smn_unidades_servicios_rf,
	smn_servicios_rf,
	psd_tipo_componentes,
	smn_componentes_rf,
	psd_cantidad,
	psd_precio_propuesto_ml,
	psd_monto_propuesto_ml,
	smn_moneda_rf,
	psd_estatus,
	psd_idioma,
	psd_usuario,
	psd_fecha_registro,
	psd_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_prestacion_servicio_medico_detalle},
	${seq:nextval@smn_comercial.seq_smn_prestacion_servicio_medico_cabecera},
	(select smn_comercial.smn_ingreso_movimiento.smn_ingresos_mov_id from smn_comercial.smn_ingreso_movimiento inner join smn_comercial.smn_ingresos on smn_comercial.smn_ingresos.smn_ingresos_id = smn_comercial.smn_ingreso_movimiento.smn_ingreso_id where smn_comercial.smn_ingresos.igs_doc_origen=${fld:smn_presupuesto_id}),
	${fld:smn_unidades_servicios_rf},
	${fld:smn_servicios_rf},
	${fld:smn_tipo_componentes_rf},
	${fld:smn_componentes_rf},
	${fld:prd_cantidad},
	${fld:prd_precio},
	${fld:prd_monto_moneda_local},
	${fld:smn_moneda_rf},
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
