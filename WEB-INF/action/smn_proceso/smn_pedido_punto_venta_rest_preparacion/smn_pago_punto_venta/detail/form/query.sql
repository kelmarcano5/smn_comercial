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
	smn_comercial.smn_pago_punto_venta.ppv_monto_pagar_ma,
	smn_comercial.smn_pago_punto_venta.ppv_monto_pago_ma,
	smn_comercial.smn_pago_punto_venta.ppv_monto_devuelto_ma,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.smn_monedas_id as smn_tasa_rf,
	smn_base.smn_formas_pago.fop_descripcion as smn_forma_pago_rf,
	smn_comercial.smn_pago_punto_venta.smn_rel_punto_venta_pago_rf,
		smn_comercial.smn_pago_punto_venta.smn_pagador_clase_rf,
	smn_comercial.smn_pago_punto_venta.ppv_observacion,
	smn_comercial.smn_pago_punto_venta.ppv_fecha_registro
	
from
	smn_comercial.smn_pago_punto_venta
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pago_punto_venta.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_pago_punto_venta.smn_tasa_rf
	left outer join smn_base.smn_formas_pago on smn_base.smn_formas_pago.smn_formas_pago_id = smn_comercial.smn_pago_punto_venta.smn_forma_pago_rf
	left outer join smn_caja.smn_rel_caja_punto_venta on smn_caja.smn_rel_caja_punto_venta.smn_rel_caja_punto_venta_id = smn_comercial.smn_pago_punto_venta.smn_rel_punto_venta_pago_rf
where
	smn_pago_punto_venta_id = ${fld:id}
