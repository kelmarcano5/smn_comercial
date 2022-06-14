select smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id as id, 
smn_base.smn_auxiliar_terceros.atr_codigo || ' - ' ||  smn_base.smn_auxiliar_terceros.atr_descripcion as item
from smn_base.smn_auxiliar_terceros 
