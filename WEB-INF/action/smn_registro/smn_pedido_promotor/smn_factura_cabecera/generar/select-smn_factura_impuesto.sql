SELECT
	fid_monto_base_ml,
	smn_codigos_impuestos_rf,
	fid_porcentaje_impuesto,
	fid_monto_impuesto,
	fid_monto_sustraendo,
	smn_moneda_rf,
	smn_tasa_rf,
	fid_monto_imp_moneda_alterna
FROM
	smn_comercial.smn_factura_impuesto_deducc
WHERE
	smn_factura_detalle_id = ${fld:smn_factura_detalle_id}
