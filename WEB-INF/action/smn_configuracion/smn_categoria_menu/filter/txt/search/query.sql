select
		smn_comercial.smn_categoria_menu.smn_categoria_menu_id,
	case
	when smn_comercial.smn_categoria_menu.cam_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_categoria_menu.cam_estatus='IN' then '${lbl:b_inactive}'
	end as cam_estatus_combo,
	smn_comercial.smn_categoria_menu.cam_codigo,
	smn_comercial.smn_categoria_menu.cam_descripcion,
	smn_comercial.smn_categoria_menu.cam_estatus,
	smn_comercial.smn_categoria_menu.cam_fecha_vigencia,
	smn_comercial.smn_categoria_menu.cam_fecha_registro
	
from
	smn_comercial.smn_categoria_menu
