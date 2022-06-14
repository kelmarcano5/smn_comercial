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
	smn_precio_ml,
	fim_monto_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	smn_precio_ma_rf,
	fim_monto_ma_rf,
	fim_idioma,
	fim_usuario,
	fim_fecha_registro,
	fim_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_factura_impresion_detalle},
	(select last_value from smn_comercial.seq_smn_factura_cabecera),
	${fld:smn_pedido_detalle_id},
	${fld:smn_pedido_componente_id},
	(select smn_base.smn_servicios.smn_grupo_titulo_impresion_rf from smn_base.smn_servicios inner join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id
inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id
where smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id} and smn_comercial.smn_pedido_detalle.pde_naturaleza='SE'),
	${fld:fim_codigo},
	${fld:fim_descripcion},
	${fld:cantidad},
	${fld:precio},
	${fld:monto},
	${fld:moneda},
	${fld:tasa},
	${fld:precio_ma},
	${fld:monto_ma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
