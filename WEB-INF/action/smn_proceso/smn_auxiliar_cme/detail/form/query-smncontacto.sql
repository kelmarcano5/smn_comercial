select
	smn_base.smn_contactos.smn_contactos_id,
	smn_base.smn_contactos.cnt_nombres,
	smn_base.smn_contactos.cnt_apellidos,
	smn_base.smn_contactos.cnt_email,
	smn_base.smn_contactos.cnt_fecha_registro,
	smn_base.smn_contactos.cnt_telefono_contacto,
	tp1.tco_descripcion as smn_tipo_contactos_rf,
	case
		when smn_base.smn_contactos.smn_tipo_contactos_rf = 5 then smn_base.smn_contactos.cnt_descripcion
	end as cnt_descripcion,
	tp2.tco_descripcion as smn_tipo_contactos_rf1,
	case 
		when smn_base.smn_contactos.smn_tipo_contactos_rf1 = 3 then smn_base.smn_contactos.cnt_descripcion1
			when smn_base.smn_contactos.smn_tipo_contactos_rf1 = 4 then smn_base.smn_contactos.cnt_descripcion1
	end as cnt_descripcion1

						

from
	smn_base.smn_contactos
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_contactos.smn_auxiliar_id
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_base.smn_contactos.smn_clase_auxiliar_rf
	inner join smn_base.smn_tipo_contactos tp1 on tp1.smn_tipo_contactos_id = smn_base.smn_contactos.smn_tipo_contactos_rf
	inner join smn_base.smn_tipo_contactos tp2 on tp2.smn_tipo_contactos_id = smn_base.smn_contactos.smn_tipo_contactos_rf1
where
		smn_base.smn_auxiliar.smn_auxiliar_id=${fld:id}