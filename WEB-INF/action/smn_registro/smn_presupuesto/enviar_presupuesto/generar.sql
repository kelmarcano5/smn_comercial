select	
	(select smn_comercial.smn_documento.doc_codigo|| ' - ' || smn_comercial.smn_documento.doc_nombre from  smn_comercial.smn_documento where smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_presupuesto.smn_documento_id ) as smn_documento_id_combo,
	(select smn_base.smn_auxiliar.aux_num_doc_oficial || ' - ' || smn_base.smn_auxiliar.aux_nombres || ' ' || smn_base.smn_auxiliar.aux_apellidos from  smn_base.smn_auxiliar where smn_base.smn_auxiliar.smn_auxiliar_id is not null and smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_presupuesto.smn_auxiliar_rf) as smn_auxiliar_rf_combo,
		(select smn_comercial.smn_documento.doc_codigo|| ' - ' || smn_comercial.smn_documento.doc_nombre from  smn_comercial.smn_documento where smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_presupuesto.smn_documento_id ) as smn_documento_id_combo,
	(select smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_comercial.smn_presupuesto.smn_entidades_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as smn_entidades_rf_combo,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_comercial.smn_presupuesto.smn_sucursales_rf  order by smn_base.smn_sucursales.suc_nombre ) as smn_sucursales_rf_combo,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo = 'PA' and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_comercial.smn_presupuesto.smn_clase_auxiliar_rf) as smn_clase_auxiliar_rf_combo,
	(select smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial || ' - ' || smn_base.smn_auxiliar_persona_natural.ant_nombres || ' ' || smn_base.smn_auxiliar_persona_natural.ant_apellidos from  smn_base.smn_auxiliar_persona_natural where smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id is not null and smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id = smn_comercial.smn_presupuesto.smn_auxiliar_rf) as smn_auxiliar_rf_combo,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_comercial.smn_presupuesto.smn_clase_ord_rf) as smn_clase_ord_rf_combo,
	(select smn_base.smn_auxiliar_terceros.atr_codigo || ' - ' ||  smn_base.smn_auxiliar_terceros.atr_descripcion from smn_base.smn_auxiliar_terceros  where smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id is not null  and smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id = smn_comercial.smn_presupuesto.smn_auxiliar_ord_rf) as smn_auxiliar_ord_rf_combo,
	(select smn_base.smn_baremos.bar_codigo || ' - ' ||  smn_base.smn_baremos.bar_descripcion from  smn_base.smn_baremos  where smn_base.smn_baremos.smn_baremos_id is not null  and smn_base.smn_baremos.smn_baremos_id=smn_comercial.smn_presupuesto.smn_baremo_rf  order by smn_base.smn_baremos.bar_descripcion ) as smn_baremo_rf_combo,
	(select smn_base.smn_auxiliar_unidades_negocios.tun_codigo|| ' - ' || smn_base.smn_auxiliar_unidades_negocios.tun_nombre from  smn_base.smn_auxiliar_unidades_negocios  where smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id is not null  and smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id=smn_comercial.smn_presupuesto.smn_auxiliar_unidades_negocios_rf  order by smn_base.smn_auxiliar_unidades_negocios.tun_nombre ) as smn_auxiliar_unidades_negocios_rf_combo,
	(select smn_base.smn_auxiliar_sucursales.trs_codigo|| ' - ' || smn_base.smn_auxiliar_sucursales.trs_nombre from  smn_base.smn_auxiliar_sucursales  where smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id is not null  and smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id=smn_comercial.smn_presupuesto.smn_auxiliar_sucursales_rf  order by smn_base.smn_auxiliar_sucursales.trs_nombre ) as smn_auxiliar_sucursales_rf_combo,
	(select smn_base.smn_auxiliar_areas_servicios.tse_codigo|| ' - ' || smn_base.smn_auxiliar_areas_servicios.tse_descripcion from  smn_base.smn_auxiliar_areas_servicios  where smn_base.smn_auxiliar_areas_servicios.smn_auxiliar_areas_servicios_id is not null  and smn_base.smn_auxiliar_areas_servicios.smn_auxiliar_areas_servicios_id=smn_comercial.smn_presupuesto.smn_auxiliar_areas_servicios_rf  order by smn_base.smn_auxiliar_areas_servicios.tse_descripcion ) as smn_auxiliar_areas_servicios_rf_combo,
	(select smn_base.smn_auxiliar_unidades_servicios.tns_codigo|| ' - ' || smn_base.smn_auxiliar_unidades_servicios.tns_descripcion from  smn_base.smn_auxiliar_unidades_servicios  where smn_base.smn_auxiliar_unidades_servicios.smn_auxiliar_unidades_servicios_id is not null  and smn_base.smn_auxiliar_unidades_servicios.smn_auxiliar_unidades_servicios_id=smn_comercial.smn_presupuesto.smn_auxiliar_unidades_servicios_rf  order by smn_base.smn_auxiliar_unidades_servicios.tns_descripcion ) as smn_auxiliar_unidades_servicios_rf_combo,
	(select smn_comercial.smn_ordenes_medicas.omd_numero_orden || ' - ' || smn_comercial.smn_ordenes_medicas.omd_descripcion from  smn_comercial.smn_ordenes_medicas  where smn_comercial.smn_ordenes_medicas.smn_ordenes_medicas_id is not null  and smn_comercial.smn_ordenes_medicas.smn_ordenes_medicas_id=smn_comercial.smn_presupuesto.smn_ordenes_medicas_id  order by smn_comercial.smn_ordenes_medicas.omd_descripcion ) as smn_ordenes_medicas_id_combo,
	(select smn_base.smn_monedas.mon_codigo || ' - ' || smn_base.smn_monedas.mon_nombre from  smn_base.smn_monedas  where smn_base.smn_monedas.smn_monedas_id is not null  and smn_base.smn_monedas.smn_monedas_id=smn_comercial.smn_presupuesto.smn_moneda_rf  order by smn_base.smn_monedas.mon_nombre ) as smn_moneda_rf_combo,
	(select smn_comercial.smn_estado_presupuesto.epr_codigo || ' - ' || smn_comercial.smn_estado_presupuesto.epr_descripcion from  smn_comercial.smn_estado_presupuesto  where smn_comercial.smn_estado_presupuesto.smn_estado_presupuesto_id is not null  and smn_comercial.smn_estado_presupuesto.smn_estado_presupuesto_id=smn_comercial.smn_presupuesto.smn_estado_presupuesto_id  order by 1 ) as smn_estado_presupuesto_id_combo,
	smn_comercial.smn_presupuesto.smn_documento_id,
	smn_comercial.smn_presupuesto.smn_baremo_rf,
	smn_comercial.smn_presupuesto.pre_numero_control,
	smn_comercial.smn_presupuesto.smn_entidades_rf,
	smn_comercial.smn_presupuesto.smn_sucursales_rf,
	smn_comercial.smn_presupuesto.smn_auxiliar_rf,
	smn_comercial.smn_presupuesto.pre_fecha_registro,
	smn_comercial.smn_presupuesto.pre_monto_ml,
	smn_comercial.smn_presupuesto.smn_presupuesto_id,
		smn_comercial.smn_presupuesto.*,
	case
		when smn_comercial.smn_presupuesto.smn_estado_presupuesto_id = 1 then 'Registrado'
		when smn_comercial.smn_presupuesto.smn_estado_presupuesto_id = 2 then 'Generado' 
		when smn_comercial.smn_presupuesto.smn_estado_presupuesto_id = 3 then 'Enviado/Entregado'
		when smn_comercial.smn_presupuesto.smn_estado_presupuesto_id = 4 then 'Aprobado'
		when smn_comercial.smn_presupuesto.smn_estado_presupuesto_id = 5 then 'Rechazado'
	end as status_combo,
	smn_comercial.smn_presupuesto.smn_estado_presupuesto_id as status
	
from
	smn_comercial.smn_presupuesto
where
	smn_comercial.smn_presupuesto.smn_presupuesto_id=${fld:id}
 	 
order by 
	smn_presupuesto_id desc