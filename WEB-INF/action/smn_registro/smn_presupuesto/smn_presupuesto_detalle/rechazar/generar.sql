UPDATE smn_control_acceso.smn_justificaciones SET
	jus_estatus_rf='NAP'

WHERE
	smn_justificaciones_id=${fld:id}