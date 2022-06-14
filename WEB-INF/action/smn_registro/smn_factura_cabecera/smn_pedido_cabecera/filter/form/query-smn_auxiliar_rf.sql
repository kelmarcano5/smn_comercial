select smn_base.smn_auxiliar.smn_auxiliar_id as id, smn_base.smn_auxiliar.aux_descripcion ||' - '|| smn_base.smn_auxiliar.aux_num_doc_oficial as item from smn_base.smn_auxiliar
inner join smn_base.smn_auxiliar_clase on smn_base.smn_auxiliar_clase.smn_auxiliar_id = smn_base.smn_auxiliar.smn_auxiliar_id
inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_base.smn_auxiliar.smn_clase_auxiliar_rf
where
	smn_base.smn_clase_auxiliar.cla_codigo='PA'