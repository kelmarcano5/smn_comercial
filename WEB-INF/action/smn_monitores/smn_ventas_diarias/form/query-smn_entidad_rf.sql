select 
	smn_base.smn_entidades.smn_entidades_id as id, 
	smn_base.smn_entidades.ent_codigo|| ' - ' || smn_base.smn_entidades.ent_descripcion_corta as item 
from smn_base.smn_entidades
where 
	smn_base.smn_entidades.smn_entidades_id in (select 
													smn_comercial.smn_rol.smn_entidades_rf
												from 
													smn_comercial.smn_rol
												where 
													smn_comercial.smn_rol.smn_usuarios_rf = (select smn_base.smn_usuarios.smn_usuarios_id
																							from
																								${schema}s_user
																								inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_user_rf = smn_seguridad.s_user.user_id
																							where
																								${schema}s_user.userlogin = '${def:user}')	)
-- select smn_base.smn_entidades.smn_entidades_id as id, smn_base.smn_entidades.ent_codigo|| ' - ' || smn_base.smn_entidades.ent_descripcion_corta as item from smn_base.smn_entidades
