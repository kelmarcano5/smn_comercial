UPDATE smn_comercial.smn_rel_documento_entidad SET
	smn_documento_id=${fld:smn_documento_id},
	smn_entidades_rf=${fld:smn_entidades_rf}

WHERE
	smn_rel_documento_entidad_id=${fld:id}

