select
		smn_comercial.smn_ingredientes.smn_ingredientes_id,
	smn_comercial.smn_solicitud_servicio_entregas_detalle.smn_solicitud_servicio_entregas_detalle_id,
	smn_comercial.smn_solicitud_servicio_entregas_detalle.sed_requirimientos as sed_requirimientos_pl0,
	smn_comercial.smn_ingredientes.smn_solicitud_servicio_entregas_detalle_id,
	smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_unidad_medida.unm_codigo ||' - '|| smn_base.smn_unidad_medida.unm_descripcion as smn_unidad_medida_rf,
	smn_comercial.smn_ingredientes.igs_cantidad,
	smn_comercial.smn_ingredientes.igs_precio,
	smn_comercial.smn_ingredientes.igs_fecha_registro
	
from
	smn_comercial.smn_ingredientes
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_comercial.smn_ingredientes.smn_unidad_medida_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_ingredientes.smn_item_rf
	inner join smn_comercial.smn_solicitud_servicio_entregas_detalle on smn_comercial.smn_solicitud_servicio_entregas_detalle.smn_solicitud_servicio_entregas_detalle_id = smn_comercial.smn_ingredientes.smn_solicitud_servicio_entregas_detalle_id
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_ingredientes.smn_moneda_rf

