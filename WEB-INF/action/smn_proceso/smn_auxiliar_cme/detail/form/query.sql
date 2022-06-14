select
	smn_base.smn_auxiliar.smn_auxiliar_id,
	smn_base.smn_auxiliar.aux_tipo_persona,
	smn_base.smn_auxiliar.aux_apellidos,
	smn_base.smn_auxiliar.aux_nombres,
	smn_base.smn_tipo_doc_oficial.tdo_codigo||'-'||smn_base.smn_tipo_doc_oficial.tdo_descripcion as aux_tipo_doc_oficial_rf,
	smn_base.smn_tipo_doc_oficial.tdo_codigo||'-'||smn_base.smn_tipo_doc_oficial.tdo_descripcion as tdo_descripcion,
	smn_base.smn_clase_auxiliar.cla_codigo||'-'||smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf,
	smn_base.smn_auxiliar.aux_rif,
	smn_base.smn_direccion.dir_descripcion as aux_direccion_rf,
	case
		when smn_base.smn_auxiliar.aux_sexo='M' then 'Masculino'
		when smn_base.smn_auxiliar.aux_sexo='F' then 'Femenino'
	end as aux_sexo,
	smn_base.smn_auxiliar.aux_num_doc_oficial,
	case
		when smn_base.smn_auxiliar.aux_estado_civil='SO' then 'Soltero'
		when smn_base.smn_auxiliar.aux_estado_civil='CA' then 'Casado'
	end as aux_estado_civil,
	smn_base.smn_auxiliar.aux_fecha_nac,
	smn_base.smn_auxiliar.aux_lugar_nac,
	smn_base.smn_auxiliar.aux_nacionalizado,
	case
		when smn_base.smn_auxiliar.aux_lateralidad='I' then 'Izquierdo'
		when smn_base.smn_auxiliar.aux_lateralidad='D' then 'Derecho'
	end as aux_lateralidad,
	smn_base.smn_auxiliar.aux_fecha_registro
	
from
	smn_base.smn_auxiliar
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_base.smn_auxiliar.smn_clase_auxiliar_rf
	inner join smn_base.smn_tipo_doc_oficial on smn_base.smn_tipo_doc_oficial.smn_tipo_doc_oficial_id = smn_base.smn_auxiliar.aux_tipo_doc_oficial_rf
	inner join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = 	smn_base.smn_auxiliar.aux_direccion_rf
where 
		smn_base.smn_clase_auxiliar.cla_codigo='PA' and smn_base.smn_auxiliar.smn_auxiliar_id = ${fld:id}
