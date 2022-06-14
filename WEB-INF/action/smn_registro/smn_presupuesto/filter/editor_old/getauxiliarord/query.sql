select smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id as id, 
smn_base.smn_auxiliar_terceros.atr_codigo || ' - ' ||  smn_base.smn_auxiliar_terceros.atr_descripcion as item
from smn_base.smn_auxiliar_terceros 
where smn_base.smn_auxiliar_terceros.smn_clase_auxiliar_id = (SELECT smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id
from smn_base.smn_clase_auxiliar
WHERE upper(smn_base.smn_clase_auxiliar.cla_nombre)=upper(${fld:id})) 