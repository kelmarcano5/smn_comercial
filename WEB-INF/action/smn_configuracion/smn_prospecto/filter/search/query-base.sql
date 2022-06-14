select
	case
	when smn_comercial.smn_prospecto.pro_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_prospecto.pro_estatus='IN' then '${lbl:b_inactive}'
	end as pro_estatus_combo,
	smn_comercial.smn_prospecto.pro_codigo,
	smn_comercial.smn_prospecto.pro_descripcion,
	smn_comercial.smn_prospecto.pro_email,
	smn_comercial.smn_prospecto.pro_movil,
	smn_comercial.smn_prospecto.pro_estatus,
	smn_comercial.smn_prospecto.pro_vigencia,
	smn_comercial.smn_prospecto.pro_fecha_registro,
		smn_comercial.smn_prospecto.smn_prospecto_id
	
from
	smn_comercial.smn_prospecto
where
	smn_prospecto_id is not null
	${filter}
order by
		smn_prospecto_id
