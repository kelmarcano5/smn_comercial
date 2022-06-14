select
		smn_comercial.smn_accion.acc_descripcion
from
		smn_comercial.smn_accion
where
		upper(smn_comercial.smn_accion.acc_descripcion) = upper(${fld:acc_descripcion})
