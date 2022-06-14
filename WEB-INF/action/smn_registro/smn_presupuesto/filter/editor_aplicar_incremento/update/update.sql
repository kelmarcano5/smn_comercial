UPDATE smn_comercial.smn_presupuesto_detalle SET
	smn_incrementos_rf=${fld:smn_incrementos_rf}
WHERE
	smn_presupuesto_id=${fld:id};

