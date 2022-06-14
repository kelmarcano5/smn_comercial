UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_monto_pedido_ml=${fld:pca_monto_pedido_ml},
	pca_monto_pedido_ma=${fld:pca_monto_pedido_ma},
	pca_idioma='${def:locale}',
	pca_usuario='${def:user}',
	pca_fecha_registro={d '${def:date}'},
	pca_hora='${def:time}'

WHERE
	smn_pedido_cabecera_id=${fld:id2}


	