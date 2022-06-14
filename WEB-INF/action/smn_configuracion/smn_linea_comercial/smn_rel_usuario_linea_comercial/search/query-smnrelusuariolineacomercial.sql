select
	smn_comercial.smn_linea_comercial.smn_linea_comercial_id, 
	smn_comercial.smn_linea_comercial.lco_codigo as lco_codigo_pl0,
	(select smn_comercial.smn_linea_comercial.lco_codigo|| ' - ' || smn_comercial.smn_linea_comercial.lco_nombre from  smn_comercial.smn_linea_comercial  where smn_comercial.smn_linea_comercial.smn_linea_comercial_id is not null  and smn_comercial.smn_linea_comercial.smn_linea_comercial_id=smn_comercial.smn_rel_usuario_linea_comercial.smn_linea_comercial_id  order by lco_nombre ) as smn_linea_comercial_id_combo,
	(select smn_base.smn_auxiliar.smn_auxiliar_id|| ' - ' || smn_base.smn_auxiliar.aux_nombres || ' ' || smn_base.smn_auxiliar.aux_apellidos from  smn_base.smn_usuarios, smn_base.smn_auxiliar where  smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id  and smn_usuarios_id=smn_comercial.smn_rel_usuario_linea_comercial.smn_usuario_rf  order by  smn_usuarios_id ) as smn_usuario_rf_combo,
	case
		when smn_comercial.smn_rel_usuario_linea_comercial.rlu_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_rel_usuario_linea_comercial.rlu_estatus='IN' then '${lbl:b_inactive}'
	end as rlu_estatus_combo,
	smn_comercial.smn_rel_usuario_linea_comercial.smn_linea_comercial_id,
	smn_comercial.smn_rel_usuario_linea_comercial.smn_usuario_rf,
	smn_comercial.smn_rel_usuario_linea_comercial.rlu_estatus,
	smn_comercial.smn_rel_usuario_linea_comercial.rlu_vigencia,
	smn_comercial.smn_rel_usuario_linea_comercial.rlu_idioma,
	smn_comercial.smn_rel_usuario_linea_comercial.rlu_usuario,
	smn_comercial.smn_rel_usuario_linea_comercial.rlu_fecha_registro,
	smn_comercial.smn_rel_usuario_linea_comercial.rlu_hora,
	smn_comercial.smn_rel_usuario_linea_comercial.smn_rel_usuario_linea_comercial_id
	
from
	smn_comercial.smn_linea_comercial,
	smn_comercial.smn_rel_usuario_linea_comercial
where
	smn_comercial.smn_linea_comercial.smn_linea_comercial_id=smn_comercial.smn_rel_usuario_linea_comercial.smn_linea_comercial_id
and smn_comercial.smn_linea_comercial.smn_linea_comercial_id=${fld:id2}
order by  smn_rel_usuario_linea_comercial_id asc