delete from smn_comercial.smn_presupuesto_componente where smn_presupuesto_id = (select smn_comercial.smn_presupuesto.smn_presupuesto_id from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_orden_servicio_id = ${fld:orden} limit 1);

delete from smn_comercial.smn_presupuesto_detalle where smn_presupuesto_id = (select smn_comercial.smn_presupuesto.smn_presupuesto_id from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_orden_servicio_id = ${fld:orden} limit 1);

delete from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_orden_servicio_id = ${fld:orden};

UPDATE smn_comercial.smn_orden_servicio SET
	ors_estatus='AS'
WHERE
	smn_orden_servicio_id=${fld:orden}

