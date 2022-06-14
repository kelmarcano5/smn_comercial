select
		smn_comercial.smn_presupuesto_impuesto.smn_codigo_impuesto_id
from
		smn_comercial.smn_presupuesto_impuesto
where
		upper(smn_comercial.smn_presupuesto_impuesto.smn_codigo_impuesto_id) = upper(${fld:smn_codigo_impuesto_id})
