select
	smn_comercial.smn_diagnostico_cab_auto.smn_diagnostico_cab_auto_id,
	smn_comercial.smn_ingresos.ctm_observaciones_id as ctm_observaciones_id_pl0,
	case
		when smn_comercial.smn_diagnostico_cab_auto.dia_estatus='RE' then '${lbl:b_registe}'
		when smn_comercial.smn_diagnostico_cab_auto.dia_estatus='GE' then '${lbl:b_generate}'
		when smn_comercial.smn_diagnostico_cab_auto.dia_estatus='ED' then 'En Diagnostico'
		when smn_comercial.smn_diagnostico_cab_auto.dia_estatus='DI' then 'Diagnosticado'
	end as dia_estatus_combo,
	smn_comercial.smn_diagnostico_cab_auto.smn_ingresos_id,
	smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf_combo,
	vh.aux_descripcion as vehiculo,
	vh.aux_codigo  as placa,
	vh.aux_nombres as color,
	smn_comercial.smn_diagnostico_cab_auto.dia_fecha_registro,
	smn_comercial.smn_ingresos.igs_num_ingreso,
	smn_comercial.smn_ingresos.descripcion_sintoma,
	ps.prs_codigo ||' - '|| ps.prs_descripcion as smn_auxiliar_rf_prest,
	smn_comercial.smn_ingresos.smn_entidades_rf,
	vh.aux_representante_legal as propietario
	
from
	smn_comercial.smn_diagnostico_cab_auto
	left outer join smn_comercial.smn_ingresos on smn_comercial.smn_ingresos.smn_ingresos_id = smn_comercial.smn_diagnostico_cab_auto.smn_ingresos_id
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_comercial.smn_diagnostico_cab_auto.smn_clase_auxiliar_rf
	left outer join smn_base.smn_auxiliar vh on vh.smn_auxiliar_id = smn_comercial.smn_diagnostico_cab_auto.smn_auxiliar_rf
	left outer join smn_base.smn_prestadores_servicios ps on ps.smn_prestadores_servicios_id = smn_comercial.smn_diagnostico_cab_auto.smn_auxiliar_rf_prest
where
	smn_comercial.smn_diagnostico_cab_auto.smn_diagnostico_cab_auto_id is not null 
	and smn_comercial.smn_diagnostico_cab_auto.smn_diagnostico_cab_auto_id=${fld:id} 
 	 
order by 
	smn_diagnostico_cab_auto_id desc