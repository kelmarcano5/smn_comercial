UPDATE smn_base.smn_usuarios SET
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	usr_idioma='${def:locale}',
	usr_usuario='${def:user}',
	usr_fecha_registro={d '${def:date}'},
	usr_hora='${def:time}',
	smn_tipo_registro_rf = ${fld:smn_tipo_registro_rf}
where 
	smn_base.smn_usuarios.smn_user_rf=${fld:smn_user_rf}



