select	
	*
from 
		smn_comercial.smn_rel_cliente_contacto
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_rel_cliente_contacto.smn_cliente_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	inner join smn_base.smn_auxiliar_contacto on smn_base.smn_auxiliar_contacto.smn_auxiliar_contacto_id = smn_comercial.smn_rel_cliente_contacto.smn_contacto_rf
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id =  smn_base.smn_auxiliar_contacto.smn_clase_auxiliar_rf
where 
	smn_rel_cliente_contacto_id = ${fld:id}


