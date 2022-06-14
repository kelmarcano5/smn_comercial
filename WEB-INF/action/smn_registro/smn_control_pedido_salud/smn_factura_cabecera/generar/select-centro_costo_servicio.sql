SELECT
	smn_centro_costo_rf
FROM
	smn_base.smn_rel_servicio_area_unidad
WHERE
	smn_servicios_id = ${fld:smn_elemento_id}
AND
	smn_areas_servicios_rf = ${fld:smn_areas_servicios_rf}
AND	
	smn_unidades_servicios_rf = ${fld:smn_unidades_servicios_rf}
	