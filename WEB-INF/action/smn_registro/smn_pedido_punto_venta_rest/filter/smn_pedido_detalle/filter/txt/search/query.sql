select
		smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	case
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='IT' then '${lbl:b_item}'
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='SE' then '${lbl:b_services}'
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='AF' then '${lbl:b_actfij}'
	end as pde_naturaleza,
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id,
	smn_comercial.smn_pedido_detalle.pde_naturaleza,
	smn_comercial.smn_pedido_detalle.pde_cantidad_oferta,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_detalle.pde_monto,
	smn_comercial.smn_pedido_detalle.pde_fecha_registro
	
from
	smn_comercial.smn_pedido_detalle
