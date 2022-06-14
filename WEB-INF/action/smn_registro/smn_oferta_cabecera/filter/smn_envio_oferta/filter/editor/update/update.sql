UPDATE smn_comercial.smn_envio_oferta SET
	smn_oferta_id=${fld:smn_oferta_id},
	eof_fecha_envio=${fld:eof_fecha_envio},
	eof_fecha_cierre=${fld:eof_fecha_cierre},
	smn_clasificacion_cliente_id=${fld:smn_clasificacion_cliente_id},
	smn_clientes_area_interes_id=${fld:smn_clientes_area_interes_id},
	smn_tipo_contactos_rf=${fld:smn_tipo_contactos_rf},
	eof_descripcion=${fld:eof_descripcion},
	eof_idioma='${def:locale}',
	eof_usuario='${def:user}',
	eof_fecha_registro={d '${def:date}'},
	eof_hora='${def:time}'

WHERE
	smn_envio_oferta_id=${fld:id}

