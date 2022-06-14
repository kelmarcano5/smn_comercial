select	
	smn_comercial.smn_cliente.smn_cliente_id, 
	(smn_comercial.smn_imagen_cliente.iic_imagen_size / 1024) as image_size,
	smn_comercial.smn_cliente.cli_nacional_ext as cli_nacional_ext_pl0,
	(select smn_base.smn_auxiliar.aux_codigo || ' - ' || smn_base.smn_auxiliar.aux_descripcion from  smn_comercial.smn_cliente 
left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf where smn_comercial.smn_cliente.smn_cliente_id is not null  and smn_comercial.smn_cliente.smn_cliente_id=smn_comercial.smn_imagen_cliente.smn_cliente_id) as smn_cliente_id,
	smn_comercial.smn_imagen_cliente.smn_imagen_cliente_id,
	smn_comercial.smn_imagen_cliente.iic_descripcion,
	smn_comercial.smn_imagen_cliente.iic_imagen_size,
	smn_comercial.smn_imagen_cliente.filename,
	smn_comercial.smn_imagen_cliente.content_type,
	smn_comercial.smn_imagen_cliente.iic_idioma,
	smn_comercial.smn_imagen_cliente.iic_usuario,
	smn_comercial.smn_imagen_cliente.iic_fecha_registro,
	smn_comercial.smn_imagen_cliente.iic_hora

from
	smn_comercial.smn_imagen_cliente 
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_imagen_cliente.smn_cliente_id
where
	smn_comercial.smn_imagen_cliente.smn_cliente_id=${fld:id2}
${filter} 
order by 
	smn_imagen_cliente_id