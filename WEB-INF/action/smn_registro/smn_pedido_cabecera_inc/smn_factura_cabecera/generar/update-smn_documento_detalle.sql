UPDATE
	smn_cont_financiera.smn_documento_detalle
SET
	dod_monto_ml = ${fld:total_monto_ml},
	dod_monto_ma = ${fld:total_monto_ma}
WHERE
	smn_documento_detalle_id = ${fld:smn_documento_detalle_id}