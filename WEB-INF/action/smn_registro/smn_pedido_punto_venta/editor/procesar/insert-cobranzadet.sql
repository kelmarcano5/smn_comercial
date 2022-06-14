INSERT INTO smn_cobranzas.smn_mov_documento_cob_detalle
(
	smn_mov_documento_cob_det_id,
	smn_mov_documento_cob_cab_id,
	smn_tipo_documento_id,
	smn_documento_id,
	mdd_numero_documento,
	smn_cliente_rf,
	smn_centro_costo_rf,
	mdd_monto_ml,
	smn_moneda_rf,
	mdd_monto_ma,
	mdd_fecha_pago,
	smn_tasa_rf,
	mdd_diferencia_cambiario,
	mdd_idioma,
	mdd_usuario,
	mdd_fecha_registro,
	mdd_hora,
	mdd_saldo_ml
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_mov_documento_cob_detalle},
	(select smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id from smn_cobranzas.smn_mov_documento_cob_detalle
	inner join smn_cobranzas.smn_mov_documento_cob_cab on smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id
	where smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen=${fld:mdd_numero_documento}),
	'NC',
	${fld:smn_documento_id},
	${fld:mdd_numero_documento},
	${fld:smn_cliente_rf},
	${fld:smn_centro_costo_rf},
	${fld:mdd_monto_ml},
	${fld:smn_moneda_rf},
	${fld:mdd_monto_ma},
	${fld:mdd_fecha_pago},
	${fld:smn_tasa_rf},
	${fld:mdd_diferencia_cambiario},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:mdd_monto_ml}
)
