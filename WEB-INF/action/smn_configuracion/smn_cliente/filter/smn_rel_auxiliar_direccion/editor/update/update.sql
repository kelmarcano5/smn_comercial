UPDATE smn_base.smn_rel_auxiliar_direccion SET
	smn_clase_auxiliar_id=${fld:smn_clase_auxiliar_id},
	smn_auxiliar_id=${fld:smn_auxiliar_id},
	smn_direccion_id=${fld:smn_direccion_id},
	rad_tipo_direccion=${fld:rad_tipo_direccion},
	rad_status=${fld:rad_status},
	rad_fecha_vigencia=${fld:rad_fecha_vigencia},
	smn_zona_rf=${fld:smn_zona_rf},
	rad_idioma='${def:locale}',
	rad_usuario='${def:user}',
	rad_fecha_registro={d '${def:date}'},
	rad_hora='${def:time}'

WHERE
	smn_rel_auxiliar_direccion_id=${fld:id}

