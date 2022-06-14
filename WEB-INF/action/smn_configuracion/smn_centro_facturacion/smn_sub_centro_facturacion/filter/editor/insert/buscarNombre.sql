select
		smn_comercial.smn_sub_centro_facturacion.scf_nombre
from
		smn_comercial.smn_sub_centro_facturacion
where
		upper(smn_comercial.smn_sub_centro_facturacion.scf_nombre) = upper(${fld:scf_nombre})
