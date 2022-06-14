select
	iic_imagen_data as image_data
from smn_comercial.smn_imagen_cliente
where smn_imagen_cliente_id = ${fld:id}
