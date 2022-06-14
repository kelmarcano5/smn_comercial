WITH rows as (
select SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml) as total_descuento_cab
from smn_comercial.smn_presupuesto_detalle
inner join smn_base.smn_descuentos_retenciones on smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id = smn_comercial.smn_presupuesto_detalle.smn_codigo_descuento_rf
where
smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id}
) 
update smn_comercial.smn_presupuesto
set
pre_monto_descuento=rows.total_descuento_cab,
pre_monto_neto_moneda_local=(select smn_comercial.smn_presupuesto.pre_monto_ml from smn_comercial.smn_presupuesto where smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:id})-rows.total_descuento_cab
from rows
where
smn_comercial.smn_presupuesto.smn_presupuesto_id = ${fld:id}