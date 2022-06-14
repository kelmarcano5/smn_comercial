select 
	
	smn_base.smn_servicios.smn_servicios_id as id, 
	smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion as item 
from smn_base.smn_servicios 
-- 	left outer join smn_base.smn_baremos_detalle on smn_base.smn_servicios.smn_servicios_id = smn_servicios_rf
-- where smn_base.smn_baremos_detalle.smn_baremos_id = ${fld:smn_baremos_id}
-- order by 1-- DISTINCT 