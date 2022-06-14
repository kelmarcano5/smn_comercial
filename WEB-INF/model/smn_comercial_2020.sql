CREATE TABLE smn_comercial.smn_accion(
  smn_accion_id INTEGER NOT NULL,
  acc_codigo VARCHAR(10) NOT NULL,
  acc_descripcion VARCHAR(100) NOT NULL,
  acc_require_seguimiento CHARACTER(1) NOT NULL,
  acc_dias_seguimiento INTEGER NOT NULL,
  acc_paso_rf INTEGER NOT NULL,
  acc_estatus CHARACTER(2) NOT NULL,
  acc_vigencia DATE NOT NULL,
  acc_idioma CHARACTER(2) NOT NULL,
  acc_usuario VARCHAR(10) NOT NULL,
  acc_fecha_registro DATE NOT NULL,
  acc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_accion;


CREATE TABLE smn_comercial.smn_accion_gestion_cliente(
  smn_accion_gestion_cliente_id INTEGER NOT NULL,
  smn_rel_oferta_cliente_id INTEGER NOT NULL,
  smn_accion_id INTEGER NOT NULL,
  ago_estatus_proceso CHARACTER(2) NOT NULL,
  ago_fecha_seguimiento DATE,
  ago_fecha_aprobacion DATE,
  ago_fecha_vigencia_desde DATE NOT NULL,
  ago_fecha_vigencia_hasta DATE NOT NULL,
  ago_fecha_cierre DATE,
  ago_idioma CHARACTER(2) NOT NULL,
  ago_usuario VARCHAR(10) NOT NULL,
  ago_fecha_registro DATE NOT NULL,
  ago_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_accion_gestion_cliente;


CREATE TABLE smn_comercial.smn_area_interes(
  smn_area_interes_id INTEGER NOT NULL,
  ari_codigo VARCHAR(16) NOT NULL,
  ari_descripcion VARCHAR(48) NOT NULL,
  ari_vigencia DATE NOT NULL,
  ari_estatus CHARACTER(2) NOT NULL,
  ari_idioma CHARACTER(2) NOT NULL,
  ari_usuario VARCHAR(10) NOT NULL,
  ari_fecha_registro DATE NOT NULL,
  ari_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_area_interes;


CREATE TABLE smn_comercial.smn_catalogo_item_comercio(
  smn_catalogo_item_comercio_id INTEGER NOT NULL,
  cic_origen CHARACTER(2) NOT NULL,
  smn_cliente_rf INTEGER NOT NULL,
  smn_item_rf INTEGER NOT NULL,
  smn_unidad_medida_rf INTEGER NOT NULL,
  cic_tiempo_sug_preparacion CHARACTER(8),
  smn_categoria_menu_id INTEGER,
  smn_categoria_item_id_a INTEGER,
  smn_categoria_item_id_b INTEGER,
  smn_baremos_rf INTEGER NOT NULL,
  cic_idioma CHARACTER(2) NOT NULL,
  cic_usuario VARCHAR(10) NOT NULL,
  cic_fecha_registro DATE NOT NULL,
  cic_hora CHARACTER(8) NOT NULL,
  cic_maneja_ingredientes CHARACTER(2),
  cic_descripcion CHARACTER(200)
);

CREATE SEQUENCE smn_comercial.seq_smn_catalogo_item_comercio;


CREATE TABLE smn_comercial.smn_categoria_item(
  smn_categoria_item_id INTEGER NOT NULL,
  cai_codigo CHARACTER(16) NOT NULL,
  cai_descripcion VARCHAR(100) NOT NULL,
  cai_estatus CHARACTER(2) NOT NULL,
  cai_fecha_vigencia DATE NOT NULL,
  cai_idioma CHARACTER(2) NOT NULL,
  cai_usuario VARCHAR(10) NOT NULL,
  cai_fecha_registro DATE NOT NULL,
  cai_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_categoria_item;


CREATE TABLE smn_comercial.smn_categoria_menu(
  smn_categoria_menu_id INTEGER NOT NULL,
  cam_codigo CHARACTER(16) NOT NULL,
  cam_descripcion VARCHAR(100) NOT NULL,
  cam_estatus CHARACTER(2) NOT NULL,
  cam_fecha_vigencia DATE NOT NULL,
  cam_idioma CHARACTER(2) NOT NULL,
  cam_usuario VARCHAR(10) NOT NULL,
  cam_fecha_registro DATE NOT NULL,
  cam_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_categoria_menu;


CREATE TABLE smn_comercial.smn_centro_facturacion(
  smn_centro_facturacion_id INTEGER NOT NULL,
  cfc_codigo VARCHAR(16) NOT NULL,
  cfc_nombre VARCHAR(48) NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER,
  smn_areas_servicios_rf INTEGER,
  smn_unidades_servicios_rf INTEGER,
  cfc_numero_identificacion VARCHAR(16),
  smn_almacen_rf INTEGER,
  smn_centro_costo_rf INTEGER,
  smn_caja_rf INTEGER NOT NULL,
  cfc_control_fiscal_1 INTEGER NOT NULL,
  cfc_control_fiscal_2 INTEGER,
  cfc_vigencia DATE NOT NULL,
  cfc_estatus CHARACTER(2) NOT NULL,
  cfc_idioma CHARACTER(2) NOT NULL,
  cfc_usuario VARCHAR(10) NOT NULL,
  cfc_fecha_registro DATE NOT NULL,
  cfc_hora CHARACTER(8) NOT NULL,
  smn_baremos_rf INTEGER
);

CREATE SEQUENCE smn_comercial.seq_smn_centro_facturacion;


CREATE TABLE smn_comercial.smn_clasificacion_cliente(
  smn_clasificacion_cliente_id INTEGER NOT NULL,
  ccl_codigo VARCHAR(16) NOT NULL,
  ccl_descripcion VARCHAR(48) NOT NULL,
  ccl_vigencia DATE NOT NULL,
  ccl_estatus CHARACTER(2) NOT NULL,
  ccl_idioma CHARACTER(2) NOT NULL,
  ccl_usuario VARCHAR(10) NOT NULL,
  ccl_fecha_registro DATE NOT NULL,
  ccl_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_clasificacion_cliente;


CREATE TABLE smn_comercial.smn_cliente(
  smn_cliente_id INTEGER NOT NULL,
  smn_clasificacion_cliente_id INTEGER NOT NULL,
  smn_clase_auxiliar_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_clasificacion_abc_rf INTEGER,
  smn_sector_economico_rf INTEGER NOT NULL,
  cli_nacional_ext CHARACTER(1) NOT NULL,
  cli_vigencia DATE NOT NULL,
  cli_estatus CHARACTER(2) NOT NULL,
  cli_idioma CHARACTER(2) NOT NULL,
  cli_usuario VARCHAR(10) NOT NULL,
  cli_fecha_registro DATE NOT NULL,
  cli_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_cliente;


CREATE TABLE smn_comercial.smn_tipo_documentos_fact(
  smn_tipo_documentos_fact_id INTEGER NOT NULL,
  tdf_codigo VARCHAR(16) NOT NULL,
  tdf_nombre VARCHAR(48) NOT NULL,
  tdf_naturaleza CHARACTER(2) NOT NULL,
  tdf_vigencia DATE NOT NULL,
  tdf_estatus CHARACTER(2) NOT NULL,
  tdf_idioma CHARACTER(2) NOT NULL,
  tdf_usuario VARCHAR(10) NOT NULL,
  tdf_fecha_registro DATE NOT NULL,
  tdf_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_tipo_documentos_fact;


CREATE TABLE smn_comercial.smn_documento(
  smn_documento_id INTEGER NOT NULL,
  smn_tipo_documentos_fact_id INTEGER NOT NULL,
  smn_documentos_generales_rf INTEGER NOT NULL,
  dcf_codigo VARCHAR(16) NOT NULL,
  dcf_descripcion VARCHAR(48) NOT NULL,
  dcf_tipo_movimiento CHARACTER(2) NOT NULL,
  dcf_req_vigencia CHARACTER(2) NOT NULL,
  dcf_req_fecha_vencimiento CHARACTER(2) NOT NULL,
  dcf_gen_orden_despacho CHARACTER(2) NOT NULL,
  dcf_req_servicios CHARACTER(2) NOT NULL,
  dcf_req_vendedor CHARACTER(2) NOT NULL,
  dcf_req_tiempo_entrega CHARACTER(2) NOT NULL,
  dcf_usa_bonificaciones CHARACTER(2) NOT NULL,
  dcf_usa_descuentos CHARACTER(2) NOT NULL,
  dcf_moneda_alterna CHARACTER(2),
  dcf_selecciona_precio CHARACTER(2) NOT NULL,
  dcf_usa_anexo CHARACTER(2),
  dcf_vigencia DATE NOT NULL,
  dcf_estatus CHARACTER(2) NOT NULL,
  dcf_idioma CHARACTER(2) NOT NULL,
  dcf_usuario VARCHAR(10) NOT NULL,
  dcf_fecha_registro DATE NOT NULL,
  dcf_hora CHARACTER(8) NOT NULL,
  dcf_genera_factura_pv CHARACTER(2)
);

CREATE SEQUENCE smn_comercial.seq_smn_documento;


CREATE TABLE smn_comercial.smn_control_cierre_contable(
  smn_control_cierre_contable_id INTEGER NOT NULL,
  smn_entidad_rf INTEGER NOT NULL,
  smn_sucursal_rf INTEGER,
  smn_documento_rf INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  ccc_fecha DATE NOT NULL,
  ccc_numero_documento INTEGER NOT NULL,
  ccc_monto_ml DOUBLE PRECISION NOT NULL,
  ccc_monto_ma DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  ccc_estatus CHARACTER(2) NOT NULL,
  ccc_idioma CHARACTER(2) NOT NULL,
  ccc_usuario CHARACTER(10) NOT NULL,
  ccc_fecha_registro DATE NOT NULL,
  ccc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_control_cierre_contable;


CREATE TABLE smn_comercial.smn_documento_grp_titulo_imp(
  smn_documento_grp_titulo_imp_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  smn_grupo_titulo_impresion_rf INTEGER NOT NULL,
  rdi_secuencia_impresion INTEGER NOT NULL,
  rdi_idioma CHARACTER(2) NOT NULL,
  rdi_usuario VARCHAR(10) NOT NULL,
  rdi_fecha_registro DATE NOT NULL,
  rdi_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_documento_grp_titulo_imp;


CREATE TABLE smn_comercial.smn_detalle_documento_titulo_imp(
  smn_detalle_documento_titulo_imp_id INTEGER NOT NULL,
  smn_documento_grp_titulo_imp_id INTEGER NOT NULL,
  dgi_naturaleza CHARACTER(1) NOT NULL,
  smn_servicios_rf INTEGER,
  smn_item_rf INTEGER,
  smn_componentes_rf INTEGER NOT NULL,
  dgi_idioma CHARACTER(2) NOT NULL,
  dgi_usuario VARCHAR(10) NOT NULL,
  dgi_fecha_registro DATE NOT NULL,
  dgi_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_detalle_documento_titulo_imp;


CREATE TABLE smn_comercial.smn_envio_oferta(
  smn_envio_oferta_id INTEGER NOT NULL,
  smn_oferta_id INTEGER NOT NULL,
  eof_fecha_envio DATE,
  eof_fecha_cierre DATE,
  smn_clasificacion_cliente_id INTEGER,
  smn_clientes_area_interes_id INTEGER,
  smn_tipo_contactos_rf INTEGER NOT NULL,
  eof_descripcion VARCHAR(200) NOT NULL,
  eof_idioma CHARACTER(2) NOT NULL,
  eof_usuario VARCHAR(10) NOT NULL,
  eof_fecha_registro DATE NOT NULL,
  eof_hora CHARACTER(10) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_envio_oferta;


CREATE TABLE smn_comercial.smn_factura_bonificacion(
  smn_factura_bonificacion_id INTEGER NOT NULL,
  smn_factura_detalle_id INTEGER NOT NULL,
  smn_item_bonificar_rf INTEGER NOT NULL,
  fbo_cantidad_origen INTEGER NOT NULL,
  fbo_cantidad_bonificar INTEGER NOT NULL,
  fbo_precio_original DOUBLE PRECISION NOT NULL,
  fbo_monto DOUBLE PRECISION NOT NULL,
  fbo_idioma CHARACTER(2) NOT NULL,
  fbo_usuario VARCHAR(10) NOT NULL,
  fbo_fecha_registro DATE NOT NULL,
  fbo_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_factura_bonificacion;


CREATE TABLE smn_comercial.smn_factura_cabecera(
  smn_factura_cabecera_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  fca_numero_documento_id INTEGER NOT NULL,
  smn_entidad_rf INTEGER NOT NULL,
  smn_sucursal_rf INTEGER,
  smn_pedido_cabecera_id INTEGER,
  smn_oferta_id INTEGER,
  smn_caja_rf INTEGER,
  smn_cliente_id INTEGER NOT NULL,
  smn_control_serie_fiscal_id INTEGER NOT NULL,
  fca_numero_control_fiscal INTEGER NOT NULL,
  fca_rif VARCHAR(50) NOT NULL,
  fca_direccion_fiscal VARCHAR(200) NOT NULL,
  smn_centro_facturacion_id INTEGER,
  smn_tipo_linea_comercial_id INTEGER,
  smn_linea_comercial_id INTEGER,
  fca_monto_factura_ml DOUBLE PRECISION NOT NULL,
  fca_monto_impuesto_ml DOUBLE PRECISION,
  fca_monto_descuento_ml DOUBLE PRECISION,
  fca_monto_bonificacion_ml DOUBLE PRECISION,
  fca_monto_neto_ml DOUBLE PRECISION NOT NULL,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  fca_monto_factura_ma DOUBLE PRECISION,
  fca_monto_impuesto_ma DOUBLE PRECISION,
  fca_monto_descuento_ma DOUBLE PRECISION,
  fca_monto_bonificacion_ma DOUBLE PRECISION,
  fca_monto_neto_ma DOUBLE PRECISION,
  fca_estatus_financiero CHARACTER(2) NOT NULL,
  fca_estatus_proceso CHARACTER(2) NOT NULL,
  fca_idioma CHARACTER(2) NOT NULL,
  fca_usuario VARCHAR(10) NOT NULL,
  fca_fecha_registro DATE NOT NULL,
  fca_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_factura_cabecera;


CREATE TABLE smn_comercial.smn_factura_componentes(
  smn_factura_componente_id INTEGER NOT NULL,
  smn_factura_detalle_id INTEGER NOT NULL,
  smn_grupo_componente_rf INTEGER NOT NULL,
  smn_componente_rf INTEGER NOT NULL,
  fco_es_prestador_servicio CHARACTER(10) NOT NULL,
  smn_clase_auxiliar_rf INTEGER,
  smn_auxiliar_rf INTEGER,
  smn_item_rf INTEGER,
  smn_servicio_rf INTEGER,
  fco_forma_calculo CHARACTER(2) NOT NULL,
  fco_cantidad INTEGER NOT NULL,
  smn_precio_ml_rf DOUBLE PRECISION NOT NULL,
  fco_monto_ml DOUBLE PRECISION NOT NULL,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  smn_precio_ma DOUBLE PRECISION,
  smn_monto_ma DOUBLE PRECISION,
  fco_imprime CHARACTER(2) NOT NULL,
  smn_grupo_titulo_impresion_rf INTEGER NOT NULL,
  smn_tipo_gasto_rf INTEGER NOT NULL,
  smn_sub_tipo_gasto_rf INTEGER NOT NULL,
  fco_estatus CHARACTER(2) NOT NULL,
  fco_idioma CHARACTER(2) NOT NULL,
  fco_usuario VARCHAR(10) NOT NULL,
  fco_fecha_registro DATE NOT NULL,
  fco_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_factura_componentes;


CREATE TABLE smn_comercial.smn_factura_descuentos_retenciones(
  smn_factura_descuentos_retenciones_id INTEGER NOT NULL,
  smn_factura_detalle_id INTEGER NOT NULL,
  smn_descuentos_retenciones_rf INTEGER,
  fdr_monto_base_ml DOUBLE PRECISION,
  fdr_porcentaje_descuento DOUBLE PRECISION,
  fdr_monto_descuento_ml DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  fdr_monto_descuento_ma DOUBLE PRECISION,
  fdr_idioma CHARACTER(2) NOT NULL,
  fdr_usuario VARCHAR(10) NOT NULL,
  fdr_fecha_registro DATE NOT NULL,
  fdr_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_factura_descuentos_retenciones;


CREATE TABLE smn_comercial.smn_factura_detalle(
  smn_factura_detalle_id INTEGER NOT NULL,
  smn_factura_cabecera_id INTEGER NOT NULL,
  fde_naturaleza CHARACTER(2) NOT NULL,
  smn_servicios_rf INTEGER,
  smn_item_rf INTEGER,
  smn_activo_fijo_rf INTEGER,
  fde_cantidad INTEGER NOT NULL,
  fde_precio_ml INTEGER NOT NULL,
  fde_monto_ml INTEGER NOT NULL,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  fde_precio_ma DOUBLE PRECISION,
  fde_monto_ma DOUBLE PRECISION,
  fde_idioma CHARACTER(2) NOT NULL,
  fde_usuario VARCHAR(10) NOT NULL,
  fde_fecha_registro DATE NOT NULL,
  fde_hora CHARACTER(8) NOT NULL,
  fde_impuesto_ml DOUBLE PRECISION,
  fde_impuesto_ma DOUBLE PRECISION,
  fde_descuento_ml DOUBLE PRECISION,
  fde_descuento_ma DOUBLE PRECISION,
  fde_bonificacion DOUBLE PRECISION
);

CREATE SEQUENCE smn_comercial.seq_smn_factura_detalle;


CREATE TABLE smn_comercial.smn_factura_impuesto_deducc(
  smn_factura_deducc_detalle_id INTEGER NOT NULL,
  smn_factura_detalle_id INTEGER NOT NULL,
  smn_codigos_impuestos_rf INTEGER,
  fid_monto_base_ml DOUBLE PRECISION,
  fid_porcentaje_impuesto DOUBLE PRECISION,
  fid_monto_sustraendo DOUBLE PRECISION,
  fid_monto_impuesto DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  fid_monto_imp_moneda_alterna DOUBLE PRECISION,
  smn_descuentos_retenciones_rf INTEGER,
  fid_porcentaje_descuento_retencion DOUBLE PRECISION,
  fid_monto_descuento_retencion DOUBLE PRECISION,
  fid_monto_desc_moneda_alterna DOUBLE PRECISION,
  fid_idioma CHARACTER(2) NOT NULL,
  fid_usuario VARCHAR(10) NOT NULL,
  fid_fecha_registro DATE NOT NULL,
  fid_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_factura_impuesto_deducc;


CREATE TABLE smn_comercial.smn_factura_impuestos(
  smn_factura_impuestos_id INTEGER NOT NULL,
  smn_factura_detalle_id INTEGER NOT NULL,
  smn_codigos_impuestos_rf INTEGER,
  fai_monto_base_ml DOUBLE PRECISION,
  fai_porcentaje_impuesto DOUBLE PRECISION,
  fai_monto_impuesto_ml DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  fai_monto_impuesto_ma DOUBLE PRECISION,
  fai_idioma CHARACTER(2) NOT NULL,
  fai_usuario VARCHAR(10) NOT NULL,
  fai_fecha_registro DATE NOT NULL,
  fai_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_factura_impuestos;


CREATE TABLE smn_comercial.smn_factura_kits(
  smn_factura_kits_id INTEGER NOT NULL,
  smn_factura_detalle_id INTEGER NOT NULL,
  smn_item_origen_rf INTEGER NOT NULL,
  smn_item_destino_rf INTEGER NOT NULL,
  fki_cantidad INTEGER NOT NULL,
  fki_precio_ml DOUBLE PRECISION NOT NULL,
  fki_monto_ml DOUBLE PRECISION NOT NULL,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  smn_precio_ma_rf DOUBLE PRECISION,
  fki_monto_ma_rf DOUBLE PRECISION,
  fki_estatus CHARACTER(2) NOT NULL,
  fki_idioma CHARACTER(2) NOT NULL,
  fki_usuario VARCHAR(10) NOT NULL,
  fki_fecha_registro DATE NOT NULL,
  fki_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_factura_kits;


CREATE TABLE smn_comercial.smn_factura_pagadores(
  smn_factura_pagadores_id INTEGER NOT NULL,
  smn_factura_cabecera_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_monto_rf DOUBLE PRECISION NOT NULL,
  fpa_idioma CHARACTER(2) NOT NULL,
  fpa_usuario VARCHAR(10) NOT NULL,
  fpa_fecha_registro DATE NOT NULL,
  fpa_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_factura_pagadores;


CREATE TABLE smn_comercial.smn_gestion(
  smn_gestion_id INTEGER NOT NULL,
  ges_codigo VARCHAR(10) NOT NULL,
  ges_descripcion VARCHAR(100) NOT NULL,
  smn_accion_id INTEGER NOT NULL,
  ges_estatus CHARACTER(2) NOT NULL,
  ges_vigencia DATE NOT NULL,
  ges_idioma CHARACTER(2) NOT NULL,
  ges_usuario VARCHAR(10) NOT NULL,
  ges_fecha_registro DATE NOT NULL,
  ges_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_gestion;


CREATE TABLE smn_comercial.smn_grupo_promotores_vendedores(
  smn_grupo_promotores_vendedores_id INTEGER NOT NULL,
  gpv_codigo VARCHAR(18) NOT NULL,
  gpv_descripcion VARCHAR(200) NOT NULL,
  gpv_estatus CHARACTER(2) NOT NULL,
  gpv_vigencia DATE NOT NULL,
  gpv_idioma CHARACTER(2) NOT NULL,
  gpv_usuario VARCHAR(10) NOT NULL,
  gpv_fecha_registro DATE NOT NULL,
  gpv_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_grupo_promotores_vendedores;


CREATE TABLE smn_comercial.smn_imagen_cliente(
  smn_imagen_cliente_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  iic_descripcion VARCHAR(200) NOT NULL,
  iic_imagen_size INTEGER NOT NULL,
  iic_imagen_data BYTEA,
  filename VARCHAR(100),
  content_type VARCHAR(100),
  iic_idioma CHARACTER(2) NOT NULL,
  iic_usuario VARCHAR(10) NOT NULL,
  iic_fecha_registro DATE NOT NULL,
  iic_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_imagen_cliente;


CREATE TABLE smn_comercial.smn_imagen_item_comercio(
  smn_imagen_item_comercio_id INTEGER NOT NULL,
  smn_catalogo_item_comercio_id INTEGER NOT NULL,
  iic_descripcion VARCHAR(200) NOT NULL,
  iic_imagen_size INTEGER NOT NULL,
  iic_imagen_data BYTEA,
  filename VARCHAR(100),
  content_type VARCHAR(100),
  iic_idioma CHARACTER(2) NOT NULL,
  iic_usuario VARCHAR(10) NOT NULL,
  iic_fecha_registro DATE NOT NULL,
  iic_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_imagen_item_comercio;


CREATE TABLE smn_comercial.smn_ingredientes(
  smn_ingredientes_id INTEGER NOT NULL,
  smn_pedido_detalle_id INTEGER NOT NULL,
  smn_item_rf INTEGER NOT NULL,
  smn_unidad_medida_rf INTEGER NOT NULL,
  igs_cantidad INTEGER NOT NULL,
  igs_precio DOUBLE PRECISION NOT NULL,
  smn_moneda_rf INTEGER,
  igs_precio_ma DOUBLE PRECISION,
  igs_monto_moneda_local DOUBLE PRECISION NOT NULL,
  igs_monto_moneda_alterna DOUBLE PRECISION,
  igs_idioma CHARACTER(2) NOT NULL,
  igs_usuario VARCHAR(10) NOT NULL,
  igs_fecha_registro DATE NOT NULL,
  igs_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_ingredientes;


CREATE TABLE smn_comercial.smn_tipo_linea_comercial(
  smn_tipo_linea_comercial_id INTEGER NOT NULL,
  tlc_codigo VARCHAR(16) NOT NULL,
  tlc_nombre VARCHAR(48) NOT NULL,
  tlc_naturaleza CHARACTER(2) NOT NULL,
  tlc_vigencia DATE NOT NULL,
  tlc_estatus CHARACTER(2) NOT NULL,
  tlc_idioma CHARACTER(2) NOT NULL,
  tlc_usuario VARCHAR(10) NOT NULL,
  tlc_fecha_registro DATE NOT NULL,
  tlc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_tipo_linea_comercial;


CREATE TABLE smn_comercial.smn_linea_comercial(
  smn_linea_comercial_id INTEGER NOT NULL,
  smn_tipo_linea_comercial_id INTEGER NOT NULL,
  lco_codigo VARCHAR(16) NOT NULL,
  lco_nombre VARCHAR(48) NOT NULL,
  lco_vigencia DATE NOT NULL,
  lco_estatus CHARACTER(2) NOT NULL,
  lco_idioma CHARACTER(2) NOT NULL,
  lco_usuario VARCHAR(10) NOT NULL,
  lco_fecha_registro DATE NOT NULL,
  lco_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_linea_comercial;


CREATE TABLE smn_comercial.smn_llamadas(
  smn_llamadas_id INTEGER NOT NULL,
  smn_cliente_id INTEGER,
  smn_prospecto_id INTEGER,
  smn_solicitud_afiliacion_id INTEGER,
  smn_tipo_documento_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  lla_descripcion VARCHAR(200) NOT NULL,
  smn_cita_id INTEGER,
  smn_orden_pedido_id INTEGER,
  smn_oferta_id INTEGER,
  smn_solicitud_servicio_entrega_rf INTEGER,
  smn_gestion_id INTEGER,
  lla_observacion VARCHAR(200),
  lla_estatus CHARACTER(2) NOT NULL,
  lla_idioma CHARACTER(2) NOT NULL,
  lla_usuario VARCHAR(10) NOT NULL,
  lla_fecha_registro DATE NOT NULL,
  lla_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_llamadas;


CREATE TABLE smn_comercial.smn_metas(
  smn_metas_id INTEGER NOT NULL,
  smn_tipo_documento_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  smn_clase_auxiliar_rf INTEGER,
  smn_auxiliar_rf INTEGER,
  smn_rol_id INTEGER,
  smn_usuario_rf INTEGER,
  met_fecha_desde DATE NOT NULL,
  met_fecha_hasta DATE NOT NULL,
  met_dias_habiles INTEGER NOT NULL,
  met_fecha_estadistica DATE,
  met_cantidad_diaria INTEGER NOT NULL,
  met_cantidad_usuario INTEGER,
  met_estatus CHARACTER(2) NOT NULL,
  met_idioma CHARACTER(2) NOT NULL,
  met_usuario VARCHAR(10) NOT NULL,
  met_fecha_registro DATE NOT NULL,
  met_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_metas;


CREATE TABLE smn_comercial.smn_oferta_cabecera(
  smn_oferta_cabecera_id INTEGER NOT NULL,
  smn_documento_id INTEGER,
  ofe_numero_documento INTEGER NOT NULL,
  ofe_descripcion VARCHAR(100) NOT NULL,
  smn_entidad_rf INTEGER,
  smn_sucursal_rf INTEGER,
  ofe_fecha_desde DATE NOT NULL,
  ofe_fecha_hasta DATE NOT NULL,
  ofe_observaciones VARCHAR(200),
  ofe_estatus CHARACTER(2) NOT NULL,
  ofe_idioma CHARACTER(2) NOT NULL,
  ofe_usuario VARCHAR(10) NOT NULL,
  ofe_fecha_registro DATE NOT NULL,
  ofe_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_oferta_cabecera;


CREATE TABLE smn_comercial.smn_oferta_detalle(
  smn_oferta_detalle_id INTEGER NOT NULL,
  smn_oferta_id INTEGER NOT NULL,
  ofd_naturaleza CHARACTER(2) NOT NULL,
  smn_servicios_rf INTEGER,
  smn_item_rf INTEGER,
  smn_activo_fijo_rf INTEGER,
  ofd_cantidad INTEGER NOT NULL,
  ofd_precio DOUBLE PRECISION NOT NULL,
  ofd_monto_ml DOUBLE PRECISION NOT NULL,
  ofd_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  ofd_precio_moneda_alterna DOUBLE PRECISION,
  ofd_monto_moneda_alterna DOUBLE PRECISION,
  ofd_idioma CHARACTER(2) NOT NULL,
  ofd_usuario VARCHAR(10) NOT NULL,
  ofd_fecha_registro DATE NOT NULL,
  ofd_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_oferta_detalle;


CREATE TABLE smn_comercial.smn_pago_punto_venta(
  smn_pago_punto_venta_id INTEGER NOT NULL,
  smn_pedido_cabecera_id INTEGER NOT NULL,
  smn_mov_caja_cabecera_id INTEGER,
  smn_pagador_clase_rf INTEGER,
  smn_rel_punto_venta_pago_rf INTEGER,
  smn_forma_pago_rf INTEGER,
  ppv_numero_documento_forma_pago INTEGER,
  ppv_numero_autorizacion INTEGER,
  ppv_documento_identidad_pagador VARCHAR(100),
  ppv_nombre_pagador VARCHAR(100),
  ppv_monto_pagar_ml DOUBLE PRECISION,
  ppv_monto_pago_ml DOUBLE PRECISION NOT NULL,
  ppv_monto_devuelto_ml DOUBLE PRECISION,
  ppv_monto_pagar_ma DOUBLE PRECISION,
  ppv_monto_pago_ma DOUBLE PRECISION,
  ppv_monto_devuelto_ma DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  ppv_observacion VARCHAR(400),
  ppv_estatus CHARACTER(2) NOT NULL,
  ppv_idioma CHARACTER(2) NOT NULL,
  ppv_usuario VARCHAR(10) NOT NULL,
  ppv_fecha_registro DATE NOT NULL,
  ppv_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_pago_punto_venta;


CREATE TABLE smn_comercial.smn_pedido_cabecera(
  smn_pedido_cabecera_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  pca_numero_pedido INTEGER NOT NULL,
  smn_mov_caja_cabecera_id INTEGER,
  smn_oferta_id INTEGER,
  smn_cliente_id INTEGER,
  smn_usuario_rf INTEGER NOT NULL,
  pca_descripcion VARCHAR(200) NOT NULL,
  pca_fecha_requerida DATE,
  smn_entidad_rf INTEGER,
  smn_sucursal_rf INTEGER,
  smn_area_servicio_rf INTEGER,
  smn_unidad_servicio_rf INTEGER,
  smn_almacen_rf INTEGER,
  smn_centro_costo_rf INTEGER NOT NULL,
  smn_centro_facturacion_id INTEGER NOT NULL,
  smn_sub_centro_facturacion_id INTEGER,
  smn_tipo_linea_comercial_id INTEGER NOT NULL,
  smn_linea_comercial_id INTEGER NOT NULL,
  pca_monto_pedido_ml DOUBLE PRECISION,
  pca_monto_impuesto_ml DOUBLE PRECISION,
  pca_monto_descuento_ml DOUBLE PRECISION,
  pca_monto_bonificacion_ml DOUBLE PRECISION,
  pca_monto_neto_ml DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  pca_monto_pedido_ma DOUBLE PRECISION,
  pca_monto_impuesto_ma DOUBLE PRECISION,
  pca_monto_descuento_ma DOUBLE PRECISION,
  pca_monto_bonificacion_ma DOUBLE PRECISION,
  pca_monto_neto_ma DOUBLE PRECISION,
  pca_estatus CHARACTER(2) NOT NULL,
  pca_estatus_pago CHARACTER(2) NOT NULL,
  pca_fecha_vencimiento DATE,
  pca_idioma CHARACTER(2) NOT NULL,
  pca_usuario VARCHAR(10) NOT NULL,
  pca_fecha_registro DATE NOT NULL,
  pca_hora CHARACTER(8) NOT NULL,
  pca_cantidad INTEGER,
  pca_fecha_solicitud DATE,
  pca_hora_solicitud CHARACTER(8),
  pca_hora_despacho CHARACTER(8),
  pca_hora_preparacion CHARACTER(8),
  pca_tiempo_sug_preparacion CHARACTER(8),
  pca_especificacion_servicio VARCHAR(255),
  pca_hora_inicio_preparacion CHARACTER(8),
  smn_auxiliar_rf INTEGER
);

CREATE SEQUENCE smn_comercial.seq_smn_pedido_cabecera;


CREATE TABLE smn_comercial.smn_pedido_componentes(
  smn_pedido_componentes_id INTEGER NOT NULL,
  smn_pedido_detalle_id INTEGER,
  smn_mov_caja_detalle_id INTEGER,
  smn_ingresos_rf INTEGER,
  smn_grupo_componente_rf INTEGER NOT NULL,
  pco_tipo_componente CHARACTER(2) NOT NULL,
  smn_componente_rf INTEGER NOT NULL,
  pco_es_prestador_servicio CHARACTER(10) NOT NULL,
  smn_clase_auxiliar_rf INTEGER,
  smn_auxiliar_rf INTEGER,
  pco_naturaleza CHARACTER(2) NOT NULL,
  smn_item_rf INTEGER,
  smn_servicio_rf INTEGER,
  pco_cantidad INTEGER NOT NULL,
  smn_precio_ml_rf DOUBLE PRECISION NOT NULL,
  pco_monto_ml DOUBLE PRECISION NOT NULL,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  smn_precio_ma DOUBLE PRECISION,
  smn_monto_ma DOUBLE PRECISION,
  pco_imprime CHARACTER(2) NOT NULL,
  smn_grupo_titulo_impresion_rf INTEGER NOT NULL,
  smn_tipo_gasto_rf INTEGER NOT NULL,
  smn_sub_tipo_gasto_rf INTEGER NOT NULL,
  pco_estatus CHARACTER(2) NOT NULL,
  pco_idioma CHARACTER(2) NOT NULL,
  pco_usuario VARCHAR(10) NOT NULL,
  pco_fecha_registro DATE NOT NULL,
  pco_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_pedido_componentes;


CREATE TABLE smn_comercial.smn_pedido_desc_retenciones(
  smn_pedido_desc_retenciones_id INTEGER NOT NULL,
  smn_pedido_detalle_id INTEGER NOT NULL,
  smn_descuentos_retenciones_rf INTEGER,
  pim_monto_base_ml INTEGER,
  pim_porcentaje_retencion INTEGER,
  pim_monto_descuento_retencion INTEGER,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  pim_monto_descuento_ma INTEGER,
  pim_idioma CHARACTER(2) NOT NULL,
  pim_usuario VARCHAR(10) NOT NULL,
  pim_fecha_registro DATE NOT NULL,
  pim_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_pedido_desc_retenciones;


CREATE TABLE smn_comercial.smn_pedido_detalle(
  smn_pedido_detalle_id INTEGER NOT NULL,
  smn_pedido_cabecera_id INTEGER NOT NULL,
  smn_mov_caja_cabecera_id INTEGER,
  pde_naturaleza CHARACTER(2),
  smn_servicios_rf INTEGER,
  smn_item_rf INTEGER,
  smn_activo_fijo_rf INTEGER,
  pde_cantidad_oferta INTEGER,
  pde_cantidad_pedido INTEGER NOT NULL,
  pde_cantidad_aprobada INTEGER NOT NULL,
  pde_precio DOUBLE PRECISION NOT NULL,
  pde_monto DOUBLE PRECISION NOT NULL,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  pde_precio_moneda_alterna DOUBLE PRECISION,
  pde_monto_moneda_alterna DOUBLE PRECISION,
  pde_especificaciones_pedido VARCHAR(200),
  pde_fecha_requerida DATE NOT NULL,
  pde_observaciones VARCHAR(200),
  pde_estatus CHARACTER(2),
  pde_idioma CHARACTER(2) NOT NULL,
  pde_usuario VARCHAR(10) NOT NULL,
  pde_fecha_registro DATE NOT NULL,
  pde_hora CHARACTER(8) NOT NULL,
  smn_unidad_medida_rf INTEGER,
  pde_tiempo_sug_preparacion CHARACTER(8),
  smn_catalogo_item_comercio_id INTEGER,
  smn_descripcion_ingrediente VARCHAR(200)
);

CREATE SEQUENCE smn_comercial.seq_smn_pedido_detalle;


CREATE TABLE smn_comercial.smn_pedido_imp_deducc_detalle(
  smn_pedido_imp_deducc_detalle_id INTEGER NOT NULL,
  smn_pedido_detalle_id INTEGER NOT NULL,
  smn_codigos_impuestos_rf INTEGER,
  pid_porcentaje_impuesto DOUBLE PRECISION,
  pid_monto_sustraendo DOUBLE PRECISION,
  pid_monto_impuesto DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  pid_monto_imp_moneda_alterna DOUBLE PRECISION,
  smn_descuentos_retenciones_rf INTEGER,
  pid_porcentaje_descuento_retencion DOUBLE PRECISION,
  pid_monto_descuento_retencion DOUBLE PRECISION,
  pid_monto_desc_moneda_alterna DOUBLE PRECISION,
  pid_idioma CHARACTER(2) NOT NULL,
  pid_usuario VARCHAR(10) NOT NULL,
  pid_fecha_registro DATE NOT NULL,
  pid_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_pedido_imp_deducc_detalle;


CREATE TABLE smn_comercial.smn_pedido_impuestos(
  smn_pedido_impuestos_id INTEGER NOT NULL,
  smn_pedido_detalle_id INTEGER NOT NULL,
  smn_codigos_impuestos_rf INTEGER,
  pim_monto_base_ml INTEGER,
  pim_porcentaje_impuesto INTEGER,
  pim_monto_sustraendo INTEGER,
  pim_monto_impuesto INTEGER,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  pim_monto_impuesto_ma INTEGER,
  pim_idioma CHARACTER(2) NOT NULL,
  pim_usuario VARCHAR(10) NOT NULL,
  pim_fecha_registro DATE NOT NULL,
  pim_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_pedido_impuestos;


CREATE TABLE smn_comercial.smn_pedido_pagadores(
  smn_pedido_pagadores_id INTEGER NOT NULL,
  smn_pedido_cabecera_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  ppa_monto DOUBLE PRECISION NOT NULL,
  ppa_idioma CHARACTER(2) NOT NULL,
  ppa_usuario VARCHAR(10) NOT NULL,
  ppa_fecha_registro DATE NOT NULL,
  ppa_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_pedido_pagadores;


CREATE TABLE smn_comercial.smn_plan_venta(
  smn_plan_venta_id INTEGER NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursal_rf INTEGER NOT NULL,
  smn_area_servicio_rf INTEGER,
  smn_unidad_servicio_rf INTEGER,
  smn_almacen_rf INTEGER,
  smn_documento_id INTEGER NOT NULL,
  smn_servicio_rf INTEGER,
  smn_item_rf INTEGER,
  plv_semestre_rf INTEGER,
  plv_trimestre_rf INTEGER,
  plv_mes_rf INTEGER,
  plv_semana_rf INTEGER,
  plv_fecha DATE,
  plv_cantidad_rf DOUBLE PRECISION NOT NULL,
  plv_precio_rf DOUBLE PRECISION NOT NULL,
  plv_monto_rf DOUBLE PRECISION NOT NULL,
  plv_precio_ma_rf DOUBLE PRECISION,
  plv_monto_ma_rf DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  plv_idioma CHARACTER(2) NOT NULL,
  plv_usuario VARCHAR(10) NOT NULL,
  plv_fecha_registro DATE NOT NULL,
  plv_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_plan_venta;


CREATE TABLE smn_comercial.smn_prospecto(
  smn_prospecto_id INTEGER NOT NULL,
  pro_codigo VARCHAR(18) NOT NULL,
  pro_descripcion VARCHAR(100) NOT NULL,
  pro_email VARCHAR(100) NOT NULL,
  pro_movil VARCHAR(100) NOT NULL,
  pro_fijo VARCHAR(100) NOT NULL,
  pro_referido VARCHAR(100) NOT NULL,
  pro_estatus CHARACTER(2) NOT NULL,
  pro_vigencia DATE NOT NULL,
  pro_idioma CHARACTER(2) NOT NULL,
  pro_usuario VARCHAR(10) NOT NULL,
  pro_fecha_registro DATE NOT NULL,
  pro_hora CHARACTER(8) NOT NULL,
  smn_direccion_rf INTEGER,
  smn_tipo_contactos_rf INTEGER,
  pro_descripcion_contacto CHARACTER(1)
);

CREATE SEQUENCE smn_comercial.seq_smn_prospecto;


CREATE TABLE smn_comercial.smn_rel_centro_fac_documento(
  smn_rel_centro_fac_documento_id INTEGER NOT NULL,
  smn_centro_facturacion_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_centro_fac_documento;


CREATE TABLE smn_comercial.smn_rel_centro_fac_linea(
  smn_rel_centro_fac_linea_id INTEGER NOT NULL,
  smn_centro_facturacion_id INTEGER NOT NULL,
  smn_linea_comercial_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_centro_fac_linea;


CREATE TABLE smn_comercial.smn_rel_centro_facturacion_usuario(
  smn_rel_centro_facturacion_usuario_id INTEGER NOT NULL,
  smn_centro_facturacion_id INTEGER NOT NULL,
  smn_usuario_rf INTEGER NOT NULL,
  rfu_vigencia DATE NOT NULL,
  rfu_estatus CHARACTER(2) NOT NULL,
  rfu_idioma CHARACTER(2) NOT NULL,
  rfu_usuario VARCHAR(10) NOT NULL,
  rfu_fecha_registro DATE NOT NULL,
  rfu_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_centro_facturacion_usuario;


CREATE TABLE smn_comercial.smn_rel_cliente_agenda(
  smn_rel_cliente_agenda_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_agenda_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_agenda;


CREATE TABLE smn_comercial.smn_rel_cliente_area_interes(
  smn_rel_cliente_area_interes_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_area_interes_id INTEGER NOT NULL,
  rca_estatus CHARACTER(2) NOT NULL,
  rca_vigencia DATE NOT NULL,
  rca_idioma CHARACTER(2) NOT NULL,
  rca_usuario VARCHAR(10) NOT NULL,
  rca_fecha_registro DATE NOT NULL,
  rca_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_area_interes;


CREATE TABLE smn_comercial.smn_rel_cliente_cond_financiera(
  smn_rel_cliente_cond_financiera_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_condicion_financiera_rf INTEGER NOT NULL,
  rcc_estatus CHARACTER(2) NOT NULL,
  rcc_vigencia DATE NOT NULL,
  rcc_idioma CHARACTER(2) NOT NULL,
  rcc_usuario VARCHAR(10) NOT NULL,
  rcc_fecha_registro DATE NOT NULL,
  rcc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_cond_financiera;


CREATE TABLE smn_comercial.smn_rel_cliente_contacto(
  smn_rel_cliente_contacto_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_contacto_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_contacto;


CREATE TABLE smn_comercial.smn_rel_cliente_documento(
  smn_rel_cliente_documento_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_documento;


CREATE TABLE smn_comercial.smn_rel_cliente_entidad_financiera(
  smn_rel_cliente_entidad_financiera_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_entidad_financiera_rf INTEGER NOT NULL,
  smn_tipo_cuenta_banco_rf INTEGER NOT NULL,
  cef_numero_cuenta VARCHAR(20) NOT NULL,
  cef_estatus CHARACTER(2) NOT NULL,
  cef_vigencia DATE NOT NULL,
  cef_idioma CHARACTER(2) NOT NULL,
  cef_usuario VARCHAR(10) NOT NULL,
  cef_fecha_registro DATE NOT NULL,
  cef_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_entidad_financiera;


CREATE TABLE smn_comercial.smn_rel_cliente_forma_pago(
  smn_rel_cliente_forma_pago_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_forma_pago_rf INTEGER NOT NULL,
  rcf_estatus CHARACTER(2) NOT NULL,
  rcf_vigencia DATE NOT NULL,
  rcf_idioma CHARACTER(2) NOT NULL,
  rcf_usuario VARCHAR(10) NOT NULL,
  rcf_fecha_registro DATE NOT NULL,
  rcf_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_forma_pago;


CREATE TABLE smn_comercial.smn_rel_cliente_medio_pago(
  smn_rel_cliente_medio_pago_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_medio_pago_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_medio_pago;


CREATE TABLE smn_comercial.smn_rel_cliente_rol(
  smn_rel_cliente_rol_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_rol_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_rol;


CREATE TABLE smn_comercial.smn_rel_cliente_servicio(
  smn_rel_cliente_servicio_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_servicio_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_servicio;


CREATE TABLE smn_comercial.smn_rel_cliente_usuario(
  smn_rel_cliente_usuario_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_usuario_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_cliente_usuario;


CREATE TABLE smn_comercial.smn_rel_detalle_ingrediente(
  smn_rel_detalle_ingrediente_id INTEGER NOT NULL,
  smn_pedido_detalle_id INTEGER NOT NULL,
  smn_ingredientes_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_detalle_ingrediente;


CREATE TABLE smn_comercial.smn_rel_doc_entidad(
  smn_rel_doc_entidad_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  smn_entidades_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_doc_entidad;


CREATE TABLE smn_comercial.smn_rel_documento_entidad(
  smn_rel_documento_entidad_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  smn_entidades_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_documento_entidad;


CREATE TABLE smn_comercial.smn_rol(
  smn_rol_id INTEGER NOT NULL,
  smn_usuarios_rf INTEGER NOT NULL,
  rol_tipo CHARACTER(2) NOT NULL,
  smn_corporaciones_rf INTEGER,
  smn_entidades_rf INTEGER,
  smn_sucursales_rf INTEGER,
  smn_areas_servicios_rf INTEGER,
  smn_unidades_servicios_rf INTEGER,
  rol_posicion_estructura_rf INTEGER NOT NULL,
  rol_estatus CHARACTER(2) NOT NULL,
  rol_vigencia DATE NOT NULL,
  rol_idioma CHARACTER(2) NOT NULL,
  rol_usuario VARCHAR(10) NOT NULL,
  rol_fecha_registro DATE NOT NULL,
  rol_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rol;


CREATE TABLE smn_comercial.smn_rel_grp_promotor_vendedor_rol(
  smn_rel_grp_promotor_vendedor_rol_id INTEGER NOT NULL,
  smn_grupo_promotores_vendedores_id INTEGER NOT NULL,
  smn_rol_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_grp_promotor_vendedor_rol;


CREATE TABLE smn_comercial.smn_rel_linea_comercial_afijo(
  smn_rel_linea_comercial_afijo_id INTEGER NOT NULL,
  smn_linea_comercial_id INTEGER NOT NULL,
  smn_activo_rf INTEGER NOT NULL,
  rla_estatus CHARACTER(2) NOT NULL,
  rla_vigencia DATE NOT NULL,
  rla_idioma CHARACTER(2) NOT NULL,
  rla_usuario VARCHAR(10) NOT NULL,
  rla_fecha_registro DATE NOT NULL,
  rla_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_linea_comercial_afijo;


CREATE TABLE smn_comercial.smn_rel_linea_comercial_item(
  smn_rel_linea_comercial_item_id INTEGER NOT NULL,
  smn_linea_comercial_id INTEGER NOT NULL,
  smn_item_rf INTEGER NOT NULL,
  rli_estatus CHARACTER(2) NOT NULL,
  rli_vigencia DATE NOT NULL,
  rli_idioma CHARACTER(2) NOT NULL,
  rli_usuario VARCHAR(10) NOT NULL,
  rli_fecha_registro DATE NOT NULL,
  rli_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_linea_comercial_item;


CREATE TABLE smn_comercial.smn_rel_linea_comercial_servicio(
  smn_rel_linea_comercial_servicio_id INTEGER NOT NULL,
  smn_linea_comercial_id INTEGER NOT NULL,
  smn_servicio_rf INTEGER NOT NULL,
  rls_estatus CHARACTER(2) NOT NULL,
  rls_vigencia DATE NOT NULL,
  rls_idioma CHARACTER(2) NOT NULL,
  rls_usuario VARCHAR(10) NOT NULL,
  rls_fecha_registro DATE NOT NULL,
  rls_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_linea_comercial_servicio;


CREATE TABLE smn_comercial.smn_rel_oferta_cliente(
  smn_rel_oferta_cliente_id INTEGER NOT NULL,
  smn_oferta_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  roc_estatus_proceso CHARACTER(2) NOT NULL,
  roc_fecha_aprobacion DATE,
  roc_fecha_vigencia_desde DATE NOT NULL,
  roc_fecha_vigencia_hasta DATE NOT NULL,
  roc_fecha_cierre DATE,
  roc_idioma CHARACTER(2) NOT NULL,
  roc_usuario VARCHAR(10) NOT NULL,
  roc_fecha_registro DATE NOT NULL,
  roc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_oferta_cliente;


CREATE TABLE smn_comercial.smn_rel_usuario_linea_comercial(
  smn_rel_usuario_linea_comercial_id INTEGER NOT NULL,
  smn_linea_comercial_id INTEGER NOT NULL,
  smn_usuario_rf INTEGER NOT NULL,
  rlu_estatus CHARACTER(2) NOT NULL,
  rlu_vigencia DATE NOT NULL,
  rlu_idioma CHARACTER(2) NOT NULL,
  rlu_usuario VARCHAR(10) NOT NULL,
  rlu_fecha_registro DATE NOT NULL,
  rlu_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_usuario_linea_comercial;


CREATE TABLE smn_comercial.smn_sub_centro_facturacion(
  smn_sub_centro_facturacion_id INTEGER NOT NULL,
  smn_centro_facturacion_id INTEGER NOT NULL,
  scf_codigo CHARACTER(20) NOT NULL,
  scf_nombre VARCHAR(200) NOT NULL,
  scf_estatus CHARACTER(2) NOT NULL,
  scf_vigencia DATE NOT NULL,
  scf_idioma CHARACTER(2) NOT NULL,
  scf_usuario VARCHAR(10) NOT NULL,
  scf_fecha_registro DATE NOT NULL,
  scf_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_sub_centro_facturacion;


CREATE TABLE smn_comercial.smn_paciente(
  smn_paciente_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_paciente;


CREATE TABLE smn_comercial.smn_factura_impresion_detalle(
  smn_factura_impresion_detalle_id INTEGER NOT NULL,
  smn_factura_cabecera_id INTEGER NOT NULL,
  smn_pedido_detalle_id INTEGER NOT NULL,
  smn_pedido_componente_id INTEGER,
  smn_grupo_titulo_impresion_rf INTEGER,
  fim_codigo VARCHAR(100) NOT NULL,
  fim_descripcion VARCHAR(255) NOT NULL,
  fim_cantidad INTEGER NOT NULL,
  fim_precio_ml DOUBLE PRECISION NOT NULL,
  fim_monto_ml DOUBLE PRECISION NOT NULL,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  fim_precio_ma DOUBLE PRECISION,
  fim_monto_ma DOUBLE PRECISION,
  fim_idioma CHARACTER(2) NOT NULL,
  fim_usuario VARCHAR(10) NOT NULL,
  fim_fecha_registro DATE NOT NULL,
  fim_hora CHARACTER(8) NOT NULL,
  smn_prestador_servicio_rf INTEGER,
  smn_pedido_cabecera_id INTEGER
);

CREATE SEQUENCE smn_comercial.seq_smn_factura_impresion_detalle;


CREATE TABLE smn_comercial.smn_rel_pedido_fecha_entrega(
  smn_rel_pedido_fecha_entrega_id INTEGER NOT NULL,
  smn_pedido_detalle_id INTEGER NOT NULL,
  smn_rel_auxiliar_direccion INTEGER NOT NULL,
  pfe_fecha_entrega DATE NOT NULL,
  pfe_cantidad INTEGER NOT NULL,
  pfe_idioma CHARACTER(2) NOT NULL,
  pfe_usuario VARCHAR(10) NOT NULL,
  pfe_fecha_registro DATE NOT NULL,
  pfe_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_pedido_fecha_entrega;



ALTER TABLE smn_comercial.smn_accion ADD PRIMARY KEY (smn_accion_id);

ALTER TABLE smn_comercial.smn_accion_gestion_cliente ADD PRIMARY KEY (smn_accion_gestion_cliente_id);

ALTER TABLE smn_comercial.smn_area_interes ADD PRIMARY KEY (smn_area_interes_id);

ALTER TABLE smn_comercial.smn_categoria_item ADD PRIMARY KEY (smn_categoria_item_id);

ALTER TABLE smn_comercial.smn_categoria_menu ADD PRIMARY KEY (smn_categoria_menu_id);

ALTER TABLE smn_comercial.smn_centro_facturacion ADD PRIMARY KEY (smn_centro_facturacion_id);

ALTER TABLE smn_comercial.smn_clasificacion_cliente ADD PRIMARY KEY (smn_clasificacion_cliente_id);

ALTER TABLE smn_comercial.smn_cliente ADD PRIMARY KEY (smn_cliente_id);
ALTER TABLE smn_comercial.smn_cliente ADD CONSTRAINT FK_smn_cliente_0 FOREIGN KEY (smn_clasificacion_cliente_id) REFERENCES smn_comercial.smn_clasificacion_cliente (smn_clasificacion_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_tipo_documentos_fact ADD PRIMARY KEY (smn_tipo_documentos_fact_id);

ALTER TABLE smn_comercial.smn_documento ADD PRIMARY KEY (smn_documento_id);
ALTER TABLE smn_comercial.smn_documento ADD CONSTRAINT FK_smn_documento_0 FOREIGN KEY (smn_tipo_documentos_fact_id) REFERENCES smn_comercial.smn_tipo_documentos_fact (smn_tipo_documentos_fact_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_control_cierre_contable ADD PRIMARY KEY (smn_control_cierre_contable_id);
ALTER TABLE smn_comercial.smn_control_cierre_contable ADD CONSTRAINT FK_smn_control_cierre_contable_0 FOREIGN KEY (smn_documento_id) REFERENCES smn_comercial.smn_documento (smn_documento_id) ON DELETE CASCADE;
ALTER TABLE smn_comercial.smn_control_cierre_contable ADD CONSTRAINT FK_smn_control_cierre_contable_1 FOREIGN KEY (smn_documento_rf) REFERENCES smn_comercial.smn_documento (smn_documento_id) ON DELETE CASCADE;

ALTER TABLE smn_comercial.smn_documento_grp_titulo_imp ADD PRIMARY KEY (smn_documento_grp_titulo_imp_id);
ALTER TABLE smn_comercial.smn_documento_grp_titulo_imp ADD CONSTRAINT FK_smn_documento_grp_titulo_imp_0 FOREIGN KEY (smn_documento_id) REFERENCES smn_comercial.smn_documento (smn_documento_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_detalle_documento_titulo_imp ADD PRIMARY KEY (smn_detalle_documento_titulo_imp_id);
ALTER TABLE smn_comercial.smn_detalle_documento_titulo_imp ADD CONSTRAINT FK_smn_detalle_documento_titulo_imp_0 FOREIGN KEY (smn_documento_grp_titulo_imp_id) REFERENCES smn_comercial.smn_documento_grp_titulo_imp (smn_documento_grp_titulo_imp_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_envio_oferta ADD PRIMARY KEY (smn_envio_oferta_id);

ALTER TABLE smn_comercial.smn_factura_bonificacion ADD PRIMARY KEY (smn_factura_bonificacion_id);

ALTER TABLE smn_comercial.smn_factura_cabecera ADD PRIMARY KEY (smn_factura_cabecera_id);

ALTER TABLE smn_comercial.smn_factura_componentes ADD PRIMARY KEY (smn_factura_componente_id);

ALTER TABLE smn_comercial.smn_factura_descuentos_retenciones ADD PRIMARY KEY (smn_factura_descuentos_retenciones_id);

ALTER TABLE smn_comercial.smn_factura_detalle ADD PRIMARY KEY (smn_factura_detalle_id);
ALTER TABLE smn_comercial.smn_factura_detalle ADD CONSTRAINT FK_smn_factura_detalle_0 FOREIGN KEY (smn_factura_cabecera_id) REFERENCES smn_comercial.smn_factura_cabecera (smn_factura_cabecera_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_factura_impuesto_deducc ADD PRIMARY KEY (smn_factura_deducc_detalle_id);

ALTER TABLE smn_comercial.smn_factura_impuestos ADD PRIMARY KEY (smn_factura_impuestos_id);

ALTER TABLE smn_comercial.smn_factura_kits ADD PRIMARY KEY (smn_factura_kits_id);

ALTER TABLE smn_comercial.smn_factura_pagadores ADD PRIMARY KEY (smn_factura_pagadores_id);
ALTER TABLE smn_comercial.smn_factura_pagadores ADD CONSTRAINT FK_smn_factura_pagadores_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_comercial.smn_cliente (smn_cliente_id) ON DELETE NO ACTION;
ALTER TABLE smn_comercial.smn_factura_pagadores ADD CONSTRAINT FK_smn_factura_pagadores_1 FOREIGN KEY (smn_factura_cabecera_id) REFERENCES smn_comercial.smn_factura_cabecera (smn_factura_cabecera_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_gestion ADD PRIMARY KEY (smn_gestion_id);
ALTER TABLE smn_comercial.smn_gestion ADD CONSTRAINT FK_smn_gestion_0 FOREIGN KEY (smn_accion_id) REFERENCES smn_comercial.smn_accion (smn_accion_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_grupo_promotores_vendedores ADD PRIMARY KEY (smn_grupo_promotores_vendedores_id);

ALTER TABLE smn_comercial.smn_imagen_cliente ADD PRIMARY KEY (smn_imagen_cliente_id);
ALTER TABLE smn_comercial.smn_imagen_cliente ADD CONSTRAINT FK_smn_imagen_cliente_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_comercial.smn_cliente (smn_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_imagen_item_comercio ADD PRIMARY KEY (smn_imagen_item_comercio_id);

ALTER TABLE smn_comercial.smn_ingredientes ADD PRIMARY KEY (smn_ingredientes_id);

ALTER TABLE smn_comercial.smn_tipo_linea_comercial ADD PRIMARY KEY (smn_tipo_linea_comercial_id);

ALTER TABLE smn_comercial.smn_linea_comercial ADD PRIMARY KEY (smn_linea_comercial_id);
ALTER TABLE smn_comercial.smn_linea_comercial ADD CONSTRAINT FK_smn_linea_comercial_0 FOREIGN KEY (smn_tipo_linea_comercial_id) REFERENCES smn_comercial.smn_tipo_linea_comercial (smn_tipo_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_llamadas ADD PRIMARY KEY (smn_llamadas_id);

ALTER TABLE smn_comercial.smn_metas ADD PRIMARY KEY (smn_metas_id);

ALTER TABLE smn_comercial.smn_pago_punto_venta ADD PRIMARY KEY (smn_pago_punto_venta_id);

ALTER TABLE smn_comercial.smn_pedido_cabecera ADD PRIMARY KEY (smn_pedido_cabecera_id);

ALTER TABLE smn_comercial.smn_pedido_componentes ADD PRIMARY KEY (smn_pedido_componentes_id);

ALTER TABLE smn_comercial.smn_pedido_desc_retenciones ADD PRIMARY KEY (smn_pedido_desc_retenciones_id);

ALTER TABLE smn_comercial.smn_pedido_imp_deducc_detalle ADD PRIMARY KEY (smn_pedido_imp_deducc_detalle_id);

ALTER TABLE smn_comercial.smn_pedido_impuestos ADD PRIMARY KEY (smn_pedido_impuestos_id);

ALTER TABLE smn_comercial.smn_plan_venta ADD PRIMARY KEY (smn_plan_venta_id);

ALTER TABLE smn_comercial.smn_prospecto ADD PRIMARY KEY (smn_prospecto_id);

ALTER TABLE smn_comercial.smn_rel_centro_fac_documento ADD PRIMARY KEY (smn_rel_centro_fac_documento_id);

ALTER TABLE smn_comercial.smn_rel_centro_fac_linea ADD PRIMARY KEY (smn_rel_centro_fac_linea_id);

ALTER TABLE smn_comercial.smn_rel_centro_facturacion_usuario ADD PRIMARY KEY (smn_rel_centro_facturacion_usuario_id);
ALTER TABLE smn_comercial.smn_rel_centro_facturacion_usuario ADD CONSTRAINT FK_smn_rel_centro_facturacion_usuario_0 FOREIGN KEY (smn_centro_facturacion_id) REFERENCES smn_comercial.smn_centro_facturacion (smn_centro_facturacion_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_cliente_agenda ADD PRIMARY KEY (smn_rel_cliente_agenda_id);

ALTER TABLE smn_comercial.smn_rel_cliente_area_interes ADD PRIMARY KEY (smn_rel_cliente_area_interes_id);
ALTER TABLE smn_comercial.smn_rel_cliente_area_interes ADD CONSTRAINT FK_smn_rel_cliente_area_interes_0 FOREIGN KEY (smn_area_interes_id) REFERENCES smn_comercial.smn_area_interes (smn_area_interes_id) ON DELETE NO ACTION;
ALTER TABLE smn_comercial.smn_rel_cliente_area_interes ADD CONSTRAINT FK_smn_rel_cliente_area_interes_1 FOREIGN KEY (smn_cliente_id) REFERENCES smn_comercial.smn_cliente (smn_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_cliente_cond_financiera ADD PRIMARY KEY (smn_rel_cliente_cond_financiera_id);

ALTER TABLE smn_comercial.smn_rel_cliente_contacto ADD PRIMARY KEY (smn_rel_cliente_contacto_id);

ALTER TABLE smn_comercial.smn_rel_cliente_documento ADD PRIMARY KEY (smn_rel_cliente_documento_id);
ALTER TABLE smn_comercial.smn_rel_cliente_documento ADD CONSTRAINT FK_smn_rel_cliente_documento_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_comercial.smn_cliente (smn_cliente_id) ON DELETE NO ACTION;
ALTER TABLE smn_comercial.smn_rel_cliente_documento ADD CONSTRAINT FK_smn_rel_cliente_documento_1 FOREIGN KEY (smn_documento_id) REFERENCES smn_comercial.smn_documento (smn_documento_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_cliente_entidad_financiera ADD PRIMARY KEY (smn_rel_cliente_entidad_financiera_id);
ALTER TABLE smn_comercial.smn_rel_cliente_entidad_financiera ADD CONSTRAINT FK_smn_rel_cliente_entidad_financiera_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_comercial.smn_cliente (smn_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_cliente_forma_pago ADD PRIMARY KEY (smn_rel_cliente_forma_pago_id);
ALTER TABLE smn_comercial.smn_rel_cliente_forma_pago ADD CONSTRAINT FK_smn_rel_cliente_forma_pago_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_comercial.smn_cliente (smn_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_cliente_medio_pago ADD PRIMARY KEY (smn_rel_cliente_medio_pago_id);

ALTER TABLE smn_comercial.smn_rel_cliente_rol ADD PRIMARY KEY (smn_rel_cliente_rol_id);

ALTER TABLE smn_comercial.smn_rel_cliente_servicio ADD PRIMARY KEY (smn_rel_cliente_servicio_id);

ALTER TABLE smn_comercial.smn_rel_cliente_usuario ADD PRIMARY KEY (smn_rel_cliente_usuario_id);

ALTER TABLE smn_comercial.smn_rel_detalle_ingrediente ADD PRIMARY KEY (smn_rel_detalle_ingrediente_id);
ALTER TABLE smn_comercial.smn_rel_detalle_ingrediente ADD CONSTRAINT FK_smn_rel_detalle_ingrediente_0 FOREIGN KEY (smn_ingredientes_id) REFERENCES smn_comercial.smn_ingredientes (smn_ingredientes_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_doc_entidad ADD PRIMARY KEY (smn_rel_doc_entidad_id);
ALTER TABLE smn_comercial.smn_rel_doc_entidad ADD CONSTRAINT FK_smn_rel_doc_entidad_0 FOREIGN KEY (smn_documento_id) REFERENCES smn_comercial.smn_documento (smn_documento_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rol ADD PRIMARY KEY (smn_rol_id);

ALTER TABLE smn_comercial.smn_rel_grp_promotor_vendedor_rol ADD PRIMARY KEY (smn_rel_grp_promotor_vendedor_rol_id);
ALTER TABLE smn_comercial.smn_rel_grp_promotor_vendedor_rol ADD CONSTRAINT FK_smn_rel_grp_promotor_vendedor_rol_0 FOREIGN KEY (smn_grupo_promotores_vendedores_id) REFERENCES smn_comercial.smn_grupo_promotores_vendedores (smn_grupo_promotores_vendedores_id) ON DELETE NO ACTION;
ALTER TABLE smn_comercial.smn_rel_grp_promotor_vendedor_rol ADD CONSTRAINT FK_smn_rel_grp_promotor_vendedor_rol_1 FOREIGN KEY (smn_rol_id) REFERENCES smn_comercial.smn_rol (smn_rol_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_linea_comercial_afijo ADD PRIMARY KEY (smn_rel_linea_comercial_afijo_id);
ALTER TABLE smn_comercial.smn_rel_linea_comercial_afijo ADD CONSTRAINT FK_smn_rel_linea_comercial_afijo_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_comercial.smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_linea_comercial_item ADD PRIMARY KEY (smn_rel_linea_comercial_item_id);
ALTER TABLE smn_comercial.smn_rel_linea_comercial_item ADD CONSTRAINT FK_smn_rel_linea_comercial_item_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_comercial.smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_linea_comercial_servicio ADD PRIMARY KEY (smn_rel_linea_comercial_servicio_id);
ALTER TABLE smn_comercial.smn_rel_linea_comercial_servicio ADD CONSTRAINT FK_smn_rel_linea_comercial_servicio_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_comercial.smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_oferta_cliente ADD PRIMARY KEY (smn_rel_oferta_cliente_id);

ALTER TABLE smn_comercial.smn_paciente ADD PRIMARY KEY (smn_paciente_id);

ALTER TABLE smn_comercial.smn_factura_impresion_detalle ADD PRIMARY KEY (smn_factura_impresion_detalle_id);

ALTER TABLE smn_comercial.smn_rel_pedido_fecha_entrega ADD PRIMARY KEY (smn_rel_pedido_fecha_entrega_id);

