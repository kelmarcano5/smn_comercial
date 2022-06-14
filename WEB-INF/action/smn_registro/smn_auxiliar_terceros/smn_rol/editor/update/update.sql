UPDATE smn_entrega.smn_rol SET
	smn_usuario_rf=${fld:smn_usuario_rf},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	rol_tipo=${fld:rol_tipo},
	smn_corporacion_rf=${fld:smn_corporacion_rf},
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_posicion_estructura_rf=${fld:smn_posicion_estructura_rf},
	rol_estatus=${fld:rol_estatus},
	rol_vigencia=${fld:rol_vigencia},
	rol_idioma='${def:locale}',
	rol_usuario='${def:user}',
	rol_fecha_registro={d '${def:date}'},
	rol_hora='${def:time}'

WHERE
	smn_rol_id=${fld:id}

