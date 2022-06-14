select smn_base.smn_formas_pago.smn_formas_pago_id as id, smn_base.smn_formas_pago.fop_codigo|| ' - ' || smn_base.smn_formas_pago.fop_descripcion as item 
from smn_base.smn_formas_pago 
inner join smn_caja.smn_relacion_caja_forma_pago on smn_caja.smn_relacion_caja_forma_pago.smn_formas_pago_rf = smn_base.smn_formas_pago.smn_formas_pago_id 
inner join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = ${fld:centro} and smn_caja.smn_relacion_caja_forma_pago.smn_caja_id = smn_comercial.smn_centro_facturacion.smn_caja_rf
order by fop_descripcion

