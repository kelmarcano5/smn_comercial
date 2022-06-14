UPDATE smn_comercial.smn_clasificacion_cliente SET
	ccl_codigo=${fld:ccl_codigo},
	ccl_descripcion=${fld:ccl_descripcion},
	ccl_vigencia=${fld:ccl_vigencia},
	ccl_estatus=${fld:ccl_estatus},
	ccl_idioma='${def:locale}',
	ccl_usuario='${def:user}',
	ccl_fecha_registro={d '${def:date}'},
	ccl_hora='${def:time}'

WHERE
	smn_clasificacion_cliente_id=${fld:id}

