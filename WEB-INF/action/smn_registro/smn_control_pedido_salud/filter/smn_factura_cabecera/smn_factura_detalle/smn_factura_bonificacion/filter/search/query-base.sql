select
	smn_comercial.smn_factura_bonificacion.smn_factura_bonificacion_id,
	smn_comercial.smn_factura_bonificacion.smn_factura_detalle_id,
	smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre as smn_item_bonificar_rf,
	smn_comercial.smn_factura_bonificacion.fbo_cantidad_origen,
	smn_comercial.smn_factura_bonificacion.fbo_cantidad_bonificar,
	smn_comercial.smn_factura_bonificacion.fbo_precio_original,
	smn_comercial.smn_factura_bonificacion.fbo_monto,
	smn_comercial.smn_factura_bonificacion.fbo_fecha_registro
	
from
	smn_comercial.smn_factura_bonificacion
	inner join smn_comercial.smn_factura_detalle on smn_comercial.smn_factura_detalle.smn_factura_detalle_id = smn_comercial.smn_factura_bonificacion.smn_factura_detalle_id
	inner join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_factura_bonificacion.smn_item_bonificar_rf
where
	smn_factura_bonificacion_id is not null
	${filter}
order by
		smn_factura_bonificacion_id
