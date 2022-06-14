UPDATE smn_comercial.smn_orden_servicio_detalle SET
	smn_orden_cab_det_servicio_id=${fld:smn_orden_cab_det_servicio_id},
	smn_servicios_rf=${fld:smn_servicios_rf},
	smn_item_rf=${fld:smn_item_rf},
	smn_componentes_rf=${fld:smn_componentes_rf},
	osd_cantidad=${fld:osd_cantidad},
	smn_tipo_componente=${fld:smn_tipo_componente},
	smn_grupo_prestador_rf=${fld:smn_grupo_prestador_rf},
	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf},
	smn_nivel_estructura_rf=${fld:smn_nivel_estructura_rf},
	osd_estatus=${fld:osd_estatus},
	osd_idioma='${def:locale}',
	osd_usuario='${def:user}',
	osd_fecha_registro={d '${def:date}'},
	osd_hora='${def:time}'

WHERE
	smn_orden_servicio_detalle_id=${fld:id}

