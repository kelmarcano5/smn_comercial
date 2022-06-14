select
		smn_comercial.smn_factura_descuentos_retenciones.smn_factura_descuentos_retenciones_id,
	${field}
from
	smn_comercial.smn_factura_descuentos_retenciones
where
		smn_comercial.smn_factura_descuentos_retenciones.smn_factura_descuentos_retenciones_id is not null
	${filter}
	
	
