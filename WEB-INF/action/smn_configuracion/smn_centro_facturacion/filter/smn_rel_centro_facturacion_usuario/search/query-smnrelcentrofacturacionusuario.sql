select
	smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id, 
	smn_comercial.smn_rel_centro_facturacion_usuario.smn_rel_centro_facturacion_usuario_id,
  smn_comercial.smn_centro_facturacion.cfc_nombre as smn_centro_facturacion_id,
	smn_base.smn_auxiliar.aux_nombres || ' ' || smn_base.smn_auxiliar.aux_apellidos as smn_usuario_rf,
	case
		when smn_comercial.smn_rel_centro_facturacion_usuario.rfu_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_rel_centro_facturacion_usuario.rfu_estatus='IN' then '${lbl:b_inactive}'
	end as rfu_estatus,
	smn_comercial.smn_rel_centro_facturacion_usuario.rfu_vigencia,
	smn_comercial.smn_rel_centro_facturacion_usuario.rfu_fecha_registro
	
from
	smn_comercial.smn_rel_centro_facturacion_usuario
	inner join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_rel_centro_facturacion_usuario.smn_centro_facturacion_id
	inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_rel_centro_facturacion_usuario.smn_usuario_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
where
	smn_comercial.smn_rel_centro_facturacion_usuario.smn_centro_facturacion_id = ${fld:id2}