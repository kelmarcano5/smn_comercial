select	
	SUM(smn_comercial.smn_pedido_detalle.pde_monto) as montopagar,
	SUM(smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna) as montopagarma,
	smn_comercial.smn_pedido_detalle.smn_moneda_rf,
	smn_comercial.smn_pedido_detalle.smn_tasa_rf
from 
	smn_comercial.smn_pedido_detalle
where
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}
GROUP BY smn_comercial.smn_pedido_detalle.smn_moneda_rf, smn_comercial.smn_pedido_detalle.smn_tasa_rf