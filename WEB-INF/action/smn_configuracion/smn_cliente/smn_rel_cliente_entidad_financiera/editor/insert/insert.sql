INSERT INTO smn_comercial.smn_rel_cliente_entidad_financiera
(
	smn_rel_cliente_entidad_financiera_id,
	smn_cliente_id,
	smn_entidad_financiera_rf,
	smn_tipo_cuenta_banco_rf,
	cef_numero_cuenta,
	cef_estatus,
	cef_vigencia,
	cef_idioma,
	cef_usuario,
	cef_fecha_registro,
	cef_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_rel_cliente_entidad_financiera},
	${fld:smn_cliente_id},
	${fld:smn_entidad_financiera_rf},
	${fld:smn_tipo_cuenta_banco_rf},
	${fld:cef_numero_cuenta},
	${fld:cef_estatus},
	${fld:cef_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
