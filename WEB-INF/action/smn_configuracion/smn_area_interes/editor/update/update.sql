UPDATE smn_comercial.smn_area_interes SET
	ari_codigo=${fld:ari_codigo},
	ari_descripcion=${fld:ari_descripcion},
	ari_vigencia=${fld:ari_vigencia},
	ari_estatus=${fld:ari_estatus},
	ari_idioma='${def:locale}',
	ari_usuario='${def:user}',
	ari_fecha_registro={d '${def:date}'},
	ari_hora='${def:time}'

WHERE
	smn_area_interes_id=${fld:id}

