select smn_base.smn_auxiliar.smn_auxiliar_id as id, 
smn_base.smn_auxiliar.aux_codigo|| ' - ' || smn_base.smn_auxiliar.aux_descripcion as item 
from smn_base.smn_auxiliar 
inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
inner join smn_comercial.smn_rol on smn_comercial.smn_rol.smn_usuarios_rf = smn_base.smn_usuarios.smn_usuarios_id
where smn_comercial.smn_rol.rol_tipo in ('PR','VE')
order by aux_descripcion