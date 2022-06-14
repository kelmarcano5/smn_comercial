select smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id as id, 
smn_comercial.smn_centro_facturacion.cfc_codigo ||' - '|| smn_comercial.smn_centro_facturacion.cfc_nombre as item,
 smn_comercial.smn_centro_facturacion.smn_baremos_rf as baremos_rf
from smn_comercial.smn_centro_facturacion 
inner join smn_comercial.smn_rel_centro_facturacion_usuario 
on smn_comercial.smn_rel_centro_facturacion_usuario.smn_centro_facturacion_id = smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id
inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_rel_centro_facturacion_usuario.smn_usuario_rf
inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where
	smn_seguridad.s_user.userlogin='${def:user}' and smn_comercial.smn_centro_facturacion.smn_entidades_rf=${fld:id} 
	ORDER BY smn_comercial.smn_centro_facturacion.cfc_codigo