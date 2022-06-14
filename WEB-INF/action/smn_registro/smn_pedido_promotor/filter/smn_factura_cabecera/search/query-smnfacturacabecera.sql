	select smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id,
	case
		when smn_comercial.smn_factura_cabecera.fca_estatus_financiero='PE' then '${lbl:b_pending}'
		when smn_comercial.smn_factura_cabecera.fca_estatus_financiero='PA' then '${lbl:b_paying}'
		when smn_comercial.smn_factura_cabecera.fca_estatus_financiero='PP' then '${lbl:b_partial_paying}'
	end as fca_estatus_financiero,
	case
		when smn_comercial.smn_factura_cabecera.fca_estatus_proceso='RE' then '${lbl:b_register}'
		when smn_comercial.smn_factura_cabecera.fca_estatus_proceso='GE' then '${lbl:b_generated}'
		when smn_comercial.smn_factura_cabecera.fca_estatus_proceso='AN' then '${lbl:b_anulated}'
		when smn_comercial.smn_factura_cabecera.fca_estatus_proceso='CO' then '${lbl:b_posted}'
	end as fca_estatus_proceso,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo ||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_comercial.smn_factura_cabecera.fca_numero_documento_id,
	smn_comercial.smn_factura_cabecera.smn_pedido_cabecera_id,
	smn_comercial.smn_factura_cabecera.smn_oferta_id,
	smn_comercial.smn_factura_cabecera.smn_caja_rf,
	smn_comercial.smn_factura_cabecera.smn_control_serie_fiscal_id,
	smn_comercial.smn_factura_cabecera.fca_numero_control_fiscal,
	smn_comercial.smn_factura_cabecera.fca_rif,
	smn_comercial.smn_factura_cabecera.fca_direccion_fiscal,
	smn_comercial.smn_factura_cabecera.fca_monto_factura_ml,
	smn_comercial.smn_factura_cabecera.fca_monto_impuesto_ml,
	smn_comercial.smn_factura_cabecera.fca_monto_descuento_ml,
	smn_comercial.smn_factura_cabecera.fca_monto_bonificacion_ml,
	smn_comercial.smn_factura_cabecera.fca_monto_neto_ml,
	smn_comercial.smn_factura_cabecera.smn_moneda_rf,
	smn_comercial.smn_factura_cabecera.smn_tasa_rf,
	smn_comercial.smn_factura_cabecera.fca_monto_factura_ma,
	smn_comercial.smn_factura_cabecera.fca_monto_impuesto_ma,
	smn_comercial.smn_factura_cabecera.fca_monto_descuento_ma,
	smn_comercial.smn_factura_cabecera.fca_monto_bonificacion_ma,
	smn_comercial.smn_factura_cabecera.fca_monto_neto_ma,
	smn_comercial.smn_factura_cabecera.fca_idioma,
	smn_comercial.smn_factura_cabecera.fca_usuario,
	smn_comercial.smn_factura_cabecera.fca_fecha_registro,
	smn_comercial.smn_factura_cabecera.fca_hora
	
from
	smn_comercial.smn_factura_cabecera
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_factura_cabecera.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_factura_cabecera.smn_sucursal_rf
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_factura_cabecera.smn_cliente_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_factura_cabecera.smn_documento_id