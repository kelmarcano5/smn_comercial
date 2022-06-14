select distinct smn_base.smn_usuarios.smn_auxiliar_rf as id,
smn_seguridad.s_user.lname ||' - '|| smn_seguridad.s_user.fname as item 
from smn_base.smn_usuarios
left join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
left join smn_comercial.smn_rol on smn_comercial.smn_rol.smn_usuarios_rf = smn_base.smn_usuarios.smn_usuarios_id
where smn_seguridad.s_user.userlogin = '${def:user}' and smn_comercial.smn_rol.rol_tipo='PR'