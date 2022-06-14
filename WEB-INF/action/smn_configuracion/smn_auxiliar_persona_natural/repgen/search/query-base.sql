select
	smn_base.smn_auxiliar_cond_financiera.cfn_descripcion,
	smn_base.smn_cuentas_bancarias.cba_nombre,
	smn_base.smn_direccion.dir_descripcion,
	smn_base.smn_paises.pai_gentilicio,
	smn_base.smn_tipo_doc_oficial.tdo_descripcion,
	smn_base.smn_unidad_medida.unm_descripcion,
	smn_base.smn_unidad_medida.unm_descripcion as unm_descripcion2,,
	smn_base.smn_unidad_medida.unm_descripcion as unm_descripcion2,,
	smn_base.smn_unidad_medida.unm_descripcion as unm_descripcion2,,
	smn_base.smn_unidad_medida.unm_descripcion as unm_descripcion2,,
	smn_base.smn_unidad_medida.unm_descripcion as unm_descripcion2,,
		smn_base.smn_auxiliar.smn_auxiliar_id,
	${field}
from
	smn_base.smn_auxiliar
	left outer join smn_base.smn_auxiliar_cond_financiera on smn_base.smn_auxiliar_cond_financiera.smn_auxiliar_cond_financiera_id = smn_base.smn_auxiliar.aux_condicion_financiera_rf
	left outer join smn_base.smn_cuentas_bancarias on smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id = smn_base.smn_auxiliar.aux_cuenta_bancaria_rf
	left outer join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = smn_base.smn_auxiliar.aux_direccion_rf
	left outer join smn_base.smn_paises on smn_base.smn_paises.smn_paises_id = smn_base.smn_auxiliar.aux_nacionalidad_rf
	left outer join smn_base.smn_tipo_doc_oficial on smn_base.smn_tipo_doc_oficial.smn_tipo_doc_oficial_id = smn_base.smn_auxiliar.aux_tipo_doc_oficial_rf
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_base.smn_auxiliar.aux_unidad_med_braga_rf
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_base.smn_auxiliar.aux_unidad_med_camisa_rf
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_base.smn_auxiliar.aux_unidad_med_casco_rf
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_base.smn_auxiliar.aux_unidad_med_pantalon_rf
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_base.smn_auxiliar.aux_unidad_med_peso_rf
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_base.smn_auxiliar.aux_unidad_med_zapato_rf
where
		smn_base.smn_auxiliar.smn_auxiliar_id is not null
	${filter}
	
	
