UPDATE smn_comercial.smn_metas SET
	smn_tipo_documento_id=${fld:smn_tipo_documento_id},
	smn_documento_id=${fld:smn_documento_id},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_rol_id=${fld:smn_rol_id},
	smn_usuario_rf=${fld:smn_usuario_rf},
	met_fecha_desde=${fld:met_fecha_desde},
	met_fecha_hasta=${fld:met_fecha_hasta},
	met_dias_habiles=${fld:met_dias_habiles},
	met_fecha_estadistica={d '${def:date}'},
	met_cantidad_diaria=${fld:met_cantidad_diaria},
	met_cantidad_usuario=${fld:met_cantidad_usuario},
	met_estatus=${fld:met_estatus},
	met_idioma='${def:locale}',
	met_usuario='${def:user}',
	met_fecha_registro={d '${def:date}'},
	met_hora='${def:time}'

WHERE
	smn_metas_id=${fld:id}

