select 
	smn_comercial.smn_diagnostico_det_estruc_item.smn_diagnostico_det_estruc_item_id,
	smn_comercial.smn_diagnostico_det_estruc_item.smn_diagnostico_det_auto_id,
	smn_base.smn_nivel_estructura.nes_codigo ||' - '|| smn_base.smn_nivel_estructura.nes_nombre as estr,
	smn_base.smn_componentes.cmp_codigo||' - '|| smn_base.smn_componentes.cmp_descripcion smn_componentes_rf,
	 smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_comercial.smn_diagnostico_det_estruc_item.dde_cantidad
	
from
	smn_comercial.smn_diagnostico_det_estruc_item
	left outer join smn_comercial.smn_diagnostico_det_auto on smn_comercial.smn_diagnostico_det_auto.smn_diagnostico_det_auto_id = smn_comercial.smn_diagnostico_det_estruc_item.smn_diagnostico_det_auto_id
	left outer join smn_base.smn_nivel_estructura on smn_base.smn_nivel_estructura.smn_nivel_estructura_id = smn_comercial.smn_diagnostico_det_estruc_item.smn_nivel_estructura_rf
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_diagnostico_det_estruc_item.smn_servicios_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_diagnostico_det_estruc_item.smn_item_rf
	left outer join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_diagnostico_det_estruc_item.smn_componentes_rf	
where
	smn_comercial.smn_diagnostico_det_auto.smn_diagnostico_cab_auto_id=${fld:id} ORDER BY smn_base.smn_servicios.svc_codigo, smn_base.smn_componentes.cmp_codigo asc
