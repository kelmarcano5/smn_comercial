INSERT INTO smn_cobranzas.smn_mov_documento_cob_cab
(
	smn_mov_documento_cob_cab_id,
	smn_modulo_origen_rf,
	smn_documento_rf,
	mdc_numero_doc_origen,
	smn_cliente_rf,
	mdc_fecha_documento,
	mdc_fecha_vencimiento,
	mdc_monto_ml,
	smn_moneda_rf,
	mdc_monto_ma,
	mdc_saldo_doc_ml,
	mdc_saldo_doc_ma,
	mdc_estatus_proceso,
	mdc_estatus_financiero,
	mdc_idioma,
	mdc_usuario,
	mdc_fecha_registro,
	mdc_hora,
	smn_entidad_rf,
	smn_sucursal_rf,
	mdc_dias_vencidos,
	smn_documento_id,
	smn_promotor_rf
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_mov_documento_cob_cab},
	(select smn_base.smn_modulos.smn_modulos_id from smn_base.smn_modulos where smn_base.smn_modulos.mod_codigo='SMN_CME'),
	${fld:smn_documento_id},
	${fld:mdd_numero_documento},
	${fld:smn_cliente_rf},
	${fld:mdc_fecha_documento},
	${fld:mdc_fecha_vencimiento},
	${fld:mdc_monto_ml},
	${fld:smn_moneda_rf},
	${fld:mdc_monto_ma},
	${fld:mdc_saldo_doc_ml},
	${fld:mdc_saldo_doc_ma},
	'GE',
	'PE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:entidad},
	${fld:sucursal},
	${fld:dias_vencidos},
	(select smn_cobranzas.smn_documento.smn_documento_id from smn_cobranzas.smn_documento where smn_cobranzas.smn_documento.smn_documento_general_rf=(select smn_comercial.smn_documento.smn_documentos_generales_rf from smn_comercial.smn_documento where smn_comercial.smn_documento.smn_documento_id = ${fld:smn_documento_id})),
	${fld:smn_promotor_rf}

)
RETURNING smn_mov_documento_cob_cab_id;

