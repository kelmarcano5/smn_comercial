update smn_base.smn_auxiliar_contacto set
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_tipo_contactos_rf='2',
	auc_descripcion=${fld:auc_descripcion},
	auc_idioma='${def:locale}',
	auc_usuario='${def:user}',
	auc_fecha_registro={d '${def:date}'},
	auc_hora='${def:time}'
WHERE smn_base.smn_auxiliar_contacto.smn_auxiliar_rf=${fld:id} and smn_base.smn_auxiliar_contacto.smn_tipo_contactos_rf='2'