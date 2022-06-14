select

       CASE WHEN smn_base.smn_auxiliar_terceros.atr_maneja_sucursal = 'SI' THEN true
            WHEN smn_base.smn_auxiliar_terceros.atr_maneja_sucursal = 'NO' THEN false
       END as caso
FROM smn_base.smn_auxiliar_terceros
WHERE upper(smn_base.smn_auxiliar_terceros.atr_descripcion)=upper(${fld:id})



     
