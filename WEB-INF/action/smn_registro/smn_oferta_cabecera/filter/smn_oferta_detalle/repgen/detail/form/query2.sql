select
		smn_comercial.smn_oferta_detalle.smn_oferta_id,
	smn_comercial.smn_oferta_detalle.ofd_naturaleza,
	smn_comercial.smn_oferta_detalle.smn_servicios_rf,
	smn_comercial.smn_oferta_detalle.smn_item_rf,
	smn_comercial.smn_oferta_detalle.smn_activo_fijo_rf,
	smn_comercial.smn_oferta_detalle.ofd_cantidad,
	smn_comercial.smn_oferta_detalle.ofd_precio,
	smn_comercial.smn_oferta_detalle.ofd_monto_ml,
	smn_comercial.smn_oferta_detalle.ofd_moneda_rf,
	smn_comercial.smn_oferta_detalle.smn_tasa_rf,
	smn_comercial.smn_oferta_detalle.ofd_precio_moneda_alterna,
	smn_comercial.smn_oferta_detalle.ofd_monto_moneda_alterna,
	smn_comercial.smn_oferta_detalle.ofd_fecha_registro
from
	smn_comercial.smn_oferta_detalle 
where
	smn_comercial.smn_oferta_detalle.smn_oferta_detalle_id = ${fld:id}
