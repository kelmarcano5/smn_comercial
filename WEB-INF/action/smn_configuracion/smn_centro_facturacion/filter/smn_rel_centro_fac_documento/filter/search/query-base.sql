select
	smn_comercial.smn_rel_centro_fac_documento.smn_rel_centro_fac_documento_id,
	smn_comercial.smn_centro_facturacion.cfc_codigo||' - '|| smn_comercial.smn_centro_facturacion.cfc_nombre as smn_centro_facturacion_id,
	smn_comercial.smn_documento.dcf_codigo||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id
	
from
	smn_comercial.smn_rel_centro_fac_documento
	inner join smn_comercial.smn_centro_facturacion on 
	smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_rel_centro_fac_documento.smn_centro_facturacion_id
	inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = 	smn_comercial.smn_rel_centro_fac_documento.smn_documento_id
where
	smn_rel_centro_fac_documento_id is not null
	${filter}
order by
		smn_rel_centro_fac_documento_id
