delete from smn_comercial.smn_pedido_cabecera where smn_pedido_cabecera_id = ${fld:id};
delete from smn_comercial.smn_pedido_detalle where smn_pedido_cabecera_id = ${fld:id};
delete from smn_comercial.smn_pago_punto_venta where smn_pedido_cabecera_id = ${fld:id};