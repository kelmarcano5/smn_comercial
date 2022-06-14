select
		smn_comercial.smn_pago_punto_venta.smn_pago_punto_venta_id,
	case
	when smn_comercial.smn_pago_punto_venta.ppv_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_pago_punto_venta.ppv_estatus='IN' then '${lbl:b_inactive}'
	end as ppv_estatus,
	smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id,
	smn_comercial.smn_pago_punto_venta.smn_mov_caja_cabecera_id,
	smn_comercial.smn_pago_punto_venta.ppv_numero_documento_forma_pago,
	smn_comercial.smn_pago_punto_venta.ppv_numero_autorizacion,
	smn_comercial.smn_pago_punto_venta.ppv_documento_identidad_pagador,
	smn_comercial.smn_pago_punto_venta.ppv_nombre_pagador,
	smn_comercial.smn_pago_punto_venta.ppv_monto_pagar_ml,
	smn_comercial.smn_pago_punto_venta.ppv_monto_pago_ml,
	smn_comercial.smn_pago_punto_venta.ppv_monto_devuelto_ml,
	smn_comercial.smn_pago_punto_venta.ppv_fecha_registro
	
from
	smn_comercial.smn_pago_punto_venta
where
	smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id=${fld:id2}
order by 
		smn_comercial.smn_pago_punto_venta.ppv_fecha_registro desc