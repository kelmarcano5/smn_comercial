select 
	smn_base.smn_auxiliar.smn_auxiliar_id as id, 
	smn_base.smn_auxiliar.aux_num_doc_oficial || ' - ' || smn_base.smn_auxiliar.aux_descripcion as item 
from smn_base.smn_auxiliar
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_auxiliar.smn_clase_auxiliar_rf = smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id
where smn_base.smn_auxiliar.smn_clase_auxiliar_rf = ${fld:id} order by smn_base.smn_auxiliar.aux_num_doc_oficial