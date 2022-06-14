select
select
	case
	when smn_comercial.smn_presupuesto_componente.smn_tipos_componentes_rf='IT' then '${lbl:b_item}'
	when smn_comercial.smn_presupuesto_componente.smn_tipos_componentes_rf='HO' then '${lbl:b_honorary}'
	when smn_comercial.smn_presupuesto_componente.smn_tipos_componentes_rf='SE' then '${lbl:b_services}'
	end as smn_tipos_componentes_rf,
select
select
select
	case
	when smn_comercial.smn_presupuesto_componente.prc_forma_calculo_rf='RP' then '${lbl:b_price_inv}'
	when smn_comercial.smn_presupuesto_componente.prc_forma_calculo_rf='R' then '${lbl:b_price_inv_plus}'
	when smn_comercial.smn_presupuesto_componente.prc_forma_calculo_rf='PP' then '${lbl:b_presupuesto_plus}'
	when smn_comercial.smn_presupuesto_componente.prc_forma_calculo_rf='PR' then '${lbl:b_presupuesto}'
	when smn_comercial.smn_presupuesto_componente.prc_forma_calculo_rf='D' then '${lbl:b_diference}'
	when smn_comercial.smn_presupuesto_componente.prc_forma_calculo_rf='M' then '${lbl:b_amount}'
	when smn_comercial.smn_presupuesto_componente.prc_forma_calculo_rf='PO' then '${lbl:b_porcentage}'
	end as prc_forma_calculo_rf,
	case
	when smn_comercial.smn_presupuesto_componente.prc_visible_rf='S' then '${lbl:b_yes}'
	when smn_comercial.smn_presupuesto_componente.prc_visible_rf='N' then '${lbl:b_not}'
	end as prc_visible_rf,
select
select
	smn_comercial.smn_presupuesto_componente.*
from
	smn_comercial.smn_presupuesto_componente
where
	smn_presupuesto_componente_id = ${fld:id}
