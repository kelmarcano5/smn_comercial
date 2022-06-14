select
	case
	when smn_comercial.smn_tipo_linea_comercial.tlc_naturaleza='IT' then '${lbl:b_item}'
	when smn_comercial.smn_tipo_linea_comercial.tlc_naturaleza='SE' then '${lbl:b_service}'
	when smn_comercial.smn_tipo_linea_comercial.tlc_naturaleza='AF' then '${lbl:b_fixed_asset}'
	end as tlc_naturaleza_combo,
	case
	when smn_comercial.smn_tipo_linea_comercial.tlc_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_tipo_linea_comercial.tlc_estatus='IN' then '${lbl:b_inactive}'
	end as tlc_estatus_combo,
	smn_comercial.smn_tipo_linea_comercial.tlc_codigo,
	smn_comercial.smn_tipo_linea_comercial.tlc_nombre,
	smn_comercial.smn_tipo_linea_comercial.tlc_naturaleza,
	smn_comercial.smn_tipo_linea_comercial.tlc_vigencia,
	smn_comercial.smn_tipo_linea_comercial.tlc_estatus,
	smn_comercial.smn_tipo_linea_comercial.tlc_idioma,
	smn_comercial.smn_tipo_linea_comercial.tlc_usuario,
	smn_comercial.smn_tipo_linea_comercial.tlc_fecha_registro,
	smn_comercial.smn_tipo_linea_comercial.tlc_hora,
		smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id
	
from
	smn_comercial.smn_tipo_linea_comercial
where
	smn_tipo_linea_comercial_id is not null
	${filter}
order by
		smn_tipo_linea_comercial_id
