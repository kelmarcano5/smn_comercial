select
	case
	when smn_comercial.smn_grupo_promotores_vendedores.gpv_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_grupo_promotores_vendedores.gpv_estatus='IN' then '${lbl:b_inactive}'
	end as gpv_estatus_combo,
	smn_comercial.smn_grupo_promotores_vendedores.*
from
	smn_comercial.smn_grupo_promotores_vendedores
where
	smn_grupo_promotores_vendedores_id = ${fld:id}
