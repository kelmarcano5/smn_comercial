update smn_comercial.smn_pedido_cabecera
set pca_estatus='GE'
where
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}