select
	smn_comercial.smn_documento_grp_titulo_imp.smn_documento_grp_titulo_imp_id, 
	(select smn_comercial.smn_documento.dcf_codigo || ' - ' || smn_comercial.smn_documento.dcf_descripcion || ' - ' || smn_base.smn_grupo_titulo_impresion.gti_codigo || ' - ' || smn_base.smn_grupo_titulo_impresion.gti_descripcion from   smn_comercial.smn_documento_grp_titulo_imp, smn_comercial.smn_documento, smn_base.smn_grupo_titulo_impresion where smn_comercial.smn_documento_grp_titulo_imp.smn_documento_id = smn_comercial.smn_documento.smn_documento_id and smn_comercial.smn_documento_grp_titulo_imp.smn_grupo_titulo_impresion_rf = smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id  and smn_comercial.smn_documento_grp_titulo_imp.smn_documento_grp_titulo_imp_id=smn_comercial.smn_detalle_documento_titulo_imp.smn_documento_grp_titulo_imp_id  order by smn_grupo_titulo_impresion_rf ) as smn_documento_grp_titulo_imp_id,
	case
		when smn_comercial.smn_detalle_documento_titulo_imp.dgi_naturaleza='S' then '${lbl:b_service}'
		when smn_comercial.smn_detalle_documento_titulo_imp.dgi_naturaleza='I' then '${lbl:b_item}'
	end as smn_item_servicio_rf,
	(select case when smn_comercial.smn_detalle_documento_titulo_imp.dgi_naturaleza = 'S' then (select smn_base.smn_servicios.svc_codigo|| ' - ' || smn_base.smn_servicios.svc_descripcion as item from smn_base.smn_servicios where smn_comercial.smn_detalle_documento_titulo_imp.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id order by svc_descripcion) when smn_comercial.smn_detalle_documento_titulo_imp.dgi_naturaleza = 'I' then (select smn_base.smn_item.itm_codigo|| ' - ' || smn_base.smn_item.itm_nombre as item from smn_base.smn_item where smn_comercial.smn_detalle_documento_titulo_imp.smn_item_rf = smn_base.smn_item.smn_item_id order by itm_nombre) else null end) smn_id_rf,
	smn_comercial.smn_detalle_documento_titulo_imp.dgi_naturaleza,
	smn_base.smn_componentes.cmp_descripcion as smn_componentes_rf,
	smn_comercial.smn_detalle_documento_titulo_imp.dgi_fecha_registro,
	smn_comercial.smn_detalle_documento_titulo_imp.smn_detalle_documento_titulo_imp_id
	
from
	smn_comercial.smn_detalle_documento_titulo_imp
	inner join smn_comercial.smn_documento_grp_titulo_imp on smn_comercial.smn_documento_grp_titulo_imp.smn_documento_grp_titulo_imp_id = smn_comercial.smn_detalle_documento_titulo_imp.smn_documento_grp_titulo_imp_id
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_detalle_documento_titulo_imp.smn_componentes_rf

where
	smn_comercial.smn_documento_grp_titulo_imp.smn_documento_grp_titulo_imp_id=smn_comercial.smn_detalle_documento_titulo_imp.smn_documento_grp_titulo_imp_id
	and smn_detalle_documento_titulo_imp_id = ${fld:id}