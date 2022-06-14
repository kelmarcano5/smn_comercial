SELECT
	*
FROM
	smn_comercial.smn_factura_cabecera
WHERE
	smn_factura_cabecera_id = ${fld:smn_factura_id}
AND
	fca_estatus_proceso = 'RE'