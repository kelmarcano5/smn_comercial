insert into smn_inventario.smn_despacho(
  smn_despacho_id,
  smn_modulo_rf,
  smn_documento_origen_id,
  des_numero_documento_origen,
  smn_usuario_solicitante_rf,
  smn_documento_id,
  des_numero_documento,
  des_descripcion,
  smn_entidad_rf,
  smn_sucursal_rf,
  smn_almacen_rf,
  smn_clase_auxiliar_rf,
  smn_auxiliar_rf,
  smn_unidad_organizativa_rf,
  smn_centro_costo_rf,
  smn_direccion_rf,
  smn_zona_rf,
  des_fecha_solicitud,
  des_fecha_despacho,
  des_estatus, -- GE=Generada|TR=Transporte|AP=Aprobada|RE=Rechazada|EN=Entregada|PE=Parcialmente Entregada|CE=Cerrada
  des_monto_pedido_ml,
  des_monto_impuesto_ml,
  des_monto_descuento_ml,
  des_monto_bonificacion_ml,
  des_monto_neto_ml,
  smn_moneda_rf,
  smn_tasa_rf,
  des_monto_pedido_ma,
  des_monto_impuesto_ma,
  des_monto_descuento_ma,
  des_monto_bonificacion_ma,
  des_monto_neto_ma,
  des_idioma,
  des_usuario,
  des_fecha_registro,
  des_hora
)
select
nextval('smn_inventario.seq_smn_despacho'),
smn_base.smn_modulos.smn_modulos_id,
smn_comercial.smn_pedido_cabecera.smn_documento_id,
smn_comercial.smn_pedido_cabecera.pca_numero_pedido,
(select smn_usuarios_id from smn_base.smn_usuarios
  inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id=smn_base.smn_usuarios.smn_user_rf
  where userlogin=smn_comercial.smn_pedido_cabecera.pca_usuario),
smn_inventario.smn_documento.smn_documento_id,
(smn_inventario.smn_documento.doc_secuencia+1),
smn_comercial.smn_pedido_cabecera.pca_descripcion,
smn_comercial.smn_pedido_cabecera.smn_entidad_rf,
smn_comercial.smn_pedido_cabecera.smn_sucursal_rf,
smn_comercial.smn_pedido_cabecera.smn_almacen_rf,
smn_comercial.smn_cliente.smn_clase_auxiliar_rf,
smn_comercial.smn_cliente.smn_auxiliar_rf,
0, -- Unidad organiativa
smn_comercial.smn_pedido_cabecera.smn_centro_costo_rf,
smn_base.smn_auxiliar.aux_direccion_rf,
(select smn_base.smn_rel_auxiliar_direccion.smn_zona_rf from smn_base.smn_auxiliar
inner join smn_base.smn_rel_auxiliar_direccion on smn_base.smn_rel_auxiliar_direccion.smn_direccion_id = smn_base.smn_auxiliar.aux_direccion_rf 
inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_cliente_id = smn_comercial.smn_cliente.smn_cliente_id
where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id} limit 1),
{d '${def:date}'},
smn_comercial.smn_pedido_cabecera.pca_fecha_requerida,
'GE',
smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml,
smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ml,
smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml,
smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ml,
smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml,
smn_comercial.smn_pedido_cabecera.smn_moneda_rf,
smn_comercial.smn_pedido_cabecera.smn_tasa_rf,
smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma,
smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ma,
smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma,
smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ma,
smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma,
'${def:locale}',
'${def:user}',
{d '${def:date}'},
'${def:time}'
from 
smn_comercial.smn_pedido_cabecera, smn_base.smn_modulos, smn_inventario.smn_documento, 
smn_comercial.smn_cliente, smn_base.smn_auxiliar
where
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}
and
smn_base.smn_modulos.smn_modulos_id=(
select
smn_base.smn_modulos.smn_modulos_id
from
smn_base.smn_modulos
where
smn_base.smn_modulos.mod_codigo='SMN_CME')
and
smn_comercial.smn_cliente.smn_cliente_id=smn_comercial.smn_pedido_cabecera.smn_cliente_id
and
smn_base.smn_auxiliar.smn_auxiliar_id=smn_comercial.smn_cliente.smn_auxiliar_rf
and
smn_inventario.smn_documento.smn_documento_id=(select smn_inventario.smn_documento.smn_documento_id 
from smn_comercial.smn_pedido_cabecera
inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id=smn_comercial.smn_pedido_cabecera.smn_documento_id
inner join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id=smn_comercial.smn_documento.smn_documentos_generales_rf
inner join smn_inventario.smn_documento on smn_inventario.smn_documento.smn_documento_general_rf=smn_base.smn_documentos_generales.smn_documentos_generales_id
where
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id})

RETURNING smn_despacho_id as id_despacho

/*update smn_inventario.smn_documento
set doc_secuencia=doc_secuencia+1
from smn_comercial.smn_pedido_cabecera, smn_comercial.smn_documento, smn_base.smn_documentos_generales
where
smn_inventario.smn_documento.smn_documento_general_rf=smn_base.smn_documentos_generales.smn_documentos_generales_id
and 
smn_base.smn_documentos_generales.smn_documentos_generales_id=smn_comercial.smn_documento.smn_documentos_generales_rf
and
smn_comercial.smn_documento.smn_documento_id=smn_comercial.smn_pedido_cabecera.smn_documento_id
and
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}*/