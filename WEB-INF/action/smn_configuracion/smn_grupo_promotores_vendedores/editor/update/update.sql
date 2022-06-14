UPDATE smn_comercial.smn_grupo_promotores_vendedores SET
	gpv_codigo=${fld:gpv_codigo},
	gpv_descripcion=${fld:gpv_descripcion},
	gpv_estatus=${fld:gpv_estatus},
	gpv_vigencia=${fld:gpv_vigencia},
	gpv_idioma='${def:locale}',
	gpv_usuario='${def:user}',
	gpv_fecha_registro={d '${def:date}'},
	gpv_hora='${def:time}'

WHERE
	smn_grupo_promotores_vendedores_id=${fld:id}

