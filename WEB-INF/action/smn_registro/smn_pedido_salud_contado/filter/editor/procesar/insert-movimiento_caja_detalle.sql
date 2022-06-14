INSERT INTO smn_caja.smn_mov_caja_detalle
(
	smn_mov_caja_detalle_id,
	smn_mov_caja_cabecera_id,
	mcd_tipo_producto,
	smn_id_rf,
	mcd_monto_por_pagar_ml,
	mcd_saldo_pago_ml,
	mcd_monto_por_pagar_ma,
	mcd_saldo_pago_ma,
	smn_moneda_rf,
	smn_tasa_rf,
	mcd_idioma,
	mcd_usuario,
	mcd_fecha_registro,
	mcd_hora
)
VALUES
(
	${seq:currval@smn_caja.seq_smn_mov_caja_detalle},
	${seq:currval@smn_caja.seq_smn_mov_caja_cabecera_id},
	${fld:mcd_tipo_producto},
	${fld:smn_id_rf},
	${fld:mcd_monto_por_pagar_ml},
	${fld:mcd_saldo_pago_ml},
	${fld:mcd_monto_por_pagar_ma},
	${fld:mcd_saldo_pago_ma},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

UPDATE smn_caja.smn_mov_caja_cabecera SET
	mcc_monto_ml_documento = mcc_monto_ml_documento + ${fld:mcd_monto_por_pagar_ml},
	mcc_saldo_ml_documento = mcc_saldo_ml_documento + ${fld:mcd_saldo_pago_ml},
	mcc_monto_ma_documento = mcc_monto_ma_documento + ${fld:mcd_monto_por_pagar_ma},
	mcc_saldo_ma_documento = mcc_saldo_ma_documento + ${fld:mcd_saldo_pago_ma}

WHERE
	smn_mov_caja_cabecera_id=${fld:smn_mov_caja_cabecera_id};
