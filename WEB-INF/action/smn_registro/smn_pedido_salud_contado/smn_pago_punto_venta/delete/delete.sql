update smn_comercial.smn_pedido_cabecera set pca_estatus_pago='PE' WHERE smn_pedido_cabecera_id=(select smn_pedido_cabecera_id from smn_comercial.smn_pago_punto_venta where smn_pago_punto_venta_id=${fld:id});

delete from smn_comercial.smn_pedido_pagadores where smn_pago_punto_venta_id = ${fld:id};

delete from smn_comercial.smn_pago_punto_venta where smn_pago_punto_venta_id = ${fld:id};


