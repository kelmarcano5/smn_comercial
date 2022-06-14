select
		smn_comercial.smn_grupo_promotores_vendedores.gpv_descripcion
from
		smn_comercial.smn_grupo_promotores_vendedores
where
		upper(smn_comercial.smn_grupo_promotores_vendedores.gpv_descripcion) = upper(${fld:gpv_descripcion})
