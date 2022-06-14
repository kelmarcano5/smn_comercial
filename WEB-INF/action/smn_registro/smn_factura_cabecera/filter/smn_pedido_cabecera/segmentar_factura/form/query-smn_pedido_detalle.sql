select DISTINCT
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id as smn_pedido_detalle_id, 
	smn_comercial.smn_pedido_detalle.pde_monto as monto_ml,
	smn_base.smn_servicios.svc_descripcion as descripcion
from 
	smn_comercial.smn_pedido_detalle
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_pedido_detalle.smn_servicios_rf
where 
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id = ${fld:id2}