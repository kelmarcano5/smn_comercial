UPDATE smn_comercial.smn_orden_servicio_detalle SET
	osd_estatus='AP'
WHERE
	smn_orden_cab_det_servicio_id=${fld:id} and osd_estatus='RC';

UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_estatus='AP'
WHERE
	smn_orden_servicio_id=(SELECT smn_orden_servicio_id FROM smn_comercial.smn_orden_cab_det_servicio where smn_comercial.smn_orden_cab_det_servicio.smn_orden_cab_det_servicio_id=${fld:id});

