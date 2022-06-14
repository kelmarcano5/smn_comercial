SELECT
	smn_caja.smn_caja.smn_auxiliar_rf
FROM
	smn_caja.smn_caja
INNER JOIN
	smn_comercial.smn_factura_cabecera
ON
	smn_caja.smn_caja.smn_caja_id = smn_comercial.smn_factura_cabecera.smn_caja_rf
WHERE
	smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id = ${fld:smn_factura_id}