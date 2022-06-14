UPDATE smn_comercial.smn_orden_cab_det_servicio SET
	ocd_estatus='RZ',
	ocd_motivo_rechazo=${fld:ocd_motivo_rechazo}

WHERE
	smn_orden_cab_det_servicio_id=${fld:id};

UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_estatus='RZ'
WHERE
	smn_orden_servicio_id=(SELECT smn_orden_servicio_id FROM smn_comercial.smn_orden_cab_det_servicio where smn_comercial.smn_orden_cab_det_servicio.smn_orden_cab_det_servicio_id=${fld:id});


UPDATE smn_comercial.smn_pedido_detalle SET
	pde_estatus='RZ'
WHERE
	smn_pedido_cabecera_id=(select smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_orden_servicio_id=(select smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id from smn_comercial.smn_orden_cab_det_servicio where smn_orden_cab_det_servicio_id=${fld:id}))


