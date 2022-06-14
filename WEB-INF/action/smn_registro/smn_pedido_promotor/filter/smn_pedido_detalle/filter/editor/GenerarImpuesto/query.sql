with row as (
	select DISTINCT smn_base.smn_rel_item_cod_impuesto.smn_codigos_impuestos_id as cod_imp, smn_base.smn_codigos_impuestos.imp_porcentaje_calculo as por, smn_base.smn_codigos_impuestos.imp_monto_sustraendo as sus from smn_base.smn_rel_item_cod_impuesto
	inner join smn_base.smn_codigos_impuestos on smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id = smn_base.smn_rel_item_cod_impuesto.smn_codigos_impuestos_id
	where smn_base.smn_rel_item_cod_impuesto.smn_item_id=${fld:id} and smn_base.smn_rel_item_cod_impuesto.smn_codigos_impuestos_id=${fld:cod_imp}
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
	pim_hora,
	pim_monto_base_ma
)
(select
	nextval('smn_comercial.seq_smn_pedido_impuestos'),
	(select last_value from smn_comercial.seq_smn_pedido_detalle),
	row.cod_imp,
	${fld:montobaseml},
	row.por,
	row.sus,
	${fld:montoimpuestoml},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:montoimpuestoma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:montobasema}
	from row
)