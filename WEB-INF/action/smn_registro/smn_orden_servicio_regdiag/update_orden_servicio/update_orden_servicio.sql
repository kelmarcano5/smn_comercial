UPDATE smn_comercial.smn_orden_servicio SET
	ors_estatus='PR'
WHERE
	smn_orden_servicio_id=${fld:id};
