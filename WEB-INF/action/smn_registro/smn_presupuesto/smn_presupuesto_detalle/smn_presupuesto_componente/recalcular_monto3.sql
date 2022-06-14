-- recalculo incluyendo el precio
with r as (
	select 	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id as ids,
				smn_comercial.smn_presupuesto_detalle.prd_precio as precio,
			case
					when pc.smn_tipos_componentes_rf='HO' and pc.prc_forma_calculo_rf='PO' then smn_comercial.smn_presupuesto_detalle.prd_precio*pc.prc_porcentaje_prestador/100
			end honorarios,
			case
					when pc.smn_tipos_componentes_rf='IT' and pc.prc_forma_calculo_rf='R' then pc.prc_cantidad*pc.prc_porcentaje_prestador
			end item,
			case
				when pc.smn_tipos_componentes_rf='SE' and pc.prc_forma_calculo_rf='D' then smn_comercial.smn_presupuesto_detalle.prd_precio
			end servicios
  from 
		smn_comercial.smn_presupuesto_detalle
		inner join smn_comercial.smn_presupuesto_componente pc on pc.smn_presupuesto_detalle_id = smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id
	where 
		smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id=${fld:id2} and pc.smn_tipos_componentes_rf='HO'
		)
UPDATE smn_comercial.smn_presupuesto_componente SET 
		prc_monto_ml=r.honorarios,
		prc_monto_neto_ml=r.honorarios
from r
where smn_comercial.smn_presupuesto_componente.smn_presupuesto_detalle_id=${fld:id2} and smn_comercial.smn_presupuesto_componente.smn_presupuesto_detalle_id = r.ids and smn_comercial.smn_presupuesto_componente.smn_tipos_componentes_rf='HO';

with r as (
	select 	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id as ids,
				smn_comercial.smn_presupuesto_detalle.prd_precio as precio,
			case
					when pc.smn_tipos_componentes_rf='HO' and pc.prc_forma_calculo_rf='PO' then smn_comercial.smn_presupuesto_detalle.prd_precio*pc.prc_porcentaje_prestador/100
			end honorarios,
			case
					when pc.smn_tipos_componentes_rf='IT' and pc.prc_forma_calculo_rf='R' then pc.prc_cantidad*pc.prc_porcentaje_prestador
			end item,
			case
				when pc.smn_tipos_componentes_rf='SE' and pc.prc_forma_calculo_rf='D' then smn_comercial.smn_presupuesto_detalle.prd_precio
			end servicios
  from 
		smn_comercial.smn_presupuesto_detalle
		inner join smn_comercial.smn_presupuesto_componente pc on pc.smn_presupuesto_detalle_id = smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id
	where 
		smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id=${fld:id2} and pc.smn_tipos_componentes_rf='IT'
		)
UPDATE smn_comercial.smn_presupuesto_componente SET 
		prc_monto_ml=r.item,
		prc_monto_neto_ml=r.item
from r
where smn_comercial.smn_presupuesto_componente.smn_presupuesto_detalle_id=${fld:id2} and smn_comercial.smn_presupuesto_componente.smn_presupuesto_detalle_id = r.ids and smn_comercial.smn_presupuesto_componente.smn_tipos_componentes_rf='IT';

with r as (
	select 	DISTINCT smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id as ids,
				smn_comercial.smn_presupuesto_detalle.prd_precio as precio,
			case
					when pc.smn_tipos_componentes_rf='HO' and pc.prc_forma_calculo_rf='PO' then smn_comercial.smn_presupuesto_detalle.prd_precio*pc.prc_porcentaje_prestador/100
			end honorarios,
			case
					when pc.smn_tipos_componentes_rf='IT' and pc.prc_forma_calculo_rf='R' then pc.prc_cantidad*pc.prc_porcentaje_prestador
			end item,
			case
				when pc.smn_tipos_componentes_rf='SE' and pc.prc_forma_calculo_rf='D' then smn_comercial.smn_presupuesto_detalle.prd_precio
			end servicios
  from 
		smn_comercial.smn_presupuesto_detalle
		inner join smn_comercial.smn_presupuesto_componente pc on pc.smn_presupuesto_detalle_id = smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id
	where 
		smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id=${fld:id2}
		)
UPDATE smn_comercial.smn_presupuesto_componente SET 
		prc_monto_ml=r.precio-(select smn_comercial.smn_presupuesto_componente.prc_monto_ml from smn_comercial.smn_presupuesto_componente where smn_comercial.smn_presupuesto_componente.smn_presupuesto_detalle_id=123 and smn_comercial.smn_presupuesto_componente.smn_tipos_componentes_rf='HO' limit 1)-(select smn_comercial.smn_presupuesto_componente.prc_monto_ml from smn_comercial.smn_presupuesto_componente where smn_comercial.smn_presupuesto_componente.smn_presupuesto_detalle_id=123 and smn_comercial.smn_presupuesto_componente.smn_tipos_componentes_rf='IT' limit 1),
		prc_monto_neto_ml=r.precio-(select smn_comercial.smn_presupuesto_componente.prc_monto_ml from smn_comercial.smn_presupuesto_componente where smn_comercial.smn_presupuesto_componente.smn_presupuesto_detalle_id=123 and smn_comercial.smn_presupuesto_componente.smn_tipos_componentes_rf='HO' limit 1)-(select smn_comercial.smn_presupuesto_componente.prc_monto_ml from smn_comercial.smn_presupuesto_componente where smn_comercial.smn_presupuesto_componente.smn_presupuesto_detalle_id=123 and smn_comercial.smn_presupuesto_componente.smn_tipos_componentes_rf='IT' limit 1)
from r
where smn_comercial.smn_presupuesto_componente.smn_presupuesto_detalle_id=${fld:id2} and smn_comercial.smn_presupuesto_componente.smn_presupuesto_detalle_id = r.ids and smn_comercial.smn_presupuesto_componente.smn_tipos_componentes_rf='SE';



