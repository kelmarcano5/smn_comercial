select	
	SUM(smn_comercial.smn_pedido_detalle.pde_monto) as monto
from 
	smn_comercial.smn_pedido_detalle
where
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}