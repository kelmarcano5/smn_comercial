SELECT smn_caja_id  
FROM smn_caja.smn_caja
WHERE smn_entidad_rf = ${fld:smn_entidad_rf} 
	AND smn_sucursal_rf = ${fld:smn_sucursal_rf}  
	AND smn_area_servicio_rf = ${fld:smn_area_servicio_rf}  
	AND smn_unidad_servicio_rf = ${fld:smn_unidad_servicio_rf} 
LIMIT 1;