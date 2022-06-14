select
	smn_comercial.smn_linea_comercial.smn_linea_comercial_id,
	smn_comercial.smn_linea_comercial.lco_codigo as lco_codigo_pl0,
select
select
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
	and
	smn_rel_usuario_linea_comercial_id = ${fld:id}
