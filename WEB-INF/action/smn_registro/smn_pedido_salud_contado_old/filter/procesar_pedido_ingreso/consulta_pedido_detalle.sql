SELECT
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id,
	smn_comercial.smn_pedido_detalle.smn_servicios_rf,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_detalle.pde_monto,
	smn_comercial.smn_pedido_detalle.pde_precio_moneda_alterna,
	smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna,
	smn_comercial.smn_pedido_detalle.smn_moneda_rf, 
	smn_comercial.smn_pedido_detalle.smn_tasa_rf,
	smn_comercial.smn_pedido_detalle.pde_fecha_registro,
	${fld:smn_ingresos_id} as smn_ingresos_id
FROM
	smn_comercial.smn_pedido_detalle
	inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
WHERE
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id = ${fld:smn_pedido_cabecera_id}