INSERT INTO smn_inventario.smn_movimiento_detalle
(
 smn_movimiento_detalle_id,
  smn_movimiento_cabecera_id,
  smn_item_rf,
  smn_centro_costo_rf,
  mde_lote,
  mde_fecha_vencimiento_lote,
  mde_tipo_movimiento,
  mde_cantidad_recibida,
  mde_descripcion,
  mde_es_bonificacion,
  smn_unidad_medida_rf,
  mde_valor_unitario_ml,
  smn_tasa_rf,
  smn_moneda_rf,
  mde_valor_unitario_ma,
  mde_monto_bruto_ml,
  mde_monto_bruto_ma,
  mde_estatus,
  mde_idioma,
  mde_usuario,
  mde_fecha_registro,
  mde_hora
)
select
	nextval('smn_inventario.seq_smn_movimiento_detalle'),
	${fld:id_mov_cab},
	smn_inventario.smn_caracteristica_item.smn_caracteristica_item_id,
  smn_inventario.smn_caracteristica_item.smn_centro_costo_rf,
  ${fld:id_lote},
  ${fld:fecha_venc},
  'SA',
   ${fld:cantidad},
  'Ventas al Detal',
	'NO',
	smn_inventario.smn_caracteristica_item.smn_unidad_medida_venta_rf,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_detalle.smn_tasa_rf,
	smn_comercial.smn_pedido_detalle.smn_moneda_rf,
	smn_comercial.smn_pedido_detalle.pde_precio_moneda_alterna,
	smn_comercial.smn_pedido_detalle.pde_monto,
	smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna,
	'GE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
	from smn_comercial.smn_pedido_detalle
	inner join smn_inventario.smn_caracteristica_item on smn_inventario.smn_caracteristica_item.smn_item_rf= ${fld:id_item_comp}
	where
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id};
