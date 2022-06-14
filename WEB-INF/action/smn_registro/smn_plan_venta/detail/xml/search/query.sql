select
select
select
select
select
select
select
select
select
	smn_base.smn_monedas.mon_nombre,
	case
	when smn_comercial.smn_plan_venta.plv_semestre_rf='AC' then '{lbl:b_active}'
	when smn_comercial.smn_plan_venta.plv_semestre_rf='IN' then '{lbl:b_inactive}'
	end as plv_semestre_rf,
	case
	when smn_comercial.smn_plan_venta.plv_trimestre_rf='AC' then '{lbl:b_active}'
	when smn_comercial.smn_plan_venta.plv_trimestre_rf='IN' then '{lbl:b_inactive}'
	end as plv_trimestre_rf,
	case
	when smn_comercial.smn_plan_venta.plv_mes_rf='AC' then '{lbl:b_active}'
	when smn_comercial.smn_plan_venta.plv_mes_rf='IN' then '{lbl:b_inactive}'
	end as plv_mes_rf,
	case
	when smn_comercial.smn_plan_venta.plv_semana_rf='AC' then '{lbl:b_active}'
	when smn_comercial.smn_plan_venta.plv_semana_rf='IN' then '{lbl:b_inactive}'
	end as plv_semana_rf,
select
select
select
	smn_comercial.smn_plan_venta.*
from
	smn_base.smn_monedas,
	smn_comercial.smn_plan_venta
where
	smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_plan_venta.plv_precio_ma_rf and
	smn_plan_venta_id = ${fld:id}
