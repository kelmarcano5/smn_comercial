select 
	case
		when doc.dcf_entrega_por_orden='SI' then
			smn_comercial.smn_pedido_cabecera.smn_documento_id
		else
			(select cfd.smn_documento_id from smn_comercial.smn_pedido_cabecera 
				inner join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id=smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id
				inner join smn_comercial.smn_control_fiscal_documento cfd on cfd.smn_control_fiscal_documento_id=smn_comercial.smn_centro_facturacion.cfc_control_fiscal_1
				where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id})
			
	end as smn_documento_id,
	case
		when doc.dcf_entrega_por_orden='SI' then
			smn_comercial.smn_pedido_cabecera.smn_cliente_id 
		else
			fca.smn_cliente_id
	end as smn_cliente_rf,
	case
		when doc.dcf_entrega_por_orden='SI' then
			smn_comercial.smn_pedido_cabecera.pca_fecha_requerida
		else
			fca.fca_fecha_registro
	end as mdc_fecha_documento,
	case
		when doc.dcf_entrega_por_orden='SI' then
			smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento 
		else
			fca.fca_fecha_registro
	end as mdc_fecha_vencimiento,
	
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as mdc_numero_doc_origen,
	fca.fca_numero_documento as mdc_numero_factura,
	fca.fca_numero_documento as mdd_numero_documento,

	case
		when doc.dcf_entrega_por_orden='SI' then
			smn_comercial.smn_pedido_cabecera.smn_moneda_rf 
		else
			fca.smn_moneda_rf
	end as smn_moneda_rf,
	
	smn_comercial.smn_pedido_cabecera.smn_ingresos_rf as smn_numero_ingreso_rf,
		
	case
		when doc.dcf_entrega_por_orden='SI' then
			smn_comercial.smn_pedido_cabecera.smn_entidad_rf 
		else
			fca.smn_entidad_rf
	end as entidad,
	case
		when smn_comercial.smn_pedido_cabecera.smn_sucursal_rf is null then 0 
		else 
			smn_comercial.smn_pedido_cabecera.smn_sucursal_rf 
	end as sucursal,

	smn_comercial.smn_pedido_cabecera.smn_centro_costo_rf,

	case 
		when smn_comercial.smn_pedido_cabecera.smn_tasa_rf is null then 0 else smn_comercial.smn_pedido_cabecera.smn_tasa_rf
	end as smn_tasa_rf,
	case
		when doc.dcf_entrega_por_orden='SI' then
			case 
				when smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml is null then 0 
				else smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml
			end 
		else
			case 
				when fca.fca_monto_factura_ml is null then 0 
				else fca.fca_monto_factura_ml
			end
	end as mdc_monto_ml,

	case
		when doc.dcf_entrega_por_orden='SI' then
			case 
				when smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma is null then 0 
				else smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma
			end 
		else
			case 
				when fca.fca_monto_factura_ma is null then 0 
				else fca.fca_monto_factura_ma
			end
	end as mdc_monto_ma,
	case
		when doc.dcf_entrega_por_orden='SI' then
			case 
				when smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml is null then 0 
				else smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml
			end 
		else
			case 
				when fca.fca_monto_neto_ml is null then 0 
				else fca.fca_monto_neto_ml
			end 
	end as mdc_saldo_doc_ml,


	case
		when doc.dcf_entrega_por_orden='SI' then
			case 
				when smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma is null then 0 
				else smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma
			end 
		else
			case 
				when fca.fca_monto_neto_ma is null then 0 
				else fca.fca_monto_neto_ma
			end 
	end as mdc_saldo_doc_ma,

	case 
		when smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml
		end as mdc_descuento_ml,
		case 
			when smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma
	end as mdc_descuento_ma,

	case 
		when fca.fim_abonos_ml is null then 0 else fca.fim_abonos_ml
		end as fim_abonos_ml,
	case 
		when fca.fim_abonos_ma is null then 0 else fca.fim_abonos_ma
		end as fim_abonos_ma,

	cli.smn_promotor_rf as smn_promotor_rf,

	EXTRACT(DAY FROM age(smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento, smn_comercial.smn_pedido_cabecera.pca_fecha_requerida)) AS dias_vencidos,
	case
		when doc.dcf_entrega_por_orden='SI' then
		(select smn_cobranzas.smn_documento.smn_documento_id from 
			smn_cobranzas.smn_documento 
			where smn_cobranzas.smn_documento.smn_documento_general_rf=
			(select smn_comercial.smn_documento.smn_documentos_generales_rf from smn_comercial.smn_documento 
				where smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id))
	
		else
		(select smn_cobranzas.smn_documento.smn_documento_id from 
			smn_cobranzas.smn_documento 
			where smn_cobranzas.smn_documento.smn_documento_general_rf=
			(select smn_comercial.smn_documento.smn_documentos_generales_rf from smn_comercial.smn_documento 
				where smn_comercial.smn_documento.smn_documento_id = fca.smn_documento_id))
	
	end as smn_documento_id_cob

from smn_comercial.smn_pedido_cabecera 
inner join smn_comercial.smn_rel_pedido_factura rpf on rpf.smn_pedido_cabecera_id=smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
inner join smn_comercial.smn_factura_cabecera fca on fca.smn_factura_cabecera_id=rpf.smn_factura_cabecera_id
inner join smn_comercial.smn_documento doc on doc.smn_documento_id=smn_comercial.smn_pedido_cabecera.smn_documento_id
inner join smn_comercial.smn_cliente cli on cli.smn_cliente_id=smn_comercial.smn_pedido_cabecera.smn_cliente_id
where 
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}
