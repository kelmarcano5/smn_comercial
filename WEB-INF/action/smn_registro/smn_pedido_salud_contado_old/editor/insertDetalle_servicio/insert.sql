INSERT INTO smn_comercial.smn_pedido_detalle
(
	smn_pedido_detalle_id,
	smn_pedido_cabecera_id,
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
	smn_unidad_medida_rf,
	pde_tiempo_sug_preparacion
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_pedido_detalle},
	${fld:smn_pedido_cabecera_id},
	${fld:pde_naturaleza},
	${fld:smn_servicios_rf},
	0,
	0,
	0,
	${fld:pde_cantidad_pedido},
	${fld:pde_cantidad_aprobada},
	${fld:pde_precio},
	${fld:pde_monto},
	${fld:smn_moneda_rf},
	(select smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id as id from smn_base.smn_tasas_de_cambio 
		inner join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_base.smn_tasas_de_cambio.smn_monedas_id
where smn_base.smn_tasas_de_cambio.smn_monedas_id=(select smn_base.smn_baremos.smn_moneda_rf from smn_base.smn_baremos 
	where smn_base.smn_baremos.smn_baremos_id=${fld:BaremosG} limit 1) and smn_base.smn_tasas_de_cambio.tca_fecha_vigencia = current_date limit 1),
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
	${fld:smn_unidad_medida_rf},
	${fld:pde_tiempo_sug_preparacion}
);
