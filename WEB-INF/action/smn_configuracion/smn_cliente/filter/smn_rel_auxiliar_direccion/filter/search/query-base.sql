select
	case
		when smn_base.smn_rel_auxiliar_direccion.rad_status='A' then '${lbl:b_account_type_active}'
		when smn_base.smn_rel_auxiliar_direccion.rad_status='I' then '${lbl:b_inactive}'
	end as rad_status,
	case
		when smn_base.smn_rel_auxiliar_direccion.rad_tipo_direccion ='F' then '${lbl:b_fiscal}'
		when smn_base.smn_rel_auxiliar_direccion.rad_tipo_direccion ='E' then '${lbl:b_entrega}'
		when smn_base.smn_rel_auxiliar_direccion.rad_tipo_direccion ='O' then '${lbl:b_others}'
	end as rad_tipo_direccion,
	smn_rel_auxiliar_direccion_id,
	smn_base.smn_clase_auxiliar.cla_codigo || '-' || smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_id_combo,
	smn_base.smn_auxiliar.aux_codigo || '-' || smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_id_combo,
	smn_base.smn_direccion.dir_codigo || '-' || smn_base.smn_direccion.dir_descripcion as smn_direccion_id_combo,
	smn_base.smn_zona.zon_codigo || '-' || smn_base.smn_zona.zon_descripcion as smn_zona_rf,
	smn_base.smn_rel_auxiliar_direccion.rad_fecha_vigencia,
	smn_base.smn_rel_auxiliar_direccion.rad_fecha_registro,
	rad_usuario,
	rad_hora,
	rad_idioma
	
from
	smn_base.smn_rel_auxiliar_direccion
	INNER JOIN smn_base.smn_clase_auxiliar on smn_base.smn_rel_auxiliar_direccion.smn_clase_auxiliar_id = smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id
	INNER JOIN smn_base.smn_auxiliar on smn_base.smn_rel_auxiliar_direccion.smn_auxiliar_id = smn_base.smn_auxiliar.smn_auxiliar_id
	INNER JOIN smn_base.smn_direccion on smn_base.smn_rel_auxiliar_direccion.smn_direccion_id = smn_base.smn_direccion.smn_direccion_id
	INNER JOIN smn_base.smn_zona on smn_base.smn_rel_auxiliar_direccion.smn_zona_rf = smn_base.smn_zona.smn_zona_id

where
	smn_rel_auxiliar_direccion_id is not null
	${filter}
order by
		smn_rel_auxiliar_direccion_id
