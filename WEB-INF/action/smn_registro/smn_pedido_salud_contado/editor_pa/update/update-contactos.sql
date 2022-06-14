UPDATE smn_base.smn_auxiliar_contacto SET
	cnt_nombres=${fld:cnt_nombres},
	cnt_apellidos=${fld:cnt_apellidos},
	cnt_email=${fld:cnt_email},
	cnt_idioma='${def:locale}',
	cnt_usuario='${def:user}',
	cnt_fecha_registro={d '${def:date}'},
	cnt_hora='${def:time}',
	smn_auxiliar_id=${fld:smn_auxiliar_id},
	smn_tipo_contactos_rf=${fld:smn_tipo_contactos_rf},
	cnt_descripcion=${fld:cnt_descripcion},
	smn_tipo_contactos_rf1=${fld:smn_tipo_contactos_rf1},
	cnt_descripcion1=${fld:cnt_descripcion1},
	cnt_telefono_contacto=${fld:cnt_telefono_contacto}

WHERE
	smn_auxiliar_rf=${fld:id}
