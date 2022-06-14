UPDATE smn_comercial.smn_tipo_pedido SET
	tpp_codigo=${fld:tpp_codigo},
	tpp_descripcion=${fld:tpp_descripcion},
	tpp_estatus=${fld:tpp_estatus},
	tpp_fecha_vigencia=${fld:tpp_fecha_vigencia},
	tpp_idioma='${def:locale}',
	tpp_usuario='${def:user}',
	tpp_fecha_registro={d '${def:date}'},
	tpp_hora='${def:time}'

WHERE
	smn_tipo_pedido_id=${fld:id}

