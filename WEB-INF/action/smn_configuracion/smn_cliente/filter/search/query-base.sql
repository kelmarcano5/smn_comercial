select
	smn_comercial.smn_cliente.smn_cliente_id,
	smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id, 
	case
		when smn_comercial.smn_cliente.cli_nacional_ext='N' then '${lbl:b_nacional}'
		when smn_comercial.smn_cliente.cli_nacional_ext='E' then '${lbl:b_extranjero}'
	end as cli_nacional_ext,
	case
		when smn_comercial.smn_cliente.cli_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_cliente.cli_estatus='IN' then '${lbl:b_inactive}'
	end as cli_estatus,
	smn_comercial.smn_clasificacion_cliente.ccl_descripcion as smn_clasificacion_cliente_id,
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id,
	smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf,
	smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf,
	smn_base.smn_direccion.dir_descripcion as direccion,
	smn_base.smn_clasificacion_abc.clf_descripcion as smn_clasificacion_abc_rf,
	smn_base.smn_sectores_economicos.sec_descripcion as smn_sector_economico_rf,
	smn_comercial.smn_cliente.cli_vigencia,
	smn_comercial.smn_cliente.cli_fecha_registro,
	smn_base.smn_condicion_financiera.cfi_description as smn_condicion_financiera_rf,
	promo.aux_descripcion as promotor

from
	smn_comercial.smn_cliente
	inner join smn_comercial.smn_clasificacion_cliente on smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id = smn_comercial.smn_cliente.smn_clasificacion_cliente_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_comercial.smn_cliente.smn_clase_auxiliar_rf
	inner join smn_base.smn_clasificacion_abc on smn_base.smn_clasificacion_abc.smn_clasificacion_abc_id = smn_comercial.smn_cliente.smn_clasificacion_abc_rf
	inner join smn_base.smn_sectores_economicos on smn_base.smn_sectores_economicos.smn_sectores_economicos_id = smn_comercial.smn_cliente.smn_sector_economico_rf
	left outer join smn_base.smn_condicion_financiera ON smn_base.smn_auxiliar.aux_condicion_financiera_rf = smn_base.smn_condicion_financiera.smn_condicion_financiera_id
	left outer join smn_base.smn_condicion_pago ON smn_base.smn_auxiliar.aux_cond_pago_rf = smn_base.smn_condicion_pago.smn_condicion_pago_id
	left join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = smn_base.smn_auxiliar.aux_direccion_rf
	left join smn_base.smn_auxiliar promo on promo.smn_auxiliar_id = smn_comercial.smn_cliente.smn_promotor_rf
where
	smn_cliente_id is not null
	and 	smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id=smn_comercial.smn_cliente.smn_clasificacion_cliente_id
	${filter}
order by
		smn_cliente_id
