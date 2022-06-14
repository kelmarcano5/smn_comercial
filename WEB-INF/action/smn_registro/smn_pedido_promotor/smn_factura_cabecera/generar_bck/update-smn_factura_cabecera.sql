UPDATE 
	smn_comercial.smn_factura_cabecera
SET
	fca_estatus_proceso = 'GE'
WHERE
	smn_factura_cabecera_id = ${fld:smn_factura_id}

RETURNING smn_factura_cabecera_id;