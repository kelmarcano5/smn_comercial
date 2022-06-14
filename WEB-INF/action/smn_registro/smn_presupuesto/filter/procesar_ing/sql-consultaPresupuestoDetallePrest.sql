SELECT DISTINCT 
	--smn_comercial.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id,
	smn_comercial.smn_presupuesto.smn_presupuesto_id,
	smn_comercial.smn_ingresos.smn_unidades_servicios_rf,
	smn_comercial.smn_presupuesto_detalle.smn_servicios_rf,
	smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf,
	smn_comercial.smn_presupuesto_detalle.smn_componentes_rf,
	smn_comercial.smn_presupuesto_detalle.prd_cantidad,
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_item_rf is null then 0 else smn_comercial.smn_presupuesto_detalle.smn_item_rf
	end as smn_item_rf,
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_servicios_rf is null then 0 else smn_comercial.smn_presupuesto_detalle.smn_servicios_rf
	end as smn_servicios_rf,
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
		when smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml
	end as prd_monto_descuento_ml,
	case 
		when smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna
	end as prd_moneda_alterna,
	case 
		when smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml
	end as prd_monto_descuento_ml,
	case 
		when smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ma is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ma
	end as prd_monto_descuento_ma,
	case 
		when smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ml is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ml
	end as prd_monto_neto_ml,
	case 
		when smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ma is null then 0 else smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ma
	end as prd_monto_neto_ma,
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_prestadores_servicios_rf is null then 0 else smn_comercial.smn_presupuesto_detalle.smn_prestadores_servicios_rf
	end as 	smn_prestadores_servicios_rf,
		case 
		when  smn_comercial.smn_presupuesto_detalle.smn_moneda_rf is null then 0 else  smn_comercial.smn_presupuesto_detalle.smn_moneda_rf
	end as smn_moneda_rf,
	case 
		when  smn_comercial.smn_presupuesto_detalle.smn_tasa_rf is null then 0 else  smn_comercial.smn_presupuesto_detalle.smn_tasa_rf
	end as smn_tasa_rf,
	smn_comercial.smn_ingreso_movimiento.smn_ingresos_mov_id
FROM smn_comercial.smn_presupuesto_detalle
	inner join smn_comercial.smn_presupuesto on smn_comercial.smn_presupuesto.smn_presupuesto_id = smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id
	inner join smn_comercial.smn_ingresos on smn_comercial.smn_ingresos.igs_doc_origen = smn_comercial.smn_presupuesto.smn_presupuesto_id
	left outer join smn_comercial.smn_diagnostico_cab_auto on smn_comercial.smn_diagnostico_cab_auto.smn_ingresos_id = smn_comercial.smn_ingresos.smn_ingresos_id
	--left outer join smn_comercial.smn_prestacion_servicio_medico_cabecera on smn_comercial.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id = smn_comercial.smn_presupuesto.smn_ingresos_id
	inner join smn_comercial.smn_ingreso_movimiento on smn_comercial.smn_ingreso_movimiento.smn_ingreso_id = smn_comercial.smn_diagnostico_cab_auto.smn_ingresos_id
WHERE 
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id = ${fld:smn_presupuesto_id} AND smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf IN('HO','IT')