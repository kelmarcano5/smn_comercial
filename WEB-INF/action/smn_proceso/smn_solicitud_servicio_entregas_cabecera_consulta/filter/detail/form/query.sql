select
		smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_solicitud_servicio_entregas_cabecera_id,
	case
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_origen='W' then '${lbl:b_web}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_origen='C' then '${lbl:b_call_centre}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_origen='L' then '${lbl:b_local}'
	end as sec_origen1,
	case
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='SO' then '${lbl:b_solicitada}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='AC' then '${lbl:b_aprobada_comercio}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='AS' then '${lbl:b_aprobada_solicitante}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='EP' then '${lbl:b_en_proceso}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='DE' then '${lbl:b_despachado}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='EN' then '${lbl:b_entregado}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='RE' then '${lbl:b_rechazado}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='ER' then 'En Despacho'
	end as sec_estatus_proceso1,
	case
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_financiera='PE' then '${lbl:b_pendiente}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_financiera='PA' then '${lbl:b_pagado}'
	when smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_estatus_financiera='DV' then '${lbl:b_devuelto}'
	end as sec_estatus_financiera1,
	smn_entrega.smn_documento.doc_codigo||' - '|| smn_entrega.smn_documento.doc_descripcion as smn_documento_id1,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_rf1,
	smn_base.smn_tipos_servicios.tsr_descripcion as smn_tipo_servicio_rf1,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_descripcion,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_fecha_registro,
	smn_base.smn_direccion.dir_descripcion as sec_direccion_busqueda,
	smn_base.smn_direccion.dir_descripcion as sec_direccion_entrega,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_hora_preparacion,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_hora_inicio_preparacion,
  smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_hora_despacho,
	smn_base.smn_formas_pago.fop_descripcion as smn_forma_pago_rf,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_especificacion_servicio,
		smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_fecha_solicitud,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_monto_ml,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_monto_ma,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_monto_pago_efectivo,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_otras_instrucciones,
		smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_fecha_solicitud,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_hora_solicitud,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_tiempo_sug_preparacion,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_observacion_servicio
	
from
	smn_entrega.smn_solicitud_servicio_entregas_cabecera	
	left outer join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_tipo_servicio_rf
	left outer join smn_entrega.smn_documento on smn_entrega.smn_documento.smn_documento_id = smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_documento_id
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_cliente_rf
	left outer join smn_base.smn_formas_pago on smn_base.smn_formas_pago.smn_formas_pago_id = smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_forma_pago_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_moneda_rf
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_direccion_entrega and smn_base.smn_direccion.smn_direccion_id = smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_direccion_busqueda

where
	smn_solicitud_servicio_entregas_cabecera_id = ${fld:id}

