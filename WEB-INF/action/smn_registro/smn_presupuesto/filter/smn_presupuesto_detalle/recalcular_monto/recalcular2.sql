WITH rows as (
select 
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_moneda_local) as monto_ml,
SUM(smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna) as monto_ma,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml) as monto_descuento_ml,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ma) as monto_descuento_ma,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_incremento_ml) as monto_incremento_ml,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_incremento_ma) as monto_incremento_ma,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ml) as monto_neto_ml,
SUM(smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ma) as monto_neto_ma
from smn_comercial.smn_presupuesto_detalle
where
smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} and smn_comercial.smn_presupuesto_detalle.prd_estatus<>'RZ'
) 
update smn_comercial.smn_presupuesto
set
pre_monto_ml=rows.monto_ml,
pre_monto_ma=rows.monto_ma,
pre_monto_descuento=rows.monto_descuento_ml,
pre_monto_descuento_moneda_alterna=rows.monto_descuento_ma,
pre_monto_neto_moneda_local=rows.monto_neto_ml+rows.monto_incremento_ml-rows.monto_descuento_ml,
pre_monto_neto_moneda_alterna=rows.monto_neto_ma+rows.monto_incremento_ma-rows.monto_descuento_ma
from rows
where
smn_comercial.smn_presupuesto.smn_presupuesto_id = ${fld:id2};

with rows as (
	select 
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id as idp,
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' then (select smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ml from smn_comercial.smn_presupuesto_detalle where smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='SE' and smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} limit 1)	
	end as precio, 
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' THEN smn_comercial.smn_presupuesto_detalle.prd_porcentaje_prestador	
	end as porcentaje,
		case 
		when smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' then (select smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ma from smn_comercial.smn_presupuesto_detalle where smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='SE' and smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} limit 1)	
	end as precio_ma
	from smn_comercial.smn_presupuesto_detalle where smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id= ${fld:id2} and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO'
)
UPDATE smn_comercial.smn_presupuesto_detalle SET 
		prd_precio = rows.precio, 
		prd_monto_moneda_local = rows.precio * rows.porcentaje/ 100, 
		prd_precio_ma = rows.precio_ma,
		prd_moneda_alterna = rows.precio_ma * rows.porcentaje/ 100
from rows
where smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id= ${fld:id2} and smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id =rows.idp and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO'