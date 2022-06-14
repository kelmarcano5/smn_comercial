select
	${field},
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo ||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_areas_servicios.ase_codigo ||' - '|| smn_base.smn_areas_servicios.ase_descripcion as smn_area_servicio_rf,
	smn_base.smn_unidades_servicios.uns_codigo ||' - '|| smn_base.smn_unidades_servicios.uns_descripcion as smn_unidad_servicio_rf,
	smn_base.smn_almacen.alm_codigo ||' - '|| smn_base.smn_almacen.alm_nombre as smn_almacen_rf,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_comercial.smn_centro_facturacion.cfc_nombre ||' - '|| smn_comercial.smn_centro_facturacion.cfc_codigo as smn_centro_facturacion_id,
	smn_comercial.smn_sub_centro_facturacion.scf_codigo ||' - '|| smn_comercial.smn_sub_centro_facturacion.scf_nombre as smn_sub_centro_facturacion_id,
	smn_comercial.smn_linea_comercial.lco_nombre ||' - '|| smn_comercial.smn_linea_comercial.lco_codigo as smn_linea_comercial_id,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma,
	smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_activo_fijo.acf_codigo ||' - '|| smn_base.smn_activo_fijo.acf_nombre as smn_activo_fijo_rf,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_base.smn_unidad_medida.unm_codigo ||' - '|| smn_base.smn_unidad_medida.unm_descripcion as smn_unidad_medida_rf,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_detalle.pde_monto,
	smn_base.smn_monedas.mon_codigo ||' - '|| smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.tca_moneda_referencia ||' - '|| smn_base.smn_tasas_de_cambio.tca_tasa_cambio as smn_tasa_rf,
	smn_comercial.smn_pedido_detalle.pde_precio_moneda_alterna,
	smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna,
	smn_comercial.smn_pedido_componentes.pco_tipo_componente,
	smn_base.smn_componentes.cmp_codigo ||' - '|| smn_base.smn_componentes.cmp_descripcion as smn_componente_rf,
	smn_comercial.smn_pedido_componentes.pco_monto_ml,
	smn_comercial.smn_pedido_componentes.smn_precio_ma,
  	smn_comercial.smn_pedido_componentes.smn_monto_ma,
	smn_base.smn_descuentos_retenciones.dyr_codigo ||' - '|| smn_base.smn_descuentos_retenciones.dyr_descripcion as smn_descuentos_retenciones_rf,
	smn_comercial.smn_pedido_desc_retenciones.pim_porcentaje_retencion,
  	smn_comercial.smn_pedido_desc_retenciones.pim_monto_descuento_retencion,
	smn_comercial.smn_pedido_desc_retenciones.pim_monto_descuento_ma,
	smn_comercial.smn_pago_punto_venta.ppv_numero_autorizacion,
	smn_comercial.smn_pago_punto_venta.ppv_nombre_pagador,
	smn_comercial.smn_pago_punto_venta.ppv_monto_pago_ml,
	smn_comercial.smn_pago_punto_venta.ppv_monto_pago_ma
from
	smn_comercial.smn_pedido_cabecera
	inner join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
	left outer join smn_comercial.smn_pedido_componentes on smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id
	left outer join smn_comercial.smn_pedido_desc_retenciones on smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = smn_comercial.smn_pedido_desc_retenciones.smn_pedido_detalle_id
	inner join smn_comercial.smn_pago_punto_venta on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_pedido_cabecera.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_pedido_cabecera.smn_sucursal_rf
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_comercial.smn_pedido_cabecera.smn_area_servicio_rf
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_comercial.smn_pedido_cabecera.smn_unidad_servicio_rf
	left outer join smn_base.smn_almacen on smn_base.smn_almacen.smn_almacen_id = smn_comercial.smn_pedido_cabecera.smn_almacen_rf
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_base.smn_auxiliar comp on comp.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
	left outer join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id
	left outer join smn_comercial.smn_sub_centro_facturacion on smn_comercial.smn_sub_centro_facturacion.smn_sub_centro_facturacion_id = smn_comercial.smn_pedido_cabecera.smn_sub_centro_facturacion_id
	left outer join smn_comercial.smn_linea_comercial on smn_comercial.smn_linea_comercial.smn_linea_comercial_id = smn_comercial.smn_pedido_cabecera.smn_linea_comercial_id
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_pedido_detalle.smn_servicios_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_pedido_detalle.smn_item_rf
	left outer join smn_base.smn_activo_fijo on smn_base.smn_activo_fijo.smn_afijo_id = smn_comercial.smn_pedido_detalle.smn_activo_fijo_rf
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_comercial.smn_pedido_detalle.smn_unidad_medida_rf
	left outer join smn_base.smn_item i on smn_base.smn_item.smn_item_id = smn_comercial.smn_pedido_componentes.smn_item_rf
	left outer join smn_base.smn_servicios s on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_pedido_componentes.smn_servicio_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_detalle.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_pedido_detalle.smn_tasa_rf
	left outer join smn_base.smn_monedas m on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pago_punto_venta.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio t on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_pago_punto_venta.smn_tasa_rf
	left outer join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_pedido_componentes.smn_componente_rf
	left outer join smn_base.smn_descuentos_retenciones on smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id = smn_comercial.smn_pedido_desc_retenciones.smn_descuentos_retenciones_rf

where
		smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id is not null
	${filter}

	
