select
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id,
	smn_comercial.smn_pedido_detalle.smn_mov_caja_cabecera_id,
	cliente.aux_descripcion as cliente,
	paciente.aux_descripcion as paciente,
	case
		when smn_comercial.smn_pedido_detalle.pde_naturaleza='SE' then smn_base.smn_servicios.svc_descripcion
		when smn_comercial.smn_pedido_detalle.pde_naturaleza='IT' then smn_base.smn_item.itm_nombre
	end as descripcion,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_detalle.pde_monto,
		smn_comercial.smn_pedido_detalle.pde_precio_moneda_alterna,
	smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna,
	smn_comercial.smn_pedido_detalle.pde_fecha_registro,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada as cantidad,
	smn_comercial.smn_pedido_detalle.pde_observaciones as requerimientos,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as numeropedido,
	smn_comercial.smn_pedido_cabecera.pca_descripcion as descripcion_cab,
	smn_comercial.smn_pedido_cabecera.pca_estatus as pca_estatus_val,
	case
		when smn_comercial.smn_pedido_cabecera.smn_sucursal_rf is null then 0 else smn_comercial.smn_pedido_cabecera.smn_sucursal_rf
	end as sucursal,
	smn_comercial.smn_pedido_cabecera.smn_entidad_rf as entidad,
	smn_comercial.smn_pedido_detalle.pde_monto as monto,
	smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id as caja,
	smn_comercial.smn_pedido_cabecera.smn_documento_id as documento,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada*smn_comercial.smn_pedido_detalle.pde_precio as sed_monto_moneda_local,
	smn_comercial.smn_pedido_detalle.pde_naturaleza
from
	smn_comercial.smn_pedido_detalle
	left join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_pedido_detalle.smn_servicios_rf
	left join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_pedido_detalle.smn_item_rf
	inner join smn_comercial.smn_pedido_cabecera on 
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
	left join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	left join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left join smn_caja.smn_mov_caja_cabecera on smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id
	left join smn_base.smn_auxiliar paciente on paciente.smn_auxiliar_id = smn_caja.smn_mov_caja_cabecera.smn_auxiliar_rf
	left join smn_base.smn_auxiliar cliente on cliente.smn_auxiliar_id = smn_caja.smn_mov_caja_cabecera.smn_auxiliar_pagador_rf

where
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}
