select 
	smn_caja.smn_rel_pto_venta_mediop.smn_rel_pto_venta_mediop_id as id, 
	smn_caja.smn_punto_venta.pvt_codigo || ' ' || smn_caja.smn_punto_venta.pvt_descripcion || ' - ' || smn_base.smn_formas_pago.fop_codigo|| ' ' || smn_base.smn_formas_pago.fop_descripcion as item
from smn_caja.smn_rel_pto_venta_mediop, 
	 smn_caja.smn_punto_venta,
	 smn_base.smn_formas_pago,
	 smn_caja.smn_rel_caja_punto_venta 
where 
	 smn_caja.smn_punto_venta.smn_punto_venta_id = smn_caja.smn_rel_pto_venta_mediop.smn_punto_venta_id and
	 smn_base.smn_formas_pago.smn_formas_pago_id=smn_caja.smn_rel_pto_venta_mediop.smn_forma_pago_rf and 
	 smn_caja.smn_rel_caja_punto_venta.smn_pundo_venta_id = smn_caja.smn_punto_venta.smn_punto_venta_id and
	 smn_caja.smn_rel_pto_venta_mediop.smn_forma_pago_rf = ${fld:id}