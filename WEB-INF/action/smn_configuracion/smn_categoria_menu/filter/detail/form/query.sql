select
	case
	when smn_comercial.smn_categoria_menu.cam_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_categoria_menu.cam_estatus='IN' then '${lbl:b_inactive}'
	end as cam_estatus_combo,
	smn_comercial.smn_categoria_menu.*
from
	smn_comercial.smn_categoria_menu
where
	smn_categoria_menu_id = ${fld:id}
