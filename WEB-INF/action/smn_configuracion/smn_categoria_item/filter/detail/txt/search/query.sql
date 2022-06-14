select
	case
	when smn_comercial.smn_categoria_item.cai_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_categoria_item.cai_estatus='IN' then '${lbl:b_inactive}'
	end as cai_estatus_combo,
	smn_comercial.smn_categoria_item.*
from
	smn_comercial.smn_categoria_item
where
	smn_categoria_item_id = ${fld:id}
