select 
	smn_comercial.smn_factura_impresion_detalle.smn_grupo_titulo_impresion_rf as titulo_id,
    smn_comercial.smn_factura_impresion_detalle.fim_codigo,
	smn_comercial.smn_factura_impresion_detalle.fim_descripcion,
	smn_comercial.smn_factura_impresion_detalle.fim_monto_ml,
	smn_comercial.smn_factura_impresion_detalle.fim_monto_ma,
	smn_comercial.smn_factura_impresion_detalle.fim_cantidad
from
		smn_comercial.smn_factura_impresion_detalle
where
    smn_comercial.smn_factura_impresion_detalle.smn_pedido_cabecera_id= ${fld:id}
