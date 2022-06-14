select
	(select smn_base.smn_auxiliar_sucursales.trs_codigo|| ' - ' ||smn_base.smn_auxiliar_sucursales.trs_nombre from  smn_base.smn_auxiliar_sucursales
 where smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id is not null  and smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id=smn_base.smn_auxiliar.smn_auxiliar_sucursal_id) as smn_auxiliar_sucursal_id,
	smn_base.smn_rel_aux_sucursal.*
from 
	smn_base.smn_rel_aux_sucursal,
	smn_base.smn_auxiliar
where
	smn_base.smn_rel_aux_sucursal.smn_auxiliar_id=smn_base.smn_auxiliar.smn_auxiliar_id and 
	smn_base.smn_auxiliar.smn_auxiliar_id=${fld:id}
