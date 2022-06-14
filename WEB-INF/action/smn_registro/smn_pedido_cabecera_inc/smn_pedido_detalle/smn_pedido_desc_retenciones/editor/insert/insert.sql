INSERT INTO smn_comercial.smn_pedido_desc_retenciones
(
	smn_pedido_desc_retenciones_id,
	smn_pedido_detalle_id,
	smn_descuentos_retenciones_rf,
	pim_monto_base_ml,
	pim_porcentaje_retencion,
	pim_monto_descuento_retencion,
	smn_moneda_rf,
	smn_tasa_rf,
	pim_monto_descuento_ma,
	pim_idioma,
	pim_usuario,
	pim_fecha_registro,
	pim_hora,
	pim_monto_base_ma,
	pim_cantidad
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_pedido_desc_retenciones},
	${fld:smn_pedido_detalle_id},
	${fld:smn_descuentos_retenciones_rf},
	${fld:pim_monto_base_ml},
	${fld:pim_porcentaje_retencion},
	${fld:pim_monto_descuento_retencion},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:pim_monto_descuento_ma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:pim_monto_base_ma},
	${fld:pim_cantidad}

);

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


WITH ocd AS (
	SELECT 
		case 
			when smn_comercial.smn_pedido_detalle.pde_monto is null then 0 else 	smn_comercial.smn_pedido_detalle.pde_monto
		end as pde_monto,
		case 
			when smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna is null then 0 else 	smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna
		end as pde_monto_moneda_alterna,
		case 
			when smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ml is null then 0 else 	smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ml
		end as pde_monto_impuesto_ml,
		case 
			when smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ma is null then 0 else 	smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ma
		end as pde_monto_impuesto_ma,
		case 
			when smn_comercial.smn_pedido_detalle.pde_descuento_ml is null then 0 else smn_comercial.smn_pedido_detalle.pde_descuento_ml
		end as pde_descuento_ml,
		case 
			when smn_comercial.smn_pedido_detalle.pde_monto_descuento_ma is null then 0 else smn_comercial.smn_pedido_detalle.pde_monto_descuento_ma
		end as pde_monto_descuento_ma
	FROM 
		smn_comercial.smn_pedido_detalle
	WHERE
		smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
)
UPDATE smn_comercial.smn_pedido_detalle SET
	pde_monto_neto_ml=ocd.pde_monto-ocd.pde_descuento_ml,
	pde_monto_neto_ma=ocd.pde_monto_moneda_alterna-ocd.pde_monto_descuento_ma,
	pde_idioma='${def:locale}',
	pde_usuario='${def:user}',
	pde_fecha_registro={d '${def:date}'},
	pde_hora='${def:time}'
FROM 
	ocd
WHERE
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = ${fld:smn_pedido_detalle_id};


WITH ocd1 AS (
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
	pca_monto_impuesto_ml=ocd1.total_monto_impuesto_ml,
	pca_monto_impuesto_ma=ocd1.total_monto_impuesto_ma,
	pca_monto_descuento_ml=ocd1.total_monto_descuento_ml,
	pca_monto_descuento_ma=ocd1.total_monto_descuento_ma,
	pca_monto_pedido_ml=ocd1.total_monto_neto_ml,
	pca_monto_pedido_ma=ocd1.total_monto_neto_ma,
	pca_idioma='${def:locale}',
	pca_usuario='${def:user}',
	pca_fecha_registro={d '${def:date}'},
	pca_hora='${def:time}'
FROM 
	ocd1
WHERE
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = (SELECT smn_pedido_cabecera_id FROM smn_comercial.smn_pedido_detalle WHERE smn_pedido_detalle_id = ${fld:smn_pedido_detalle_id});

