select
	smn_base.smn_auxiliar_corporaciones.tcp_nombre,
	smn_base.smn_auxiliar_unidades_negocios.tun_nombre,
	smn_base.smn_comunidades.cmn_nombre,
	smn_base.smn_auxiliar_cond_financiera.cfn_descripcion,
	smn_base.smn_condicion_pago.cop_descripcion,
	smn_base.smn_cuentas_bancarias.cba_nombre,
	smn_base.smn_direccion.dir_descripcion,
	${field}
from
	smn_base.smn_auxiliar
	left outer join smn_base.smn_auxiliar_corporaciones on smn_base.smn_auxiliar_corporaciones.smn_auxiliar_corporaciones_id = smn_base.smn_auxiliar.aux_auxiliar_corporacion_rf
	left outer join smn_base.smn_auxiliar_unidades_negocios on smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id = smn_base.smn_auxiliar.aux_auxiliar_unidad_negocio_rf
	left outer join smn_base.smn_comunidades on smn_base.smn_comunidades.smn_comunidades_id = smn_base.smn_auxiliar.aux_comunidad_rf
	left outer join smn_base.smn_auxiliar_cond_financiera on smn_base.smn_auxiliar_cond_financiera.smn_auxiliar_cond_financiera_id = smn_base.smn_auxiliar.aux_condicion_financiera_rf
	left outer join smn_base.smn_condicion_pago on smn_base.smn_condicion_pago.smn_condicion_pago_id = smn_base.smn_auxiliar.aux_cond_pago_rf
	left outer join smn_base.smn_cuentas_bancarias on smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id = smn_base.smn_auxiliar.aux_cuenta_bancaria_rf
	left outer join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = smn_base.smn_auxiliar.aux_direccion_rf
where
		smn_base.smn_auxiliar.smn_auxiliar_id is not null
