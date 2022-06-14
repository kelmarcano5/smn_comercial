WITH rows as (
select 
smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id as idp,
smn_comercial.smn_presupuesto_detalle.prd_monto_moneda_local as monto_ml,
smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml as des_ml,
smn_comercial.smn_presupuesto_detalle.prd_monto_impuesto_ml as imp_ml,
smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ma as des_ma,
smn_comercial.smn_presupuesto_detalle.prd_monto_impuesto_ma as imp_ma,
smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna as monto_ma,
smn_base.smn_incrementos.inc_porcentaje_incremento as porc_incremento,
smn_base.smn_incrementos.inc_porcentaje_base as porc_base,
smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf as tipo,
case
  when smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf = 'IT' then smn_comercial.smn_presupuesto_detalle.prd_monto_moneda_local*(smn_base.smn_incrementos.inc_porcentaje_base/100)*smn_base.smn_incrementos.inc_porcentaje_incremento/100
end as monto_incremento_ml,
 case 
 when smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf = 'IT' 
 then smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna*(smn_base.smn_incrementos.inc_porcentaje_base/100)*smn_base.smn_incrementos.inc_porcentaje_incremento/100
 end as monto_incremento_ma
from smn_comercial.smn_presupuesto_detalle
inner join smn_base.smn_incrementos on smn_base.smn_incrementos.smn_incrementos_id = smn_comercial.smn_presupuesto_detalle.smn_incrementos_rf
where
smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id= ${fld:id} and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='IT'
) 
update smn_comercial.smn_presupuesto_detalle
set
prd_monto_incremento_ml=(case when rows.tipo ='IT' then rows.monto_incremento_ml end),
prd_monto_incremento_ma=(case when rows.tipo ='IT' then rows.monto_incremento_ma end),
prd_monto_neto_ml=(case when rows.tipo ='IT' then rows.monto_ml+rows.monto_incremento_ml-rows.des_ml+rows.imp_ml end),
prd_monto_neto_ma=(case when rows.tipo ='IT' then rows.monto_ma+rows.monto_incremento_ma-rows.des_ma+rows.imp_ma end)
from rows
where
smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id =  ${fld:id} and smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id =rows.idp and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='IT';