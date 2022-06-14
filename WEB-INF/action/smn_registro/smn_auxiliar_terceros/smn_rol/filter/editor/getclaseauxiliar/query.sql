SELECT 
smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id as id,
smn_base.smn_clase_auxiliar.cla_nombre as item from smn_base.smn_clase_auxiliar
inner join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_clase_auxiliar_rf = smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id
where smn_base.smn_v_usuarios.smn_usuarios_id = ${fld:id}