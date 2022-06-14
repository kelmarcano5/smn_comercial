select
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	case
		when smn_comercial.smn_pedido_cabecera.pca_estatus='RE' then '${lbl:b_register}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='AP' then '${lbl:b_aprobated}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='RZ' then '${lbl:b_refused}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='GE' then '${lbl:b_generated}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='PA' then '${lbl:b_partial_aprobated}'
	end as pca_estatus,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido,
	smn_comercial.smn_pedido_cabecera.smn_oferta_id,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_v_usuarios.usr_nombres ||' - '|| smn_base.smn_v_usuarios.usr_apellidos as smn_usuario_rf,
	smn_comercial.smn_pedido_cabecera.pca_descripcion,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo ||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_areas_servicios.ase_codigo ||' - '|| smn_base.smn_areas_servicios.ase_descripcion as smn_area_servicio_rf,
	smn_base.smn_unidades_servicios.uns_codigo ||' - '|| smn_base.smn_unidades_servicios.uns_descripcion as smn_unidad_servicio_rf,
	smn_base.smn_almacen.alm_codigo ||' - '|| smn_base.smn_almacen.alm_nombre as smn_almacen_rf,
	smn_base.smn_centro_costo.cco_codigo ||' - '|| smn_base.smn_centro_costo.cco_descripcion_corta as smn_centro_costo_rf,
	smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id,
	smn_comercial.smn_pedido_cabecera.pca_fecha_requerida,
	smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento,
	smn_comercial.smn_pedido_cabecera.pca_fecha_registro
from
	smn_comercial.smn_pedido_cabecera
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_pedido_cabecera.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_pedido_cabecera.smn_sucursal_rf
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_comercial.smn_pedido_cabecera.smn_area_servicio_rf
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_comercial.smn_pedido_cabecera.smn_unidad_servicio_rf
	left outer join smn_base.smn_almacen on smn_base.smn_almacen.smn_almacen_id = smn_comercial.smn_pedido_cabecera.smn_almacen_rf
	left outer join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_comercial.smn_pedido_cabecera.smn_centro_costo_rf
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left outer join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
where
	smn_pedido_cabecera_id = ${fld:id}
