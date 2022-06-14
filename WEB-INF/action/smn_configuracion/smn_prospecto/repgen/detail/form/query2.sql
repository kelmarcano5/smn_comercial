select
		smn_comercial.smn_prospecto.pro_codigo,
	smn_comercial.smn_prospecto.pro_descripcion,
	smn_comercial.smn_prospecto.pro_email,
	smn_comercial.smn_prospecto.pro_movil,
	smn_comercial.smn_prospecto.pro_fijo,
	smn_comercial.smn_prospecto.pro_referido,
	smn_comercial.smn_prospecto.pro_estatus,
	smn_comercial.smn_prospecto.pro_vigencia,
	smn_comercial.smn_prospecto.pro_fecha_registro
from
	smn_comercial.smn_prospecto 
where
	smn_comercial.smn_prospecto.smn_prospecto_id = ${fld:id}
