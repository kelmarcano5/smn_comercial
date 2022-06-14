INSERT INTO smn_comercial.smn_factura_impresion_detalle
(
	smn_factura_impresion_detalle_id,
	smn_factura_cabecera_id,
	smn_pedido_detalle_id,
	smn_pedido_componente_id,
	smn_grupo_titulo_impresion_rf,
	fim_codigo,
	fim_descripcion,
	fim_cantidad,
	fim_precio_ml,
	fim_monto_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	fim_precio_ma,
	fim_monto_ma,
	fim_idioma,
	fim_usuario,
	fim_fecha_registro,
	fim_hora,
	smn_prestador_servicio_rf,
	smn_pedido_cabecera_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_factura_impresion_detalle},
	${fld:smn_factura_cabecera_id},
	${fld:smn_pedido_detalle_id},
	${fld:smn_pedido_componentes_id},
	${fld:smn_grupo_titulo_impresion_rf},
	${fld:codigo},
	${fld:descripcion},
	${fld:pco_cantidad},
	${fld:smn_precio_ml_rf},
	${fld:pco_monto_ml},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:smn_precio_ma},
	${fld:smn_monto_ma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_prestador_servicio_rf},
	${fld:smn_pedido_cabecera_id}
)