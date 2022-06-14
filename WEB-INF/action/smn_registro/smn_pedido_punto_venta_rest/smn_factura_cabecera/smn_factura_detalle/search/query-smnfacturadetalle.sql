select
		smn_comercial.smn_factura_detalle.smn_factura_detalle_id,
	case
	when smn_comercial.smn_factura_detalle.fde_naturaleza='IT' then '${lbl:b_item}'
	when smn_comercial.smn_factura_detalle.fde_naturaleza='SE' then '${lbl:b_services}'
	when smn_comercial.smn_factura_detalle.fde_naturaleza='AF' then '${lbl:b_actfijo}'
	end as fde_naturaleza,
	smn_comercial.smn_factura_detalle.smn_factura_cabecera_id,
	smn_comercial.smn_factura_detalle.fde_cantidad,
	smn_comercial.smn_factura_detalle.fde_precio_ml,
	smn_comercial.smn_factura_detalle.fde_monto_ml,
	smn_comercial.smn_factura_detalle.fde_fecha_registro
	
from
	smn_comercial.smn_factura_detalle
where 
	smn_comercial.smn_factura_detalle.smn_factura_cabecera_id=${fld:id2}
