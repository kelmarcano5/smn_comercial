UPDATE smn_comercial.smn_rel_centro_fac_linea SET
	smn_centro_facturacion_id=${fld:smn_centro_facturacion_id},
	smn_linea_comercial_id=${fld:smn_linea_comercial_id}

WHERE
	smn_rel_centro_fac_linea_id=${fld:id}

