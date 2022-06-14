UPDATE smn_comercial.smn_categoria_item SET
	cai_codigo=${fld:cai_codigo},
	cai_descripcion=${fld:cai_descripcion},
	cai_estatus=${fld:cai_estatus},
	cai_fecha_vigencia={d '${def:date}'},
	cai_idioma='${def:locale}',
	cai_usuario='${def:user}',
	cai_fecha_registro={d '${def:date}'},
	cai_hora='${def:time}'

WHERE
	smn_categoria_item_id=${fld:id}

