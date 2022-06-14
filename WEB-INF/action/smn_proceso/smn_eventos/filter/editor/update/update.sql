UPDATE smn_comercial.smn_evento SET
	eve_codigo=${fld:eve_codigo},
	eve_descripcion_corta=${fld:eve_descripcion_corta},
	eve_descripcion_larga=${fld:eve_descripcion_larga},
	smn_servicios_rf=${fld:smn_servicios_rf},
	eve_fecha_inicial=${fld:eve_fecha_inicial},
	eve_fecha_final=${fld:eve_fecha_final},
	eve_hora_inicial=${fld:eve_hora_inicial},
	eve_hora_final=${fld:eve_hora_final},
	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf},
	smn_clasificacion_abc_rf=${fld:smn_clasificacion_abc_rf},
	eve_cupo=${fld:eve_cupo},
	eve_reservas_por_afiliado=${fld:eve_reservas_por_afiliado},
	eve_estatus=${fld:eve_estatus},
	eve_idioma='${def:locale}',
	eve_usuario='${def:user}',
	eve_fecha_registro={d '${def:date}'},
	eve_hora='${def:time}'

WHERE
	smn_evento_id=${fld:id}

