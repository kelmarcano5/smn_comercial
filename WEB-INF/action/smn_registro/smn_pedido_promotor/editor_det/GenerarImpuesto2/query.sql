select smn_base.smn_codigos_impuestos.imp_porcentaje_calculo as por, smn_base.smn_codigos_impuestos.imp_monto_sustraendo as sus from smn_base.smn_codigos_impuestos 
where smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id=${fld:id}