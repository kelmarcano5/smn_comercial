select
	smn_comercial.smn_rel_centro_fac_linea.smn_rel_centro_fac_linea_id,
	smn_comercial.smn_centro_facturacion.cfc_codigo||' - '||smn_comercial.smn_centro_facturacion.cfc_nombre as smn_centro_facturacion_id,
	smn_comercial.smn_linea_comercial.lco_codigo||' - '|| smn_comercial.smn_linea_comercial.lco_nombre as smn_linea_comercial_id
	
from
	smn_comercial.smn_linea_comercial
	inner join smn_comercial.smn_rel_centro_fac_linea on smn_comercial.smn_rel_centro_fac_linea.smn_linea_comercial_id = smn_comercial.smn_linea_comercial.smn_linea_comercial_id
	inner join smn_comercial.smn_centro_facturacion on 	smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_rel_centro_fac_linea.smn_centro_facturacion_id
where
smn_comercial.smn_linea_comercial.smn_linea_comercial_id=${fld:id2}	
	