UPDATE smn_comercial.smn_factura_cabecera SET
	smn_documento_id=${fld:smn_documento_id},
	fca_numero_documento_id=${fld:fca_numero_documento_id},
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_control_serie_fiscal_id=${fld:smn_control_serie_fiscal_id},
	fca_numero_control_fiscal=${fld:fca_numero_control_fiscal},
	fca_rif=${fld:fca_rif},
	fca_direccion_fiscal=${fld:fca_direccion_fiscal},
	fca_monto_factura_ml=${fld:fca_monto_factura_ml},
	fca_monto_impuesto_ml=${fld:fca_monto_impuesto_ml},
	fca_monto_descuento_ml=${fld:fca_monto_descuento_ml},
	fca_monto_bonificacion_ml=${fld:fca_monto_bonificacion_ml},
	fca_monto_neto_ml=${fld:fca_monto_neto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	fca_monto_factura_ma=${fld:fca_monto_factura_ma},
	fca_monto_impuesto_ma=${fld:fca_monto_impuesto_ma},
	fca_monto_descuento_ma=${fld:fca_monto_descuento_ma},
	fca_monto_bonificacion_ma=${fld:fca_monto_bonificacion_ma},
	fca_monto_neto_ma=${fld:fca_monto_neto_ma},
	fca_estatus_financiero=${fld:fca_estatus_financiero},
	fca_estatus_proceso=${fld:fca_estatus_proceso},
	fca_idioma='${def:locale}',
	fca_usuario='${def:user}',
	fca_fecha_registro={d '${def:date}'},
	fca_hora='${def:time}'

WHERE
	smn_factura_cabecera_id=${fld:id}

