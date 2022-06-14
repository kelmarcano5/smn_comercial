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
	${fld:smn_item_rf},
	${fld:smn_activo_fijo_rf},
	${fld:pde_cantidad_oferta},
	${fld:pde_cantidad_pedido},
	${fld:pde_cantidad_aprobada},
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
	${fld:smn_unidad_medida_rf},
	${fld:pde_tiempo_sug_preparacion}
);

INSERT INTO smn_inventario.smn_rel_control_item_pedido
(
	smn_rel_control_item_pedido_id,
	smn_control_item_id,
	pca_numero_pedido,
	rcp_descripcion,
	rcp_cantidad,
	rcp_idioma,
	rcp_usuario,
	rcp_fecha_registro,
	rcp_hora
)
VALUES
(
	${seq:nextval@smn_inventario.seq_smn_rel_control_item_pedido},
	(select last_value from smn_inventario.seq_smn_control_item),
	(select smn_comercial.smn_pedido_cabecera.pca_numero_pedido from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}),
	(select  smn_comercial.smn_documento.dcf_descripcion ||' N° del Pedido: '|| smn_comercial.smn_pedido_cabecera.pca_numero_pedido  from smn_comercial.smn_pedido_cabecera
inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}),
	${fld:pde_cantidad_pedido},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);
