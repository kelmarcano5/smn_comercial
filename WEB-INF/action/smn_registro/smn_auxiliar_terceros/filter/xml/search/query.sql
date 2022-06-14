select
	smn_base.smn_auxiliar_corporaciones.tcp_nombre,
	smn_base.smn_auxiliar_unidades_negocios.tun_nombre,
	smn_base.smn_comunidades.cmn_nombre,
	smn_base.smn_auxiliar_cond_financiera.cfn_descripcion,
	smn_base.smn_condicion_pago.cop_descripcion,
	smn_base.smn_cuentas_bancarias.cba_nombre,
	smn_base.smn_direccion.dir_descripcion,
		smn_base.smn_auxiliar.smn_auxiliar_id,
	case
	when smn_base.smn_auxiliar.aux_tipo_persona='PJ' then '${lbl:b_legal_person_value}'
	when smn_base.smn_auxiliar.aux_tipo_persona='PN' then '${lbl:b_natural_person_value}'
	when smn_base.smn_auxiliar.aux_tipo_persona='GO' then '${lbl:b_government_person}'
	end as aux_tipo_persona,
	smn_base.smn_auxiliar.smn_auxiliar_id,
	smn_base.smn_clase_auxiliar.cla_codigo||'-'||smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf,
	smn_base.smn_auxiliar.aux_tipo_persona,
	smn_base.smn_auxiliar.aux_codigo,
	smn_base.smn_auxiliar.aux_descripcion,
	smn_base.smn_auxiliar.aux_rif,
	smn_base.smn_auxiliar.aux_direccion_rf,
	smn_base.smn_auxiliar.aux_fecha_registro
	
from
	smn_base.smn_auxiliar
	left outer join smn_base.smn_auxiliar_corporaciones on smn_base.smn_auxiliar_corporaciones.smn_auxiliar_corporaciones_id = smn_base.smn_auxiliar.aux_auxiliar_corporacion_rf
	left outer join smn_base.smn_auxiliar_unidades_negocios on smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id = smn_base.smn_auxiliar.aux_auxiliar_unidad_negocio_rf
	left outer join smn_base.smn_comunidades on smn_base.smn_comunidades.smn_comunidades_id = smn_base.smn_auxiliar.aux_comunidad_rf
	left outer join smn_base.smn_auxiliar_cond_financiera on smn_base.smn_auxiliar_cond_financiera.smn_auxiliar_cond_financiera_id = smn_base.smn_auxiliar.aux_condicion_financiera_rf
	left outer join smn_base.smn_condicion_pago on smn_base.smn_condicion_pago.smn_condicion_pago_id = smn_base.smn_auxiliar.aux_cond_pago_rf
	left outer join smn_base.smn_cuentas_bancarias on smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id = smn_base.smn_auxiliar.aux_cuenta_bancaria_rf
	left outer join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = smn_base.smn_auxiliar.aux_direccion_rf
	LEFT OUTER JOIN smn_base.smn_naturaleza_auxiliar on 
	smn_base.smn_naturaleza_auxiliar.smn_naturaleza_auxiliar_id=smn_base.smn_auxiliar.smn_naturaleza_auxiliar_rf
	LEFT OUTER JOIN smn_base.smn_clase_auxiliar on 
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_base.smn_auxiliar.smn_clase_auxiliar_rf
	where smn_base.smn_naturaleza_auxiliar.smn_naturaleza_auxiliar_id='3'
