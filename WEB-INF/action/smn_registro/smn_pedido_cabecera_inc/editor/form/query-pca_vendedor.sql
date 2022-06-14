select DISTINCT smn_base.smn_usuarios.smn_auxiliar_rf as id,
smn_seguridad.s_user.lname ||' - '|| smn_seguridad.s_user.fname as item 
from smn_base.smn_usuarios
left join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
left join smn_comercial.smn_rol on smn_comercial.smn_rol.smn_usuarios_rf = smn_base.smn_usuarios.smn_usuarios_id
inner join smn_comercial.smn_rel_centro_facturacion_usuario on smn_comercial.smn_rel_centro_facturacion_usuario.smn_usuario_rf = smn_comercial.smn_rol.smn_usuarios_rf
where  smn_comercial.smn_rel_centro_facturacion_usuario.smn_centro_facturacion_id = '${fld:centro_facturacion}' and smn_comercial.smn_rol.rol_tipo='PR'
