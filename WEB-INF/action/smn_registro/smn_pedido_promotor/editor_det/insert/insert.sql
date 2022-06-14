INSERT INTO smn_comercial.smn_pedido_detalle
(
	smn_pedido_detalle_id,
	smn_pedido_cabecera_id,
	pde_naturaleza,
	smn_servicios_rf,
	smn_item_rf,
	smn_activo_fijo_rf,
	pde_cantidad_oferta,
	pde_cantidad_pedido,
	pde_cantidad_aprobada,
	pde_precio,
	pde_monto,
	smn_moneda_rf,
	smn_tasa_rf,
	pde_precio_moneda_alterna,
	pde_monto_moneda_alterna,
	pde_especificaciones_pedido,
	pde_fecha_requerida,
	pde_observaciones,
	pde_estatus,
	pde_idioma,
	pde_usuario,
	pde_fecha_registro,
	pde_hora,
	smn_codigos_impuestos_rf,
	smn_codigo_descuento_rf,
	pde_monto_impuesto_ml,
	pde_monto_impuesto_ma,
	pde_descuento_ml,
	pde_monto_descuento_ma,
	pde_monto_neto_ml,
	pde_monto_neto_ma
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_pedido_detalle},
	${fld:smn_pedido_cabecera_id},
	${fld:pde_naturaleza},
	${fld:smn_servicios_rf},
	${fld:smn_item_rf},
	${fld:smn_activo_fijo_rf},
	${fld:pde_cantidad_oferta},
	${fld:pde_cantidad_pedido},
	${fld:pde_cantidad_aprobada},
	${fld:pde_precio},
	${fld:pde_monto},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:pde_precio_moneda_alterna},
	${fld:pde_monto_moneda_alterna},
	${fld:pde_especificaciones_pedido},
	${fld:pde_fecha_requerido},
	${fld:pde_observaciones},
	${fld:pde_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_codigos_impuestos_rf},
	${fld:smn_codigo_descuento_rf},
	${fld:pde_monto_impuesto_ml},
	${fld:pde_monto_impuesto_ma},
	${fld:pde_descuento_ml},
	${fld:pde_monto_descuento_ma},
	${fld:pde_monto_neto_ml},
	${fld:pde_monto_neto_ma}
);

WITH rows as (
	select 
		SUM(smn_comercial.smn_pedido_detalle.pde_monto) as monto_ml,
		SUM(smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna) as monto_ma,
		SUM(smn_comercial.smn_pedido_detalle.pde_monto_neto_ml) as monto_neto_ml,
		SUM(smn_comercial.smn_pedido_detalle.pde_monto_neto_ma) as monto_neto_ma,
		smn_comercial.smn_pedido_detalle.smn_moneda_rf as moneda,
		smn_comercial.smn_pedido_detalle.smn_tasa_rf as tasa
	from 
		smn_comercial.smn_pedido_detalle
	where
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}
	GROUP BY smn_comercial.smn_pedido_detalle.pde_monto, smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna, smn_comercial.smn_pedido_detalle.smn_moneda_rf, smn_comercial.smn_pedido_detalle.smn_tasa_rf
) 
update smn_comercial.smn_pedido_cabecera
set
pca_monto_pedido_ml=rows.monto_ml,
pca_monto_pedido_ma=rows.monto_ma,
pca_monto_neto_ml=rows.monto_neto_ml,
pca_monto_neto_ma=rows.monto_neto_ma,
smn_moneda_rf=rows.moneda,
smn_tasa_rf=rows.tasa

from rows
where
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = ${fld:smn_pedido_cabecera_id}
