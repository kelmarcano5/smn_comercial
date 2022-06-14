select
		smn_comercial.smn_rel_cliente_area_interes.smn_rel_cliente_area_interes_id,
	${field}
from
	smn_comercial.smn_rel_cliente_area_interes
where
		smn_comercial.smn_rel_cliente_area_interes.smn_rel_cliente_area_interes_id is not null
	${filter}
	
	
