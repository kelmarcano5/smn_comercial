select
	smn_base.smn_monedas.mon_nombre,
	${field}
from
	smn_base.smn_monedas,
	smn_comercial.smn_plan_venta
where
	smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_plan_venta.plv_precio_ma_rf and
		smn_comercial.smn_plan_venta.smn_plan_venta_id is not null
