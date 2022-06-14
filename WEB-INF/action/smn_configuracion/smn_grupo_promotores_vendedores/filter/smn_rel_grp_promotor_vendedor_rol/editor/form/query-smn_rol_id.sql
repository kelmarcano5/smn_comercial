select smn_comercial.smn_rol.smn_rol_id as id, smn_base.smn_v_auxiliar.smn_item as item from smn_comercial.smn_rol
inner join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_rol.smn_usuarios_rf
inner join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_base.smn_v_usuarios.smn_auxiliar_rf 