UPDATE smn_comercial.smn_sub_centro_facturacion SET
	smn_rol_id=${fld:smn_rol_id},
	smn_usuario_rf=${fld:smn_usuario_rf},
	smn_corporacion_rf=${fld:smn_corporacion_rf},
	scf_estatus=${fld:scf_estatus},
	scf_vigencia={d '${def:date}'},
	scf_idioma='${def:locale}',
	scf_usuario='${def:user}',
	scf_fecha_registro={d '${def:date}'},
	scf_hora='${def:time}'

WHERE
	smn_sub_centro_facturacion_id=${fld:id}

