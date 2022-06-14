select
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as numeropedido,
	smn_comercial.smn_pedido_cabecera.pca_descripcion as descripcion_cab,
	smn_comercial.smn_pedido_cabecera.pca_estatus as pca_estatus_val,
	smn_comercial.smn_pedido_cabecera.smn_cliente_id as cliente,
	smn_comercial.smn_pedido_cabecera.smn_documento_id as documento,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml as monto,
	smn_comercial.smn_pedido_cabecera.*
	
from
	smn_comercial.smn_pedido_cabecera
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	left outer join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
where
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:id2}
