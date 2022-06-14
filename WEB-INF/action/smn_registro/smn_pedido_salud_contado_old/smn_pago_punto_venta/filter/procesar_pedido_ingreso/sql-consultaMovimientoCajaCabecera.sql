select cliente.smn_v_auxiliar_id as cliente1,
	comprador.smn_auxiliar_id as comprador,
	cliente.smn_clase_id as clase_cliente,
	comprador.smn_clase_auxiliar_rf as clase_comprador,
	smn_comercial.smn_centro_facturacion.smn_caja_rf as caja,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml as monto_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml as saldo_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma as monto_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma as saldo_ma,
	smn_comercial.smn_pedido_cabecera.smn_moneda_rf as moneda,
	smn_comercial.smn_pedido_cabecera.smn_tasa_rf as tasa,
	smn_comercial.smn_pedido_cabecera.smn_documento_id as documento,
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as numero_referencia,
	smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf,
	smn_comercial.smn_pedido_cabecera.smn_cliente_id
from 
	smn_comercial.smn_pedido_cabecera
	left outer join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
	left outer join smn_comercial.smn_pago_punto_venta on smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
	left outer join smn_base.smn_auxiliar comprador on comprador.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left outer join smn_base.smn_v_auxiliar cliente on cliente.smn_v_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id
where 
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}