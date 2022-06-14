select DISTINCT smn_comercial.smn_cliente.smn_cliente_id as id, smn_base.smn_auxiliar.aux_codigo|| ' - ' || smn_base.smn_auxiliar.aux_descripcion as item 
from smn_comercial.smn_cliente
inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
inner join smn_comercial.smn_rel_cliente_usuario on smn_comercial.smn_rel_cliente_usuario.smn_cliente_id = smn_comercial.smn_cliente.smn_cliente_id
where smn_comercial.smn_cliente.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id 
