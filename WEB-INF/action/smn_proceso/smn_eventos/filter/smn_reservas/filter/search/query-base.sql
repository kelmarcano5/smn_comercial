select
		smn_comercial.smn_reservas.smn_reservas_id,
	case
	when smn_comercial.smn_reservas.res_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_reservas.res_estatus='CA' then '${lbl:b_cancelled}'
	end as res_estatus,
	smn_comercial.smn_evento.eve_codigo ||' - '|| smn_comercial.smn_evento.eve_descripcion_corta as smn_evento_id,
	afi.aux_descripcion as smn_afiliado_id,
	rel.aux_descripcion as smn_relacionado_id,
	smn_comercial.smn_reservas.res_cantidad,
	smn_comercial.smn_reservas.res_fecha_registro
	
from
	smn_comercial.smn_reservas
	left join smn_comercial.smn_evento on smn_comercial.smn_evento.smn_evento_id = smn_comercial.smn_reservas.smn_evento_id
	left join smn_comercial.smn_afiliados on smn_comercial.smn_afiliados.smn_afiliados_id = smn_comercial.smn_reservas.smn_afiliado_id
	left join smn_comercial.smn_relacionado on smn_comercial.smn_relacionado.smn_relacionado_id = smn_comercial.smn_reservas.smn_relacionado_id
	left join smn_base.smn_auxiliar afi on afi.smn_auxiliar_id = smn_comercial.smn_afiliados.afi_auxiliar_rf
	left join smn_base.smn_auxiliar rel on rel.smn_auxiliar_id = smn_comercial.smn_relacionado.rel_auxiliar_rf
where
	smn_reservas_id is not null and 
	smn_comercial.smn_reservas.smn_evento_id='${fld:id2}'
	${filter}
order by
		smn_reservas_id
