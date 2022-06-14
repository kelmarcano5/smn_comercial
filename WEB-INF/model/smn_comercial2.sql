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
  dcf_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_documento;


CREATE TABLE smn_comercial.smn_rel_doc_entidad(
  smn_rel_doc_entidad_id INTEGER NOT NULL,
  smn_documento_id INTEGER NOT NULL,
  smn_entidades_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_doc_entidad;


CREATE TABLE smn_comercial.smn_centro_facturacion(
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

CREATE SEQUENCE smn_comercial.seq_smn_centro_facturacion;


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


CREATE TABLE smn_comercial.smn_rel_linea_comercial_Item(
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

CREATE SEQUENCE smn_comercial.seq_smn_rel_linea_comercial_item;


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


CREATE TABLE smn_comercial.smn_rel_unid_grup_prest_contado(
  smn_rel_unid_grup_prest_contado_id INTEGER NOT NULL,
  smn_unidades_servicios_rf INTEGER NOT NULL,
  smn_grupo_prestador_rf INTEGER NOT NULL,
  smn_prestador_servicio_rf INTEGER NOT NULL
);

CREATE SEQUENCE smn_comercial.seq_smn_rel_unid_grup_prest_contado;



ALTER TABLE smn_comercial.smn_tipo_documentos_fact ADD PRIMARY KEY (smn_tipo_documentos_fact_id);

ALTER TABLE smn_comercial.smn_documento ADD PRIMARY KEY (smn_documento_id);
ALTER TABLE smn_comercial.smn_documento ADD CONSTRAINT FK_smn_documento_0 FOREIGN KEY (smn_tipo_documentos_fact_id) REFERENCES smn_comercial.smn_tipo_documentos_fact (smn_tipo_documentos_fact_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_doc_entidad ADD PRIMARY KEY (smn_rel_doc_entidad_id);
ALTER TABLE smn_comercial.smn_rel_doc_entidad ADD CONSTRAINT FK_smn_rel_doc_entidad_0 FOREIGN KEY (smn_documento_id) REFERENCES smn_comercial.smn_documento (smn_documento_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_centro_facturacion ADD PRIMARY KEY (smn_centro_facturacion_id);

ALTER TABLE smn_comercial.smn_rol ADD PRIMARY KEY (smn_rol_id);

ALTER TABLE smn_comercial.smn_rel_centro_facturacion_usuario ADD PRIMARY KEY (smn_rel_centro_facturacion_usuario_id);
ALTER TABLE smn_comercial.smn_rel_centro_facturacion_usuario ADD CONSTRAINT FK_smn_rel_centro_facturacion_usuario_0 FOREIGN KEY (smn_centro_facturacion_id) REFERENCES smn_comercial.smn_centro_facturacion (smn_centro_facturacion_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_tipo_linea_comercial ADD PRIMARY KEY (smn_tipo_linea_comercial_id);

ALTER TABLE smn_comercial.smn_area_interes ADD PRIMARY KEY (smn_area_interes_id);

ALTER TABLE smn_comercial.smn_clasificacion_cliente ADD PRIMARY KEY (smn_clasificacion_cliente_id);

ALTER TABLE smn_comercial.smn_cliente ADD PRIMARY KEY (smn_cliente_id);
ALTER TABLE smn_comercial.smn_cliente ADD CONSTRAINT FK_smn_cliente_0 FOREIGN KEY (smn_clasificacion_cliente_id) REFERENCES smn_comercial.smn_clasificacion_cliente (smn_clasificacion_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_linea_comercial ADD PRIMARY KEY (smn_linea_comercial_id);
ALTER TABLE smn_comercial.smn_linea_comercial ADD CONSTRAINT FK_smn_linea_comercial_0 FOREIGN KEY (smn_tipo_linea_comercial_id) REFERENCES smn_comercial.smn_tipo_linea_comercial (smn_tipo_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_cliente_forma_pago ADD PRIMARY KEY (smn_rel_cliente_forma_pago_id);
ALTER TABLE smn_comercial.smn_rel_cliente_forma_pago ADD CONSTRAINT FK_smn_rel_cliente_forma_pago_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_comercial.smn_cliente (smn_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_cliente_area_interes ADD PRIMARY KEY (smn_rel_cliente_area_interes_id);
ALTER TABLE smn_comercial.smn_rel_cliente_area_interes ADD CONSTRAINT FK_smn_rel_cliente_area_interes_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_comercial.smn_cliente (smn_cliente_id) ON DELETE NO ACTION;
ALTER TABLE smn_comercial.smn_rel_cliente_area_interes ADD CONSTRAINT FK_smn_rel_cliente_area_interes_1 FOREIGN KEY (smn_area_interes_id) REFERENCES smn_comercial.smn_area_interes (smn_area_interes_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_cliente_entidad_financiera ADD PRIMARY KEY (smn_rel_cliente_entidad_financiera_id);
ALTER TABLE smn_comercial.smn_rel_cliente_entidad_financiera ADD CONSTRAINT FK_smn_rel_cliente_entidad_financiera_0 FOREIGN KEY (smn_cliente_id) REFERENCES smn_comercial.smn_cliente (smn_cliente_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_linea_comercial_servicio ADD PRIMARY KEY (smn_rel_linea_comercial_servicio_id);
ALTER TABLE smn_comercial.smn_rel_linea_comercial_servicio ADD CONSTRAINT FK_smn_rel_linea_comercial_servicio_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_comercial.smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_linea_comercial_Item ADD PRIMARY KEY (smn_rel_linea_comercial_Item_id);
ALTER TABLE smn_comercial.smn_rel_linea_comercial_Item ADD CONSTRAINT FK_smn_rel_linea_comercial_Item_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_comercial.smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_linea_comercial_afijo ADD PRIMARY KEY (smn_rel_linea_comercial_afijo_id);
ALTER TABLE smn_comercial.smn_rel_linea_comercial_afijo ADD CONSTRAINT FK_smn_rel_linea_comercial_afijo_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_comercial.smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_usuario_linea_comercial ADD PRIMARY KEY (smn_rel_usuario_linea_comercial_id);
ALTER TABLE smn_comercial.smn_rel_usuario_linea_comercial ADD CONSTRAINT FK_smn_rel_usuario_linea_comercial_0 FOREIGN KEY (smn_linea_comercial_id) REFERENCES smn_comercial.smn_linea_comercial (smn_linea_comercial_id) ON DELETE NO ACTION;

ALTER TABLE smn_comercial.smn_rel_unid_grup_prest_contado ADD PRIMARY KEY (smn_rel_unid_grup_prest_contado_id);

