SELECT DISTINCT
	${fld:smn_factura_cabecera_id} AS smn_factura_cabecera_id,
	case when Sum(smn_comercial.smn_pedido_componentes.pco_cantidad) is null then 1 else Sum(smn_comercial.smn_pedido_componentes.pco_cantidad) end as pco_cantidad,
	case when Avg(smn_comercial.smn_pedido_componentes.smn_precio_ml_rf) is null then 0 else ROUND(Avg(smn_comercial.smn_pedido_componentes.smn_precio_ml_rf)) end as smn_precio_ml_rf,
	case when Avg(smn_comercial.smn_pedido_componentes.smn_precio_ma) is null then 0 else round(Avg(smn_comercial.smn_pedido_componentes.smn_precio_ma)) end as smn_precio_ma,
	case when Sum(smn_comercial.smn_pedido_componentes.pco_monto_ml) is null then 0 else ROUND(Sum(smn_comercial.smn_pedido_componentes.pco_monto_ml)) end as pco_monto_ml,
	case when Sum(smn_comercial.smn_pedido_componentes.smn_monto_ma) is null then 0 else ROUND(Sum(smn_comercial.smn_pedido_componentes.smn_monto_ma)) end as smn_monto_ma,
	smn_base.smn_componentes.cmp_codigo AS codigo,
	case
	 when smn_comercial.smn_pedido_componentes.pco_tipo_componente='HO' then smn_base.smn_componentes.cmp_descripcion ||' '||COALESCE(smn_base.smn_auxiliar.aux_benef_pago, '')
	 else smn_base.smn_componentes.cmp_descripcion
	 end AS descripcion,
	smn_comercial.smn_pedido_componentes.smn_moneda_rf,
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf,
	smn_comercial.smn_pedido_componentes.pco_imprime
FROM
	smn_comercial.smn_pedido_componentes
	INNER JOIN smn_comercial.smn_pedido_cabecera ON smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id
	INNER JOIN smn_comercial.smn_pedido_detalle ON smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id
	LEFT JOIN smn_comercial.smn_rel_pedido_factura ON smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
	LEFT JOIN smn_comercial.smn_factura_cabecera ON smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id = smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id
	INNER JOIN smn_base.smn_servicios ON smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_pedido_componentes.smn_servicio_rf
	INNER JOIN smn_base.smn_componentes ON smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_pedido_componentes.smn_componente_rf
	LEFT JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_pedido_componentes.smn_auxiliar_rf
WHERE
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id IS NOT null AND
	smn_comercial.smn_pedido_cabecera.pca_estatus IN ('PR') 
	
	and smn_comercial.smn_pedido_cabecera.smn_entidad_rf=${fld:entidad}
	and smn_comercial.smn_pedido_cabecera.smn_sucursal_rf=(CASE WHEN ${fld:sucursal} IS NULL THEN 0 ELSE ${fld:sucursal} END)
	and smn_comercial.smn_pedido_cabecera.smn_documento_id=${fld:documento}
	and smn_comercial.smn_pedido_cabecera.smn_cliente_id=${fld:smn_cliente_id}
	and smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id=${fld:smn_centro_id}
	and smn_comercial.smn_pedido_cabecera.pca_fecha_requerida>=${fld:pca_fecha_registro_ini} 
	and smn_comercial.smn_pedido_cabecera.pca_fecha_requerida<=${fld:pca_fecha_registro_fin} 
	and smn_comercial.smn_pedido_componentes.pco_imprime = 'S'
GROUP BY
	smn_base.smn_componentes.cmp_codigo,
	smn_comercial.smn_pedido_componentes.smn_moneda_rf,
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf,
	smn_comercial.smn_pedido_componentes.pco_imprime,
	smn_comercial.smn_pedido_componentes.pco_tipo_componente,
	smn_base.smn_componentes.cmp_codigo,
	smn_base.smn_componentes.cmp_descripcion,
	smn_base.smn_auxiliar.aux_benef_pago
ORDER BY
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf ASC