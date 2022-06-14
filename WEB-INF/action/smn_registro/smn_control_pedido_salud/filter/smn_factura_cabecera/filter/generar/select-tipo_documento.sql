SELECT
	smn_tipo_documento_id
FROM
	smn_cont_financiera.smn_rel_modulo_documento_tipo_doc
WHERE
	smn_modulos_rf = ${fld:smn_modulo_rf}
AND
	smn_documentos_generales_rf = ${fld:smn_documentos_generales_rf}
	