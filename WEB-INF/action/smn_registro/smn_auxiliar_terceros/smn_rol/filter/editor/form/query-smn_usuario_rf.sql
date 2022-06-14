select smn_base.smn_usuarios.smn_usuarios_id as id, smn_base.smn_auxiliar.aux_descripcion as item 
from smn_base.smn_usuarios
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
WHERE
	smn_base.smn_usuarios.smn_clase_auxiliar_rf=43