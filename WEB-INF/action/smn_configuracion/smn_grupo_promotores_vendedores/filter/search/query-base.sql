select
	case
	when smn_comercial.smn_grupo_promotores_vendedores.gpv_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_grupo_promotores_vendedores.gpv_estatus='IN' then '${lbl:b_inactive}'
	end as gpv_estatus_combo,
	smn_comercial.smn_grupo_promotores_vendedores.gpv_codigo,
	smn_comercial.smn_grupo_promotores_vendedores.gpv_descripcion,
	smn_comercial.smn_grupo_promotores_vendedores.gpv_estatus,
	smn_comercial.smn_grupo_promotores_vendedores.gpv_vigencia,
	smn_comercial.smn_grupo_promotores_vendedores.gpv_fecha_registro,
		smn_comercial.smn_grupo_promotores_vendedores.smn_grupo_promotores_vendedores_id
	
from
	smn_comercial.smn_grupo_promotores_vendedores
where
	smn_grupo_promotores_vendedores_id is not null
	${filter}
order by
		smn_grupo_promotores_vendedores_id
