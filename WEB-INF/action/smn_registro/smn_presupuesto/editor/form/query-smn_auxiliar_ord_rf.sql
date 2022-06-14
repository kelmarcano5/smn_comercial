select smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id as id, 
	smn_base.smn_auxiliar_terceros.atr_codigo || ' - ' ||  smn_base.smn_auxiliar_terceros.atr_descripcion as item
from smn_comercial.smn_contratante
inner join smn_base.smn_auxiliar_terceros on
	smn_comercial.smn_contratante.smn_auxiliar_rf = smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id