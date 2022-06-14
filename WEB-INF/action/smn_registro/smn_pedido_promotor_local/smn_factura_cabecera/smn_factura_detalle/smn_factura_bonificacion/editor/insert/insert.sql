INSERT INTO smn_comercial.smn_factura_bonificacion
(
	smn_factura_bonificacion_id,
	smn_factura_detalle_id,
	smn_item_bonificar_rf,
	fbo_cantidad_origen,
	fbo_cantidad_bonificar,
	fbo_precio_original,
	fbo_monto,
	fbo_idioma,
	fbo_usuario,
	fbo_fecha_registro,
	fbo_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_factura_bonificacion},
	${fld:smn_factura_detalle_id},
	${fld:smn_item_bonificar_rf},
	${fld:fbo_cantidad_origen},
	${fld:fbo_cantidad_bonificar},
	${fld:fbo_precio_original},
	${fld:fbo_monto},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
