select smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id as id, 
smn_base.smn_auxiliar_sucursales.trs_codigo|| ' - ' ||smn_base.smn_auxiliar_sucursales.trs_nombre as item 
from smn_base.smn_auxiliar_sucursales
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_auxiliar_sucursales.smn_auxiliar_rf
where 
	smn_base.smn_auxiliar_sucursales.smn_auxiliar_rf=${fld:id}
