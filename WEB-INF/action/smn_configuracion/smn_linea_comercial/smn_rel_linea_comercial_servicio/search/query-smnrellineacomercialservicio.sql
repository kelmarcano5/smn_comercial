select
	smn_comercial.smn_linea_comercial.smn_linea_comercial_id, 
	smn_comercial.smn_linea_comercial.lco_codigo as lco_codigo_pl0,
	(select smn_comercial.smn_linea_comercial.lco_codigo|| ' - ' || smn_comercial.smn_linea_comercial.lco_nombre from  smn_comercial.smn_linea_comercial  where smn_comercial.smn_linea_comercial.smn_linea_comercial_id is not null  and smn_comercial.smn_linea_comercial.smn_linea_comercial_id=smn_comercial.smn_rel_linea_comercial_servicio.smn_linea_comercial_id  order by lco_nombre ) as smn_linea_comercial_id_combo,
	(select smn_base.smn_servicios.svc_codigo|| ' - ' || smn_base.smn_servicios.svc_descripcion from  smn_base.smn_servicios  where smn_base.smn_servicios.smn_servicios_id is not null  and smn_base.smn_servicios.smn_servicios_id=smn_comercial.smn_rel_linea_comercial_servicio.smn_servicio_rf  order by svc_descripcion ) as smn_servicio_rf_combo,
	case
		when smn_comercial.smn_rel_linea_comercial_servicio.rls_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_rel_linea_comercial_servicio.rls_estatus='IN' then '${lbl:b_inactive}'
	end as rls_estatus_combo,
	smn_comercial.smn_rel_linea_comercial_servicio.smn_linea_comercial_id,
	smn_comercial.smn_rel_linea_comercial_servicio.smn_servicio_rf,
	smn_comercial.smn_rel_linea_comercial_servicio.rls_estatus,
	smn_comercial.smn_rel_linea_comercial_servicio.rls_vigencia,
	smn_comercial.smn_rel_linea_comercial_servicio.rls_idioma,
	smn_comercial.smn_rel_linea_comercial_servicio.rls_usuario,
	smn_comercial.smn_rel_linea_comercial_servicio.rls_fecha_registro,
	smn_comercial.smn_rel_linea_comercial_servicio.rls_hora,
	smn_comercial.smn_rel_linea_comercial_servicio.smn_rel_linea_comercial_servicio_id
	
from
	smn_comercial.smn_linea_comercial,
	smn_comercial.smn_rel_linea_comercial_servicio
where
	smn_comercial.smn_linea_comercial.smn_linea_comercial_id=smn_comercial.smn_rel_linea_comercial_servicio.smn_linea_comercial_id
and smn_comercial.smn_linea_comercial.smn_linea_comercial_id=${fld:id2}	
order by
		smn_rel_linea_comercial_servicio_id
