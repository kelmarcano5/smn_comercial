with row as (
	select DISTINCT smn_base.smn_rel_item_cod_impuesto.smn_codigos_impuestos_id as cod_imp, smn_base.smn_codigos_impuestos.imp_porcentaje_calculo as por, smn_base.smn_codigos_impuestos.imp_monto_sustraendo as sus, smn_base.smn_baremos_detalle.bad_precio_moneda_local as montolocal from smn_base.smn_rel_item_cod_impuesto
	inner join smn_base.smn_codigos_impuestos on smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id = smn_base.smn_rel_item_cod_impuesto.smn_codigos_impuestos_id
	inner join smn_base.smn_baremos_detalle on smn_base.smn_baremos_detalle.smn_item_rf = smn_base.smn_rel_item_cod_impuesto.smn_item_id
	inner join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = smn_base.smn_baremos_detalle.smn_baremos_id
	where smn_base.smn_rel_item_cod_impuesto.smn_item_id=${fld:id} and smn_base.smn_baremos_detalle.smn_baremos_id=${fld:baremos}
)
INSERT INTO smn_comercial.smn_pedido_impuestos
(
	smn_pedido_impuestos_id,
	smn_pedido_detalle_id,
	smn_codigos_impuestos_rf,
	pim_monto_base_ml,
	pim_porcentaje_impuesto,
	pim_monto_sustraendo,
	pim_monto_impuesto,
	smn_moneda_rf,
	smn_tasa_rf,
	pim_monto_impuesto_ma,
	pim_idioma,
	pim_usuario,
	pim_fecha_registro,
	pim_hora
)
(select
	nextval('smn_comercial.seq_smn_pedido_impuestos'),
	${fld:smn_pedido_detalle_id},
	row.cod_imp,
	row.montolocal,
	row.por,
	row.sus,
	(row.montolocal*row.por/100)-row.sus,
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:pim_monto_impuesto_ma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
	from row
)