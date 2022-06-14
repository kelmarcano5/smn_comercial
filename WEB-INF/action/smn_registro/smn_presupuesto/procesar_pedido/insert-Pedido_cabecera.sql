INSERT INTO smn_comercial.smn_pedido_cabecera
(
  smn_pedido_cabecera_id,
  smn_documento_id,
  pca_numero_pedido,
  smn_oferta_id,
  smn_cliente_id,
  smn_usuario_rf,
  pca_descripcion,
  pca_fecha_requerida,
  smn_entidad_rf,
  smn_sucursal_rf,
  smn_area_servicio_rf,
  smn_unidad_servicio_rf,
  smn_almacen_rf,
  smn_centro_costo_rf,
  smn_centro_facturacion_id,
  smn_tipo_linea_comercial_id,
  smn_linea_comercial_id,
  pca_estatus,
  pca_estatus_pago,
  pca_idioma,
  pca_usuario,
  pca_fecha_registro,
  pca_hora,
  smn_modulo_rf,
  smn_documento_general_rf,
  smn_numero_documento_origen
)
VALUES
(
  ${seq:nextval@smn_comercial.seq_smn_pedido_cabecera},
  ${fld:smn_documento_id},
  ${seq:nextval@smn_comercial.seq_smn_numero_pedido},
  ${fld:smn_presupuesto_id},
  ${fld:smn_cliente_id},
  ${fld:smn_usuario_rf},
  ${fld:pca_descripcion},
  {d '${def:date}'},
  ${fld:smn_entidades_rf},
  ${fld:smn_sucursales_rf},
  ${fld:smn_areas_servicios_rf},
  ${fld:smn_unidades_servicios_rf},
  ${fld:smn_almacen_rf},
  ${fld:smn_centro_costo_rf},
  ${fld:smn_centro_facturacion_id},
  (select smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id from smn_comercial.smn_rel_centro_fac_linea
  inner join smn_comercial.smn_linea_comercial on smn_comercial.smn_linea_comercial.smn_linea_comercial_id = smn_comercial.smn_rel_centro_fac_linea.smn_linea_comercial_id
  inner join smn_comercial.smn_tipo_linea_comercial on smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id = smn_comercial.smn_linea_comercial.smn_tipo_linea_comercial_id
  where smn_comercial.smn_rel_centro_fac_linea.smn_centro_facturacion_id=${fld:smn_centro_facturacion_id}),
  (select smn_comercial.smn_rel_centro_fac_linea.smn_linea_comercial_id from smn_comercial.smn_rel_centro_fac_linea where  smn_comercial.smn_rel_centro_fac_linea.smn_centro_facturacion_id=${fld:smn_centro_facturacion_id}),
  'RE',
  'PE',
  '${def:locale}',
  '${def:user}',
  {d '${def:date}'},
  '${def:time}',
  'PR',
  (select smn_comercial.smn_documento.smn_documentos_generales_rf as smn_documento_general_rf from smn_comercial.smn_documento where smn_comercial.smn_documento.smn_documento_id=${fld:smn_documento_id}),
  ${fld:pre_numero_control}

)
