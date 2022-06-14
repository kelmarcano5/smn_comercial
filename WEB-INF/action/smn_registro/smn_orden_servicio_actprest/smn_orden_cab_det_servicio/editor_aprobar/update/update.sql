UPDATE smn_comercial.smn_orden_cab_det_servicio SET
	ocd_estatus='TE',
	ocd_observacion=${fld:ocd_observacion},
	ocd_fecha_inicio=${fld:ocd_fecha_inicio},
	ocd_fecha_culminacion=${fld:ocd_fecha_culminacion},
	ocd_horas_laboradas=${fld:ocd_horas_laboradas}

WHERE
	smn_orden_cab_det_servicio_id=${fld:id};

UPDATE smn_comercial.smn_pedido_detalle SET
	pde_estatus='AP'
WHERE
	smn_pedido_cabecera_id=(select smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_orden_servicio_id=(select smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id from smn_comercial.smn_orden_cab_det_servicio where smn_orden_cab_det_servicio_id=${fld:id}))





