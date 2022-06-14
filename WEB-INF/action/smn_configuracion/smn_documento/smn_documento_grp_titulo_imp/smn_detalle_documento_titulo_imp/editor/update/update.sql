UPDATE smn_comercial.smn_detalle_documento_titulo_imp SET
	smn_documento_grp_titulo_imp_id=${fld:smn_documento_grp_titulo_imp_id},
	dgi_naturaleza=${fld:dgi_naturaleza},
	smn_servicios_rf=${fld:smn_servicios_rf},
	smn_item_rf=${fld:smn_item_rf},
	smn_componentes_rf=${fld:smn_componentes_rf},
	dgi_idioma='${def:locale}',
	dgi_usuario='${def:user}',
	dgi_fecha_registro={d '${def:date}'},
	dgi_hora='${def:time}'

WHERE
	smn_detalle_documento_titulo_imp_id=${fld:id}

