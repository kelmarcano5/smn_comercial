select
	${field},
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id,
	case
		when smn_comercial.smn_orden_servicio.ors_estatus='RE' then '${lbl:b_registrada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='AS' then '${lbl:b_asignada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='ES' then '${lbl:b_en_servicio}'
		when smn_comercial.smn_orden_servicio.ors_estatus='AP' then '${lbl:b_aprobada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='RZ' then '${lbl:b_rechazada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='GE' then '${lbl:b_generada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='AN' then '${lbl:b_anulada}'
	end as ors_estatus,
	smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_orden_servicio.ors_numero,
	cl.aux_descripcion as smn_cliente_id,
	smn_comercial.smn_orden_servicio.ors_descripcion,
	smn_comercial.smn_orden_servicio.ors_fecha_inicial,
	smn_comercial.smn_orden_servicio.ors_fecha_final,
	smn_base.smn_prestadores_servicios.prs_descripcion as smn_prestador_servicio_rf,
	smn_comercial.smn_orden_servicio.ors_fecha_registro, 
	smn_base.smn_tipos_servicios.tsr_descripcion as smn_tipo_servicio_rf,
	case
		when smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente='SE' then 'Servicio'
		when smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente='IT' then 'Item'
		when smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente='CO' then 'Componentes'
	end as smn_tipo_componente,
	smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_componentes.cmp_descripcion as smn_componentes_rf,
	smn_comercial.smn_orden_servicio_detalle.osd_cantidad
from
	smn_comercial.smn_orden_servicio
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_orden_servicio.smn_cliente_id
	left outer join smn_base.smn_auxiliar cl on cl.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_comercial.smn_orden_servicio.smn_prestador_servicio_rf
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_orden_servicio.smn_documento_id
	left outer join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_comercial.smn_orden_servicio.smn_tipo_servicio_rf
	inner join smn_comercial.smn_orden_cab_det_servicio on smn_comercial.smn_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id
	inner join smn_comercial.smn_orden_servicio_detalle on smn_comercial.smn_orden_cab_det_servicio.smn_orden_cab_det_servicio_id = smn_comercial.smn_orden_servicio_detalle.smn_orden_cab_det_servicio_id
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_orden_servicio_detalle.smn_servicios_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_orden_servicio_detalle.smn_item_rf
	left outer join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_orden_servicio_detalle.smn_componentes_rf	
where
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id is not null
	${filter}