select	
	smn_entrega.smn_imagen_auxiliar.smn_auxiliar_rf,
	smn_entrega.smn_imagen_auxiliar.cca_descripcion,
	smn_entrega.smn_imagen_auxiliar.smn_imagen_auxiliar_id

from 
	smn_entrega.smn_imagen_auxiliar
where 
	smn_imagen_auxiliar_id = ${fld:id}


