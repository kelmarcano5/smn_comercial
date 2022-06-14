select
		smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id,
	${field}
from
	smn_comercial.smn_centro_facturacion
where
		smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id is not null
	${filter}
	
	
