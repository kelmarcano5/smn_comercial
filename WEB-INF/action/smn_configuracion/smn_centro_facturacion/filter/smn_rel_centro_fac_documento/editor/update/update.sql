UPDATE smn_comercial.smn_rel_centro_fac_documento SET
	smn_centro_facturacion_id=${fld:smn_centro_facturacion_id},
	smn_documento_id=${fld:smn_documento_id}

WHERE
	smn_rel_centro_fac_documento_id=${fld:id}

