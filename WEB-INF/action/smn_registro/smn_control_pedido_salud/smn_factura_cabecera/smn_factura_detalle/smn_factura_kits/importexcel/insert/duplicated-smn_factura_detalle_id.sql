select
	smn_factura_detalle_id	
from 
	smn_comercial.smn_factura_detalle
where
	smn_factura_detalle_id = ${fld:smn_factura_detalle_id}
	