select distinct smn_base.smn_baremos_detalle.bad_precio_moneda_local as precio,
smn_base.smn_baremos_detalle.smn_descuento_rf as descuento,
case 
when smn_base.smn_baremos_detalle.smn_descuento_rf is not null then smn_base.smn_baremos_detalle.bad_precio_moneda_local*smn_base.smn_descuentos_retenciones.dyr_porcentaje_base/100*smn_base.smn_descuentos_retenciones.dyr_porcentaje_descuento/100
	when smn_base.smn_baremos_detalle.smn_descuento_rf is null then smn_base.smn_baremos_detalle.bad_precio_moneda_local
end as prec_descuento,
smn_base.smn_baremos_detalle.bad_precio_moneda_local-case 
when smn_base.smn_baremos_detalle.smn_descuento_rf is not null then smn_base.smn_baremos_detalle.bad_precio_moneda_local*smn_base.smn_descuentos_retenciones.dyr_porcentaje_base/100*smn_base.smn_descuentos_retenciones.dyr_porcentaje_descuento/100
	when smn_base.smn_baremos_detalle.smn_descuento_rf is null then smn_base.smn_baremos_detalle.bad_precio_moneda_local
end as precml,
smn_base.smn_baremos.*, smn_base.smn_baremos_detalle.*
from smn_comercial.smn_catalogo_item_comercio
left outer join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_baremos_rf = ${fld:baremos}
inner join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = ${fld:baremos}
left outer join smn_base.smn_baremos_detalle on smn_base.smn_baremos_detalle.smn_item_rf = smn_comercial.smn_catalogo_item_comercio.smn_item_rf
left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id= smn_comercial.smn_catalogo_item_comercio.smn_item_rf
left outer join smn_base.smn_descuentos_retenciones on smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id = smn_base.smn_baremos_detalle.smn_descuento_rf
where smn_comercial.smn_catalogo_item_comercio.smn_catalogo_item_comercio_id=${fld:id} and smn_base.smn_baremos_detalle.smn_baremos_id=${fld:baremos}