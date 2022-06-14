select
		smn_comercial.smn_prospecto.smn_prospecto_id,
	case
	when smn_comercial.smn_prospecto.pro_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_prospecto.pro_estatus='IN' then '${lbl:b_inactive}'
	end as pro_estatus_combo,
	smn_comercial.smn_prospecto.pro_codigo,
	smn_comercial.smn_prospecto.pro_descripcion,
	smn_comercial.smn_prospecto.pro_email,
	smn_comercial.smn_prospecto.pro_movil,
	smn_comercial.smn_prospecto.pro_vigencia,
	smn_base.smn_tipo_contactos.tco_descripcion as smn_tipo_contactos_rf,
	smn_comercial.smn_prospecto.pro_descripcion_contacto,
	smn_comercial.smn_prospecto.pro_fecha_registro
	
from
	smn_comercial.smn_prospecto
	inner join smn_base.smn_tipo_contactos on smn_base.smn_tipo_contactos.smn_tipo_contactos_id = smn_comercial.smn_prospecto.smn_tipo_contactos_rf
where
	smn_prospecto_id = ${fld:id}
