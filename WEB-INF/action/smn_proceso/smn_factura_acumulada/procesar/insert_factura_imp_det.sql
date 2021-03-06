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
	0,
	0,
	${fld:smn_grupo_titulo_impresion_rf},
	${fld:codigo},
	${fld:descripcion},
	${fld:pco_cantidad},
	case when ${fld:smn_precio_ml_rf} is null then 0 else ${fld:smn_precio_ml_rf} end,
	case when ${fld:pco_monto_ml} is null then 0 else ${fld:pco_monto_ml} end,
	${fld:smn_moneda_rf},
	0,
	case when ${fld:smn_precio_ma} is null then 0 else ${fld:smn_precio_ma} end,
	case when ${fld:smn_monto_ma} is null then 0 else ${fld:smn_monto_ma} end,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	0,
	0
); --RETURNING ${fld:smn_factura_cabecera_id} as smn_factura_cabecera_id;--, ${fld:smn_pedido_cabecera_id} as smn_pedido_cabecera_id;
