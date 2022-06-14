select  SUM(smn_comercial.smn_presupuesto_impuesto.pim_monto_neto_impuesto_ma) as impuestoma
from smn_comercial.smn_presupuesto_impuesto
	inner join smn_comercial.smn_presupuesto_detalle on smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id = smn_comercial.smn_presupuesto_impuesto.smn_presupuesto_detalle_id
	inner join smn_comercial.smn_presupuesto on smn_comercial.smn_presupuesto.smn_presupuesto_id = smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id
where 
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id} and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf in('SE','IT') and smn_comercial.smn_presupuesto_detalle.prd_estatus<>'RZ' limit 1