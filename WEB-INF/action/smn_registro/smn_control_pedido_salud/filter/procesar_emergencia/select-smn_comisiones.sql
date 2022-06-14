SELECT
	com_numero_documento+1 AS com_numero_documento
FROM
	smn_cobranzas.smn_comisiones
ORDER BY com_numero_documento DESC LIMIT 1