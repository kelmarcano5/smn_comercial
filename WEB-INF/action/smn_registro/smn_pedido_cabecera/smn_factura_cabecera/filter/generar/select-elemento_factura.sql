SELECT
	CASE
		WHEN fde_naturaleza = 'IT' THEN smn_item_rf
		ELSE smn_servicios_rf
	END AS elemento
FROM
	smn_comercial.smn_factura_detalle
WHERE
	smn_factura_detalle_id = ${fld:smn_factura_detalle_id}