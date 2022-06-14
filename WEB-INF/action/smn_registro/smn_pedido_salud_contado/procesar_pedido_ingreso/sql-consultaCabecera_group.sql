SELECT
	--smn_salud.smn_ingreso_movimiento.smn_ingreso_id as smn_ingresos_id,
	--smn_salud.smn_ingreso_movimiento.smn_servicios_rf,
	 smn_salud.smn_ingreso_movimiento.smn_grupo_prestador_servicio_rf as smn_grupo_prestador_servicio_rf,
	smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf,
	case 
		when smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf is null then 0 else  smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf
	end as smn_prestador_servicio_rf,
	${fld:smn_ingresos_id} as smn_ingresos_id

FROM
	smn_salud.smn_ingreso_movimiento
WHERE
	smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:smn_ingresos_id} --and smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf = 12 --AND smn_base.smn_componentes.cmp_grupo_prestador IS NOT NULL
--ORDER BY smn_salud.smn_ingreso_movimiento.smn_servicios_rf ASC
GROUP BY smn_salud.smn_ingreso_movimiento.smn_ingreso_id, smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf, smn_salud.smn_ingreso_movimiento.smn_grupo_prestador_servicio_rf, smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf