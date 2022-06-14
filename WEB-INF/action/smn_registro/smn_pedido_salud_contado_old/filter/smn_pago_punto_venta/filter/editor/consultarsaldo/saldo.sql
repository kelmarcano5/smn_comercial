select 
case
	when smn_comercial.smn_pago_punto_venta.ppv_monto_devuelto_ml is null then 1 else smn_comercial.smn_pago_punto_venta.ppv_monto_devuelto_ml 
end as saldo_devuelto, 
case
	when smn_comercial.smn_pago_punto_venta.ppv_monto_devuelto_ma is null then 1 else smn_comercial.smn_pago_punto_venta.ppv_monto_devuelto_ma 
end as saldo_devuelto_ma
from smn_comercial.smn_pago_punto_venta 
where
smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id=${fld:id2} order by smn_comercial.smn_pago_punto_venta.ppv_hora desc limit 1