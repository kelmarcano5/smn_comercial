insert into smn_base.smn_usuarios
(
	smn_usuarios_id,
	smn_user_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	usr_idioma,
	usr_usuario,
	usr_fecha_registro,
	usr_hora,
	smn_tipo_registro_rf
)
values 
(
	${seq:currval@smn_base.seq_smn_usuarios},
	${seq:currval@${schema}seq_user},
	${fld:smn_clase_auxiliar_rf},
	${fld:id3},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_tipo_registro_rf}
)


