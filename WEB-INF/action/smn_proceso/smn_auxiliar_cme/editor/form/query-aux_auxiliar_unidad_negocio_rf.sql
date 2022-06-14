select 
	smn_salud.smn_contratante.smn_contratante_id as id, 
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as item 
from smn_salud.smn_contratante
left outer join smn_base.smn_auxiliar on 
smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf