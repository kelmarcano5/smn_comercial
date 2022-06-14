delete from smn_comercial.smn_factura_impresion_detalle where smn_pedido_cabecera_id=${fld:id};

delete from smn_comercial.smn_factura_cabecera where smn_factura_cabecera_id = (select smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id from smn_comercial.smn_rel_pedido_factura where smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id=${fld:id});

delete from smn_comercial.smn_rel_pedido_factura where smn_pedido_cabecera_id=${fld:id};

delete from smn_comercial.smn_pedido_pagadores where smn_pedido_cabecera_id=${fld:id};

delete from smn_comercial.smn_pedido_componentes where smn_pedido_cabecera_id=${fld:id};

delete from smn_comercial.smn_pedido_detalle where smn_pedido_cabecera_id=${fld:id};

delete from smn_comercial.smn_pedido_cabecera where smn_pedido_cabecera_id = ${fld:id};

UPDATE smn_caja.smn_mov_caja_cabecera SET
	smn_estatus_cobro='PE',
	mcc_estatus_registro='RE'
WHERE
	smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id=${fld:caja_id}; --AND smn_estatus_cobro='CR'
