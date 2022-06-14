select
	smn_entrega.smn_solicitud_servicio_entregas_detalle.smn_solicitud_servicio_entregas_detalle_id,
		smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_solicitud_servicio_entregas_cabecera_id as numero_documento,
	smn_base.smn_item.itm_nombre as item,
	smn_entrega.smn_catalogo_item_comercio.cic_tiempo_sug_preparacion as tiempo,
	smn_entrega.smn_documento.doc_descripcion as documento,
	smn_entrega.smn_solicitud_servicio_entregas_detalle.sed_cantidad as cantidad,
	smn_entrega.smn_solicitud_servicio_entregas_detalle.sed_monto_moneda_local as monto,
	case
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='SO' then '${lbl:b_solicitada}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='AC' then '${lbl:b_aprobada_comercio}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='AS' then '${lbl:b_aprobada_solicitante}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='EP' then '${lbl:b_en_proceso}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='DE' then '${lbl:b_despachado}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='EN' then '${lbl:b_entregado}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='RE' then '${lbl:b_rechazado}'
	end as estatus_proceso,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_solicitud_servicio_entregas_cabecera_id,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_observacion_servicio,
	smn_entrega.smn_solicitud_servicio_entregas_detalle.sed_fecha_registro as fecha_registro
from
	smn_entrega.smn_solicitud_servicio_entregas_detalle	
	left outer join smn_entrega.smn_solicitud_servicio_entregas_cabecera on smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_solicitud_servicio_entregas_cabecera_id = smn_entrega.smn_solicitud_servicio_entregas_detalle.smn_solicitud_servicio_entregas_cabecera_id
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_entrega.smn_solicitud_servicio_entregas_detalle.smn_unidad_medida_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_entrega.smn_solicitud_servicio_entregas_detalle.smn_moneda_rf
	left outer join smn_entrega.smn_catalogo_item_comercio on smn_entrega.smn_catalogo_item_comercio.smn_catalogo_item_comercio_id = smn_entrega.smn_solicitud_servicio_entregas_detalle.smn_catalogo_item_comercio_id	
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_entrega.smn_catalogo_item_comercio.smn_item_rf
	left outer join smn_entrega.smn_documento on smn_entrega.smn_documento.smn_documento_id = smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_documento_id
WHERE	 
	 smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_solicitud_servicio_entregas_cabecera_id = ${fld:id}


