SELECT 
	smn_base.smn_sucursales.smn_sucursales_id as id,
	smn_base.smn_sucursales.suc_codigo||'-'||smn_base.smn_sucursales.suc_nombre as item 
from smn_base.smn_sucursales 
	inner join smn_salud.smn_rol on smn_salud.smn_rol.smn_sucursal_rf = smn_base.smn_sucursales.smn_sucursales_id
	inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_salud.smn_rol.smn_usuario_id
	inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where 
	smn_base.smn_sucursales.suc_empresa=${fld:id} and smn_seguridad.s_user.userlogin='${def:user}'