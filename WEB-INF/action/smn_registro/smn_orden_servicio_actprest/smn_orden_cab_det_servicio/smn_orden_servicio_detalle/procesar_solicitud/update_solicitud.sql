UPDATE smn_comercial.smn_orden_servicio_detalle SET
	osd_estatus='SO'
WHERE
	smn_orden_cab_det_servicio_id=(select smn_orden_cab_det_servicio_id from smn_comercial.smn_orden_cab_det_servicio where smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id=${fld:id2});

UPDATE smn_comercial.smn_orden_cab_det_servicio SET
	ocd_estatus='SO'
WHERE
	ocd_estatus='TE' and smn_orden_cab_det_servicio_id=(select smn_orden_cab_det_servicio_id from smn_comercial.smn_orden_cab_det_servicio where smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id=${fld:id2})


