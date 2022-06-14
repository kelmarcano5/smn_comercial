UPDATE smn_comercial.smn_factura_bonificacion SET
	smn_factura_detalle_id=${fld:smn_factura_detalle_id},
	smn_item_bonificar_rf=${fld:smn_item_bonificar_rf},
	fbo_cantidad_origen=${fld:fbo_cantidad_origen},
	fbo_cantidad_bonificar=${fld:fbo_cantidad_bonificar},
	fbo_precio_original=${fld:fbo_precio_original},
	fbo_monto=${fld:fbo_monto},
	fbo_idioma='${def:locale}',
	fbo_usuario='${def:user}',
	fbo_fecha_registro={d '${def:date}'},
	fbo_hora='${def:time}'

WHERE
	smn_factura_bonificacion_id=${fld:id}

