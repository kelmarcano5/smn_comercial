select
		smn_comercial.smn_rel_auxiliar_direccion.smn_rel_auxiliar_direccion_id,
	${field}
from
	smn_comercial.smn_rel_auxiliar_direccion
where
		smn_comercial.smn_rel_auxiliar_direccion.smn_rel_auxiliar_direccion_id is not null
	${filter}
	
	
