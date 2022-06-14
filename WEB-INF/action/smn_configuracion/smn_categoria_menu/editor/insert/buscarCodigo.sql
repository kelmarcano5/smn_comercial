select
		smn_comercial.smn_categoria_menu.cam_codigo
from
		smn_comercial.smn_categoria_menu
where
		upper(smn_comercial.smn_categoria_menu.cam_codigo) = upper(${fld:cam_codigo})
