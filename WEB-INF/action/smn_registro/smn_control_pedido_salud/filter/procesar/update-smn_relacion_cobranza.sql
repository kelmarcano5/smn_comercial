UPDATE smn_cobranzas.smn_relacion_cobranza SET
	rco_estatus_proceso='PR'
WHERE
	smn_relacion_cobranza_id=${fld:id}