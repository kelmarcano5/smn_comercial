select
	smn_base.smn_monedas.mon_nombre,
		smn_comercial.smn_plan_venta.smn_plan_venta_id,
select
		smn_comercial.smn_plan_venta.smn_plan_venta_id,
select
		smn_comercial.smn_plan_venta.smn_plan_venta_id,
select
		smn_comercial.smn_plan_venta.smn_plan_venta_id,
select
		smn_comercial.smn_plan_venta.smn_plan_venta_id,
select
		smn_comercial.smn_plan_venta.smn_plan_venta_id,
	smn_comercial.smn_plan_venta.smn_entidades_rf,
	smn_comercial.smn_plan_venta.smn_almacen_rf,
	smn_comercial.smn_plan_venta.smn_documento_id,
	smn_comercial.smn_plan_venta.smn_servicio_rf,
	smn_comercial.smn_plan_venta.smn_item_rf,
	smn_comercial.smn_plan_venta.plv_fecha,
	smn_comercial.smn_plan_venta.plv_cantidad_rf,
	smn_comercial.smn_plan_venta.plv_precio_rf,
	smn_comercial.smn_plan_venta.plv_monto_rf,
	smn_comercial.smn_plan_venta.plv_monto_ma_rf,
	smn_comercial.smn_plan_venta.plv_fecha_registro
	
from

	smn_base.smn_monedas,
	smn_comercial.smn_plan_venta
where
	smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_plan_venta.plv_precio_ma_rf
