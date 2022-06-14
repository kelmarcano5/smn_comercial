SELECT DISTINCT 
	smn_comercial.smn_presupuesto.smn_presupuesto_id,
	gp.gpp_unidad_servicio as smn_unidades_servicios_rf,
	--smn_comercial.smn_presupuesto_detalle.smn_servicios_rf,
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
		when smn_comercial.smn_presupuesto_detalle.smn_prestadores_servicios_rf is null then 0 else smn_comercial.smn_presupuesto_detalle.smn_prestadores_servicios_rf
	end as 	smn_prestadores_servicios_rf,
		case 
		when  smn_comercial.smn_presupuesto_detalle.smn_moneda_rf is null then 0 else  smn_comercial.smn_presupuesto_detalle.smn_moneda_rf
	end as smn_moneda_rf,
	case 
		when  smn_comercial.smn_presupuesto_detalle.smn_tasa_rf is null then 0 else  smn_comercial.smn_presupuesto_detalle.smn_tasa_rf
	end as smn_tasa_rf,
		case 
		when smn_comercial.smn_presupuesto_detalle.smn_grupo_prestador_rf is null then 0 else smn_comercial.smn_presupuesto_detalle.smn_grupo_prestador_rf
	end as 	smn_grupo_prestador_rf,
	case 
		when smn_comercial.smn_presupuesto.smn_clase_auxiliar_rf is null then 0 else smn_comercial.smn_presupuesto.smn_clase_auxiliar_rf 
	end as 	smn_clase_auxiliar_rf,
	case 
		when smn_comercial.smn_presupuesto.smn_auxiliar_rf is null then 0 else smn_comercial.smn_presupuesto.smn_auxiliar_rf 
	end as 	smn_auxiliar_rf
FROM smn_comercial.smn_presupuesto_detalle
	inner join smn_comercial.smn_presupuesto on smn_comercial.smn_presupuesto.smn_presupuesto_id = smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id
	left join smn_base.smn_grupos_prestadores gp on gp.smn_grupos_prestadores_id = smn_comercial.smn_presupuesto_detalle.smn_grupo_prestador_rf
WHERE 
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id = ${fld:smn_presupuesto_id} AND smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf IN('SE') and smn_comercial.smn_presupuesto_detalle.prd_estatus<>'RZ'