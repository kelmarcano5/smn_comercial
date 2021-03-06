select 
	comprador.smn_clase_auxiliar_rf,
	smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf,
	smn_comercial.smn_pago_punto_venta.smn_rel_punto_venta_pago_rf,
	smn_comercial.smn_pago_punto_venta.smn_forma_pago_rf as formadepago,
	smn_comercial.smn_pago_punto_venta.ppv_numero_documento_forma_pago,
	smn_comercial.smn_pago_punto_venta.ppv_numero_autorizacion,
	smn_comercial.smn_pago_punto_venta.ppv_documento_identidad_pagador,
	smn_comercial.smn_pago_punto_venta.ppv_nombre_pagador,
	smn_comercial.smn_pago_punto_venta.ppv_monto_pagar_ml,
	smn_comercial.smn_pago_punto_venta.ppv_monto_pago_ml,
	smn_comercial.smn_pago_punto_venta.ppv_monto_pagar_ma,
	smn_comercial.smn_pago_punto_venta.ppv_monto_pago_ma,
	smn_comercial.smn_pago_punto_venta.smn_moneda_rf,
	smn_comercial.smn_pago_punto_venta.smn_tasa_rf,
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	smn_comercial.smn_pago_punto_venta.ppv_observacion,
	${fld:smn_mov_caja_cabecera_id} as smn_mov_caja_cabecera_id,
	smn_comercial.smn_pago_punto_venta.ppv_banco_origen,
	smn_comercial.smn_pago_punto_venta.ppv_banco_destino,
	smn_comercial.smn_pago_punto_venta.ppv_cuenta_bancaria
from 
	smn_comercial.smn_pago_punto_venta
	inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id
	left join smn_base.smn_auxiliar comprador on comprador.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
	left join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left join smn_base.smn_v_auxiliar cliente on cliente.smn_v_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
where
smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}