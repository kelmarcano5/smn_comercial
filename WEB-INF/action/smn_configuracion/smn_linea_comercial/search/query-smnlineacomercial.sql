select
	smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id, 
	smn_comercial.smn_tipo_linea_comercial.tlc_codigo as tlc_codigo_pl0,
	(select smn_comercial.smn_tipo_linea_comercial.tlc_codigo|| ' - ' || smn_comercial.smn_tipo_linea_comercial.tlc_nombre from  smn_comercial.smn_tipo_linea_comercial  where smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id is not null  and smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id=smn_comercial.smn_linea_comercial.smn_tipo_linea_comercial_id  order by tlc_nombre ) as smn_tipo_linea_comercial_id_combo,
	case
		when smn_comercial.smn_linea_comercial.lco_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_linea_comercial.lco_estatus='IN' then '${lbl:b_inactive}'
	end as lco_estatus_combo,
	smn_comercial.smn_linea_comercial.smn_tipo_linea_comercial_id,
	smn_comercial.smn_linea_comercial.lco_codigo,
	smn_comercial.smn_linea_comercial.lco_nombre,
	smn_comercial.smn_linea_comercial.lco_vigencia,
	smn_comercial.smn_linea_comercial.lco_estatus,
	smn_comercial.smn_linea_comercial.lco_idioma,
	smn_comercial.smn_linea_comercial.lco_usuario,
	smn_comercial.smn_linea_comercial.lco_fecha_registro,
	smn_comercial.smn_linea_comercial.lco_hora,
	smn_comercial.smn_linea_comercial.smn_linea_comercial_id
	
from
	smn_comercial.smn_tipo_linea_comercial,
	smn_comercial.smn_linea_comercial
where
	smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id=smn_comercial.smn_linea_comercial.smn_tipo_linea_comercial_id
	
order by
		smn_linea_comercial_id
