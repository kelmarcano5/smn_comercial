Delete smn_inventario.smn_rel_control_item_pedido 
WHERE smn_inventario.smn_rel_control_item_pedido.smn_control_item_id = ${fld:smn_control_item_id} 
and
pca_numero_pedido=${fld:mca_numero_documento_origen} 