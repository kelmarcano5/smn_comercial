select	
	smn_comercial.smn_imagen_item_comercio.smn_catalogo_item_comercio_id,
	smn_comercial.smn_imagen_item_comercio.iic_descripcion,
	smn_comercial.smn_imagen_item_comercio.smn_imagen_item_comercio_id

from 
	smn_comercial.smn_imagen_item_comercio
where 
	smn_imagen_item_comercio_id = ${fld:id}


