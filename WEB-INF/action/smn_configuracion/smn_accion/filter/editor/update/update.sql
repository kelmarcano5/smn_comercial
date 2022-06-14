UPDATE smn_comercial.smn_accion SET
	acc_codigo=${fld:acc_codigo},
	acc_descripcion=${fld:acc_descripcion},
	acc_require_seguimiento=${fld:acc_require_seguimiento},
	acc_dias_seguimiento=${fld:acc_dias_seguimiento},
	acc_paso_rf=${fld:acc_paso_rf},
	acc_estatus=${fld:acc_estatus},
	acc_vigencia=${fld:acc_vigencia},
	acc_idioma='${def:locale}',
	acc_usuario='${def:user}',
	acc_fecha_registro={d '${def:date}'},
	acc_hora='${def:time}'

WHERE
	smn_accion_id=${fld:id}

