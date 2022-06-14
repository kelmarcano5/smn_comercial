SELECT
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id,
	case 
		when smn_comercial.smn_pedido_componentes.pco_tipo_acumulado = 'SE' THEN smn_base.smn_servicios.svc_codigo 
		when smn_comercial.smn_pedido_componentes.pco_tipo_acumulado = 'TS' THEN smn_base.smn_tipos_servicios.tsr_codigo
	END AS codigo,
		case 
		when smn_comercial.smn_pedido_componentes.pco_tipo_acumulado = 'SE' THEN smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion 
		when smn_comercial.smn_pedido_componentes.pco_tipo_acumulado = 'TS' THEN smn_base.smn_tipos_servicios.tsr_codigo ||' - '|| smn_base.smn_tipos_servicios.tsr_descripcion
	END AS descripcion,
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf,
	smn_comercial.smn_pedido_componentes.pco_tipo_acumulado,
	Sum(smn_comercial.smn_pedido_componentes.smn_monto_ma) as smn_monto_ma,
	Sum(smn_comercial.smn_pedido_componentes.pco_monto_ml) as pco_monto_ml,
	smn_comercial.smn_pedido_componentes.smn_moneda_rf,
	smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf
FROM
	smn_comercial.smn_pedido_componentes
	INNER JOIN smn_base.smn_servicios ON smn_comercial.smn_pedido_componentes.smn_servicio_rf = smn_base.smn_servicios.smn_servicios_id
	INNER JOIN smn_base.smn_tipos_servicios ON smn_base.smn_servicios.smn_tipo_servicio_rf = smn_base.smn_tipos_servicios.smn_tipos_servicios_id
WHERE
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}
GROUP BY
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id,
	smn_base.smn_servicios.svc_codigo,
	smn_base.smn_servicios.svc_descripcion,
	smn_base.smn_tipos_servicios.tsr_codigo,
	smn_base.smn_tipos_servicios.tsr_descripcion,
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf,
	smn_comercial.smn_pedido_componentes.smn_moneda_rf,
	smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf,
	smn_comercial.smn_pedido_componentes.pco_tipo_acumulado