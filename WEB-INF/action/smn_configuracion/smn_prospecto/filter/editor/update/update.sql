UPDATE smn_comercial.smn_prospecto SET
	pro_codigo=${fld:pro_codigo},
	pro_descripcion=${fld:pro_descripcion},
	pro_email=${fld:pro_email},
	pro_movil=${fld:pro_movil},
	pro_fijo=${fld:pro_fijo},
	pro_referido=${fld:pro_referido},
	pro_estatus=${fld:pro_estatus},
	pro_vigencia=${fld:pro_vigencia},
	pro_idioma='${def:locale}',
	pro_usuario='${def:user}',
	pro_fecha_registro={d '${def:date}'},
	pro_hora='${def:time}',
	smn_direccion_rf=${fld:smn_direccion_rf},
	smn_tipo_contactos_rf=${fld:smn_tipo_contactos_rf},
	pro_descripcion_contacto=${fld:pro_descripcion_contacto}

WHERE
	smn_prospecto_id=${fld:id}

