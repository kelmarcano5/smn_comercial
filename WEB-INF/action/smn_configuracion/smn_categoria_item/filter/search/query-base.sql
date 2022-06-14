select
	case
	when smn_comercial.smn_categoria_item.cai_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_categoria_item.cai_estatus='IN' then '${lbl:b_inactive}'
	end as cai_estatus_combo,
	smn_comercial.smn_categoria_item.cai_codigo,
	smn_comercial.smn_categoria_item.cai_descripcion,
	smn_comercial.smn_categoria_item.cai_estatus,
	smn_comercial.smn_categoria_item.cai_fecha_vigencia,
	smn_comercial.smn_categoria_item.cai_fecha_registro,
		smn_comercial.smn_categoria_item.smn_categoria_item_id
	
from
	smn_comercial.smn_categoria_item
where
	smn_categoria_item_id is not null
	${filter}
order by
		smn_categoria_item_id
