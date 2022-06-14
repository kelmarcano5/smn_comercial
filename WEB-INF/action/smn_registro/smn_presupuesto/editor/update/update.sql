UPDATE smn_comercial.smn_presupuesto SET
	smn_documento_id=${fld:smn_documento_id},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursales_rf=${fld:smn_sucursales_rf},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_clase_ord_rf=${fld:smn_clase_ord_rf},
	smn_auxiliar_ord_rf=${fld:smn_auxiliar_ord_rf},
	smn_baremo_rf=
	(select id
	 from ((select 1 as order, smn_base.smn_baremos.smn_baremos_id as id from smn_base.smn_baremos where smn_clase_auxiliar_rf = ${fld:smn_clase_ord_rf}  and smn_auxiliar_rf = ${fld:smn_auxiliar_ord_rf})
			union
	       (select 2 as order, smn_base.smn_baremos.smn_baremos_id as id from smn_base.smn_baremos where smn_clase_auxiliar_rf = ${fld:smn_clase_auxiliar_rf}  and smn_auxiliar_rf = ${fld:smn_auxiliar_rf})
			union
		   (select 3 as order, smn_base.smn_baremos.smn_baremos_id as id from smn_base.smn_baremos where bar_tipo = 'G' and bar_codigo = 'EGR01')
		  ) subq
	order by subq.order asc
	limit 1),
	smn_auxiliar_unidades_negocios_rf=${fld:smn_auxiliar_unidades_negocios_rf},
	smn_auxiliar_sucursales_rf=${fld:smn_auxiliar_sucursales_rf},
	smn_auxiliar_areas_servicios_rf=${fld:smn_auxiliar_areas_servicios_rf},
	smn_auxiliar_unidades_servicios_rf=${fld:smn_auxiliar_unidades_servicios_rf},
	pre_vigencia_hasta=${fld:pre_vigencia_hasta},
	smn_ordenes_medicas_id=${fld:smn_ordenes_medicas_id},
	pre_fecha_entrega=${fld:pre_fecha_entrega},
	pre_monto_descuento=${fld:pre_monto_descuento},
	pre_monto_neto_moneda_local=${fld:pre_monto_neto_moneda_local},
	pre_idioma='${def:locale}',
	pre_usuario='${def:user}',
	pre_fecha_registro={d '${def:date}'},
	pre_hora='${def:time}'

WHERE
	smn_presupuesto_id=${fld:id}

