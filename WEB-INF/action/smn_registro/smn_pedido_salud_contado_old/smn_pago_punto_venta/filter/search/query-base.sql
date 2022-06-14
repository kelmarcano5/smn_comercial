select
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
	smn_comercial.smn_pago_punto_venta.ppv_estatus,
	smn_comercial.smn_pago_punto_venta.ppv_fecha_registro,
		smn_comercial.smn_pago_punto_venta.smn_pago_punto_venta_id,
	smn_base.smn_formas_pago.fop_descripcion
	
from
	smn_comercial.smn_pago_punto_venta
	inner join smn_base.smn_formas_pago on smn_base.smn_formas_pago.smn_formas_pago_id = smn_comercial.smn_pago_punto_venta.smn_forma_pago_rf
where
	smn_pago_punto_venta_id is not null and smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id=${fld:id2}
	${filter}
order by
		smn_pago_punto_venta_id
