select
		smn_comercial.smn_ingredientes.smn_solicitud_servicio_entrega_detalle_id,
	smn_comercial.smn_ingredientes.smn_item_rf,
	smn_comercial.smn_ingredientes.smn_unidad_medida_rf,
	smn_comercial.smn_ingredientes.igs_cantidad,
	smn_comercial.smn_ingredientes.igs_precio,
	smn_comercial.smn_ingredientes.smn_moneda_rf,
	smn_comercial.smn_ingredientes.igs_precio_ma,
	smn_comercial.smn_ingredientes.igs_monto_moneda_local,
	smn_comercial.smn_ingredientes.igs_monto_moneda_alterna,
	smn_comercial.smn_ingredientes.igs_fecha_registro
from
	smn_comercial.smn_ingredientes 
where
	smn_comercial.smn_ingredientes.smn_ingredientes_id = ${fld:id}
