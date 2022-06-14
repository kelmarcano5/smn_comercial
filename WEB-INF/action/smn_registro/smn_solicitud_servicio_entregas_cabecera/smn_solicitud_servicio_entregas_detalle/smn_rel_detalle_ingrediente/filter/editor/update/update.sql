UPDATE smn_comercial.smn_rel_detalle_ingrediente SET
	smn_solicitud_servicio_entregas_detalle_id=${fld:smn_solicitud_servicio_entregas_detalle_id},
	smn_ingredientes_id=${fld:smn_ingredientes_id}

WHERE
	smn_rel_detalle_ingrediente_id=${fld:id}

