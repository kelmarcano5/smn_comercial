select
	smn_base.smn_estructura_organizacional.eor_nombre,
	${field}
from
	smn_base.smn_estructura_organizacional,
	smn_comercial.smn_rol
where
	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_comercial.smn_rol.rol_posicion_estructura_rf and
		smn_comercial.smn_rol.smn_rol_id = ${fld:id}
	
