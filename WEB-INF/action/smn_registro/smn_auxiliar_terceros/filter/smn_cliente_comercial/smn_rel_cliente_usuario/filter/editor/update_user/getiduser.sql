select 
	user_id 
from smn_seguridad.s_user
left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_user_rf = smn_seguridad.s_user.user_id
where 
	smn_base.smn_usuarios.smn_usuarios_id=${fld:id}