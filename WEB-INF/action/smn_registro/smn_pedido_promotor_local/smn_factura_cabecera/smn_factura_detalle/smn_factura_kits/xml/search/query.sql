select
		smn_comercial.smn_factura_kits.smn_factura_kits_id,
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id,
	smn_comercial.smn_factura_detalle.fde_naturaleza as fde_naturaleza_pl0,
	case
	when smn_comercial.smn_factura_kits.fki_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_factura_kits.fki_estatus='PE' then '${lbl:b_pending}'
	when smn_comercial.smn_factura_kits.fki_estatus='PA' then '${lbl:b_paying}'
	end as fki_estatus,
	smn_comercial.smn_factura_kits.smn_factura_detalle_id,
	smn_comercial.smn_factura_kits.smn_item_origen_rf,
	smn_comercial.smn_factura_kits.smn_item_destino_rf,
	smn_comercial.smn_factura_kits.fki_cantidad,
	smn_comercial.smn_factura_kits.fki_precio_ml,
	smn_comercial.smn_factura_kits.fki_monto_ml,
	smn_comercial.smn_factura_kits.smn_moneda_rf,
	smn_comercial.smn_factura_kits.smn_tasa_rf,
	smn_comercial.smn_factura_kits.smn_precio_ma_rf,
	smn_comercial.smn_factura_kits.fki_monto_ma_rf,
	smn_comercial.smn_factura_kits.fki_estatus,
	smn_comercial.smn_factura_kits.fki_idioma,
	smn_comercial.smn_factura_kits.fki_usuario,
	smn_comercial.smn_factura_kits.fki_fecha_registro,
	smn_comercial.smn_factura_kits.fki_hora
	
from
	smn_comercial.smn_factura_detalle,
	smn_comercial.smn_factura_kits
where
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id=smn_comercial.smn_factura_kits.smn_factura_detalle_id
