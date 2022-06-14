delete from smn_comercial.smn_orden_servicio_detalle where smn_orden_cab_det_servicio_id = ${fld:id} and smn_servicios_rf=${fld:id2};
delete from smn_comercial.smn_rel_orden_servicio where smn_servicios_rf=${fld:id2} and smn_orden_servicio_id=${fld:id};
UPDATE smn_comercial.smn_orden_cab_det_servicio SET
	ocd_estatus='SO'
WHERE
	smn_orden_cab_det_servicio_id=${fld:id};

