UPDATE smn_comercial.smn_sub_centro_facturacion SET
	smn_centro_facturacion_id=${fld:smn_centro_facturacion_id},
	scf_codigo=${fld:scf_codigo},
	scf_nombre=${fld:scf_nombre},
	scf_estatus=${fld:scf_estatus},
	scf_vigencia=${fld:scf_vigencia},
	scf_idioma='${def:locale}',
	scf_usuario='${def:user}',
	scf_fecha_registro={d '${def:date}'},
	scf_hora='${def:time}'

WHERE
	smn_sub_centro_facturacion_id=${fld:id}

