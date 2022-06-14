select distinct
	smn_comercial.smn_factura_kits.smn_factura_kits_id,
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id,
	case
	when smn_comercial.smn_factura_kits.fki_estatus='GE' then 'Generada'
	when smn_comercial.smn_factura_kits.fki_estatus='PE' then 'Pendiente'
	when smn_comercial.smn_factura_kits.fki_estatus='PA' then 'Pagado'
	end as fki_estatus,
	smn_comercial.smn_factura_kits.smn_factura_detalle_id,
	origen.itm_codigo ||' - '|| origen.itm_nombre as smn_item_origen_rf,
	destino.itm_codigo ||' - '|| destino.itm_nombre as smn_item_destino_rf,
	smn_comercial.smn_factura_kits.fki_cantidad,
	smn_comercial.smn_factura_kits.fki_precio_ml,
	smn_comercial.smn_factura_kits.fki_monto_ml,
	smn_base.smn_monedas.mon_codigo||' - '|| smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_comercial.smn_factura_kits.smn_tasa_rf,
	smn_comercial.smn_factura_kits.smn_precio_ma_rf,
	smn_comercial.smn_factura_kits.fki_monto_ma_rf,
	smn_comercial.smn_factura_kits.fki_fecha_registro
	
from
	smn_comercial.smn_factura_kits
	inner join smn_comercial.smn_factura_detalle on smn_comercial.smn_factura_detalle.smn_factura_detalle_id = smn_comercial.smn_factura_kits.smn_factura_detalle_id
	inner join smn_base.smn_item destino on destino.smn_item_id = smn_comercial.smn_factura_kits.smn_item_destino_rf
	inner join smn_base.smn_item origen on origen.smn_item_id = smn_comercial.smn_factura_kits.smn_item_origen_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_factura_kits.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_factura_kits.smn_tasa_rf
where
	smn_factura_kits_id is not null
	${filter}
order by
		smn_factura_kits_id
