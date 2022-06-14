select
	smn_base.smn_auxiliar.smn_auxiliar_id,
	smn_base.smn_auxiliar.aux_tipo_persona,
	smn_base.smn_auxiliar.aux_apellidos,
	smn_base.smn_auxiliar.aux_nombres,
	smn_base.smn_tipo_doc_oficial.tdo_codigo||'-'||smn_base.smn_tipo_doc_oficial.tdo_descripcion as aux_tipo_doc_oficial_rf,
	smn_base.smn_tipo_doc_oficial.tdo_codigo||'-'||smn_base.smn_tipo_doc_oficial.tdo_descripcion as tdo_descripcion,
	smn_base.smn_clase_auxiliar.cla_codigo||'-'||smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf,
	smn_base.smn_auxiliar.aux_rif,
	smn_base.smn_auxiliar.aux_fecha_registro
	
from
	smn_base.smn_auxiliar,
	smn_base.smn_clase_auxiliar,
	smn_base.smn_tipo_doc_oficial
	where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_base.smn_auxiliar.smn_clase_auxiliar_rf and
	smn_base.smn_auxiliar.aux_tipo_doc_oficial_rf=smn_base.smn_tipo_doc_oficial.smn_tipo_doc_oficial_id and 
	smn_base.smn_auxiliar.smn_naturaleza_auxiliar_rf='1' and
	smn_auxiliar_id = ${fld:id}
