UPDATE smn_comercial.smn_accion_gestion_cliente SET
	smn_rel_oferta_cliente_id=${fld:smn_rel_oferta_cliente_id},
	smn_accion_id=${fld:smn_accion_id},
	ago_estatus_proceso=${fld:ago_estatus_proceso},
	ago_fecha_seguimiento=${fld:ago_fecha_seguimiento},
	ago_fecha_aprobacion=${fld:ago_fecha_aprobacion},
	ago_fecha_vigencia_desde=${fld:ago_fecha_vigencia_desde},
	ago_fecha_vigencia_hasta=${fld:ago_fecha_vigencia_hasta},
	ago_fecha_cierre=${fld:ago_fecha_cierre},
	ago_idioma='${def:locale}',
	ago_usuario='${def:user}',
	ago_fecha_registro={d '${def:date}'},
	ago_hora='${def:time}'

WHERE
	smn_accion_gestion_cliente_id=${fld:id}

