select 
	smn_base.smn_formas_pago.smn_formas_pago_id as id, smn_base.smn_formas_pago.fop_codigo|| ' - ' || smn_base.smn_formas_pago.fop_descripcion as item
from smn_caja.smn_relacion_caja_forma_pago
inner join smn_base.smn_formas_pago on smn_base.smn_formas_pago.smn_formas_pago_id = smn_caja.smn_relacion_caja_forma_pago.smn_formas_pago_rf
inner join smn_caja.smn_caja on smn_caja.smn_caja.smn_caja_id = smn_caja.smn_relacion_caja_forma_pago.smn_caja_id
inner join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_caja_rf = smn_caja.smn_relacion_caja_forma_pago.smn_caja_id
where 
	 smn_caja.smn_relacion_caja_forma_pago.smn_caja_id=${fld:id}