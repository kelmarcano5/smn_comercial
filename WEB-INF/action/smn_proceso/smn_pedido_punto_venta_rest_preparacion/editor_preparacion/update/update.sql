UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_hora_preparacion='${def:time}',
	pca_estatus='ED',
	pca_idioma='${def:locale}',
	pca_usuario='${def:user}',
	pca_fecha_registro={d '${def:date}'},
	pca_hora='${def:time}'

WHERE
	smn_pedido_cabecera_id=${fld:id}