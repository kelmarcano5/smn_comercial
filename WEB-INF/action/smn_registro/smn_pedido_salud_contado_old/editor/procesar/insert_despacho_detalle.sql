INSERT INTO smn_inventario.smn_despacho_detalle
(
  smn_despacho_detalle_id,
  smn_despacho_id,

  smn_caracteristica_item_id,
  dde_cantidad_solicitada,
  dde_cantidad_despachada,
  dde_costo_ml,
  dde_costo_ma,
  dde_estatus_transaccion, 
  dde_idioma,
  dde_usuario,
  dde_fecha_registro,
  dde_hora
)
select
	nextval('smn_inventario.seq_smn_despacho_detalle'),
	(select last_value from smn_inventario.seq_smn_despacho),
	smn_comercial.smn_pedido_detalle.smn_item_rf,
    smn_comercial.smn_pedido_detalle.pde_cantidad_pedido,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido,
	smn_comercial.smn_pedido_detalle.pde_monto,
	smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna,
	'GE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
	from smn_comercial.smn_pedido_detalle
	
	where
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}

