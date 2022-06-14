SELECT 
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml as monto_pedido,
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	paciente.aux_descripcion as paciente,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_pedido_cabecera.pca_descripcion,
	smn_comercial.smn_pedido_cabecera.pca_fecha_registro,
	smn_base.smn_auxiliar.aux_descripcion as cliente,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido,
	smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf as num_ingreso
FROM
	smn_comercial.smn_pedido_cabecera
	LEFT OUTER JOIN smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	LEFT OUTER JOIN smn_base.smn_usuarios ON smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf
	LEFT OUTER JOIN smn_seguridad.s_user ON smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	LEFT OUTER JOIN smn_base.smn_v_usuarios ON smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf
	LEFT OUTER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	LEFT OUTER JOIN smn_base.smn_auxiliar paciente ON paciente.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
	LEFT OUTER JOIN smn_comercial.smn_documento ON smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
	LEFT OUTER JOIN smn_comercial.smn_centro_facturacion ON smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id
	LEFT OUTER JOIN smn_comercial.smn_sub_centro_facturacion ON smn_comercial.smn_sub_centro_facturacion.smn_sub_centro_facturacion_id = smn_comercial.smn_pedido_cabecera.smn_sub_centro_facturacion_id
	LEFT OUTER JOIN smn_comercial.smn_tipo_linea_comercial ON smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id = smn_comercial.smn_pedido_cabecera.smn_tipo_linea_comercial_id
	LEFT OUTER JOIN smn_comercial.smn_linea_comercial ON smn_comercial.smn_linea_comercial.smn_linea_comercial_id = smn_comercial.smn_pedido_cabecera.smn_linea_comercial_id
	LEFT OUTER JOIN smn_base.smn_monedas ON smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_cabecera.smn_moneda_rf
	LEFT JOIN smn_comercial.smn_control_fiscal_documento ON smn_comercial.smn_control_fiscal_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
	INNER JOIN smn_comercial.smn_tipo_pedido ON smn_comercial.smn_tipo_pedido.smn_tipo_pedido_id = smn_comercial.smn_documento.smn_tipo_pedido_id
	LEFT OUTER JOIN smn_base.smn_auxiliar promotor ON promotor.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.pca_vendedor
	INNER JOIN smn_caja.smn_mov_caja_cabecera ON smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id
WHERE 
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:id2};