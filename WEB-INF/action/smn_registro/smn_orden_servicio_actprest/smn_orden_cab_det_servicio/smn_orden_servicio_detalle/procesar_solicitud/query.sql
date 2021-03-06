select
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id,
	smn_comercial.smn_orden_servicio.smn_documento_id as smn_documento_origen_id,
	smn_comercial.smn_orden_servicio.ors_numero as des_numero_documento_origen,
	smn_comercial.smn_orden_servicio.ors_descripcion ||' N° De Orden de Servicio: '||smn_comercial.smn_orden_servicio.ors_numero as des_descripcion,
	smn_comercial.smn_cliente.smn_auxiliar_rf as smn_auxiliar_rf,
	smn_comercial.smn_cliente.smn_clase_auxiliar_rf as smn_clase_auxiliar_rf,
	smn_comercial.smn_orden_servicio.smn_prestador_servicio_rf as smn_usuario_solicitante_rf,
	smn_comercial.smn_centro_facturacion.smn_entidades_rf as smn_entidad_rf,
	smn_comercial.smn_centro_facturacion.smn_sucursales_rf as smn_sucursal_rf,
	smn_comercial.smn_documento.smn_documentos_generales_rf,
	smn_comercial.smn_orden_servicio.ors_fecha_registro	
from
	smn_comercial.smn_orden_servicio
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_orden_servicio.smn_cliente_id
	inner join smn_base.smn_auxiliar cl on cl.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_comercial.smn_orden_servicio.smn_prestador_servicio_rf
	left join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_orden_servicio.smn_documento_id
	inner join smn_comercial.smn_rel_cliente_entidad_financiera on smn_comercial.smn_rel_cliente_entidad_financiera.smn_cliente_id = smn_comercial.smn_orden_servicio.smn_cliente_id
	inner join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_orden_servicio.smn_centro_facturacion_id
	inner join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id =  smn_comercial.smn_documento.smn_documentos_generales_rf
where
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id=${fld:id2} 