INSERT INTO smn_comercial.smn_pedido_impuestos
(
	smn_pedido_impuestos_id,
	smn_pedido_detalle_id,
	smn_codigos_impuestos_rf,
	pim_monto_base_ml,
	pim_porcentaje_impuesto,
	pim_monto_sustraendo,
	pim_monto_impuesto,
	smn_moneda_rf,
	smn_tasa_rf,
	pim_monto_impuesto_ma,
	pim_idioma,
	pim_usuario,
	pim_fecha_registro,
	pim_hora,
	smn_tipo_impuesto_rf
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_pedido_impuestos},
	${fld:smn_pedido_detalle_id},
	${fld:smn_codigos_impuestos_rf},
	${fld:pim_monto_base_ml},
	${fld:pim_porcentaje_impuesto},
	${fld:pim_monto_sustraendo},
	${fld:pim_monto_impuesto},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:pim_monto_impuesto_ma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_tipo_impuesto_rf}
);

WITH impuestos AS (
	SELECT 
		CASE
			WHEN SUM(smn_comercial.smn_pedido_impuestos.pim_monto_impuesto) IS NULL THEN 0
			WHEN SUM(smn_comercial.smn_pedido_impuestos.pim_monto_impuesto) IS NOT NULL THEN SUM(smn_comercial.smn_pedido_impuestos.pim_monto_impuesto)
		END AS total_monto_impuesto_ml,
		CASE
			WHEN SUM(smn_comercial.smn_pedido_impuestos.pim_monto_impuesto) IS NULL THEN 0
			WHEN SUM(smn_comercial.smn_pedido_impuestos.pim_monto_impuesto_ma) IS NOT NULL THEN SUM(smn_comercial.smn_pedido_impuestos.pim_monto_impuesto_ma)
		END AS total_monto_impuesto_ma
	FROM 
		smn_comercial.smn_pedido_impuestos
	WHERE
		smn_comercial.smn_pedido_impuestos.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
)

UPDATE smn_comercial.smn_pedido_detalle SET
	pde_monto_impuesto_ml=impuestos.total_monto_impuesto_ml,
	pde_monto_impuesto_ma=impuestos.total_monto_impuesto_ma,
	pde_idioma='${def:locale}',
	pde_usuario='${def:user}',
	pde_fecha_registro={d '${def:date}'},
	pde_hora='${def:time}'
FROM 
	impuestos
WHERE
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = ${fld:smn_pedido_detalle_id};

