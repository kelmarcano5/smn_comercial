UPDATE smn_comercial.smn_cliente SET
	smn_clasificacion_cliente_id=${fld:smn_clasificacion_cliente_id},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_clasificacion_abc_rf=${fld:smn_clasificacion_abc_rf},
	smn_sector_economico_rf=${fld:smn_sector_economico_rf},
	cli_nacional_ext=${fld:cli_nacional_ext},
	cli_vigencia='${def:date}',
	cli_estatus=${fld:cli_estatus},
	cli_idioma='${def:locale}',
	cli_usuario='${def:user}',
	cli_fecha_registro='${def:date}',
	cli_hora='${def:time}',
	smn_forma_pago_rf=${fld:smn_forma_pago_rf},
	smn_condicion_financiera_rf=${fld:smn_condicion_financiera_rf},
	smn_promotor_rf=${fld:smn_promotor_rf}

WHERE
	smn_cliente_id=${fld:id}

