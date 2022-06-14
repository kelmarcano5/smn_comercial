SELECT
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id,
	case 
		when smn_comercial.smn_pedido_componentes.pco_tipo_acumulado = 'CO' THEN smn_base.smn_componentes.cmp_codigo
	END AS codigo,
	case 
		when smn_comercial.smn_pedido_componentes.pco_tipo_componente='HO' THEN smn_base.smn_componentes.cmp_descripcion ||' '||COALESCE(smn_base.smn_auxiliar.aux_benef_pago, '') ||'  '||COALESCE(smn_base.smn_auxiliar.aux_rif, '')
	END AS descripcion,
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf,
	smn_comercial.smn_pedido_componentes.pco_tipo_acumulado,
	Sum(smn_comercial.smn_pedido_componentes.smn_monto_ma) as smn_monto_ma,
	Sum(smn_comercial.smn_pedido_componentes.pco_monto_ml) as pco_monto_ml,
	case when smn_comercial.smn_pedido_componentes.smn_moneda_rf is null then 0 else smn_comercial.smn_pedido_componentes.smn_moneda_rf end,
	case when smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf is null then 0 else smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf end
FROM
	smn_comercial.smn_pedido_componentes
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = 	smn_comercial.smn_pedido_componentes.smn_componente_rf
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=smn_comercial.smn_pedido_componentes.smn_auxiliar_rf
WHERE
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id} AND smn_comercial.smn_pedido_componentes.pco_tipo_acumulado = 'CO' and smn_comercial.smn_pedido_componentes.pco_tipo_componente='HO'
GROUP BY
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id,
	smn_base.smn_componentes.cmp_codigo,
	smn_base.smn_componentes.cmp_descripcion,
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf,
	smn_comercial.smn_pedido_componentes.smn_moneda_rf,
	smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf,
	smn_comercial.smn_pedido_componentes.pco_tipo_acumulado,
	smn_comercial.smn_pedido_componentes.pco_tipo_componente,
	smn_base.smn_auxiliar.aux_benef_pago,
	smn_base.smn_auxiliar.aux_rif