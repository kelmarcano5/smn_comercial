UPDATE smn_comercial.smn_pedido_cabecera SET
   pca_estatus='RE'
   pca_estatus_pago='PE'
WHERE
   smn_pedido_cabecera_id=${fld:id} AND smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera is null 