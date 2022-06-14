select smn_base.smn_baremos_detalle.bad_precio_moneda_local as precio,
case 
when smn_base.smn_baremos_detalle.smn_moneda_rf is not null and smn_base.smn_baremos_detalle.bad_precio_moneda_alterna is not null then smn_base.smn_baremos_detalle.bad_precio_moneda_alterna 
when smn_base.smn_baremos_detalle.smn_moneda_rf is null and smn_base.smn_baremos_detalle.bad_precio_moneda_alterna is null then 0
end as precioma,
smn_base.smn_baremos_detalle.smn_moneda_rf
from smn_base.smn_baremos_detalle
inner join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = smn_base.smn_baremos_detalle.smn_baremos_id
where smn_base.smn_baremos_detalle.bad_precio_moneda_local is not null and smn_base.smn_baremos_detalle.smn_item_rf=${fld:id} 

