select
		smn_comercial.smn_rel_centro_fac_documento.smn_centro_facturacion_id,
	smn_comercial.smn_rel_centro_fac_documento.smn_documento_id
from
	smn_comercial.smn_rel_centro_fac_documento 
where
	smn_comercial.smn_rel_centro_fac_documento.smn_rel_centro_fac_documento_id = ${fld:id}
