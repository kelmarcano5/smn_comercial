SELECT  smn_comercial.smn_sub_centro_facturacion.smn_sub_centro_facturacion_id as id, smn_comercial.smn_sub_centro_facturacion.scf_codigo ||' - '||  smn_comercial.smn_sub_centro_facturacion.scf_nombre as item from smn_comercial.smn_centro_facturacion 
inner join smn_comercial.smn_sub_centro_facturacion on smn_comercial.smn_sub_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id
where
smn_comercial.smn_sub_centro_facturacion.smn_centro_facturacion_id=${fld:id}