UPDATE smn_comercial.smn_ingreso_movimiento
	SET 
	inm_estatus = 'AC'
WHERE smn_ingresos_mov_id = ${fld:smn_ingresos_mov_id};

UPDATE smn_comercial.smn_ingresos
   SET (igs_monto_moneda_local,  igs_monto_moneda_alterna)=
(SELECT igs_monto_moneda_local - inm_monto_ml, igs_monto_moneda_alterna - inm_monto_ma FROM smn_comercial.smn_ingreso_movimiento WHERE smn_ingresos_mov_id = ${fld:smn_ingresos_mov_id} and smn_ingreso_id =${fld:smn_ingreso_id} and inm_estatus = 'AC')
 WHERE smn_ingresos_id = ${fld:smn_ingreso_id} and 
 	igs_estatus_financiero = 'PE'