SELECT
	mcc_tipo_comp
FROM
	smn_cont_financiera.smn_modelo_comprobante
WHERE
	mcc_modulo = ${fld:smn_modulo_rf}
AND
	mcc_documento = (
		SELECT
			smn_rel_modulo_documento_tipo_doc_id
		FROM
			smn_cont_financiera.smn_rel_modulo_documento_tipo_doc
		WHERE
			smn_modulos_rf = ${fld:smn_modulo_rf}
		AND
			smn_documentos_generales_rf = ${fld:smn_documentos_generales_rf}
	)
	
	