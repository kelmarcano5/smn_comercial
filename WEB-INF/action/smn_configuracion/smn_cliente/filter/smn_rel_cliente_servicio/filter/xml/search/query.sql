select
	smn_comercial.smn_rel_cliente_servicio.smn_rel_cliente_servicio_id,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_servicios.svc_descripcion as smn_servicio_rf
from
	smn_comercial.smn_rel_cliente_servicio
	inner join smn_base.smn_servicios on  smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_rel_cliente_servicio.smn_servicio_rf
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = 	smn_comercial.smn_rel_cliente_servicio.smn_cliente_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rfs