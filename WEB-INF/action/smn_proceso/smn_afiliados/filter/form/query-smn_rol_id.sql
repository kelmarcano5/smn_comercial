select smn_comercial.smn_rol.smn_rol_id as id, promotor.aux_descripcion as item from smn_comercial.smn_rol 
inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_rol.smn_usuarios_rf
inner join smn_base.smn_auxiliar promotor on promotor.smn_auxiliar_id =  smn_base.smn_usuarios.smn_auxiliar_rf where promotor.aux_descripcion NOTNULL
and smn_comercial.smn_rol.rol_tipo='PR'