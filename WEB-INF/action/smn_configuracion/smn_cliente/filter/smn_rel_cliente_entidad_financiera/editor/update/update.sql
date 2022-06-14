UPDATE smn_comercial.smn_rel_cliente_entidad_financiera SET
	smn_cliente_id=${fld:smn_cliente_id},
	smn_entidad_financiera_rf=${fld:smn_entidad_financiera_rf},
	smn_tipo_cuenta_banco_rf=${fld:smn_tipo_cuenta_banco_rf},
	cef_numero_cuenta=${fld:cef_numero_cuenta},
	cef_estatus=${fld:cef_estatus},
	cef_vigencia=${fld:cef_vigencia},
	cef_idioma='${def:locale}',
	cef_usuario='${def:user}',
	cef_fecha_registro={d '${def:date}'},
	cef_hora='${def:time}'

WHERE
	smn_rel_cliente_entidad_financiera_id=${fld:id}

