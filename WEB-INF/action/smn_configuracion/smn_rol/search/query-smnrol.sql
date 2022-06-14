select
	(select smn_base.smn_auxiliar.smn_auxiliar_id|| ' - ' || smn_base.smn_auxiliar.aux_nombres || ' ' || smn_base.smn_auxiliar.aux_apellidos from  smn_base.smn_usuarios, smn_base.smn_auxiliar where  smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id  and smn_usuarios_id=smn_comercial.smn_rol.smn_usuarios_rf  order by  smn_usuarios_id ) as smn_usuarios_rf_combo,
	case
		when smn_comercial.smn_rol.rol_tipo='SO' then '${lbl:b_applicants}'
		when smn_comercial.smn_rol.rol_tipo='AP' then '${lbl:b_approver}'
		when smn_comercial.smn_rol.rol_tipo='FC' then '${lbl:b_billing}'
		when smn_comercial.smn_rol.rol_tipo='VD' then '${lbl:b_seller}'
		when smn_comercial.smn_rol.rol_tipo='PR' then '${lbl:b_promoter}'
		when smn_comercial.smn_rol.rol_tipo='EC' then '${lbl:b_call_executive}'
			when smn_comercial.smn_rol.rol_tipo='CO' then 'Contralor'
				when smn_comercial.smn_rol.rol_tipo='EC' then 'Prestador'
	end as rol_tipo_combo,
	(select smn_base.smn_corporaciones.crp_codigo|| ' - ' || smn_base.smn_corporaciones.crp_nombre from  smn_base.smn_corporaciones  where smn_base.smn_corporaciones.smn_corporaciones_id is not null  and smn_base.smn_corporaciones.smn_corporaciones_id=smn_comercial.smn_rol.smn_corporaciones_rf  order by crp_nombre ) as smn_corporaciones_rf_combo,
	(select smn_base.smn_entidades.ent_codigo|| ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_comercial.smn_rol.smn_entidades_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as smn_entidades_rf_combo,
	(select smn_base.smn_sucursales.suc_codigo|| ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_comercial.smn_rol.smn_sucursales_rf  order by suc_nombre ) as smn_sucursales_rf_combo,
	(select smn_base.smn_areas_servicios.ase_codigo|| ' - ' || smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_comercial.smn_rol.smn_areas_servicios_rf  order by ase_descripcion ) as smn_areas_servicios_rf_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo || ' - ' || smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_comercial.smn_rol.smn_unidades_servicios_rf  order by smn_base.smn_unidades_servicios.uns_descripcion ) as smn_unidades_servicios_rf_combo,
	(select smn_base.smn_estructura_organizacional.eor_codigo|| ' - ' || smn_base.smn_estructura_organizacional.eor_nombre from  smn_base.smn_estructura_organizacional  where smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id is not null  and smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id=smn_comercial.smn_rol.rol_posicion_estructura_rf  order by eor_nombre ) as rol_posicion_estructura_rf_combo,
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
	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_comercial.smn_rol.rol_posicion_estructura_rf
order by
		smn_rol_id
