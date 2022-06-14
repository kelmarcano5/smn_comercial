select
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id,
	case
		when smn_comercial.smn_orden_servicio.ors_estatus='SO' then 'Solicitada'
		when smn_comercial.smn_orden_servicio.ors_estatus='RE' then '${lbl:b_registrada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='AS' then '${lbl:b_asignada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='ES' then '${lbl:b_en_servicio}'
		when smn_comercial.smn_orden_servicio.ors_estatus='AP' then '${lbl:b_aprobada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='RZ' then '${lbl:b_rechazada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='GE' then '${lbl:b_generada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='AN' then '${lbl:b_anulada}'
		when smn_comercial.smn_orden_servicio.ors_estatus='PR' then 'En Presupuesto'
	end as ors_estatus,
	smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_orden_servicio.ors_numero,
	cl.aux_descripcion as smn_cliente_id,
	smn_comercial.smn_orden_servicio.ors_descripcion,
	smn_comercial.smn_orden_servicio.ors_fecha_inicial,
	smn_comercial.smn_orden_servicio.ors_fecha_final,
	smn_base.smn_prestadores_servicios.prs_descripcion as smn_prestador_servicio_rf,
	smn_comercial.smn_orden_servicio.smn_prestador_servicio_rf as prestadorid,
	smn_comercial.smn_orden_servicio.ors_fecha_registro,
	smn_base.smn_tipos_servicios.tsr_codigo as tdf_naturaleza, 
	smn_base.smn_tipos_servicios.tsr_codigo ||' - '|| smn_base.smn_tipos_servicios.tsr_descripcion as tipo_documento,
	smn_comercial.smn_orden_servicio.smn_tipo_servicio_rf	
from
	smn_comercial.smn_orden_servicio
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_orden_servicio.smn_cliente_id
	inner join smn_base.smn_auxiliar cl on cl.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_comercial.smn_orden_servicio.smn_prestador_servicio_rf
	left join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_orden_servicio.smn_documento_id
	inner join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_comercial.smn_orden_servicio.smn_tipo_servicio_rf	

where
	smn_orden_servicio_id is not null
	${filter}
order by
		smn_orden_servicio_id
