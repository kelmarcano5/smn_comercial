select
		smn_comercial.smn_rel_cliente_entidad_financiera.smn_rel_cliente_entidad_financiera_id,
	${field}
from
	smn_comercial.smn_rel_cliente_entidad_financiera
where
		smn_comercial.smn_rel_cliente_entidad_financiera.smn_rel_cliente_entidad_financiera_id is not null
	${filter}
	
	
