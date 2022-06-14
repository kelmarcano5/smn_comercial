INSERT INTO smn_comercial.smn_factura_cabecera
(
	smn_factura_cabecera_id,
	smn_documento_id,
	fca_numero_documento_id,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_pedido_cabecera_id,
	smn_oferta_id,
	smn_caja_rf,
	smn_cliente_id,
	smn_control_serie_fiscal_id,
	fca_numero_control_fiscal,
	fca_rif,
	fca_direccion_fiscal,
	smn_centro_facturacion_id,
	smn_tipo_linea_comercial_id,
	smn_linea_comercial_id,
	fca_monto_factura_ml,
	fca_monto_impuesto_ml,
	fca_monto_descuento_ml,
	fca_monto_bonificacion_ml,
	fca_monto_neto_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	fca_monto_factura_ma,
	fca_monto_impuesto_ma,
	fca_monto_descuento_ma,
	fca_monto_bonificacion_ma,
	fca_monto_neto_ma,
	fca_estatus_financiero,
	fca_estatus_proceso,
	fca_idioma,
	fca_usuario,
	fca_fecha_registro,
	fca_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_factura_cabecera},
	${fld:smn_documento_id},
	${fld:fca_numero_documento_id},
	${fld:smn_entidad_rf},
	${fld:smn_sucursal_rf},
	${fld:smn_pedido_cabecera_id},
	${fld:smn_oferta_id},
	${fld:smn_caja_rf},
	${fld:smn_cliente_id},
	${fld:smn_control_serie_fiscal_id},
	${fld:fca_numero_control_fiscal},
	${fld:fca_rif},
	${fld:fca_direccion_fiscal},
	${fld:smn_centro_facturacion_id},
	${fld:smn_tipo_linea_comercial_id},
	${fld:smn_linea_comercial_id},
	${fld:fca_monto_factura_ml},
	${fld:fca_monto_impuesto_ml},
	${fld:fca_monto_descuento_ml},
	${fld:fca_monto_bonificacion_ml},
	${fld:fca_monto_neto_ml},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:fca_monto_factura_ma},
	${fld:fca_monto_impuesto_ma},
	${fld:fca_monto_descuento_ma},
	${fld:fca_monto_bonificacion_ma},
	${fld:fca_monto_neto_ma},
	${fld:fca_estatus_financiero},
	${fld:fca_estatus_proceso},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)