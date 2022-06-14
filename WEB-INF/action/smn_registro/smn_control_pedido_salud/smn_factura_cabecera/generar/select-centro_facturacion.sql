SELECT
	smn_areas_servicios_rf,
	smn_unidades_servicios_rf
FROM
	smn_comercial.smn_centro_facturacion
WHERE
	smn_centro_facturacion_id = ${fld:smn_centro_facturacion_id}