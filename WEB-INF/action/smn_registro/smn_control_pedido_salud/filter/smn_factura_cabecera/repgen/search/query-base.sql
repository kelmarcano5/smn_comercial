select
		smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id,
	${field}
from
	smn_comercial.smn_factura_cabecera
where
		smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id is not null
	${filter}
	
	
