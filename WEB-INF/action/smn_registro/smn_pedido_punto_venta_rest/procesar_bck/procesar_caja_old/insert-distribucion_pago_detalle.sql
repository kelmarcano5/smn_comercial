INSERT INTO smn_caja.smn_dist_pago_detalle
(
	smn_dist_pago_detalle_id,
	smn_mov_caja_cabecera_id,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	smn_rel_pto_venta_mediop_rf,
	smn_forma_pago_rf,
	dpd_numero_doc_forma_pago,
	dpd_numero_autorizacion,
	dpd_documento_pagador,
	dpd_nombre_pagador,
	dpd_monto_por_pagar_ml,
	dpd_monto_del_pago_ml,
	mcd_monto_por_pagar_ma,
	dpd_monto_del_pago_ma,
	smn_moneda_rf,
	smn_tasa_rf,
	dpd_observacion,
	dpd_estatus,
	dpd_idioma,
	dpd_usuario,
	dpd_fecha_registro,
	dpd_hora
)
VALUES
(
	${seq:nextval@smn_caja.seq_smn_dist_pago_detalle},
	${seq:currval@smn_caja.seq_smn_mov_caja_cabecera},
	(select case when smn_comercial.smn_pedido_cabecera.smn_cliente_id !=0 then cl.smn_clase_auxiliar_rf 
	when smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf !=0 then co.smn_clase_auxiliar_rf
	end as smn_clase_auxiliar_rf
	from smn_comercial.smn_pedido_cabecera 
	left outer join smn_base.smn_auxiliar co on co.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
	left outer join smn_comercial.smn_cliente cl on cl.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}),
	${fld:smn_auxiliar_rf},
	${fld:smn_rel_punto_venta_pago_rf},
	${fld:smn_forma_pago_rf},
	${fld:ppv_numero_documento_forma_pago},
	${fld:ppv_numero_autorizacion},
	${fld:ppv_documento_identidad_pagador},
	${fld:ppv_nombre_pagador},
	${fld:ppv_monto_pagar_ml},
	${fld:ppv_monto_pago_ml},
	${fld:ppv_monto_pagar_ma},
	${fld:ppv_monto_pago_ma},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:ppv_observacion},
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

