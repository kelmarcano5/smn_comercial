select
		smn_comercial.smn_metas.smn_metas_id,
	case
	when smn_comercial.smn_metas.met_estatus='RE' then '${lbl:b_registry}'
	when smn_comercial.smn_metas.met_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_metas.met_estatus='VE' then '${lbl:b_expired}'
	end as met_estatus_combo,
	smn_comercial.smn_tipo_documentos_fact.tdf_codigo||' - '|| smn_comercial.smn_tipo_documentos_fact.tdf_nombre as smn_tipo_documento_id_combo,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id_combo,
	smn_base.smn_v_usuarios.usr_nombres||' - '|| smn_base.smn_v_usuarios.usr_apellidos as smn_usuario_rf_combo,
	smn_base.smn_clase_auxiliar.cla_codigo ||' - '|| smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf_combo,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf_combo,
	CASE
			when smn_comercial.smn_rol.rol_tipo = 'SO' then 'SOLICITANTE'
			when smn_comercial.smn_rol.rol_tipo = 'AP' then 'APROBADOR'
			when smn_comercial.smn_rol.rol_tipo = 'FC' then 'FACTURADOR'
			when smn_comercial.smn_rol.rol_tipo = 'VD' then 'VENDEDOR'
			when smn_comercial.smn_rol.rol_tipo = 'PR' then 'PROMOTOR'
			when smn_comercial.smn_rol.rol_tipo = 'EC' then 'EJECUTIVO CALL'
	end as smn_rol_id_combo,
	smn_comercial.smn_metas.met_cantidad_diaria,
	smn_comercial.smn_metas.met_cantidad_usuario,
	smn_comercial.smn_metas.met_estatus,
	smn_comercial.smn_metas.met_fecha_registro
	
from
	smn_comercial.smn_metas
	inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_metas.smn_documento_id
	inner join smn_comercial.smn_tipo_documentos_fact on smn_comercial.smn_tipo_documentos_fact.smn_tipo_documentos_fact_id = smn_comercial.smn_metas.smn_tipo_documento_id
	LEFT OUTER JOIN smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_metas.smn_auxiliar_rf
	LEFT OUTER JOIN smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_metas.smn_usuario_rf
	LEFT OUTER JOIN smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_comercial.smn_metas.smn_clase_auxiliar_rf
	LEFT OUTER JOIN smn_comercial.smn_rol on smn_comercial.smn_rol.smn_rol_id = smn_comercial.smn_metas.smn_rol_id
