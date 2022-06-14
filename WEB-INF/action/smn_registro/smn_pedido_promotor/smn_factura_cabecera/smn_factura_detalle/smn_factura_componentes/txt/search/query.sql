select
		smn_comercial.smn_factura_componentes.smn_factura_componentes_id,
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id,
	smn_comercial.smn_factura_detalle.fde_naturaleza as fde_naturaleza_pl0,
	case
	when smn_comercial.smn_factura_componentes.fco_es_prestador_servicio='SI' then '${lbl:b_yes}'
	when smn_comercial.smn_factura_componentes.fco_es_prestador_servicio='NO' then '${lbl:b_not}'
	end as fco_es_prestador_servicio,
select
		smn_comercial.smn_factura_componentes.smn_factura_componentes_id,
select
		smn_comercial.smn_factura_componentes.smn_factura_componentes_id,
select
		smn_comercial.smn_factura_componentes.smn_factura_componentes_id,
select
		smn_comercial.smn_factura_componentes.smn_factura_componentes_id,
	case
	when smn_comercial.smn_factura_componentes.fco_forma_calculo=IM then '${lbl:b_amount_money}'
	when smn_comercial.smn_factura_componentes.fco_forma_calculo=PO then '${lbl:b_percentage}'
	end as fco_forma_calculo,
	case
	when smn_comercial.smn_factura_componentes.fco_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_factura_componentes.fco_estatus='PE' then '${lbl:b_pending}'
	when smn_comercial.smn_factura_componentes.fco_estatus='PA' then '${lbl:b_paying}'
	end as fco_estatus,
	smn_comercial.smn_factura_componentes.smn_factura_detalle_id,
	smn_comercial.smn_factura_componentes.smn_grupo_componente_rf,
	smn_comercial.smn_factura_componentes.smn_componente_rf,
	smn_comercial.smn_factura_componentes.fco_es_prestador_servicio,
	smn_comercial.smn_factura_componentes.smn_clase_auxiliar_rf,
	smn_comercial.smn_factura_componentes.smn_auxiliar_rf,
	smn_comercial.smn_factura_componentes.smn_item_rf,
	smn_comercial.smn_factura_componentes.smn_servicio_rf,
	smn_comercial.smn_factura_componentes.fco_forma_calculo,
	smn_comercial.smn_factura_componentes.fco_cantidad,
	smn_comercial.smn_factura_componentes.smn_precio_ml_rf,
	smn_comercial.smn_factura_componentes.fco_monto_ml,
	smn_comercial.smn_factura_componentes.fco_estatus,
	smn_comercial.smn_factura_componentes.fco_fecha_registro
	
from
	smn_comercial.smn_factura_detalle,
	smn_comercial.smn_factura_componentes
where
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id=smn_comercial.smn_factura_componentes.smn_factura_detalle_id
