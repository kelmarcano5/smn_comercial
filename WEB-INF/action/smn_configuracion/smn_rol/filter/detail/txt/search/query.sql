select
select
	smn_base.smn_estructura_organizacional.eor_nombre,
	case
	when smn_comercial.smn_rol.rol_tipo='SO' then '${lbl:b_applicants}'
	when smn_comercial.smn_rol.rol_tipo='AP' then '${lbl:b_approver}'
	when smn_comercial.smn_rol.rol_tipo='AM' then '${lbl:b_ambos}'
	end as rol_tipo_combo,
select
select
select
select
select
select
	case
	when smn_comercial.smn_rol.rol_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_rol.rol_estatus='IN' then '${lbl:b_inactive}'
	end as rol_estatus_combo,
	smn_comercial.smn_rol.rol_usuario,
	smn_comercial.smn_rol.rol_fecha_registro,
	smn_comercial.smn_rol.rol_hora,
	smn_comercial.smn_rol.smn_usuarios_rf,
	smn_comercial.smn_rol.rol_tipo,
	smn_comercial.smn_rol.smn_corporaciones_rf,
	smn_comercial.smn_rol.smn_entidades_rf,
	smn_comercial.smn_rol.smn_sucursales_rf,
	smn_comercial.smn_rol.smn_areas_servicios_rf,
	smn_comercial.smn_rol.smn_unidades_servicios_rf,
	smn_comercial.smn_rol.rol_posicion_estructura_rf,
	smn_comercial.smn_rol.rol_estatus,
	smn_comercial.smn_rol.rol_vigencia,
	smn_comercial.smn_rol.rol_idioma,
		smn_comercial.smn_rol.smn_rol_id
from
	smn_base.smn_estructura_organizacional,
	smn_comercial.smn_rol
where
	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_comercial.smn_rol.rol_posicion_estructura_rf and
	smn_rol_id = ${fld:id}
