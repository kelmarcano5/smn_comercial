UPDATE smn_comercial.smn_pedido_detalle SET
	smn_pedido_cabecera_id=(select last_value from smn_comercial.seq_smn_pedido_cabecera),
	pde_monto_moneda_alterna=(select pde_precio_moneda_alterna from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:id}),
	pde_monto_neto_ma=(select pde_precio_moneda_alterna from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:id}),
	pde_monto_neto_ml=(select pde_monto from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:id})
WHERE
	smn_pedido_detalle_id=${fld:id};

update smn_comercial.smn_pedido_componentes SET 
		smn_pedido_cabecera_id=(select last_value from smn_comercial.seq_smn_pedido_cabecera)
WHERE
	smn_pedido_detalle_id=${fld:id}



	

