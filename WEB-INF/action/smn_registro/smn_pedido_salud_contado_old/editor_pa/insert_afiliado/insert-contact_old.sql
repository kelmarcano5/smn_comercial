INSERT INTO smn_base.smn_auxiliar_contacto
(
	smn_auxiliar_contacto_id,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	smn_tipo_contactos_rf,
	auc_descripcion,
	auc_idioma,
	auc_usuario,
	auc_fecha_registro,
	auc_hora
)
VALUES
(
	${seq:nextval@smn_base.seq_smn_auxiliar_contacto},
	${fld:smn_clase_auxiliar_rf},
	${seq:currval@smn_base.seq_smn_auxiliar},
	${fld:smn_tipo_contactos_rf},
	${fld:auc_descripcion},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
