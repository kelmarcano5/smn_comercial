INSERT INTO smn_comercial.smn_pedido_componentes
(
	smn_pedido_componentes_id,
	smn_pedido_detalle_id,
	smn_mov_caja_detalle_id,
	smn_ingresos_rf,
	smn_grupo_componente_rf,
	pco_tipo_componente,
	smn_componente_rf,
	pco_es_prestador_servicio,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	pco_naturaleza,
	smn_item_rf,
	smn_servicio_rf,
	pco_cantidad,
	smn_precio_ml_rf,
	pco_monto_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	smn_precio_ma,
	smn_monto_ma,
	pco_imprime,
	smn_grupo_titulo_impresion_rf,
	smn_tipo_gasto_rf,
	smn_sub_tipo_gasto_rf,
	pco_estatus,
	pco_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_pedido_componentes},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)