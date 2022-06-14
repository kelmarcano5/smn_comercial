UPDATE smn_comercial.smn_rel_oferta_cliente SET
	smn_oferta_id=${fld:smn_oferta_id},
	smn_cliente_id=${fld:smn_cliente_id},
	roc_estatus_proceso=${fld:roc_estatus_proceso},
	roc_fecha_aprobacion=${fld:roc_fecha_aprobacion},
	roc_fecha_vigencia_desde={d '${def:date}'},
	roc_fecha_vigencia_hasta={d '${def:date}'}
	roc_fecha_cierre=${fld:roc_fecha_cierre},
	roc_idioma='${def:locale}',
	roc_usuario='${def:user}',
	roc_fecha_registro={d '${def:date}'},
	roc_hora='${def:time}'

WHERE
	smn_rel_oferta_cliente_id=${fld:id}

