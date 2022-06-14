select	
	(select smn_base.smn_v_auxiliar.smn_codigo || ' - ' || smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_entrega.smn_imagen_auxiliar.smn_auxiliar_rf  order by smn_base.smn_v_auxiliar.smn_item ) as smn_auxiliar_rf_combo,
	smn_entrega.smn_imagen_auxiliar.smn_imagen_auxiliar_id,
	(smn_entrega.smn_imagen_auxiliar.cca_imagen_size / 1024) as cca_imagen_size,
	smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf,
	smn_entrega.smn_imagen_auxiliar.cca_descripcion,
	smn_entrega.smn_imagen_auxiliar.filename,
	smn_entrega.smn_imagen_auxiliar.content_type,
	smn_entrega.smn_imagen_auxiliar.cca_fecha_registro,
	smn_base.smn_auxiliar.smn_auxiliar_id

from
	smn_entrega.smn_imagen_auxiliar 
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_entrega.smn_imagen_auxiliar.smn_auxiliar_rf
where
	smn_imagen_auxiliar_id is not null
	${filter} and smn_entrega.smn_imagen_auxiliar.smn_auxiliar_rf=${fld:id2}
order by 
	smn_imagen_auxiliar_id