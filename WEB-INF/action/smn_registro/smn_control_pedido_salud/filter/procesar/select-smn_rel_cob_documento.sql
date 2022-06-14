SELECT
	smn_cobranzas.smn_tipo_documento.tdo_tipo_movimiento,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_financiero,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_proceso,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_dias_vencidos,
	smn_cobranzas.smn_mov_documento_cob_cab.smn_promotor_rf,
	smn_cobranzas.smn_mov_documento_cob_cab.smn_rol_id,
	smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_saldo_doc_ma,
	smn_cobranzas.smn_mov_documento_cob_cab.smn_documento_id,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_monto_ml,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_monto_ma,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_monto_descuento_ml,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_monto_descuento_ma,
	smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id
FROM
	smn_cobranzas.smn_relacion_cobranza
INNER JOIN
	smn_cobranzas.smn_mov_documento_cob_detalle ON smn_cobranzas.smn_mov_documento_cob_detalle.mdd_numero_documento=smn_cobranzas.smn_relacion_cobranza.rco_numero_documento
INNER JOIN
	smn_cobranzas.smn_mov_documento_cob_cab ON smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id
INNER JOIN
	smn_cobranzas.smn_documento ON smn_cobranzas.smn_documento.smn_documento_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_documento_id
INNER JOIN
	smn_cobranzas.smn_tipo_documento ON smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id=smn_cobranzas.smn_documento.smn_tipo_documento_id
WHERE
	smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id=${fld:smn_mov_documento_cob_cab_id}
AND
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_proceso IN ('EP','AB')