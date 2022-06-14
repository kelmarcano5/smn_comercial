select
	smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id, 
	smn_comercial.smn_clasificacion_cliente.ccl_codigo as ccl_codigo_pl0,
	(select smn_comercial.smn_clasificacion_cliente.ccl_codigo|| ' - ' || smn_comercial.smn_clasificacion_cliente.ccl_descripcion from  smn_comercial.smn_clasificacion_cliente  where smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id is not null  and smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id=smn_comercial.smn_cliente.smn_clasificacion_cliente_id  order by ccl_descripcion ) as smn_clasificacion_cliente_id_combo,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_comercial.smn_cliente.smn_clase_auxiliar_rf  order by cla_nombre ) as smn_clase_auxiliar_rf_combo,
	(select smn_base.smn_auxiliar.aux_codigo|| ' - ' || smn_base.smn_auxiliar.aux_descripcion from  smn_base.smn_auxiliar  where smn_base.smn_auxiliar.smn_auxiliar_id is not null  and smn_base.smn_auxiliar.smn_auxiliar_id=smn_comercial.smn_cliente.smn_auxiliar_rf  order by aux_descripcion ) as smn_auxiliar_rf_combo,
	(select smn_base.smn_clasificacion_abc.clf_codigo|| ' - ' || smn_base.smn_clasificacion_abc.clf_descripcion from  smn_base.smn_clasificacion_abc  where smn_base.smn_clasificacion_abc.smn_clasificacion_abc_id is not null  and smn_base.smn_clasificacion_abc.smn_clasificacion_abc_id=smn_comercial.smn_cliente.smn_clasificacion_abc_rf  order by clf_descripcion ) as smn_clasificacion_abc_rf_combo,
	(select smn_base.smn_sectores_economicos.sec_codigo|| ' - ' || smn_base.smn_sectores_economicos.sec_descripcion from  smn_base.smn_sectores_economicos  where smn_base.smn_sectores_economicos.smn_sectores_economicos_id is not null  and smn_base.smn_sectores_economicos.smn_sectores_economicos_id=smn_comercial.smn_cliente.smn_sector_economico_rf  order by sec_descripcion ) as smn_sector_economico_rf_combo,
	case
		when smn_comercial.smn_cliente.cli_nacional_ext='N' then '${lbl:b_nacional}'
		when smn_comercial.smn_cliente.cli_nacional_ext='E' then '${lbl:b_extranjero}'
	end as cli_nacional_ext_combo,
	case
		when smn_comercial.smn_cliente.cli_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_cliente.cli_estatus='IN' then '${lbl:b_inactive}'
	end as cli_estatus_combo,
	smn_comercial.smn_cliente.cli_fecha_registro,
	smn_comercial.smn_cliente.cli_hora,
	smn_comercial.smn_cliente.smn_clasificacion_cliente_id,
	smn_comercial.smn_cliente.smn_clase_auxiliar_rf,
	smn_comercial.smn_cliente.smn_auxiliar_rf,
	smn_comercial.smn_cliente.smn_clasificacion_abc_rf,
	smn_comercial.smn_cliente.smn_sector_economico_rf,
	smn_comercial.smn_cliente.cli_nacional_ext,
	smn_comercial.smn_cliente.cli_vigencia,
	smn_comercial.smn_cliente.cli_estatus,
	smn_comercial.smn_cliente.cli_idioma,
	smn_comercial.smn_cliente.cli_usuario,
	smn_comercial.smn_cliente.smn_cliente_id
	
from
	smn_comercial.smn_clasificacion_cliente,
	smn_comercial.smn_cliente
where
	smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id=smn_comercial.smn_cliente.smn_clasificacion_cliente_id
