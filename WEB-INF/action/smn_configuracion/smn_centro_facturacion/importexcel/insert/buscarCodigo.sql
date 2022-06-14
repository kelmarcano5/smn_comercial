select
		smn_comercial.smn_centro_facturacion.cfc_codigo
from
		smn_comercial.smn_centro_facturacion
where
		upper(smn_comercial.smn_centro_facturacion.cfc_codigo) = upper(${fld:cfc_codigo})
