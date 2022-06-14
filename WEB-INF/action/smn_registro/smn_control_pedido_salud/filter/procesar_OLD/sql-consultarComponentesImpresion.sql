SELECT DISTINCT
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id,
	smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_componentes.smn_pedido_componentes_id,
	smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id,
	smn_comercial.smn_pedido_componentes.pco_cantidad,
	smn_comercial.smn_pedido_componentes.smn_precio_ml_rf,
	smn_comercial.smn_pedido_componentes.smn_precio_ma,
	smn_comercial.smn_pedido_componentes.pco_monto_ml,
	smn_comercial.smn_pedido_componentes.smn_monto_ma,
	smn_base.smn_componentes.cmp_codigo as codigo,
	case
	when smn_comercial.smn_pedido_componentes.pco_tipo_componente='HO' then smn_base.smn_componentes.cmp_descripcion ||' '||COALESCE(smn_base.smn_auxiliar.aux_benef_pago, '') ||'  '||COALESCE(smn_base.smn_auxiliar.aux_rif, '')
	else smn_base.smn_componentes.cmp_descripcion
	end as descripcion,
	smn_comercial.smn_pedido_componentes.smn_moneda_rf,
	smn_comercial.smn_pedido_componentes.smn_tasa_rf,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido,
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf,
	smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf,
	smn_comercial.smn_pedido_componentes.pco_imprime,
	smn_comercial.smn_pedido_componentes.smn_servicio_rf

FROM
	smn_comercial.smn_pedido_componentes
	INNER JOIN smn_comercial.smn_pedido_cabecera ON smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id
	INNER JOIN smn_comercial.smn_pedido_detalle ON smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id = smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id
	left join smn_comercial.smn_rel_pedido_factura on smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id 
	left join smn_comercial.smn_factura_cabecera on smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id = smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id 
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_pedido_componentes.smn_servicio_rf
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_pedido_componentes.smn_componente_rf
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=smn_comercial.smn_pedido_componentes.smn_auxiliar_rf
where 
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id= ${fld:smn_pedido_cabecera_id}
	and smn_comercial.smn_pedido_componentes.pco_imprime='S'