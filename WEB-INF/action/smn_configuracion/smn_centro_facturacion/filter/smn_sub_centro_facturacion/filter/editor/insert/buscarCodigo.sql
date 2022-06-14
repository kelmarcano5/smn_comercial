select
		smn_comercial.smn_sub_centro_facturacion.scf_codigo
from
		smn_comercial.smn_sub_centro_facturacion
where
		upper(smn_comercial.smn_sub_centro_facturacion.scf_codigo) = upper(${fld:scf_codigo})
