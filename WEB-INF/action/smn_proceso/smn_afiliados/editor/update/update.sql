UPDATE smn_comercial.smn_afiliados SET
	afi_auxiliar_rf=${fld:afi_auxiliar_rf},
	afi_fecha_inicio=${fld:afi_fecha_inicio},
	afi_fecha_final=${fld:afi_fecha_final},
	afi_fecha_desafiliacion=${fld:afi_fecha_desafiliacion},
	smn_rol_id=${fld:smn_rol_id},
	smn_servicio_id=${fld:smn_servicio_id},
	afi_estatus=${fld:afi_estatus},
	afi_idioma='${def:locale}',
	afi_usuario='${def:user}',
	afi_fecha_registro={d '${def:date}'},
	afi_hora='${def:time}'

WHERE
	smn_afiliados_id=${fld:id}

