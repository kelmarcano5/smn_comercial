select smn_base.smn_condicion_financiera.cfi_cant_dias as dias from smn_comercial.smn_cliente 
inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
inner join smn_base.smn_condicion_financiera on smn_base.smn_condicion_financiera.smn_condicion_financiera_id = smn_base.smn_auxiliar.aux_condicion_financiera_rf
where
smn_comercial.smn_cliente.smn_cliente_id=${fld:id}