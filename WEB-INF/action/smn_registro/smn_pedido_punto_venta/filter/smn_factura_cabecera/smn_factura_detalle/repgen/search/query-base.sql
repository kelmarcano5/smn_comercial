select
		smn_comercial.smn_factura_detalle.smn_factura_detalle_id,
	${field}
from
	smn_comercial.smn_factura_detalle
where
		smn_comercial.smn_factura_detalle.smn_factura_detalle_id is not null
	${filter}
	
	
