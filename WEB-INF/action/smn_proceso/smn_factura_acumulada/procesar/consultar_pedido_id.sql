SELECT  DISTINCT
	${fld:smn_factura_cabecera_id} AS smn_factura_cabecera_id,
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id

FROM
	smn_comercial.smn_pedido_componentes
	INNER JOIN smn_comercial.smn_pedido_cabecera ON smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id
	INNER JOIN smn_comercial.smn_pedido_detalle ON smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id = smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id
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
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
ORDER BY smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id asc