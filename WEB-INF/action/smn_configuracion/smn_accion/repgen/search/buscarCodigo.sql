select
		smn_comercial.smn_accion.acc_codigo
from
		smn_comercial.smn_accion
where
		upper(smn_comercial.smn_accion.acc_codigo) = upper(${fld:acc_codigo})
