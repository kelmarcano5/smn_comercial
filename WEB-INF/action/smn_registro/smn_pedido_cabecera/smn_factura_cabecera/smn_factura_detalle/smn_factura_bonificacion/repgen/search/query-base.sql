select
		smn_comercial.smn_factura_bonificacion.smn_factura_bonificacion_id,
	${field}
from
	smn_comercial.smn_factura_bonificacion
where
		smn_comercial.smn_factura_bonificacion.smn_factura_bonificacion_id is not null
	${filter}
	
	
