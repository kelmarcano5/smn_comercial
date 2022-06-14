select smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id as id, 
smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial || ' - ' || smn_base.smn_auxiliar_persona_natural.ant_nombres || ' - ' || smn_base.smn_auxiliar_persona_natural.ant_apellidos as item 
from smn_base.smn_auxiliar_persona_natural where smn_base.smn_auxiliar_persona_natural.smn_clase_auxiliar_id = 26 
and  smn_base.smn_auxiliar_persona_natural.smn_clase_auxiliar_id = (SELECT smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id
from smn_base.smn_clase_auxiliar
WHERE upper(smn_base.smn_clase_auxiliar.cla_nombre)=upper(${fld:id})) 