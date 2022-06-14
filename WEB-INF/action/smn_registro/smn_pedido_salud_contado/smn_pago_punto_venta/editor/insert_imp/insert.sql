INSERT INTO smn_comercial.smn_pago_punto_venta
(
	smn_pago_punto_venta_id,
	smn_pedido_cabecera_id,
	smn_mov_caja_cabecera_id,
	smn_pagador_clase_rf,
	smn_rel_punto_venta_pago_rf,
	smn_forma_pago_rf,
	ppv_numero_documento_forma_pago,
	ppv_numero_autorizacion,
	ppv_documento_identidad_pagador,
	ppv_nombre_pagador,
	ppv_monto_pagar_ml,
	ppv_monto_pago_ml,
	ppv_monto_devuelto_ml,
	ppv_monto_pagar_ma,
	ppv_monto_pago_ma,
	ppv_monto_devuelto_ma,
	smn_moneda_rf,
	smn_tasa_rf,
	ppv_observacion,
	ppv_estatus,
	ppv_idioma,
	ppv_usuario,
	ppv_fecha_registro,
	ppv_hora,
	ppv_banco_origen,
	ppv_banco_destino,
	ppv_cuenta_bancaria,
	smn_codigo_impuesto_rf,
	ppv_porcentaje,
	ppv_monto_impuesto_ml,
	ppv_monto_impuesto_ma,
	ppv_monto_servicio_ml,
	ppv_monto_servicio_ma
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_pago_punto_venta},
	${fld:smn_pedido_cabecera_id},
	${fld:smn_mov_caja_cabecera_id},
	${fld:smn_pagador_clase_rf},
	${fld:smn_rel_punto_venta_pago_rf},
	${fld:smn_forma_pago_rf},
	${fld:ppv_numero_documento_forma_pago},
	${fld:ppv_numero_autorizacion},
	${fld:ppv_documento_identidad_pagador},
	${fld:ppv_nombre_pagador},
	${fld:ppv_monto_pagar_ml},
	${fld:ppv_monto_pago_ml},
	${fld:ppv_monto_devuelto_ml},
	${fld:ppv_monto_pago_ma},
	${fld:ppv_monto_pagar_ma},
	${fld:ppv_monto_devuelto_ma},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:ppv_observacion},
	${fld:ppv_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:ppv_banco_origen},
	${fld:ppv_banco_destino},
	${fld:ppv_cuenta_bancaria},
	${fld:smn_codigo_impuesto_rf},
	${fld:ppv_porcentaje},
	${fld:ppv_monto_impuesto_ml},
	${fld:ppv_monto_impuesto_ma},
	${fld:ppv_monto_servicio_ml},
	${fld:ppv_monto_servicio_ma}
);

INSERT INTO smn_comercial.smn_pedido_pagadores
(
	smn_pedido_pagadores_id,
	smn_pedido_cabecera_id,
	smn_cliente_id,
	ppa_monto,
	ppa_idioma,
	ppa_usuario,
	ppa_fecha_registro,
	ppa_hora,
	ppa_monto_ma,
	smn_moneda_rf,
	smn_tasa_rf,
	smn_codigo_impuesto_rf,
	ppa_porcentaje,
	ppa_monto_impuesto_ml,
	ppa_monto_impuesto_ma,
	smn_pago_punto_venta_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_pedido_pagadores},
	${fld:smn_pedido_cabecera_id},
	(select smn_comercial.smn_pedido_cabecera.smn_cliente_id from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id} limit 1),
	${fld:ppv_monto_pago_ml},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:ppv_monto_pago_ma},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:smn_codigo_impuesto_rf},
	${fld:ppv_porcentaje},
	${fld:ppv_monto_impuesto_ml},
	${fld:ppv_monto_impuesto_ma},
	(SELECT last_value from smn_comercial.seq_smn_pago_punto_venta)
);

WITH dpc as (
	select
		SUM(smn_comercial.smn_pago_punto_venta.ppv_monto_devuelto_ml) as saldo_ml,
		SUM(smn_comercial.smn_pago_punto_venta.ppv_monto_devuelto_ma) as saldo_ma,
		SUM(smn_comercial.smn_pago_punto_venta.ppv_monto_impuesto_ml) as imp_ml,
		SUM(smn_comercial.smn_pago_punto_venta.ppv_monto_impuesto_ma) as imp_ma,
		SUM(smn_comercial.smn_pago_punto_venta.ppv_monto_pago_ml) as monto_pago_ml,
		SUM(smn_comercial.smn_pago_punto_venta.ppv_monto_pago_ma) as monto_pago_ma
	from 
		smn_comercial.smn_pago_punto_venta
	where 
		smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id= ${fld:smn_pedido_cabecera_id}
) 
UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_monto_impuesto_ml= dpc.imp_ml,
  pca_monto_impuesto_ma= dpc.imp_ma,
	pca_monto_neto_ml=(select smn_comercial.smn_pago_punto_venta.ppv_monto_servicio_ml from smn_comercial.smn_pago_punto_venta where smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id= ${fld:smn_pedido_cabecera_id} limit 1) + dpc.imp_ml,
	pca_monto_neto_ma=(select smn_comercial.smn_pago_punto_venta.ppv_monto_servicio_ma from smn_comercial.smn_pago_punto_venta where smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id= ${fld:smn_pedido_cabecera_id} limit 1) + dpc.imp_ma
FROM
	dpc
WHERE 
	smn_pedido_cabecera_id = ${fld:smn_pedido_cabecera_id};
