select smn_base.smn_baremos_detalle.bad_precio_moneda_local as precio from smn_base.smn_baremos_detalle
inner join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = smn_base.smn_baremos_detalle.smn_baremos_id
where smn_base.smn_baremos_detalle.smn_item_rf=${fld:id} and smn_base.smn_baremos_detalle.bad_estatus = 'A'