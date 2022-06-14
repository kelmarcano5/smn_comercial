WITH rw AS (
	select 
	 SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_moneda_local) as prd_monto_moneda_local,
	 SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ml) as prd_monto_neto_ml,
	 SUM(smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna) as prd_moneda_alterna,
	 SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ma) as prd_monto_neto_ma
FROM smn_comercial.smn_presupuesto_detalle WHERE smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id = ${fld:smn_presupuesto_id}
     AND smn_comercial.smn_presupuesto_detalle.smn_servicios_rf = ${fld:smn_servicios_rf} AND smn_comercial.smn_presupuesto_detalle.prd_estatus NOT LIKE '%RZ%' 
          AND smn_comercial.smn_presupuesto_detalle.smn_moneda_rf <> '0'	
)INSERT INTO smn_comercial.smn_ingreso_movimiento
(
	smn_ingresos_mov_id,
	smn_ingreso_id,
	smn_servicios_rf,
	smn_unidades_servicios_rf,
	smn_componente_rf,
	inm_cantidad,
	inm_precio_ml,
	inm_monto_ml,
	inm_precio_ma,
	inm_monto_ma,
	smn_moneda_rf,
	smn_tasa_rf,
	smn_grupo_prestador_servicio_rf,
	smn_prestador_servicio_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	inm_tipo_orden,
	inm_estatus,
	inm_idioma,
	inm_usuario,
	inm_fecha_registro,
	inm_hora
)
SELECT
(nextval('smn_comercial.seq_smn_ingreso_movimiento')),
	(SELECT smn_comercial.smn_presupuesto.smn_ingresos_id from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:smn_presupuesto_id}),
	${fld:smn_servicios_rf},
	(SELECT smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf from smn_base.smn_rel_servicio_area_unidad where smn_base.smn_rel_servicio_area_unidad.smn_servicios_id = ${fld:smn_servicios_rf} limit 1),
	${fld:smn_componentes_rf},
	${fld:prd_cantidad},
	rw.prd_monto_neto_ml,
	rw.prd_monto_moneda_local,
	rw.prd_monto_neto_ma,
	rw.prd_moneda_alterna,
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:smn_grupo_prestador_rf},
	${fld:smn_prestadores_servicios_rf},
	${fld:smn_clase_auxiliar_rf},
	${fld:smn_auxiliar_rf},
	'MA',
	'AC',
	'${def:locale}',
	'${def:user}',
	{d'${def:date}'},
	'${def:time}' from rw