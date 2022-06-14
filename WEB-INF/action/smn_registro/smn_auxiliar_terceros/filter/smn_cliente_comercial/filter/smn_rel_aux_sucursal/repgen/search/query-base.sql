select
		smn_base.smn_rel_aux_sucursal.smn_rel_aux_sucursal_id,
	${field}
from
	smn_base.smn_rel_aux_sucursal
where
		smn_base.smn_rel_aux_sucursal.smn_rel_aux_sucursal_id is not null
	${filter}
	
	
