UPDATE smn_comercial.smn_ingresos
   SET igs_monto_moneda_local = igs_monto_moneda_local + ${fld:smn_precio_neto_ml_servicio},
   	   igs_monto_moneda_alterna = igs_monto_moneda_alterna + ${fld:smn_precio_neto_ma_servicio},
   	   smn_moneda_rf = ${fld:smn_moneda_alterna}
 WHERE smn_ingresos_id = ${fld:id_ingreso} and 
 	igs_estatus_financiero = 'PE' and 
 	smn_ingresos_id = (SELECT smn_ingreso_id FROM smn_comercial.smn_ingreso_movimiento WHERE smn_ingresos_mov_id = ${fld:id_detalle} and inm_estatus = 'AC');
 
UPDATE smn_comercial.smn_ingreso_movimiento
	SET 
	inm_cantidad = ${fld:cantidad},
	inm_precio_ml =  ${fld:smn_precio_neto_ml_servicio},
	inm_monto_ml =  ${fld:inm_monto_ml},
	inm_precio_ma =  ${fld:smn_precio_neto_ma_servicio},
	inm_monto_ma = ${fld:inm_monto_ma},
	smn_moneda_rf = ${fld:smn_moneda_alterna},
	smn_tasa_rf = ${fld:smn_tasas_de_cambio_id},
	inm_estatus = 'PR'
WHERE smn_ingresos_mov_id = ${fld:id_detalle}