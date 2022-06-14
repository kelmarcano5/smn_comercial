select	
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id, 
	smn_comercial.smn_factura_detalle.fde_naturaleza as fde_naturaleza_pl0,
	smn_comercial.smn_factura_kits.*
from
	smn_comercial.smn_factura_detalle,
	smn_comercial.smn_factura_kits 
where
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id=smn_comercial.smn_factura_kits.smn_factura_detalle_id and
	smn_factura_kits_id = ${fld:id} 
	


