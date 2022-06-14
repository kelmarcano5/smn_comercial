with row as (
	select DISTINCT smn_base.smn_rel_item_desc_retenc.smn_descuentos_retenciones_id as cod_des, smn_base.smn_descuentos_retenciones.dyr_porcentaje_descuento as por from smn_base.smn_rel_item_desc_retenc
	inner join smn_base.smn_descuentos_retenciones on smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id = smn_base.smn_rel_item_desc_retenc.smn_descuentos_retenciones_id
	where smn_base.smn_rel_item_desc_retenc.smn_item_id=${fld:id} and smn_base.smn_rel_item_desc_retenc.smn_descuentos_retenciones_id=${fld:cod_des}
)
INSERT INTO smn_comercial.smn_pedido_desc_retenciones
(
	smn_pedido_desc_retenciones_id,
	smn_pedido_detalle_id,
	smn_descuentos_retenciones_rf,
	pim_monto_base_ml,
	pim_porcentaje_retencion,
	pim_monto_descuento_retencion,
	smn_moneda_rf,
	smn_tasa_rf,
	pim_monto_descuento_ma,
	pim_idioma,
	pim_usuario,
	pim_fecha_registro,
	pim_hora,
	pim_monto_base_ma
)
(select
	nextval('smn_comercial.seq_smn_pedido_desc_retenciones'),
	(select last_value from smn_comercial.seq_smn_pedido_detalle),
	row.cod_des,
	${fld:montobaseml},
	row.por,
	${fld:montodescuentoml},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:montodescuentoma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:montobasema}
	from row
)


