INSERT INTO smn_cobranzas.smn_saldo_cliente
(
	smn_saldo_cliente_id,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_cliente_rf,
	scl_fecha,
	scl_saldo_inicial_ml,
	scl_debitos_ml,
	scl_creditos_ml,
	scl_saldo_final_ml,
	scl_saldo_inicial_ma,
	scl_debitos_ma,
	scl_creditos_ma,
	scl_saldo_final_ma,
	scl_saldo_vencido_ml,
	scl_saldo_vencido_ma,
	scl_estatus,
	scl_porcentaje_deuda_vencida,
	scl_idioma,
	scl_usuario,
	scl_fecha_registro,
	scl_hora
)
VALUES
(
	nextval('smn_cobranzas.seq_smn_saldo_cliente'),
	(select smn_comercial.smn_pedido_cabecera.smn_entidad_rf from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}),
	(select case when smn_comercial.smn_pedido_cabecera.smn_sucursal_rf is null then 0 else smn_comercial.smn_pedido_cabecera.smn_sucursal_rf end as smn_sucursal_rf from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}),--${fld:smn_sucursal_rf},
	(select smn_comercial.smn_pedido_cabecera.smn_cliente_id from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}),
	{d '${def:date}'},
	${fld:scl_saldo_inicial_ml},
	${fld:scl_debitos_ml},
	${fld:scl_creditos_ml},
	${fld:scl_saldo_final_ml},
	${fld:scl_saldo_inicial_ma},
	${fld:scl_debitos_ma},
	${fld:scl_creditos_ma},
	${fld:scl_saldo_final_ma},
	${fld:scl_saldo_vencido_ml},
	${fld:scl_saldo_vencido_ma},
	'SO',
	${fld:scl_porcentaje_deuda_vencida},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)