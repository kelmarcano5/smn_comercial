select smn_base.smn_usuarios.smn_usuarios_id as id,
smn_seguridad.s_user.lname ||' - '|| smn_seguridad.s_user.fname as item 
from smn_base.smn_usuarios
LEFT OUTER JOIN smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where smn_seguridad.s_user.userlogin = '${def:user}'