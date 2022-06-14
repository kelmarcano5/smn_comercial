UPDATE smn_base.smn_auxiliar_persona_contacto SET
	apc_apellidos=${fld:apc_apellidos},
	apc_nombres=${fld:apc_nombres},
	apc_telefono_contacto=${fld:apc_telefono_contacto},
	apc_email=${fld:apc_email},
	apc_direccion=${fld:apc_direccion},
	apc_idioma='${def:locale}',
	apc_usuario='${def:user}',
	apc_fecha_registro={d '${def:date}'},
	apc_hora='${def:time}'

WHERE
	smn_auxiliar_rf=${fld:id}

