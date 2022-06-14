UPDATE smn_base.smn_rel_aux_sucursal SET
	smn_auxiliar_id=${fld:smn_auxiliar_id},
	smn_auxiliar_sucursal_id=${fld:smn_auxiliar_sucursal_id}

WHERE
	smn_rel_aux_sucursal_id=${fld:id}

