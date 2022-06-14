select
		smn_comercial.smn_factura_impuestos.smn_factura_impuestos_id,
	${field}
from
	smn_comercial.smn_factura_impuestos
where
		smn_comercial.smn_factura_impuestos.smn_factura_impuestos_id is not null
	${filter}
	
	
