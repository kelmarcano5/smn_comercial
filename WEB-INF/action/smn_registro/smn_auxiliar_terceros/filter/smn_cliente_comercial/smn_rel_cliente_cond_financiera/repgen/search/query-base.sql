select
		smn_comercial.smn_rel_cliente_cond_financiera.smn_rel_cliente_cond_financiera_id,
	${field}
from
	smn_comercial.smn_rel_cliente_cond_financiera
where
		smn_comercial.smn_rel_cliente_cond_financiera.smn_rel_cliente_cond_financiera_id is not null
	${filter}
	
	
