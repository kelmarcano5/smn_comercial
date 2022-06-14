SELECT smn_comercial.smn_presupuesto.smn_ingresos_id,
smn_comercial.smn_presupuesto_detalle.smn_servicios_rf,
smn_comercial.smn_ingresos.smn_unidades_servicios_rf,
smn_comercial.smn_presupuesto_detalle.smn_componentes_rf,
smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id,
smn_comercial.smn_presupuesto_detalle.prd_cantidad,
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_tasa_rf is null then 0 else smn_comercial.smn_presupuesto_detalle.smn_tasa_rf
	end as smn_tasa_rf,
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_moneda_rf is null then 0 else smn_comercial.smn_presupuesto_detalle.smn_moneda_rf
	end as smn_moneda_rf,
	case 
		when smn_comercial.smn_presupuesto_detalle.prd_precio is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_precio
	end as prd_precio,
	case 
		when smn_comercial.smn_presupuesto_detalle.prd_monto_moneda_local is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_monto_moneda_local
	end as prd_monto_moneda_local,
	case 
		when smn_comercial.smn_presupuesto_detalle.prd_precio_ma is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_precio_ma
	end as prd_precio_ma,
	case 
		when smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna
	end as prd_moneda_alterna,
	case 
		when smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ma is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ma
	end as prd_monto_neto_ma,
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_prestadores_servicios_rf is null then 0 else smn_comercial.smn_presupuesto_detalle.smn_prestadores_servicios_rf
	end as smn_prestadores_servicios_rf,
	case 
		when smn_base.smn_componentes.cmp_grupo_prestador is null then 0 else smn_base.smn_componentes.cmp_grupo_prestador
	end as smn_grupo_prestador_rf,
	case 
		when smn_comercial.smn_presupuesto.smn_clase_auxiliar_rf is null then 0 else smn_comercial.smn_presupuesto.smn_clase_auxiliar_rf
	end as smn_clase_auxiliar_rf,
	case 
		when smn_comercial.smn_presupuesto.smn_auxiliar_rf is null then 0 else smn_comercial.smn_presupuesto.smn_auxiliar_rf
	end as smn_auxiliar_rf
FROM smn_comercial.smn_presupuesto_detalle
inner join smn_comercial.smn_presupuesto on smn_comercial.smn_presupuesto.smn_presupuesto_id = smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id
left outer join smn_comercial.smn_ingresos on smn_comercial.smn_ingresos.smn_ingresos_id = smn_comercial.smn_presupuesto.smn_ingresos_id
left outer join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_presupuesto_detalle.smn_componentes_rf
WHERE smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id = ${fld:smn_presupuesto_id} AND smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf IN('SE')