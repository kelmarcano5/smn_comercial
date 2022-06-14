select smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id as id, 
smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' ||smn_base.smn_clase_auxiliar.cla_nombre as item 
from smn_base.smn_clase_auxiliar
LEFT OUTER JOIN smn_base.smn_rel_tipo_reg_clase_aux on smn_base.smn_rel_tipo_reg_clase_aux.smn_clase_auxiliar_rf = smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id
LEFT OUTER JOIN smn_base.smn_tipo_registro on smn_base.smn_tipo_registro.smn_tipo_registro_id = smn_base.smn_rel_tipo_reg_clase_aux.smn_tipo_registro_rf
where smn_base.smn_rel_tipo_reg_clase_aux.smn_tipo_registro_rf=(${fld:id})
group by id
