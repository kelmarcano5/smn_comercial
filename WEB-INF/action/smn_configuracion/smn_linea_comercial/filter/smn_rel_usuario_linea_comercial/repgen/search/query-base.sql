select
		smn_comercial.smn_rel_usuario_linea_comercial.smn_rel_usuario_linea_comercial_id,
	${field}
from
	smn_comercial.smn_rel_usuario_linea_comercial
where
		smn_comercial.smn_rel_usuario_linea_comercial.smn_rel_usuario_linea_comercial_id is not null
	${filter}
	
	
