select 
	smn_caja.smn_dist_pago_detalle.smn_dist_pago_detalle_id,
	smn_caja.smn_dist_pago_detalle.smn_forma_pago_rf,
	smn_caja.smn_dist_pago_detalle.smn_cuenta_bancaria_rf,
	smn_caja.smn_dist_pago_detalle.dpd_documento_pagador,
	smn_caja.smn_dist_pago_detalle.dpd_numero_autorizacion,
	smn_caja.smn_dist_pago_detalle.dpd_numero_doc_forma_pago,
	smn_caja.smn_dist_pago_detalle.smn_moneda_rf,
	smn_caja.smn_dist_pago_detalle.smn_tasa_rf,
	smn_caja.smn_dist_pago_detalle.smn_rel_pto_venta_mediop_rf,
	smn_caja.smn_dist_pago_detalle.dpd_fecha_registro,
	smn_caja.smn_dist_pago_detalle.dpd_monto_del_pago_ml,
	smn_caja.smn_dist_pago_detalle.dpd_monto_del_pago_ma,
	smn_caja.smn_dist_pago_detalle.dpd_idioma,
	smn_caja.smn_dist_pago_detalle.dpd_usuario,
	smn_caja.smn_dist_pago_detalle.dpd_hora,
	19 as modulo,
	9 as smn_documento_id,
	smn_caja.smn_mov_caja_cabecera.smn_caja_id
from 
	smn_caja.smn_dist_pago_detalle
	inner join smn_caja.smn_mov_caja_cabecera on smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = smn_caja.smn_dist_pago_detalle.smn_mov_caja_cabecera_id
	inner join smn_base.smn_formas_pago on smn_base.smn_formas_pago.smn_formas_pago_id = smn_caja.smn_dist_pago_detalle.smn_forma_pago_rf
where 
	smn_caja.smn_dist_pago_detalle.smn_mov_caja_cabecera_id=(select smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}) and smn_base.smn_formas_pago.fop_codigo in ('TR1','PM1','TR2','PM2')

