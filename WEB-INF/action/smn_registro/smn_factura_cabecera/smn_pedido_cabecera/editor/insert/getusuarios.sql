select smn_base.smn_usuarios.smn_usuarios_id as id_usuario
from smn_base.smn_usuarios
LEFT OUTER JOIN smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where smn_seguridad.s_user.userlogin = '${def:user}'