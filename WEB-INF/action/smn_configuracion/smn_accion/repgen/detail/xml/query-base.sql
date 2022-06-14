select
	smn_base.smn_paso.pas_descripcion,
	${field}
from
	smn_base.smn_paso,
	smn_comercial.smn_accion
where
	smn_base.smn_paso.smn_paso_id = smn_comercial.smn_accion.acc_paso_rf and
		smn_comercial.smn_accion.smn_accion_id = ${fld:id}
	
