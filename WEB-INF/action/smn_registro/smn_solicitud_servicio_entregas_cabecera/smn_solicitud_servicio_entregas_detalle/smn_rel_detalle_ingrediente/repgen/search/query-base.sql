select
		smn_comercial.smn_rel_detalle_ingrediente.smn_rel_detalle_ingrediente_id,
	${field}
from
	smn_comercial.smn_rel_detalle_ingrediente
where
		smn_comercial.smn_rel_detalle_ingrediente.smn_rel_detalle_ingrediente_id is not null
	${filter}
	
	
