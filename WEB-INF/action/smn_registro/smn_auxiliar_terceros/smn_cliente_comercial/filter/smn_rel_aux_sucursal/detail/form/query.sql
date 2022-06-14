select
		smn_base.smn_rel_aux_sucursal.smn_rel_aux_sucursal_id,
	smn_base.smn_auxiliar.aux_codigo||'-'||smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_id,
	smn_base.smn_auxiliar.aux_tipo_persona as aux_tipo_persona_pl0,
	smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id as id, 
  smn_base.smn_auxiliar_sucursales.trs_codigo|| ' - ' ||smn_base.smn_auxiliar_sucursales.trs_nombre
  as smn_auxiliar_sucursal_id
from
	smn_base.smn_auxiliar,
	smn_base.smn_auxiliar_sucursales,
	smn_base.smn_rel_aux_sucursal
where
	smn_base.smn_auxiliar.smn_auxiliar_id=smn_base.smn_rel_aux_sucursal.smn_auxiliar_id
	and
	smn_rel_aux_sucursal_id = ${fld:id}
