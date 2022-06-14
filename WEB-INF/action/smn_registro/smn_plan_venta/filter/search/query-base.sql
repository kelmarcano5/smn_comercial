select
	smn_comercial.smn_plan_venta.smn_plan_venta_id,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidades_rf,
	smn_base.smn_almacen.alm_nombre as smn_almacen_rf,
	smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_base.smn_servicios.svc_descripcion smn_servicio_rf,
	smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_unidades_servicios.uns_descripcion as smn_unidad_servicio_rf,
	smn_base.smn_areas_servicios.ase_descripcion as smn_area_servicio_rf,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.tca_tasa_cambio as smn_tasa_rf,
	smn_comercial.smn_plan_venta.plv_fecha,
	smn_comercial.smn_plan_venta.plv_cantidad_rf,
	smn_comercial.smn_plan_venta.plv_precio_rf,
	smn_comercial.smn_plan_venta.plv_monto_rf,
	smn_comercial.smn_plan_venta.plv_precio_ma_rf,
	smn_comercial.smn_plan_venta.plv_monto_ma_rf,
	smn_comercial.smn_plan_venta.plv_semana_rf,
	smn_comercial.smn_plan_venta.plv_semestre_rf,
	smn_comercial.smn_plan_venta.plv_trimestre_rf,
	smn_comercial.smn_plan_venta.plv_mes_rf,
	smn_comercial.smn_plan_venta.plv_fecha_registro
from
	smn_comercial.smn_plan_venta
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_plan_venta.smn_entidades_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_plan_venta.smn_sucursal_rf
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_comercial.smn_plan_venta.smn_unidad_servicio_rf
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_comercial.smn_plan_venta.smn_area_servicio_rf
	inner join smn_base.smn_almacen on smn_base.smn_almacen.smn_almacen_id = smn_comercial.smn_plan_venta.smn_almacen_rf
	inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_plan_venta.smn_documento_id
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_plan_venta.smn_item_rf
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_plan_venta.smn_servicio_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_plan_venta.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_plan_venta.smn_tasa_rf

where
	smn_plan_venta_id is not null
	${filter}
order by
		smn_plan_venta_id
