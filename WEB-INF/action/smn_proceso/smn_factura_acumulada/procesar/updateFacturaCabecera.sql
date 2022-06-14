UPDATE smn_comercial.smn_factura_cabecera 
set
fca_monto_factura_ml=(select SUM(smn_comercial.smn_factura_impresion_detalle.fim_monto_ml) from smn_comercial.smn_factura_impresion_detalle where smn_comercial.smn_factura_impresion_detalle.smn_factura_cabecera_id=${fld:smn_factura_cabecera_id}),
fca_monto_factura_ma=(select SUM(smn_comercial.smn_factura_impresion_detalle.fim_monto_ma) from smn_comercial.smn_factura_impresion_detalle where smn_comercial.smn_factura_impresion_detalle.smn_factura_cabecera_id=${fld:smn_factura_cabecera_id}),
fca_monto_neto_ml=(select SUM(smn_comercial.smn_factura_impresion_detalle.fim_monto_ml) from smn_comercial.smn_factura_impresion_detalle where smn_comercial.smn_factura_impresion_detalle.smn_factura_cabecera_id=${fld:smn_factura_cabecera_id}),
fca_monto_neto_ma=(select SUM(smn_comercial.smn_factura_impresion_detalle.fim_monto_ma) from smn_comercial.smn_factura_impresion_detalle where smn_comercial.smn_factura_impresion_detalle.smn_factura_cabecera_id=${fld:smn_factura_cabecera_id})
where smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id=${fld:smn_factura_cabecera_id}