select DISTINCT
	smn_comercial.smn_factura_impresion_detalle.smn_grupo_titulo_impresion_rf as titulo_id,
    smn_comercial.smn_factura_impresion_detalle.fim_codigo,
	smn_comercial.smn_factura_impresion_detalle.fim_descripcion,
	smn_comercial.smn_factura_impresion_detalle.fim_monto_ml,
	smn_comercial.smn_factura_impresion_detalle.fim_monto_ma,
	smn_comercial.smn_factura_impresion_detalle.fim_cantidad
from
    smn_comercial.smn_pedido_cabecera
	INNER JOIN
		smn_comercial.smn_factura_impresion_detalle on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_factura_impresion_detalle.smn_pedido_cabecera_id
	INNER JOIN
		smn_base.smn_grupo_titulo_impresion on smn_comercial.smn_factura_impresion_detalle.smn_grupo_titulo_impresion_rf = smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id
	left JOIN 
		smn_comercial.smn_pedido_detalle on smn_comercial.smn_factura_impresion_detalle.smn_pedido_detalle_id = smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id
	left JOIN 
		smn_comercial.smn_pedido_componentes on smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id = 	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id 
	LEFT JOIN 
        smn_comercial.smn_rel_pedido_factura on  smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
where
    smn_comercial.smn_factura_impresion_detalle.smn_pedido_cabecera_id= ${fld:id}
