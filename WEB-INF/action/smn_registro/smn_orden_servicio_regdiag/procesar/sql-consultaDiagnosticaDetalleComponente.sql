select DISTINCT
	smn_comercial.smn_orden_servicio_detalle.smn_componentes_rf as smn_componentes_rf,
	smn_comercial.smn_orden_servicio_detalle.cmp_porcentaje,
	smn_comercial.smn_orden_servicio_detalle.smn_forma_calculo_rf as smn_forma_calculo_rf,
	smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente,
	smn_comercial.smn_orden_servicio_detalle.smn_grupo_prestador_rf,
	smn_comercial.smn_orden_servicio_detalle.smn_visible_rf as smn_visible_rf,
	smn_comercial.smn_orden_servicio.smn_prestador_servicio_rf,
	smn_comercial.smn_orden_servicio_detalle.osd_cantidad as prd_cantidad,
	case
	   when smn_base.smn_baremos_detalle_componente.bdc_precio_ml is null then 0 else smn_base.smn_baremos_detalle_componente.bdc_precio_ml
	end as prd_monto_moneda_local,
	case
	   when smn_base.smn_baremos_detalle_componente.bdc_monto_ma is null then 0 else smn_base.smn_baremos_detalle_componente.bdc_monto_ma
	end as prd_moneda_alterna,
	case
	   when smn_comercial.smn_orden_servicio_detalle.smn_item_rf is null then 0 else smn_comercial.smn_orden_servicio_detalle.smn_item_rf
	end as smn_item_rf,
	case
	   when smn_base.smn_baremos_detalle_componente.smn_moneda_rf is null then 0 else smn_base.smn_baremos_detalle_componente.smn_moneda_rf
	end as smn_moneda_rf,
	case
	  when smn_base.smn_baremos_detalle_componente.bdc_precio_ml is null or smn_base.smn_baremos_detalle_componente.bdc_precio_ml = 0 then smn_comercial.smn_orden_servicio_detalle.osd_cantidad*smn_base.smn_baremos_detalle_componente.bdc_monto_ma*(select smn_base.smn_tasas_de_cambio.tca_tasa_cambio from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=CURRENT_DATE AND smn_base.smn_tasas_de_cambio.tca_tipo_tasa=(select smn_comercial.smn_documento.tca_tipo_tasa from smn_comercial.smn_documento where smn_comercial.smn_documento.smn_documento_id = (select smn_comercial.smn_orden_servicio.smn_documento_id from smn_comercial.smn_orden_servicio where smn_comercial.smn_orden_servicio.smn_orden_servicio_id=${fld:id_orden_servicio}))) else smn_base.smn_baremos_detalle_componente.bdc_precio_ml
	end as precio,
	case
	   when smn_base.smn_baremos_detalle_componente.bdc_precio_ma is null then 0 else smn_base.smn_baremos_detalle_componente.bdc_precio_ma*smn_comercial.smn_orden_servicio_detalle.osd_cantidad
	end as precio_ma,
	${fld:smn_presupuesto_id} as smn_presupuesto_id,
	${fld:smn_presupuesto_detalle_id} as smn_presupuesto_detalle_id,
	${fld:smn_servicios_rf} as smn_servicios_rf
from 
	smn_comercial.smn_orden_servicio_detalle
	inner join smn_comercial.smn_orden_cab_det_servicio 
	on smn_comercial.smn_orden_cab_det_servicio.smn_orden_cab_det_servicio_id = smn_comercial.smn_orden_servicio_detalle.smn_orden_cab_det_servicio_id
	inner join smn_comercial.smn_orden_servicio 
	on smn_comercial.smn_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id
	left join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_orden_servicio.smn_centro_facturacion_id
	left join smn_comercial.smn_rel_orden_servicio on smn_comercial.smn_rel_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_orden_servicio.smn_orden_servicio_id
	left join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = smn_comercial.smn_centro_facturacion.smn_baremos_rf
	inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_componentes_id= smn_comercial.smn_orden_servicio_detalle.smn_componentes_rf
	inner join smn_base.smn_servicios_componentes se on se.smn_servicios_id= smn_comercial.smn_orden_servicio_detalle.smn_servicios_rf
	left join smn_base.smn_baremos_detalle_componente on smn_base.smn_baremos_detalle_componente.smn_componente_rf = smn_comercial.smn_orden_servicio_detalle.smn_componentes_rf
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_orden_servicio_detalle.smn_componentes_rf
where
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id = ${fld:id_orden_servicio}  and smn_base.smn_componentes.cmp_tipo_componente in('SE','IT','HO')