<<<<<<< HEAD
<<<<<<< HEAD
select smn_base.smn_usuarios.smn_auxiliar_rf as id,
=======
select DISTINCT smn_base.smn_usuarios.smn_auxiliar_rf as id,
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
=======
select DISTINCT smn_base.smn_usuarios.smn_auxiliar_rf as id,
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
smn_seguridad.s_user.lname ||' - '|| smn_seguridad.s_user.fname as item 
from smn_base.smn_usuarios
left join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
left join smn_comercial.smn_rol on smn_comercial.smn_rol.smn_usuarios_rf = smn_base.smn_usuarios.smn_usuarios_id
<<<<<<< HEAD
<<<<<<< HEAD
where smn_seguridad.s_user.userlogin = '${def:user}' and smn_comercial.smn_rol.rol_tipo='VD'
=======
inner join smn_comercial.smn_rel_centro_facturacion_usuario on smn_comercial.smn_rel_centro_facturacion_usuario.smn_usuario_rf = smn_comercial.smn_rol.smn_usuarios_rf
where  smn_comercial.smn_rel_centro_facturacion_usuario.smn_centro_facturacion_id = '${fld:centro_facturacion}' and smn_comercial.smn_rol.rol_tipo='PR'
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
=======
inner join smn_comercial.smn_rel_centro_facturacion_usuario on smn_comercial.smn_rel_centro_facturacion_usuario.smn_usuario_rf = smn_comercial.smn_rol.smn_usuarios_rf
where  smn_comercial.smn_rel_centro_facturacion_usuario.smn_centro_facturacion_id = '${fld:centro_facturacion}' and smn_comercial.smn_rol.rol_tipo='PR'
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
