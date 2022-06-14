select
		smn_comercial.smn_evento.smn_evento_id,
	case
	when smn_comercial.smn_evento.eve_estatus='RE' then '${lbl:b_registrado}'
	when smn_comercial.smn_evento.eve_estatus='AP' then '${lbl:b_aprobado}'
	when smn_comercial.smn_evento.eve_estatus='LL' then '${lbl:b_lleno}'
	end as eve_estatus,
	smn_comercial.smn_evento.eve_codigo,
	smn_comercial.smn_evento.eve_descripcion_corta,
	smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_comercial.smn_evento.eve_fecha_inicial,
	smn_comercial.smn_evento.eve_fecha_final,
	smn_base.smn_prestadores_servicios.prs_descripcion as smn_prestador_servicio_rf,
	smn_comercial.smn_evento.eve_fecha_registro
	
from
	smn_comercial.smn_evento
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_evento.smn_servicios_rf
	inner join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_comercial.smn_evento.smn_prestador_servicio_rf