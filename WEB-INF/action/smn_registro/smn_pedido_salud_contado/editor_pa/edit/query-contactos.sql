select 	smn_base.smn_contactos.smn_contactos_id,
	smn_base.smn_contactos.cnt_apellidos,
	smn_base.smn_contactos.cnt_nombres,
	smn_base.smn_contactos.cnt_fecha_registro,
	smn_base.smn_contactos.cnt_telefono_contacto,
	smn_base.smn_contactos.smn_clase_auxiliar_rf,
	smn_base.smn_contactos.smn_auxiliar_id,
	tipo.smn_tipo_contactos_id as smn_tipo_contactos_rf,
	smn_base.smn_contactos.cnt_descripcion,
	tipo2.smn_tipo_contactos_id as smn_tipo_contactos_rf1,
	smn_base.smn_contactos.cnt_descripcion1,
	smn_base.smn_contactos.cnt_descripcion as cnt_descripcion

from
	smn_base.smn_contactos
	left outer join smn_base.smn_tipo_contactos tipo on tipo.smn_tipo_contactos_id = smn_base.smn_contactos.smn_tipo_contactos_rf
	left outer join smn_base.smn_tipo_contactos tipo2 on tipo2.smn_tipo_contactos_id = smn_base.smn_contactos.smn_tipo_contactos_rf1
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=smn_base.smn_contactos.smn_auxiliar_id
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_base.smn_contactos.smn_clase_auxiliar_rf
where
	smn_base.smn_contactos.smn_auxiliar_id=${fld:id} ORDER BY tipo.smn_tipo_contactos_id asc limit  1
	