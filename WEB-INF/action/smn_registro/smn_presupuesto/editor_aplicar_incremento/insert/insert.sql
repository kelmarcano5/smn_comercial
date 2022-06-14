INSERT INTO smn_comercial.smn_presupuesto
(
	smn_presupuesto_id,
	smn_documento_id,
	smn_entidades_rf,
	smn_sucursales_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	smn_clase_ord_rf,
	smn_auxiliar_ord_rf,
	smn_baremo_rf,
	smn_auxiliar_unidades_negocios_rf,
	smn_auxiliar_sucursales_rf,
	smn_auxiliar_areas_servicios_rf,
	smn_auxiliar_unidades_servicios_rf,
	pre_vigencia_hasta,
	smn_ordenes_medicas_id,
	pre_fecha_entrega,
	pre_monto_ml,
	pre_monto_ma,
	smn_estado_presupuesto_id,
	pre_idioma,
	pre_usuario,
	pre_fecha_registro,
	pre_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_presupuesto},
	${fld:smn_documento_id},
	${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	${fld:smn_clase_auxiliar_rf},
	${fld:smn_auxiliar_rf},
	${fld:smn_clase_ord_rf},
	${fld:smn_auxiliar_ord_rf},
	(select id
	 from ((select 1 as order, smn_base.smn_baremos.smn_baremos_id as id from smn_base.smn_baremos where smn_clase_auxiliar_rf = ${fld:smn_clase_ord_rf}  and smn_auxiliar_rf = ${fld:smn_auxiliar_ord_rf})
			union
	       (select 2 as order, smn_base.smn_baremos.smn_baremos_id as id from smn_base.smn_baremos where smn_clase_auxiliar_rf = ${fld:smn_clase_auxiliar_rf}  and smn_auxiliar_rf = ${fld:smn_auxiliar_rf})
			union
		   (select 3 as order, smn_base.smn_baremos.smn_baremos_id as id from smn_base.smn_baremos where bar_tipo = 'G' and bar_codigo = 'EGR01')
		  ) subq
	order by subq.order asc
	limit 1),
	${fld:smn_auxiliar_unidades_negocios_rf},
	${fld:smn_auxiliar_sucursales_rf},
	${fld:smn_auxiliar_areas_servicios_rf},
	${fld:smn_auxiliar_unidades_servicios_rf},
	${fld:pre_vigencia_hasta},
	${fld:smn_ordenes_medicas_id},
	${fld:pre_fecha_entrega},
	0,
	0,
	1,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
