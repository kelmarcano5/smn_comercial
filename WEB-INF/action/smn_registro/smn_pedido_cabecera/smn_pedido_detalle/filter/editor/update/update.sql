UPDATE smn_comercial.smn_pedido_detalle SET
	smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id},
	pde_naturaleza=${fld:pde_naturaleza},
	smn_servicios_rf=${fld:smn_servicios_rf},
	smn_item_rf=${fld:smn_item_rf},
	smn_activo_fijo_rf=${fld:smn_activo_fijo_rf},
	pde_cantidad_oferta=${fld:pde_cantidad_oferta},
	pde_cantidad_pedido=${fld:pde_cantidad_pedido},
	pde_cantidad_aprobada=${fld:pde_cantidad_aprobada},
	pde_precio=${fld:pde_precio},
	pde_monto=${fld:pde_monto},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	pde_precio_moneda_alterna=${fld:pde_precio_moneda_alterna},
	pde_monto_moneda_alterna=${fld:pde_monto_moneda_alterna},
	pde_especificaciones_pedido=${fld:pde_especificaciones_pedido},
	pde_fecha_requerido=${fld:pde_fecha_requerido},
	pde_observaciones=${fld:pde_observaciones},
	pde_idioma='${def:locale}',
	pde_usuario='${def:user}',
	pde_fecha_registro={d '${def:date}'},
	pde_hora='${def:time}'

WHERE
	smn_pedido_detalle_id=${fld:id}

