select smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id as id, 
smn_comercial.smn_centro_facturacion.cfc_codigo ||' - '|| smn_comercial.smn_centro_facturacion.cfc_nombre as item 
from smn_comercial.smn_centro_facturacion 
inner join smn_comercial.smn_rel_centro_fac_documento
on smn_comercial.smn_rel_centro_fac_documento.smn_centro_facturacion_id = smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id
where
	smn_comercial.smn_rel_centro_fac_documento.smn_documento_id=${fld:id} 
ORDER BY smn_comercial.smn_centro_facturacion.cfc_codigo