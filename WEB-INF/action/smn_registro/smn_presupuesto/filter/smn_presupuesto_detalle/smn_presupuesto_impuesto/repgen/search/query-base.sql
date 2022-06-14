select
		smn_comercial.smn_presupuesto_impuesto.smn_presupuesto_impuesto_id,
	${field}
from
	smn_comercial.smn_presupuesto_impuesto
where
		smn_comercial.smn_presupuesto_impuesto.smn_presupuesto_impuesto_id is not null
	${filter}
	
	
