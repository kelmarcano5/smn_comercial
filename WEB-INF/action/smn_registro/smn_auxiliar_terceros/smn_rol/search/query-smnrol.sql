select
		smn_entrega.smn_rol.smn_rol_id,
	case
		when smn_entrega.smn_rol.rol_tipo='SO' then '${lbl:b_solicitante}'
		when smn_entrega.smn_rol.rol_tipo='PR' then '${lbl:b_promotor}'
		when smn_entrega.smn_rol.rol_tipo='RE' then '${lbl:b_repartidor}'
		when smn_entrega.smn_rol.rol_tipo='AP' then '${lbl:b_aprobador}'
		when smn_entrega.smn_rol.rol_tipo='AO' then '${lbl:b_aprobador_orden}'
		when smn_entrega.smn_rol.rol_tipo='PP' then '${lbl:b_preparador}'
		when smn_entrega.smn_rol.rol_tipo='VI' then '${lbl:b_visualizador}'
	end as rol_tipo,
	case
		when smn_entrega.smn_rol.rol_estatus='AC' then '${lbl:b_active}'
		when smn_entrega.smn_rol.rol_estatus='IN' then '${lbl:b_inactive}'
	end as rol_estatus,
	smn_base.smn_v_usuarios.usr_nombres ||' - '|| smn_base.smn_v_usuarios.usr_apellidos as smn_usuario_rf,
	smn_base.smn_clase_auxiliar.cla_codigo||' - '|| smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf,
	smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_apellidos as smn_auxiliar_rf,
	smn_base.smn_corporaciones.crp_codigo ||' - '|| smn_base.smn_corporaciones.crp_nombre as smn_corporacion_rf,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo ||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_estructura_organizacional.eor_codigo ||' - '|| smn_base.smn_estructura_organizacional.eor_nombre as smn_posicion_estructura_rf,
	smn_entrega.smn_rol.rol_vigencia,
	smn_entrega.smn_rol.rol_fecha_registro
	
from
	smn_entrega.smn_rol
	left outer join smn_base.smn_corporaciones on smn_base.smn_corporaciones.smn_corporaciones_id = smn_entrega.smn_rol.smn_corporacion_rf
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_entrega.smn_rol.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_entrega.smn_rol.smn_sucursal_rf
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_entrega.smn_rol.smn_posicion_estructura_rf
	inner join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_entrega.smn_rol.smn_usuario_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_entrega.smn_rol.smn_auxiliar_rf
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_entrega.smn_rol.smn_clase_auxiliar_rf
where
	smn_entrega.smn_rol.smn_auxiliar_rf=${fld:id}

