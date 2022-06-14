select
	content_type as content_type, 
	filename as filename
from smn_comercial.smn_imagen_cliente
where smn_imagen_cliente_id = ${fld:id}
