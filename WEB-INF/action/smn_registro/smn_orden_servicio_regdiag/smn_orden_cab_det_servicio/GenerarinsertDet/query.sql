select DISTINCT
smn_comercial.smn_orden_servicio.smn_orden_servicio_id as smn_orden_servicio_id,
	case 
	 when smn_base.smn_componentes.smn_componentes_id IS NULL then 0 else smn_base.smn_componentes.smn_componentes_id
	end as comp_id,	
	case 
		when smn_base.smn_componentes.cmp_tipo_componente = 'IT' then smn_base.smn_componentes.smn_item_rf
	end as item,
	case 
	 when smn_base.smn_componentes.cmp_cantidad IS NULL then 1 else smn_base.smn_componentes.cmp_cantidad
	end as cant,
	smn_comercial.smn_rel_orden_servicio.smn_servicios_rf as serv, 
	smn_base.smn_componentes.cmp_tipo_componente as tipo, 
	case 
	 when smn_base.smn_componentes.cmp_grupo_prestador IS NULL then 0 else smn_base.smn_componentes.cmp_grupo_prestador
	end as prest,
	case 
	 when smn_base.smn_componentes.smn_item_rf IS NULL then 0 else smn_base.smn_componentes.smn_item_rf
	end as nivel,
	case 
	 when smn_comercial.smn_orden_servicio.smn_prestador_servicio_rf IS NULL then 0 else smn_comercial.smn_orden_servicio.smn_prestador_servicio_rf
	end as pres,
	smn_base.smn_componentes.cmp_forma_calculo as forma, 
	smn_base.smn_componentes.cmp_visible as vis, 
	case 
	 when smn_base.smn_componentes.cmp_porcentaje IS NULL then 0 else smn_base.smn_componentes.cmp_porcentaje
	end as por
from smn_comercial.smn_rel_orden_servicio
	inner join smn_comercial.smn_orden_servicio on smn_comercial.smn_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_rel_orden_servicio.smn_orden_servicio_id
	inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_comercial.smn_rel_orden_servicio.smn_servicios_rf
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id
	left join smn_base.smn_grupos_prestadores on smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_base.smn_componentes.cmp_grupo_prestador
where smn_comercial.smn_rel_orden_servicio.smn_orden_servicio_id=${fld:smn_orden_servicio_id} 
and smn_comercial.smn_rel_orden_servicio.ocd_estatus='RE'