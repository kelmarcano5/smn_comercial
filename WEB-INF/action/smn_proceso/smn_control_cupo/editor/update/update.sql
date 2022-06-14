UPDATE smn_comercial.smn_control_cupo SET
	smn_evento_id=${fld:smn_evento_id},
	ccu_cupo=${fld:ccu_cupo},
	ccu_reservas=${fld:ccu_reservas},
	ccu_saldo=${fld:ccu_saldo},
	ccu_estatus=${fld:ccu_estatus},
	ccu_idioma='${def:locale}',
	ccu_usuario='${def:user}',
	ccu_fecha_registro={d '${def:date}'},
	ccu_hora='${def:time}'

WHERE
	smn_control_cupo_id=${fld:id}

