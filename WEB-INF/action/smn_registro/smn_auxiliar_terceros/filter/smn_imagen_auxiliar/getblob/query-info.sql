select
	content_type as content_type, 
	filename as filename
from smn_entrega.smn_imagen_auxiliar
where smn_imagen_auxiliar_id = ${fld:id}
