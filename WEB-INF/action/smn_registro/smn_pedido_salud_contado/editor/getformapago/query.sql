select 
	smn_base.smn_formas_pago.smn_formas_pago_id as id, smn_base.smn_medio_pago.mpa_tipo_medio_pago || ' - ' || smn_base.smn_formas_pago.fop_descripcion as item,
	smn_base.smn_medio_pago.mpa_moneda_alterna
from smn_caja.smn_relacion_caja_forma_pago
inner join smn_base.smn_formas_pago on smn_base.smn_formas_pago.smn_formas_pago_id = smn_caja.smn_relacion_caja_forma_pago.smn_formas_pago_rf
inner join smn_caja.smn_caja on smn_caja.smn_caja.smn_caja_id = smn_caja.smn_relacion_caja_forma_pago.smn_caja_id
inner join smn_base.smn_medio_pago on smn_base.smn_medio_pago.smn_medio_pago_id = smn_base.smn_formas_pago.fop_medio_pago
--inner join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_caja_rf = smn_caja.smn_relacion_caja_forma_pago.smn_caja_id
where 
	 smn_caja.smn_relacion_caja_forma_pago.smn_caja_id=${fld:id}