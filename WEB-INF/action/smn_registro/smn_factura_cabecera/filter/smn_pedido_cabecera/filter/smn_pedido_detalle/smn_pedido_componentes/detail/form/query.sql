select
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_detalle.pde_naturaleza as pde_naturaleza_pl0,
select
select
	case
	when smn_comercial.smn_pedido_componentes.pco_tipo_componente='IT' then '${lbl:b_item}'
	when smn_comercial.smn_pedido_componentes.pco_tipo_componente='SE' then '${lbl:b_services}'
	end as pco_tipo_componente_combo,
select
	case
	when smn_comercial.smn_pedido_componentes.pco_es_prestador_servicio='SI' then '${lbl:b_yes}'
	when smn_comercial.smn_pedido_componentes.pco_es_prestador_servicio='NO' then '${lbl:b_not}'
	end as pco_es_prestador_servicio_combo,
select
select
	case
	when smn_comercial.smn_pedido_componentes.pco_naturaleza='IT' then '${lbl:b_item}'
	when smn_comercial.smn_pedido_componentes.pco_naturaleza='SE' then '${lbl:b_services}'
	end as pco_naturaleza_combo,
select
select
select
select
	case
	when smn_comercial.smn_pedido_componentes.pco_imprime='SI' then '${lbl:b_yes}'
	when smn_comercial.smn_pedido_componentes.pco_imprime='NO' then '${lbl:b_not}'
	end as pco_imprime_combo,
select
	case
	when smn_comercial.smn_pedido_componentes.pco_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_pedido_componentes.pco_estatus='PE' then '${lbl:b_pending}'
	when smn_comercial.smn_pedido_componentes.pco_estatus='PA' then '${lbl:b_paying}'
	end as pco_estatus_combo,
	smn_comercial.smn_pedido_componentes.*
from
	smn_comercial.smn_pedido_detalle,
	smn_comercial.smn_pedido_componentes
where
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id
	and
	smn_pedido_componentes_id = ${fld:id}
