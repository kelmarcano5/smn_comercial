select
		smn_comercial.smn_pedido_componentes.smn_pedido_componentes_id,
	smn_comercial.smn_pedido_detalle.pde_naturaleza as pde_naturaleza_pl0,
	case
	when smn_comercial.smn_pedido_componentes.pco_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_pedido_componentes.pco_estatus='PE' then '${lbl:b_pending}'
	when smn_comercial.smn_pedido_componentes.pco_estatus='PA' then '${lbl:b_paying}'
	end as pco_estatus_combo,
	smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_componentes.smn_mov_caja_detalle_id,
	smn_comercial.smn_pedido_componentes.smn_ingresos_rf,
	smn_comercial.smn_pedido_componentes.smn_grupo_componente_rf,
	smn_comercial.smn_pedido_componentes.pco_cantidad,
	smn_comercial.smn_pedido_componentes.smn_precio_ml_rf,
	smn_comercial.smn_pedido_componentes.pco_monto_ml,
	smn_comercial.smn_pedido_componentes.pco_estatus,
	smn_comercial.smn_pedido_componentes.pco_fecha_registro
	
from
	smn_comercial.smn_pedido_componentes
	inner join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id
where
	smn_pedido_componentes_id is not null
	and 	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id
	${filter}
order by
		smn_pedido_componentes_id
