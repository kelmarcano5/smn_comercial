select
		smn_comercial.smn_centro_facturacion.cfc_nombre
from
		smn_comercial.smn_centro_facturacion
where
		upper(smn_comercial.smn_centro_facturacion.cfc_nombre) = upper(${fld:cfc_nombre})
