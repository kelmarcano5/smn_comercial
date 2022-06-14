UPDATE smn_comercial.smn_presupuesto_detalle SET
	smn_presupuesto_id=${fld:smn_presupuesto_id},
	prd_observaciones=${fld:prd_observaciones},
	prd_estatus='RZ'
WHERE
	smn_presupuesto_detalle_id=${fld:id};

