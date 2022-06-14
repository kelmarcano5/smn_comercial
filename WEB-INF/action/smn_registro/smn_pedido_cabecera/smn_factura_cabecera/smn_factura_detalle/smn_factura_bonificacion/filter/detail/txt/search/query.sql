select
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id,
	smn_comercial.smn_factura_detalle.fde_naturaleza as fde_naturaleza_pl0,
	smn_comercial.smn_factura_bonificacion.*
from
	smn_comercial.smn_factura_detalle,
	smn_comercial.smn_factura_bonificacion
where
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id=smn_comercial.smn_factura_bonificacion.smn_factura_detalle_id
	and
	smn_factura_bonificacion_id = ${fld:id}
