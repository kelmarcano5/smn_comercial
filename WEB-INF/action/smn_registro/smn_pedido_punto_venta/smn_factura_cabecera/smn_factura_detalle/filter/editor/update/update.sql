UPDATE smn_comercial.smn_factura_detalle SET
	smn_factura_cabecera_id=${fld:smn_factura_cabecera_id},
	fde_naturaleza=${fld:fde_naturaleza},
	smn_servicios_rf=${fld:smn_servicios_rf},
	smn_item_rf=${fld:smn_item_rf},
	smn_activo_fijo_rf=${fld:smn_activo_fijo_rf},
	fde_cantidad=${fld:fde_cantidad},
	fde_precio_ml=${fld:fde_precio_ml},
	fde_monto_ml=${fld:fde_monto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	fde_precio_ma=${fld:fde_precio_ma},
	fde_monto_ma=${fld:fde_monto_ma},
	fde_idioma='${def:locale}',
	fde_usuario='${def:user}',
	fde_fecha_registro={d '${def:date}'},
	fde_hora='${def:time}'

WHERE
	smn_factura_detalle_id=${fld:id}

