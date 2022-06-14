select
case 
	when SUM(smn_comercial.smn_pedido_detalle.pde_monto) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_monto)
end as monto
from 
	smn_comercial.smn_pedido_detalle
where
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}