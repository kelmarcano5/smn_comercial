select
		smn_comercial.smn_rel_centro_fac_linea.smn_rel_centro_fac_linea_id,
	${field}
from
	smn_comercial.smn_rel_centro_fac_linea
where
		smn_comercial.smn_rel_centro_fac_linea.smn_rel_centro_fac_linea_id is not null
	${filter}
	
	
