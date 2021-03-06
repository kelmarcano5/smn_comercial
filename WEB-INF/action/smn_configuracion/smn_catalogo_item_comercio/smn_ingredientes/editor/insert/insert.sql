INSERT INTO smn_comercial.smn_ingredientes
(
	smn_ingredientes_id,
	smn_pedido_detalle_id,
	smn_item_rf,
	smn_unidad_medida_rf,
	igs_cantidad,
	igs_precio,
	smn_moneda_rf,
	igs_precio_ma,
	igs_monto_moneda_local,
	igs_monto_moneda_alterna,
	igs_idioma,
	igs_usuario,
	igs_fecha_registro,
	igs_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_ingredientes},
	${fld:smn_solicitud_servicio_entregas_detalle_id},
	${fld:smn_item_rf},
	${fld:smn_unidad_medida_rf},
	${fld:igs_cantidad},
	${fld:igs_precio},
	${fld:smn_moneda_rf},
	${fld:igs_precio_ma},
	${fld:igs_monto_moneda_local},
	${fld:igs_monto_moneda_alterna},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
