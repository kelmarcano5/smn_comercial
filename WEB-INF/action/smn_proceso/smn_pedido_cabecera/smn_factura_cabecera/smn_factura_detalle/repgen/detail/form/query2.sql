select
		smn_comercial.smn_factura_detalle.smn_factura_cabecera_id,
	smn_comercial.smn_factura_detalle.fde_naturaleza,
	smn_comercial.smn_factura_detalle.smn_servicios_rf,
	smn_comercial.smn_factura_detalle.smn_item_rf,
	smn_comercial.smn_factura_detalle.smn_activo_fijo_rf,
	smn_comercial.smn_factura_detalle.fde_cantidad,
	smn_comercial.smn_factura_detalle.fde_precio_ml,
	smn_comercial.smn_factura_detalle.fde_monto_ml,
	smn_comercial.smn_factura_detalle.smn_moneda_rf,
	smn_comercial.smn_factura_detalle.smn_tasa_rf,
	smn_comercial.smn_factura_detalle.fde_precio_ma,
	smn_comercial.smn_factura_detalle.fde_monto_ma,
	smn_comercial.smn_factura_detalle.fde_fecha_registro
from
	smn_comercial.smn_factura_detalle 
where
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id = ${fld:id}
