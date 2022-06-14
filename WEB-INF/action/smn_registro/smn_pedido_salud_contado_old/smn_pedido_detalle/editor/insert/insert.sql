INSERT INTO smn_comercial.smn_pedido_detalle
(
	smn_pedido_detalle_id,
	smn_pedido_cabecera_id,
	smn_mov_caja_cabecera_id,
	pde_naturaleza,
	smn_servicios_rf,
	smn_item_rf,
	smn_activo_fijo_rf,
	pde_cantidad_oferta,
	pde_cantidad_pedido,
	pde_cantidad_aprobada,
	pde_precio,
	pde_monto,
	smn_moneda_rf,
	smn_tasa_rf,
	pde_precio_moneda_alterna,
	pde_monto_moneda_alterna,
	pde_especificaciones_pedido,
	pde_fecha_requerida,
	pde_observaciones,
	pde_estatus,
	pde_idioma,
	pde_usuario,
	pde_fecha_registro,
	pde_hora,
	smn_codigos_impuestos_rf,
	smn_codigo_descuento_rf,
	pde_monto_impuesto_ml,
	pde_monto_impuesto_ma,
	pde_descuento_ml,
	pde_monto_descuento_ma,
	pde_monto_neto_ml,
	pde_monto_neto_ma

)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_pedido_detalle},
	${fld:smn_pedido_cabecera_id},
	0,
	${fld:pde_naturaleza},
	${fld:smn_servicios_rf},
	${fld:smn_item_rf},
	${fld:smn_activo_fijo_rf},
	0,
	${fld:pde_cantidad_pedido},
	${fld:pde_cantidad_pedido},
	${fld:pde_precio},
	${fld:pde_monto},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:pde_precio_moneda_alterna},
	${fld:pde_monto_moneda_alterna},
	${fld:pde_especificaciones_pedido},
	{d '${def:date}'},
	${fld:pde_observaciones},
	${fld:pde_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_codigos_impuestos_rf},
	${fld:smn_codigo_descuento_rf},
	${fld:pde_monto_impuesto_ml},
	${fld:pde_monto_impuesto_ma},
	${fld:pde_descuento_ml},
	${fld:pde_monto_descuento_ma},
	${fld:pde_monto_neto_ml},
	${fld:pde_monto_neto_ma}
)