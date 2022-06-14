select
		smn_comercial.smn_rel_grp_promotor_vendedor_rol.smn_rel_grp_promotor_vendedor_rol_id,
	${field}
from
	smn_comercial.smn_rel_grp_promotor_vendedor_rol
where
		smn_comercial.smn_rel_grp_promotor_vendedor_rol.smn_rel_grp_promotor_vendedor_rol_id is not null
	${filter}
	
	
