UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_estatus='AN',
	pca_monto_pedido_ml=0,
	pca_monto_impuesto_ml=0,
	pca_monto_descuento_ml=0,
	pca_monto_bonificacion_ml=0,
	pca_monto_neto_ml=0,
	pca_monto_pedido_ma=0,
	pca_monto_impuesto_ma=0,
	pca_monto_descuento_ma=0,
	pca_monto_bonificacion_ma=0,
	pca_monto_neto_ma=0
WHERE
	smn_pedido_cabecera_id=${fld:id}; 


UPDATE smn_comercial.smn_pedido_detalle SET
	pde_precio=0,
	pde_monto=0,
	pde_precio_moneda_alterna=0,
	pde_monto_moneda_alterna=0,
	pde_estatus='AN',
	smn_codigos_impuestos_rf=0,
	smn_codigo_descuento_rf=0,
	pde_monto_impuesto_ml=0,
	pde_monto_impuesto_ma=0,
	pde_descuento_ml=0,
	pde_monto_descuento_ma=0,
	pde_incremento_ml=0,
	pde_componente_ml=0,
	pde_monto_incremento_ma=0,
	pde_monto_componente_ma=0,
	pde_monto_neto_ml=0,
	pde_monto_neto_ma=0

WHERE
	smn_pedido_cabecera_id=${fld:id}



