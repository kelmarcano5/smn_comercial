UPDATE smn_comercial.smn_orden_servicio_detalle SET
	osd_estatus='RC'
WHERE
	smn_orden_servicio_detalle_id=${fld:id}
