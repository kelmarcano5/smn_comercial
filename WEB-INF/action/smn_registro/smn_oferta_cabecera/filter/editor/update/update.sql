UPDATE smn_comercial.smn_oferta_cabecera SET
	smn_documento_id=${fld:smn_documento_id},
	ofe_numero_documento=${fld:ofe_numero_documento},
	ofe_descripcion=${fld:ofe_descripcion},
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	ofe_fecha_desde=${fld:ofe_fecha_desde},
	ofe_fecha_hasta=${fld:ofe_fecha_hasta},
	ofe_observaciones=${fld:ofe_observaciones},
	ofe_estatus=${fld:ofe_estatus},
	ofe_idioma='${def:locale}',
	ofe_usuario='${def:user}',
	ofe_fecha_registro={d '${def:date}'},
	ofe_hora='${def:time}'

WHERE
	smn_oferta_cabecera_id=${fld:id}

