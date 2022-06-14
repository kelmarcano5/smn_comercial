select
		smn_comercial.smn_categoria_item.cai_codigo
from
		smn_comercial.smn_categoria_item
where
		upper(smn_comercial.smn_categoria_item.cai_codigo) = upper(${fld:cai_codigo})
