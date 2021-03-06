select smn_comercial.smn_documento.smn_tipo_pedido_id as tipo,
smn_comercial.smn_documento.dcf_gen_orden_despacho as gen_ord_desp,
smn_comercial.smn_documento.dcf_genera_factura_pv as gen_fac,
smn_comercial.smn_documento.dcf_moneda_alterna as req_monalt,
smn_comercial.smn_documento.dcf_req_fecha_vencimiento as req_fven,
smn_comercial.smn_documento.dcf_req_vendedor as req_vend,
smn_comercial.smn_documento.dcf_req_tiempo_entrega as req_tiem_entrega,
smn_comercial.smn_documento.dcf_tipo_movimiento as tipo_mov,
smn_comercial.smn_documento.dcf_usa_anexo  as usa_anexo,
smn_comercial.smn_documento.dcf_usa_bonificaciones  as usa_bonific,
smn_comercial.smn_documento.dcf_usa_descuentos as usa_descuento,
smn_comercial.smn_documento.dcf_entrega_por_orden as entrega_por_orden,
smn_comercial.smn_documento.tca_tipo_tasa as tipotasa
from smn_comercial.smn_documento
where 
smn_comercial.smn_documento.smn_documento_id=${fld:id}