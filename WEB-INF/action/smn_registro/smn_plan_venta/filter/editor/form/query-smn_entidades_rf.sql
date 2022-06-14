select distinct smn_base.smn_entidades.smn_entidades_id as id, smn_base.smn_entidades.ent_codigo ||'-'|| smn_base.smn_entidades.ent_descripcion_corta as item from smn_base.smn_entidades
left outer join smn_compras.smn_roles on smn_compras.smn_roles.smn_entidades_id = smn_base.smn_entidades.smn_entidades_id
left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_compras.smn_roles.smn_sucursales_id
left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_compras.smn_roles.smn_usuarios_id
left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
-- where 
-- smn_seguridad.s_user.userlogin='${def:user}'