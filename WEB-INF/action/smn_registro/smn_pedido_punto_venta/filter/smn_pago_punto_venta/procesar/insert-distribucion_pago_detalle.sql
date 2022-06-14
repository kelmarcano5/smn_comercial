INSERT INTO smn_caja.smn_dist_pago_detalle
(
	smn_dist_pago_detalle_id,
	smn_mov_caja_cabecera_id,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	smn_rel_pto_venta_mediop_rf,
	smn_forma_pago_rf,
	dpd_numero_doc_forma_pago,
	dpd_numero_autorizacion,
	dpd_documento_pagador,
	dpd_nombre_pagador,
	dpd_monto_por_pagar_ml,
	dpd_monto_del_pago_ml,
	dpd_monto_del_pago_ml_aux,
	mcd_monto_por_pagar_ma,
	dpd_monto_del_pago_ma,
	smn_moneda_rf,
	smn_tasa_rf,
	dpd_observacion,
	smn_deposito_id,
	smn_orden_cobro_id,
	dpd_estatus,
	dpd_idioma,
	dpd_usuario,
	dpd_fecha_registro,
	dpd_hora
)
VALUES
(
	${seq:nextval@smn_caja.seq_smn_dist_pago_detalle},
	${seq:currval@smn_caja.seq_smn_mov_caja_cabecera_id},
	${fld:smn_clase_auxiliar_rf},
	${fld:smn_auxiliar_rf},
	${fld:smn_rel_pto_venta_mediop_rf},
	${fld:smn_forma_pago_rf},
	${fld:dpd_numero_doc_forma_pago},
	${fld:dpd_numero_autorizacion},
	${fld:dpd_documento_pagador},
	${fld:dpd_nombre_pagador},
	${fld:dpd_monto_por_pagar_ml},
	${fld:dpd_monto_del_pago_ml},
	${fld:dpd_monto_del_pago_ml},
	${fld:mcd_monto_por_pagar_ma},
	${fld:dpd_monto_del_pago_ma},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:dpd_observacion},
	${fld:smn_deposito_id},
	${fld:smn_orden_cobro_id},
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

UPDATE smn_caja.smn_mov_caja_cabecera SET
	mcc_saldo_ml_documento = mcc_saldo_ml_documento - ${fld:dpd_monto_del_pago_ml}
WHERE smn_mov_caja_cabecera_id = ${fld:smn_mov_caja_cabecera_id};
