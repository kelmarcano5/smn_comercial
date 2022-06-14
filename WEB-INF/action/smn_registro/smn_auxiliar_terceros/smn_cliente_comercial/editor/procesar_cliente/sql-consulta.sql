select smn_base.smn_auxiliar.aux_descripcion as name, 
smn_base.smn_direccion.dir_descripcion as direccion, 
smn_base.smn_auxiliar.aux_rif as rif, 
smn_base.smn_direccion.dir_mapa_latitud as latitud, 
smn_base.smn_direccion.dir_mapa_longitud as longitud, 
case 
	when smn_base.smn_auxiliar_contacto.smn_tipo_contactos_rf = 2 then smn_base.smn_auxiliar_contacto.auc_descripcion 
end as telefono 
from smn_base.smn_auxiliar
inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
inner join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = smn_base.smn_auxiliar.aux_direccion_rf 
inner join smn_base.smn_auxiliar_contacto on smn_base.smn_auxiliar_contacto.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
where smn_base.smn_auxiliar.smn_auxiliar_id = ${fld:smn_auxiliar_rf}
and smn_base.smn_auxiliar_contacto.smn_tipo_contactos_rf = 2