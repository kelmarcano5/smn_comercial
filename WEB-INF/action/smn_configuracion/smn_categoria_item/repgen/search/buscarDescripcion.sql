select
		smn_comercial.smn_categoria_item.cai_descripcion
from
		smn_comercial.smn_categoria_item
where
		upper(smn_comercial.smn_categoria_item.cai_descripcion) = upper(${fld:cai_descripcion})
