select
	smn_comercial.smn_rel_cliente_usuario.smn_rel_cliente_usuario_id,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_seguridad.s_user.lname ||' '|| smn_seguridad.s_user.fname as smn_usuario_rf,
		smn_base.smn_auxiliar.aux_codigo,
	smn_base.smn_auxiliar.aux_descripcion
from
	smn_comercial.smn_rel_cliente_usuario
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_rel_cliente_usuario.smn_cliente_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_rel_cliente_usuario.smn_usuario_rf
	inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where
	smn_comercial.smn_rel_cliente_usuario.smn_cliente_id=${fld:id2}
