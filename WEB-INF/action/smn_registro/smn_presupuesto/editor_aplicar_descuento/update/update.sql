UPDATE smn_comercial.smn_presupuesto SET
	smn_codigo_descuento_rf=${fld:smn_codigo_descuento_rf},
	pre_idioma='${def:locale}',
	pre_usuario='${def:user}',
	pre_fecha_registro={d '${def:date}'},
	pre_hora='${def:time}'

WHERE
	smn_presupuesto_id=${fld:id};

UPDATE smn_comercial.smn_presupuesto_detalle SET
	smn_codigo_descuento_rf=${fld:smn_codigo_descuento_rf}
WHERE
	smn_presupuesto_id=${fld:id};

