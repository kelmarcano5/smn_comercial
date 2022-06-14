SELECT
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id,
	case 
		when smn_comercial.smn_pedido_componentes.pco_tipo_acumulado = 'SE' THEN smn_base.smn_servicios.svc_codigo 
	END AS codigo,
	case 
		when smn_comercial.smn_pedido_componentes.pco_tipo_acumulado = 'SE' THEN smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion 
	END AS descripcion,
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf,
	smn_comercial.smn_pedido_componentes.pco_tipo_acumulado,
	Sum(smn_comercial.smn_pedido_componentes.smn_monto_ma) as smn_monto_ma,
	Sum(smn_comercial.smn_pedido_componentes.pco_monto_ml) as pco_monto_ml,
	case when smn_comercial.smn_pedido_componentes.smn_moneda_rf is null then 0 else smn_comercial.smn_pedido_componentes.smn_moneda_rf end,
	case when smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf is null then 0 else smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf end
FROM
	smn_comercial.smn_pedido_componentes
	INNER JOIN smn_base.smn_servicios ON smn_comercial.smn_pedido_componentes.smn_servicio_rf = smn_base.smn_servicios.smn_servicios_id
WHERE
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id} and smn_comercial.smn_pedido_componentes.pco_tipo_acumulado IN ('SE')
GROUP BY
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id,
	smn_base.smn_servicios.svc_codigo,
	smn_base.smn_servicios.svc_descripcion,
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf,
	smn_comercial.smn_pedido_componentes.smn_moneda_rf,
	smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf,
	smn_comercial.smn_pedido_componentes.pco_tipo_acumulado