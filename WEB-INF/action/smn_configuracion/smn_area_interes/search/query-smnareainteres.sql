select
		smn_comercial.smn_area_interes.smn_area_interes_id,
	case
	when smn_comercial.smn_area_interes.ari_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_area_interes.ari_estatus='IN' then '${lbl:b_inactive}'
	end as ari_estatus_combo,
	smn_comercial.smn_area_interes.ari_codigo,
	smn_comercial.smn_area_interes.ari_descripcion,
	smn_comercial.smn_area_interes.ari_vigencia,
	smn_comercial.smn_area_interes.ari_estatus,
	smn_comercial.smn_area_interes.ari_idioma,
	smn_comercial.smn_area_interes.ari_usuario,
	smn_comercial.smn_area_interes.ari_fecha_registro,
	smn_comercial.smn_area_interes.ari_hora,
		smn_comercial.smn_area_interes.smn_area_interes_id
	
from
	smn_comercial.smn_area_interes
order by
		smn_area_interes_id
