select	
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id, 
	smn_comercial.smn_factura_detalle.fde_naturaleza as fde_naturaleza_pl0,
	smn_comercial.smn_factura_componentes.*
from
	smn_comercial.smn_factura_detalle,
	smn_comercial.smn_factura_componentes 
where
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id=smn_comercial.smn_factura_componentes.smn_factura_detalle_id and
	smn_factura_componente_id = ${fld:id} 
	


