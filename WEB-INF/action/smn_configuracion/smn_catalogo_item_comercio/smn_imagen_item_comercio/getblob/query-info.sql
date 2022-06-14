select
	content_type as content_type, 
	filename as filename
from smn_comercial.smn_imagen_item_comercio
where smn_imagen_item_comercio_id = ${fld:id}
