SELECT
	CASE
		WHEN smn_item_rf IS NULL THEN smn_servicio_rf
		ELSE smn_item_rf
	END AS elemento
FROM
	smn_base.smn_componentes
WHERE
	smn_componentes_id = ${fld:smn_componente_rf}
	