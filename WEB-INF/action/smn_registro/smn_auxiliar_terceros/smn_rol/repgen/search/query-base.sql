select
		smn_entrega.smn_rol.smn_rol_id,
	${field}
from
	smn_entrega.smn_rol
where
		smn_entrega.smn_rol.smn_rol_id is not null
	${filter}
	
	
