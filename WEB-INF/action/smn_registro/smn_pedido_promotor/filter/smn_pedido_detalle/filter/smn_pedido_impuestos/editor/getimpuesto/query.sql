select  
smn_base.smn_codigos_impuestos.imp_porcentaje_base as porcbase,
smn_base.smn_codigos_impuestos.imp_porcentaje_calculo as porccal,  
smn_base.smn_codigos_impuestos.imp_monto_sustraendo as sustrae,
smn_base.smn_codigos_impuestos.imp_tipo_codigo as tipocod
from smn_base.smn_codigos_impuestos
where  smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id = ${fld:id}