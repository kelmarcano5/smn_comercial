SELECT * from smn_comercial.smn_centro_facturacion 
inner join smn_comercial.smn_rel_centro_fac_documento on smn_comercial.smn_rel_centro_fac_documento.smn_centro_facturacion_id = smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id
LEFT JOIN smn_comercial.smn_rel_centro_fac_linea on smn_comercial.smn_rel_centro_fac_linea.smn_centro_facturacion_id = smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id
LEFT JOIN smn_comercial.smn_linea_comercial on smn_comercial.smn_linea_comercial.smn_linea_comercial_id = smn_comercial.smn_rel_centro_fac_linea.smn_linea_comercial_id
LEFT JOIN smn_comercial.smn_tipo_linea_comercial on smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id = smn_comercial.smn_linea_comercial.smn_tipo_linea_comercial_id
where smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id=${fld:centro_fact}