CREATE TABLE smn_tipo_documentos_fact(
  smn_tipo_documentos_fact_id INTEGER NOT NULL,
  tdf_codigo VARCHAR(16) NOT NULL,
  tdf_nombre VARCHAR(48) NOT NULL,
  tdf_naturaleza CHARACTER(2) NOT NULL,
  tdf_vigencia DATE NOT NULL,
  tdf_estatus CHARACTER(2) NOT NULL,
  tdf_ult_secuencia INTEGER,
  tdf_idioma CHARACTER(2) NOT NULL,
  tdf_usuario VARCHAR(10) NOT NULL,
  tdf_fecha_registro DATE NOT NULL,
  tdf_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_tipo_documentos_fact;


CREATE TABLE smn_documento(
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
  dcf_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_documento;


CREATE TABLE smn_rel_doc_entidad(
  smn_rel_doc_entidad_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  smn_entidades_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_rel_doc_entidad;


CREATE TABLE smn_centro_facturacion(
  smn_centro_facturacion_id INTEGER NOT NULL,
  cfc_codigo VARCHAR(16) NOT NULL,
  cfc_nombre VARCHAR(48) NOT NULL,
  smn_entidades_rf INTEGER NOT NULL,
  smn_sucursales_rf INTEGER NOT NULL,
  smn_areas_servicios_rf INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  cfc_numero_identificacion VARCHAR(16),
  cfc_control_fiscal_1 INTEGER NOT NULL,
  cfc_control_fiscal_2 INTEGER,
  cfc_vigencia DATE NOT NULL,
  cfc_estatus CHARACTER(2) NOT NULL,
  cfc_idioma CHARACTER(2) NOT NULL,
  cfc_usuario VARCHAR(10) NOT NULL,
  cfc_fecha_registro DATE NOT NULL,
  cfc_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_centro_facturacion;


CREATE TABLE smn_rol(
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

CREATE SEQUENCE smn_base.seq_smn_rol;


CREATE TABLE smn_rel_centro_facturacion_usuario(
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

CREATE SEQUENCE smn_base.seq_smn_rel_centro_facturacion_usuario;


CREATE TABLE smn_tipo_linea_comercial(
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

CREATE SEQUENCE smn_base.seq_smn_tipo_linea_comercial;


CREATE TABLE smn_area_interes(
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

CREATE SEQUENCE smn_base.seq_smn_area_interes;


CREATE TABLE smn_clasificacion_cliente(
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

CREATE SEQUENCE smn_base.seq_smn_clasificacion_cliente;


CREATE TABLE smn_cliente(
  smn_cliente_id INTEGER NOT NULL,
  smn_clasificacion_cliente_id INTEGER NOT NULL,
  smn_clase_auxiliar_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_condicion_financiera_rf SERIAL,
  smn_clasificacion_abc_rf INTEGER NOT NULL,
  smn_sector_economico_rf INTEGER NOT NULL,
  cli_nacional_ext CHARACTER(1) NOT NULL,
  cli_vigencia DATE NOT NULL,
  cli_estatus CHARACTER(2) NOT NULL,
  cli_idioma CHARACTER(2) NOT NULL,
  cli_usuario VARCHAR(10) NOT NULL,
  cli_fecha_registro DATE NOT NULL,
  cli_hora CHARACTER(8) NOT NULL
);

CREATE TABLE smn_linea_comercial(
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

CREATE SEQUENCE smn_base.seq_smn_linea_comercial;


CREATE TABLE smn_rel_cliente_forma_pago(
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

CREATE SEQUENCE smn_base.seq_smn_rel_cliente_forma_pago;


CREATE TABLE smn_rel_cliente_area_interes(
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

CREATE SEQUENCE smn_base.seq_smn_rel_cliente_area_interes;


CREATE TABLE smn_rel_cliente_entidad_financiera(
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

CREATE SEQUENCE smn_base.seq_smn_rel_cliente_entidad_financiera;


CREATE TABLE smn_rel_linea_comercial_servicio(
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

CREATE SEQUENCE smn_base.seq_smn_rel_linea_comercial_servicio;


CREATE TABLE smn_rel_linea_comercial_Item(
  smn_rel_linea_comercial_Item_id INTEGER NOT NULL,
  smn_linea_comercial_id INTEGER NOT NULL,
  smn_item_rf INTEGER NOT NULL,
  rli_estatus CHARACTER(2) NOT NULL,
  rli_vigencia DATE NOT NULL,
  rli_idioma CHARACTER(2) NOT NULL,
  rli_usuario VARCHAR(10) NOT NULL,
  rli_fecha_registro DATE NOT NULL,
  rli_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_rel_linea_comercial_item;


CREATE TABLE smn_rel_linea_comercial_afijo(
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

CREATE SEQUENCE smn_base.seq_smn_rel_linea_comercial_afijo;


CREATE TABLE smn_rel_usuario_linea_comercial(
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

CREATE SEQUENCE smn_base.seq_smn_rel_usuario_linea_comercial;


CREATE TABLE smn_pedido_cabecera(
  smn_pedido_cabecera_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  pca_numero_pedido INTEGER NOT NULL,
  smn_mov_caja_cabecera_id INTEGER,
  smn_oferta_id INTEGER,
  smn_cliente_id INTEGER NOT NULL,
  smn_usuario_rf INTEGER NOT NULL,
  pca_descripcion VARCHAR(200) NOT NULL,
  pca_fecha_requerida DATE,
  smn_entidad_rf INTEGER,
  smn_sucursal_rf INTEGER,
  smn_area_servicio_rf INTEGER,
  smn_unidad_servicio_rf INTEGER,
  smn_almacen_rf INTEGER,
  smn_centro_costo_rf INTEGER,
  pca_estatus CHARACTER(2) NOT NULL,
  pca_fecha_vencimiento DATE NOT NULL,
  pca_idioma CHARACTER(2) NOT NULL,
  pca_usuario VARCHAR(10) NOT NULL,
  pca_fecha_registro DATE NOT NULL,
  pca_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_pedido_cabecera;


CREATE TABLE smn_oferta_cabecera(
  smn_oferta_cabecera_id INTEGER NOT NULL,
  smn_documento_id INTEGER,
  ofe_numero_documento INTEGER NOT NULL,
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

CREATE SEQUENCE smn_base.seq_smn_oferta_cabecera;


CREATE TABLE smn_oferta_detalle(
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

CREATE SEQUENCE smn_base.seq_smn_oferta_detalle;


CREATE TABLE smn_pedido_detalle(
  smn_pedido_detalle_id INTEGER NOT NULL,
  smn_pedido_cabecera_id INTEGER NOT NULL,
  smn_mov_caja_cabecera_id INTEGER,
  pde_naturaleza CHARACTER(2) NOT NULL,
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
  pde_fecha_requerido DATE NOT NULL,
  pde_observaciones VARCHAR(200),
  pde_estatus CHARACTER(2),
  pde_idioma CHARACTER(2) NOT NULL,
  pde_usuario VARCHAR(10) NOT NULL,
  pde_fecha_registro DATE NOT NULL,
  pde_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_pedido_detalle;


CREATE TABLE smn_factura_cabecera(
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

CREATE SEQUENCE smn_base.seq_smn_factura_cabecera;


CREATE TABLE smn_factura_detalle(
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
  fde_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_factura_detalle;


CREATE TABLE smn_pedido_pagadores(
  smn_pedido_pagadores_id INTEGER NOT NULL,
  smn_pedido_cabecera_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  ppa_monto DOUBLE PRECISION NOT NULL,
  ppa_idioma CHARACTER(2) NOT NULL,
  ppa_usuario VARCHAR(10) NOT NULL,
  ppa_fecha_registro DATE NOT NULL,
  ppa_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_pedido_pagadores;


CREATE TABLE smn_factura_prestadores(
  smn_factura_prestadores_id INTEGER NOT NULL,
  smn_factura_detalle_id INTEGER NOT NULL,
  smn_prestador_rf INTEGER,
  fpr_monto INTEGER,
  fpr_estatus INTEGER,
  fpr_idioma CHARACTER(2) NOT NULL,
  fpr_usuario VARCHAR(10) NOT NULL,
  fpr_fecha_registro DATE NOT NULL,
  fpr_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_factura_prestadores;


CREATE TABLE smn_factura_componentes(
  smn_factura_componente_id INTEGER NOT NULL,
  smn_factura_detalle_id INTEGER NOT NULL,
  smn_grupo_componente_rf INTEGER NOT NULL,
  smn_componente_rf INTEGER NOT NULL,
  smn_clase_auxiliar_rf INTEGER NOT NULL,
  smn_auxiliar_rf INTEGER NOT NULL,
  smn_item_rf INTEGER,
  smn_servicio_rf INTEGER,
  fco_cantidad INTEGER NOT NULL,
  smn_precio_ml_rf DOUBLE PRECISION NOT NULL,
  fco_monto_ml DOUBLE PRECISION NOT NULL,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  smn_precio_ma DOUBLE PRECISION,
  smn_monto_ma DOUBLE PRECISION,
  fco_estatus CHARACTER(2),
  fco_idioma CHARACTER(2) NOT NULL,
  fco_usuario VARCHAR(10) NOT NULL,
  fco_fecha_registro DATE NOT NULL,
  fco_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_factura_componentes;


CREATE TABLE smn_factura_kits(
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

CREATE SEQUENCE smn_base.seq_smn_factura_kits;


CREATE TABLE smn_factura_pagadores(
  smn_factura_pagadores_id INTEGER NOT NULL,
  smn_factura_cabecera_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  smn_monto_rf DOUBLE PRECISION NOT NULL,
  fpa_idioma CHARACTER(2) NOT NULL,
  fpa_usuario VARCHAR(10) NOT NULL,
  fpa_fecha_registro DATE NOT NULL,
  fpa_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_factura_pagadores;


CREATE TABLE smn_factura_bonificacion(
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

CREATE SEQUENCE smn_base.seq_smn_factura_bonificacion;


CREATE TABLE smn_pedido_imp_deducc_detalle(
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

CREATE SEQUENCE smn_base.seq_smn_pedido_imp_deducc_detalle;


CREATE TABLE smn_rel_pedidos_documentos_soporte(
  smn_rel_pedidos_documentos_soporte_id INTEGER NOT NULL,
  smn_pedido_cabecera_id INTEGER NOT NULL,
  smn_documentos_soportes_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_rel_pedidos_documentos_soporte;


CREATE TABLE smn_rel_oferta_cliente(
  smn_rel_oferta_cliente_id INTEGER NOT NULL,
  smn_oferta_id INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_rel_oferta_cliente;


CREATE TABLE smn_rel_pedido_fecha_entrega(
  smn_rel_pedido_fecha_entrega_id INTEGER NOT NULL,
  smn_pedido_detalle_id INTEGER NOT NULL,
  pfe_fecha_entrega DATE NOT NULL,
  pfe_cantidad INTEGER NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_rel_pedido_fecha_entrega;


CREATE TABLE smn_factura_deducc_detalle(
  smn_factura_deducc_detalle_id INTEGER NOT NULL,
  smn_factura_detalle_id INTEGER NOT NULL,
  smn_codigos_impuestos_rf INTEGER,
  fid_porcentaje_impuesto INTEGER,
  fid_monto_impuesto DOUBLE PRECISION,
  smn_moneda_rf INTEGER,
  smn_tasa_rf INTEGER,
  fid_monto_imp_moneda_alterna DOUBLE PRECISION,
  smn_descuentos_retenciones_rf INTEGER,
  fip_porcentaje_descuento_retencion DOUBLE PRECISION,
  fid_monto_descuento_retencion DOUBLE PRECISION,
  fid_monto_desc_moneda_altera DOUBLE PRECISION,
  fid_idioma CHARACTER(2) NOT NULL,
  fid_usuario VARCHAR(10) NOT NULL,
  fid_fecha_registro DATE NOT NULL,
  fid_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_factura_deducc_detalle;


CREATE TABLE smn_afiliados(
  smn_afiliados_id INTEGER NOT NULL,
  afi_auxiliar_rf INTEGER NOT NULL,
  afi_fecha_inicio DATE NOT NULL,
  afi_fecha_final DATE NOT NULL,
  afi_fecha_desafiliación DATE,
  smn_rol_id INTEGER,
  smn_servicio_id INTEGER NOT NULL,
  afi_estatus CHARACTER(2) NOT NULL,
  afi_idioma CHARACTER(2) NOT NULL,
  afi_usuario VARCHAR(10) NOT NULL,
  afi_fecha_registro DATE NOT NULL,
  afi_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_afiliados;


CREATE TABLE smn_relacionado(
  smn_relacionado_id INTEGER NOT NULL,
  smn_afiliados_id INTEGER NOT NULL,
  rel_auxiliar_rf INTEGER NOT NULL,
  rel_fecha_inicio DATE NOT NULL,
  rel_fecha_final DATE NOT NULL,
  rel_fecha_desafiliado DATE,
  rel_estatus CHARACTER(2) NOT NULL,
  rel_idioma CHARACTER(2) NOT NULL,
  rel_usuario VARCHAR(10) NOT NULL,
  rel_fecha_registro DATE NOT NULL,
  rel_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_relacionado;


CREATE TABLE smn_control_renovacion(
  smn_control_renovacion_id INTEGER NOT NULL,
  smn_afiliado_id INTEGER NOT NULL,
  smn_pedido_id INTEGER NOT NULL,
  crn_fecha_renovacion DATE NOT NULL,
  crn_fecha_vigencia_hasta DATE NOT NULL,
  crn_estatus CHARACTER(2) NOT NULL,
  crn_idioma CHARACTER(2) NOT NULL,
  crn_usuario VARCHAR(10) NOT NULL,
  crn_fecha_registro DATE NOT NULL,
  crn_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_control_renovacion;


CREATE TABLE smn_control_cupo_afiliado(
  smn_control_cupo_afiliado_id INTEGER NOT NULL,
  smn_evento_id INTEGER NOT NULL,
  cca_cupo INTEGER NOT NULL,
  cca_reservas INTEGER NOT NULL,
  cca_saldo INTEGER NOT NULL,
  cca_estatus CHARACTER(2) NOT NULL,
  cca_idioma CHARACTER(2) NOT NULL,
  cca_usuario VARCHAR(10) NOT NULL,
  cca_fecha_registro DATE NOT NULL,
  cca_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_control_cupo_afiliado;


CREATE TABLE smn_evento(
  smn_evento_id INTEGER NOT NULL,
  eve_codigo CHARACTER(6) NOT NULL,
  eve_descripcion_corta VARCHAR(32) NOT NULL,
  eve_descripcion_larga VARCHAR(64) NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  eve_fecha_inicial DATE NOT NULL,
  eve_fecha_final DATE NOT NULL,
  eve_hora_inicial CHARACTER(8) NOT NULL,
  eve_hora_final CHARACTER(8) NOT NULL,
  smn_prestador_servicio_rf INTEGER NOT NULL,
  smn_clasificacion_abc_rf INTEGER NOT NULL,
  eve_cupo INTEGER NOT NULL,
  eve_reservas_por_afiliado INTEGER NOT NULL,
  eve_estatus CHARACTER(10) NOT NULL,
  eve_idioma CHARACTER(2) NOT NULL,
  eve_usuario VARCHAR(10) NOT NULL,
  eve_fecha_registro DATE NOT NULL,
  eve_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_evento;


CREATE TABLE smn_reservas(
  smn_reservas_id INTEGER NOT NULL,
  smn_evento_id INTEGER NOT NULL,
  smn_afiliado_id INTEGER NOT NULL,
  smn_relacionado_id INTEGER NOT NULL,
  res_cantidad INTEGER NOT NULL,
  res_estatus CHARACTER(2) NOT NULL,
  res_idioma CHARACTER(2) NOT NULL,
  res_usuario VARCHAR(10) NOT NULL,
  res_fecha_registro DATE NOT NULL,
  res_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_reservas;


CREATE TABLE smn_control_cupo(
  smn_control_cupo_id INTEGER NOT NULL,
  smn_evento_id INTEGER NOT NULL,
  ccu_cupo INTEGER NOT NULL,
  ccu_reservas INTEGER NOT NULL,
  ccu_saldo INTEGER NOT NULL,
  ccu_estatus CHARACTER(2) NOT NULL,
  ccu_idioma CHARACTER(2) NOT NULL,
  ccu_usuario VARCHAR(10) NOT NULL,
  ccu_fecha_registro DATE NOT NULL,
  ccu_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_control_cupo;


CREATE TABLE smn_orden_servicio(
  smn_orden_servicio_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  ors_numero INTEGER NOT NULL,
  smn_cliente_id INTEGER NOT NULL,
  ors_descripcion VARCHAR(100) NOT NULL,
  ors_fecha_inicial DATE,
  ors_fecha_final DATE,
  ors_hora_inicial CHARACTER(8),
  ors_hora_final CHARACTER(8),
  smn_prestador_servicio_rf INTEGER,
  ors_observacion VARCHAR(200),
  ors_estatus CHARACTER(2) NOT NULL,
  ors_idioma CHARACTER(2) NOT NULL,
  ors_usuario VARCHAR(10) NOT NULL,
  ors_fecha_registro DATE NOT NULL,
  ors_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_orden_servicio;


CREATE TABLE smn_orden_servicio_detalle(
  smn_orden_servicio_detalle_id INTEGER NOT NULL,
  smn_orden_servicio_id INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL,
  smn_item_rf INTEGER,
  smn_componentes_rf INTEGER,
  osd_cantidad DOUBLE PRECISION,
  smn_tipo_componente CHARACTER(2),
  smn_grupo_prestador_rf INTEGER,
  smn_prestador_servicio_rf INTEGER,
  smn_nivel_estructura_rf INTEGER,
  osd_estatus CHARACTER(2) NOT NULL,
  osd_idioma CHARACTER(2) NOT NULL,
  osd_usuario VARCHAR(10) NOT NULL,
  osd_fecha_registro DATE NOT NULL,
  osd_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_orden_servicio_detalle;


CREATE TABLE smn_rel_orden_servicio(
  smn_rel_orden_servicio_id INTEGER NOT NULL,
  smn_orden_servicio_id INTEGER NOT NULL,
  smn_servicios_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_rel_orden_servicio;


CREATE TABLE smn_rel_orden_pedido(
  smn_rel_orden_pedido_id INTEGER NOT NULL,
  smn_orden_servicio_id INTEGER NOT NULL,
  smn_pedido_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_rel_orden_pedido;


CREATE TABLE smn_rel_reserva_relacionado(
  smn_rel_reserva_relacionado_id INTEGER NOT NULL,
  smn_reservas_id INTEGER NOT NULL,
  smn_relacionado_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_rel_reserva_relacionado;


CREATE TABLE smn_rel_auxiliar_direccion(
  smn_rel_auxiliar_direccion_id INTEGER NOT NULL,
  smn_clase_auxiliar_id INTEGER NOT NULL,
  smn_auxiliar_id INTEGER NOT NULL,
  smn_direccion_id INTEGER NOT NULL,
  rad_tipo_direccion CHARACTER(1) NOT NULL,
  rad_status CHARACTER(1) NOT NULL,
  rad_fecha_vigencia DATE NOT NULL,
  rad_idioma CHARACTER(2) NOT NULL,
  rad_usuario VARCHAR(10) NOT NULL,
  rad_fecha_registro DATE NOT NULL,
  rad_hora CHARACTER(8) NOT NULL,
  smn_zona_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_base.seq_smn_rel_auxiliar_direccion;



ALTER TABLE smn_tipo_documentos_fact ADD PRIMARY KEY (smn_tipo_documentos_fact_id);

ALTER TABLE smn_documento ADD PRIMARY KEY (smn_documento_id);
ALTER TABLE smn_documento ADD CONSTRAINT FK_smn_documento_0 FOREIGN KEY (smn_tipo_documentos_fact_id) REFERENCES smn_tipo_documentos_fact (smn_tipo_documentos_fact_id) ON DELETE NO ACTION;

ALTER TABLE smn_rel_doc_entidad ADD PRIMARY KEY (smn_rel_doc_entidad_id);
ALTER TABLE smn_rel_doc_entidad ADD CONSTRAINT FK_smn_rel_doc_entidad_0 FOREIGN KEY (smn_documento_id) REFERENCES smn_documento (smn_documento_id) ON DELETE NO ACTION;

ALTER TABLE smn_centro_facturacion ADD PRIMARY KEY (smn_centro_facturacion_id);

ALTER TABLE smn_rol ADD PRIMARY KEY (smn_rol_id);

ALTER TABLE smn_rel_centro_facturacion_usuario ADD PRIMARY KEY (smn_rel_centro_facturacion_usuario_id);
ALTER TABLE smn_rel_centro_facturacion_usuario ADD CONSTRAINT FK_smn_rel_centro_facturacion_usuario_0 FOREIGN KEY (smn_centro_facturacion_id) REFERENCES smn_centro_facturacion (smn_centro_facturacion_id) ON DELETE NO ACTION;

ALTER TABLE smn_tipo_linea_comercial ADD PRIMARY KEY (smn_tipo_linea_comercial_id);

ALTER TABLE smn_area_interes ADD PRIMARY KEY (smn_area_interes_id);

ALTER TABLE smn_clasificacion_cliente ADD PRIMARY KEY (smn_clasificacion_cliente_id);

ALTER TABLE smn_cliente ADD PRIMARY KEY (smn_cliente_id);
ALTER TABLE smn_cliente ADD CONSTRAINT FK_smn_cliente_0 FOREIGN KEY (smn_clasificacion_cliente_id) REFERENCES smn_clasificacion_cliente (smn_clasificacion_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_linea_comercial ADD PRIMARY KEY (smn_linea_comercial_id);
ALTER TABLE smn_linea_comercial ADD CONSTRAINT FK_smn_linea_comercial_0 FOREIGN KEY (smn_tipo_linea_comercial_id) REFERENCES smn_tipo_linea_comercial (smn_tipo_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_rel_cliente_forma_pago ADD PRIMARY KEY (smn_rel_cliente_forma_pago_id);
ALTER TABLE smn_rel_cliente_forma_pago ADD CONSTRAINT FK_smn_rel_cliente_forma_pago_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_cliente (smn_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_rel_cliente_area_interes ADD PRIMARY KEY (smn_rel_cliente_area_interes_id);
ALTER TABLE smn_rel_cliente_area_interes ADD CONSTRAINT FK_smn_rel_cliente_area_interes_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_cliente (smn_cliente_id) ON DELETE NO ACTION;
ALTER TABLE smn_rel_cliente_area_interes ADD CONSTRAINT FK_smn_rel_cliente_area_interes_1 FOREIGN KEY (smn_area_interes_id) REFERENCES smn_area_interes (smn_area_interes_id) ON DELETE NO ACTION;

ALTER TABLE smn_rel_cliente_entidad_financiera ADD PRIMARY KEY (smn_rel_cliente_entidad_financiera_id);
ALTER TABLE smn_rel_cliente_entidad_financiera ADD CONSTRAINT FK_smn_rel_cliente_entidad_financiera_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_cliente (smn_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_rel_linea_comercial_servicio ADD PRIMARY KEY (smn_rel_linea_comercial_servicio_id);
ALTER TABLE smn_rel_linea_comercial_servicio ADD CONSTRAINT FK_smn_rel_linea_comercial_servicio_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_rel_linea_comercial_Item ADD PRIMARY KEY (smn_rel_linea_comercial_Item_id);
ALTER TABLE smn_rel_linea_comercial_Item ADD CONSTRAINT FK_smn_rel_linea_comercial_Item_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_rel_linea_comercial_afijo ADD PRIMARY KEY (smn_rel_linea_comercial_afijo_id);
ALTER TABLE smn_rel_linea_comercial_afijo ADD CONSTRAINT FK_smn_rel_linea_comercial_afijo_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_rel_usuario_linea_comercial ADD PRIMARY KEY (smn_rel_usuario_linea_comercial_id);
ALTER TABLE smn_rel_usuario_linea_comercial ADD CONSTRAINT FK_smn_rel_usuario_linea_comercial_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_pedido_cabecera ADD PRIMARY KEY (smn_pedido_cabecera_id);

ALTER TABLE smn_oferta_cabecera ADD PRIMARY KEY (smn_oferta_cabecera_id);

ALTER TABLE smn_oferta_detalle ADD PRIMARY KEY (smn_oferta_detalle_id);

ALTER TABLE smn_pedido_detalle ADD PRIMARY KEY (smn_pedido_detalle_id);

ALTER TABLE smn_factura_cabecera ADD PRIMARY KEY (smn_factura_cabecera_id);

ALTER TABLE smn_factura_detalle ADD PRIMARY KEY (smn_factura_detalle_id);

ALTER TABLE smn_pedido_pagadores ADD PRIMARY KEY (smn_pedido_pagadores_id);
ALTER TABLE smn_pedido_pagadores ADD CONSTRAINT FK_smn_pedido_pagadores_0 FOREIGN KEY (smn_pedido_cabecera_id) REFERENCES smn_pedido_cabecera (smn_pedido_cabecera_id) ON DELETE NO ACTION;
ALTER TABLE smn_pedido_pagadores ADD CONSTRAINT FK_smn_pedido_pagadores_1 FOREIGN KEY (smn_cliente_id) REFERENCES smn_cliente (smn_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_factura_prestadores ADD PRIMARY KEY (smn_factura_prestadores_id);

ALTER TABLE smn_factura_componentes ADD PRIMARY KEY (smn_factura_componente_id);

ALTER TABLE smn_factura_kits ADD PRIMARY KEY (smn_factura_kits_id);

ALTER TABLE smn_factura_pagadores ADD PRIMARY KEY (smn_factura_pagadores_id);
ALTER TABLE smn_factura_pagadores ADD CONSTRAINT FK_smn_factura_pagadores_0 FOREIGN KEY (smn_factura_cabecera_id) REFERENCES smn_factura_cabecera (smn_factura_cabecera_id) ON DELETE NO ACTION;
ALTER TABLE smn_factura_pagadores ADD CONSTRAINT FK_smn_factura_pagadores_1 FOREIGN KEY (smn_cliente_id) REFERENCES smn_cliente (smn_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_factura_bonificacion ADD PRIMARY KEY (smn_factura_bonificacion_id);

ALTER TABLE smn_pedido_imp_deducc_detalle ADD PRIMARY KEY (smn_pedido_imp_deducc_detalle_id);
ALTER TABLE smn_pedido_imp_deducc_detalle ADD CONSTRAINT FK_smn_pedido_imp_deducc_detalle_0 FOREIGN KEY (smn_pedido_detalle_id) REFERENCES smn_pedido_detalle (smn_pedido_detalle_id) ON DELETE NO ACTION;

ALTER TABLE smn_rel_pedidos_documentos_soporte ADD PRIMARY KEY (smn_rel_pedidos_documentos_soporte_id);

ALTER TABLE smn_rel_oferta_cliente ADD PRIMARY KEY (smn_rel_oferta_cliente_id);
ALTER TABLE smn_rel_oferta_cliente ADD CONSTRAINT FK_smn_rel_oferta_cliente_0 FOREIGN KEY (smn_oferta_id) REFERENCES smn_oferta_cabecera (smn_oferta_cabecera_id) ON DELETE NO ACTION;

ALTER TABLE smn_rel_pedido_fecha_entrega ADD PRIMARY KEY (smn_rel_pedido_fecha_entrega_id);
ALTER TABLE smn_rel_pedido_fecha_entrega ADD CONSTRAINT FK_smn_rel_pedido_fecha_entrega_0 FOREIGN KEY (smn_pedido_detalle_id) REFERENCES smn_pedido_detalle (smn_pedido_detalle_id) ON DELETE NO ACTION;

ALTER TABLE smn_factura_deducc_detalle ADD PRIMARY KEY (smn_factura_deducc_detalle_id);

ALTER TABLE smn_afiliados ADD PRIMARY KEY (smn_afiliados_id);

ALTER TABLE smn_relacionado ADD PRIMARY KEY (smn_relacionado_id);

ALTER TABLE smn_control_renovacion ADD PRIMARY KEY (smn_control_renovacion_id);

ALTER TABLE smn_control_cupo_afiliado ADD PRIMARY KEY (smn_control_cupo_afiliado_id);

ALTER TABLE smn_evento ADD PRIMARY KEY (smn_evento_id);

ALTER TABLE smn_reservas ADD PRIMARY KEY (smn_reservas_id);

ALTER TABLE smn_control_cupo ADD PRIMARY KEY (smn_control_cupo_id);

ALTER TABLE smn_orden_servicio ADD PRIMARY KEY (smn_orden_servicio_id);

ALTER TABLE smn_orden_servicio_detalle ADD PRIMARY KEY (smn_orden_servicio_detalle_id);

ALTER TABLE smn_rel_orden_servicio ADD PRIMARY KEY (smn_rel_orden_servicio_id);

ALTER TABLE smn_rel_orden_pedido ADD PRIMARY KEY (smn_rel_orden_pedido_id);

ALTER TABLE smn_rel_reserva_relacionado ADD PRIMARY KEY (smn_rel_reserva_relacionado_id);

ALTER TABLE smn_rel_auxiliar_direccion ADD PRIMARY KEY (smn_rel_auxiliar_direccion_id);

