select
	CASE WHEN smn_base.smn_auxiliar_terceros.atr_maneja_sucursal = 'SI' THEN true
            WHEN smn_base.smn_auxiliar_terceros.atr_maneja_sucursal = 'NO' THEN false
    END as caso,
    smn_clase_auxiliar_id
from smn_base.smn_auxiliar_terceros
--from smn_comercial.smn_contratante
where smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id = ${fld:id}
--inner join smn_base.smn_auxiliar_terceros on
--	smn_comercial.smn_contratante.smn_auxiliar_rf = smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id
--where smn_comercial.smn_contratante.smn_contratante_id = ${fld:id}