select
		smn_comercial.smn_pago_punto_venta.smn_pago_punto_venta_id,
	${field}
from
	smn_comercial.smn_pago_punto_venta
where
		smn_comercial.smn_pago_punto_venta.smn_pago_punto_venta_id is not null
	${filter}
	
	
