select
		smn_comercial.smn_grupo_promotores_vendedores.gpv_codigo
from
		smn_comercial.smn_grupo_promotores_vendedores
where
		upper(smn_comercial.smn_grupo_promotores_vendedores.gpv_codigo) = upper(${fld:gpv_codigo})
