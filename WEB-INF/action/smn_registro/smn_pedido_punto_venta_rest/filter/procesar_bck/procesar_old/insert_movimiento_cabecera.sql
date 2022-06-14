insert into smn_inventario.smn_movimiento_cabecera(
  smn_movimiento_cabecera_id,
  smn_entidad_rf,
  smn_sucursal_rf,
  smn_almacen_rf,
  smn_modulo_rf,
  smn_documento_origen_rf,
  mca_numero_documento_origen,
  smn_documento_id,
  mca_numero,
  mca_monto_documento_ml,
  mca_monto_documento_ma,
  mca_monto_diminucion_ml,
  mca_monto_diminucion_ma,
  mca_monto_valor_agregado_ml,
  mca_monto_valor_agregado_ma,
  mca_monto_neto_ml,
  mcc_monto_neto_ma,
  smn_moneda_rf,
  smn_tasa_rf,
  mca_fecha_recibida,
  mca_estatus_proceso,
  mca_estatus_financiero,
  mca_idioma,
  mca_usuario,
  mca_fecha_registro,
  mca_hora
)
select
nextval('smn_inventario.seq_smn_movimiento_cabecera'),
smn_comercial.smn_pedido_cabecera.smn_entidad_rf,
smn_comercial.smn_pedido_cabecera.smn_sucursal_rf,
smn_comercial.smn_pedido_cabecera.smn_almacen_rf,
smn_base.smn_modulos.smn_modulos_id,
smn_comercial.smn_pedido_cabecera.smn_documento_id,
smn_comercial.smn_pedido_cabecera.pca_numero_pedido,
smn_inventario.smn_documento.smn_documento_id,
(smn_inventario.smn_documento.doc_secuencia+1),
smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml,
smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma,
smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml,
smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma,
smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ml,
smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ma,
smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml,
smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma,
smn_comercial.smn_pedido_cabecera.smn_moneda_rf,
smn_comercial.smn_pedido_cabecera.smn_tasa_rf,
smn_comercial.smn_pedido_cabecera.pca_fecha_requerida,
'GE',
'PA',
'${def:locale}',
'${def:user}',
{d '${def:date}'},
'${def:time}'
from 
smn_comercial.smn_pedido_cabecera, smn_base.smn_modulos, smn_inventario.smn_documento
where
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}
and
smn_base.smn_modulos.smn_modulos_id=(
select
smn_base.smn_modulos.smn_modulos_id
from
smn_base.smn_modulos
where
smn_base.smn_modulos.mod_codigo='SMN_FAC')
and
smn_inventario.smn_documento.smn_documento_id=(select smn_inventario.smn_documento.smn_documento_id 
from smn_comercial.smn_pedido_cabecera
inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id=smn_comercial.smn_pedido_cabecera.smn_documento_id
inner join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id=smn_comercial.smn_documento.smn_documentos_generales_rf
inner join smn_inventario.smn_documento on smn_inventario.smn_documento.smn_documento_general_rf=smn_base.smn_documentos_generales.smn_documentos_generales_id
where
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id})
RETURNING smn_movimiento_cabecera_id as id_mov_cab;
