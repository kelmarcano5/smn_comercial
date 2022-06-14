select
		smn_comercial.smn_categoria_menu.cam_descripcion
from
		smn_comercial.smn_categoria_menu
where
		upper(smn_comercial.smn_categoria_menu.cam_descripcion) = upper(${fld:cam_descripcion})
