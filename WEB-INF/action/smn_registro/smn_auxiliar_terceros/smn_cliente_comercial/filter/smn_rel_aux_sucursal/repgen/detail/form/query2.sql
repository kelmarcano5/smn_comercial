select
		smn_base.smn_rel_aux_sucursal.smn_auxiliar_id,
	smn_base.smn_rel_aux_sucursal.smn_auxiliar_sucursal_id
from
	smn_base.smn_rel_aux_sucursal 
where
	smn_base.smn_rel_aux_sucursal.smn_rel_aux_sucursal_id = ${fld:id}
