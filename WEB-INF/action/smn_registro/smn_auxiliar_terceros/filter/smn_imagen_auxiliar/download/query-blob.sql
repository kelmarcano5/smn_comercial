select
	cca_imagen_data as image_data
from smn_entrega.smn_imagen_auxiliar
where smn_imagen_auxiliar_id = ${fld:id}
