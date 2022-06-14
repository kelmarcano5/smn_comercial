select
	smn_comercial.smn_linea_comercial.smn_linea_comercial_id, 
	smn_comercial.smn_linea_comercial.lco_codigo as lco_codigo_pl0,
	(select smn_comercial.smn_linea_comercial.lco_codigo|| ' - ' || smn_comercial.smn_linea_comercial.lco_nombre from  smn_comercial.smn_linea_comercial  where smn_comercial.smn_linea_comercial.smn_linea_comercial_id is not null  and smn_comercial.smn_linea_comercial.smn_linea_comercial_id=smn_comercial.smn_rel_linea_comercial_afijo.smn_linea_comercial_id  order by lco_nombre ) as smn_linea_comercial_id_combo,
	(select smn_activo_fijo.smn_activo.act_codigo|| ' - ' || smn_activo_fijo.smn_activo.act_descripcion from  smn_activo_fijo.smn_activo  where smn_activo_fijo.smn_activo.smn_activo_id is not null  and smn_activo_fijo.smn_activo.smn_activo_id=smn_comercial.smn_rel_linea_comercial_afijo.smn_activo_rf  order by act_descripcion ) as smn_activo_rf_combo,
	case
		when smn_comercial.smn_rel_linea_comercial_afijo.rla_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_rel_linea_comercial_afijo.rla_estatus='IN' then '${lbl:b_inactive}'
	end as rla_estatus_combo,
	smn_comercial.smn_rel_linea_comercial_afijo.smn_linea_comercial_id,
	smn_comercial.smn_rel_linea_comercial_afijo.smn_activo_rf,
	smn_comercial.smn_rel_linea_comercial_afijo.rla_estatus,
	smn_comercial.smn_rel_linea_comercial_afijo.rla_vigencia,
	smn_comercial.smn_rel_linea_comercial_afijo.rla_idioma,
	smn_comercial.smn_rel_linea_comercial_afijo.rla_usuario,
	smn_comercial.smn_rel_linea_comercial_afijo.rla_fecha_registro,
	smn_comercial.smn_rel_linea_comercial_afijo.rla_hora,
	smn_comercial.smn_rel_linea_comercial_afijo.smn_rel_linea_comercial_afijo_id
	
from
	smn_comercial.smn_linea_comercial,
	smn_comercial.smn_rel_linea_comercial_afijo
where
	smn_rel_linea_comercial_afijo_id is not null
	and 	smn_comercial.smn_linea_comercial.smn_linea_comercial_id=smn_comercial.smn_rel_linea_comercial_afijo.smn_linea_comercial_id
	${filter}
order by
		smn_rel_linea_comercial_afijo_id
