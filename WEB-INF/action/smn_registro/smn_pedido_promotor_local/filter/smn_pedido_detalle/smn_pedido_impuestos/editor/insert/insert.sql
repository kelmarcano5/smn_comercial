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
			WHEN SUM(smn_comercial.smn_pedido_impuestos.pim_monto_impuesto_ma) IS NOT NULL THEN SUM(smn_comercial.smn_pedido_impuestos.pim_monto_impuesto)
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

-- **** ACTUALIZA LOS MONTOS DE DESCUENTOS Y RETENCIONES EN LA TABLA -> smn_comercial.smn_pedido_detalle****

WITH descuentos AS (
	SELECT 
		CASE
			WHEN SUM(smn_comercial.smn_pedido_desc_retenciones.pim_monto_descuento_retencion) IS NULL THEN 0
			WHEN SUM(smn_comercial.smn_pedido_desc_retenciones.pim_monto_descuento_retencion) IS NOT NULL THEN SUM(smn_comercial.smn_pedido_desc_retenciones.pim_monto_descuento_retencion)
		END AS total_monto_descuento_ml,
		CASE
			WHEN SUM(smn_comercial.smn_pedido_desc_retenciones.pim_monto_descuento_ma) IS NULL THEN 0
			WHEN SUM(smn_comercial.smn_pedido_desc_retenciones.pim_monto_descuento_ma) IS NOT NULL THEN SUM(smn_comercial.smn_pedido_desc_retenciones.pim_monto_descuento_ma)
		END AS total_monto_descuento_ma
	FROM 
		smn_comercial.smn_pedido_desc_retenciones
	WHERE
		smn_comercial.smn_pedido_desc_retenciones.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
)

UPDATE smn_comercial.smn_pedido_detalle SET
	pde_descuento_ml=descuentos.total_monto_descuento_ml,
	pde_monto_descuento_ma=descuentos.total_monto_descuento_ma,
	pde_idioma='${def:locale}',
	pde_usuario='${def:user}',
	pde_fecha_registro={d '${def:date}'},
	pde_hora='${def:time}'
FROM 
	descuentos
WHERE
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = ${fld:smn_pedido_detalle_id};	

-- **** ACTUALIZA LOS MONTOS NETO EN LA TABLA -> smn_comercial.smn_pedido_detalle****

WITH ocd AS (
	SELECT 
		-- smn_comercial.smn_pedido_detalle.pde_monto_bruto_ml,
		-- smn_comercial.smn_pedido_detallee.pde_monto_bruto_ma,
		smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ml,
		smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ma,
		smn_comercial.smn_pedido_detalle.pde_descuento_ml,
		smn_comercial.smn_pedido_detalle.pde_monto_descuento_ma
	FROM 
		smn_comercial.smn_pedido_detalle
	WHERE
		smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
)

UPDATE smn_comercial.smn_pedido_detalle SET
	pde_monto=ocd.pde_monto_impuesto_ml-ocd.pde_descuento_ml,
	pde_monto_moneda_alterna=ocd.pde_monto_impuesto_ma-ocd.pde_monto_descuento_ma,
	pde_idioma='${def:locale}',
	pde_usuario='${def:user}',
	pde_fecha_registro={d '${def:date}'},
	pde_hora='${def:time}'
FROM 
	ocd
WHERE
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = ${fld:smn_pedido_detalle_id};

-- **** ACTUALIZA LOS MONTOS EN LA TABLA -> smn_comercial.smn_pedido_cabecera****

WITH ocd AS (
	SELECT 
		SUM(smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ml) AS total_monto_impuesto_ml,
		SUM(smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ma) AS total_monto_impuesto_ma,
		SUM(smn_comercial.smn_pedido_detalle.pde_descuento_ml) AS total_monto_descuento_ml,
		SUM(smn_comercial.smn_pedido_detalle.pde_monto_descuento_ma) AS total_monto_descuento_ma,
		SUM(smn_comercial.smn_pedido_detalle.pde_monto) AS total_monto_neto_ml,
		SUM(smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna) AS total_monto_neto_ma
	FROM 
		smn_comercial.smn_pedido_detalle
	WHERE
		smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
)

UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_monto_impuesto_ml=ocd.total_monto_impuesto_ml,
	pca_monto_impuesto_ma=ocd.total_monto_impuesto_ma,
	pca_monto_descuento_ml=ocd.total_monto_descuento_ml,
	pca_monto_pedido_ml=ocd.total_monto_neto_ml,
	pca_monto_pedido_ma=ocd.total_monto_neto_ma,
	pca_idioma='${def:locale}',
	pca_usuario='${def:user}',
	pca_fecha_registro={d '${def:date}'},
	pca_hora='${def:time}'
FROM 
	ocd
WHERE
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = (SELECT smn_pedido_cabecera_id FROM smn_comercial.smn_pedido_detalle WHERE smn_pedido_detalle_id = ${fld:smn_pedido_detalle_id});
