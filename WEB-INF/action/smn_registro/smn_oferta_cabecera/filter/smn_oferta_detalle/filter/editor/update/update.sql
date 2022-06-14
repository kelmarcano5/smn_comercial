UPDATE smn_comercial.smn_oferta_detalle SET
	smn_oferta_id=${fld:smn_oferta_id},
	ofd_naturaleza=${fld:ofd_naturaleza},
	smn_servicios_rf=${fld:smn_servicios_rf},
	smn_item_rf=${fld:smn_item_rf},
	smn_activo_fijo_rf=${fld:smn_activo_fijo_rf},
	ofd_cantidad=${fld:ofd_cantidad},
	ofd_precio=${fld:ofd_precio},
	ofd_monto_ml=${fld:ofd_monto_ml},
	ofd_moneda_rf=${fld:ofd_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	ofd_precio_moneda_alterna=${fld:ofd_precio_moneda_alterna},
	ofd_monto_moneda_alterna=${fld:ofd_monto_moneda_alterna},
	ofd_idioma='${def:locale}',
	ofd_usuario='${def:user}',
	ofd_fecha_registro={d '${def:date}'},
	ofd_hora='${def:time}'

WHERE
	smn_oferta_detalle_id=${fld:id}

