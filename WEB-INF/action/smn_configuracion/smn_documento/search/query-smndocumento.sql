select
	smn_comercial.smn_tipo_documentos_fact.tdf_nombre as smn_tipo_documentos_fact_id, 
	smn_base.smn_documentos_generales.dcg_descripcion as smn_documentos_generales_rf,
	smn_comercial.smn_tipo_pedido.tpp_codigo ||' - '|| smn_comercial.smn_tipo_pedido.tpp_descripcion as smn_tipo_pedido_id,
	case
		when smn_comercial.smn_documento.dcf_usa_bonificaciones='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_usa_bonificaciones='NO' then '${lbl:b_not}'
	end as dcf_usa_bonificaciones,
	case
		when smn_comercial.smn_documento.dcf_usa_descuentos='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_usa_descuentos='NO' then '${lbl:b_not}'
	end as dcf_usa_descuentos,
	case
		when smn_comercial.smn_documento.dcf_moneda_alterna='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_moneda_alterna='NO' then '${lbl:b_not}'
	end as dcf_moneda_alterna,
	case
		when smn_comercial.smn_documento.dcf_selecciona_precio='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_selecciona_precio='NO' then '${lbl:b_not}'
	end as dcf_selecciona_precio,
	case
		when smn_comercial.smn_documento.dcf_usa_anexo='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_usa_anexo='NO' then '${lbl:b_not}'
	end as dcf_usa_anexo,
	case
		when smn_comercial.smn_documento.dcf_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_documento.dcf_estatus='IN' then '${lbl:b_inactive}'
	end as dcf_estatus,
	case
		when smn_comercial.smn_documento.dcf_tipo_movimiento='DE' then '${lbl:b_operation_debit}'
		when smn_comercial.smn_documento.dcf_tipo_movimiento='CR' then '${lbl:b_operation_credit}'
	end as dcf_tipo_movimiento,
	case
		when smn_comercial.smn_documento.dcf_req_vigencia='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_req_vigencia='NO' then '${lbl:b_not}'
	end as dcf_req_vigencia,
	case
		when smn_comercial.smn_documento.dcf_req_fecha_vencimiento='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_req_fecha_vencimiento='NO' then '${lbl:b_not}'
	end as dcf_req_fecha_vencimiento,
	case
		when smn_comercial.smn_documento.dcf_gen_orden_despacho='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_gen_orden_despacho='NO' then '${lbl:b_not}'
		when smn_comercial.smn_documento.dcf_gen_orden_despacho='DP' then 'Despacho Previo'
	end as dcf_gen_orden_despacho,
	case
		when smn_comercial.smn_documento.dcf_req_vendedor='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_req_vendedor='NO' then '${lbl:b_not}'
	end as dcf_req_vendedor,
	case
		when smn_comercial.smn_documento.dcf_req_tiempo_entrega='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_req_tiempo_entrega='NO' then '${lbl:b_not}'
	end as dcf_req_tiempo_entrega,
	case
		when smn_comercial.smn_documento.dcf_genera_factura_pv='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_documento.dcf_genera_factura_pv='NO' then '${lbl:b_not}'
	end as dcf_genera_factura_pv,
	smn_comercial.smn_documento.dcf_codigo,
	smn_comercial.smn_documento.dcf_descripcion,
	smn_comercial.smn_documento.dcf_fecha_registro,
	smn_comercial.smn_documento.dcf_req_tiempo_entrega,
	smn_comercial.smn_documento.smn_documento_id
from
	smn_comercial.smn_documento
	inner join smn_comercial.smn_tipo_documentos_fact on smn_comercial.smn_tipo_documentos_fact.smn_tipo_documentos_fact_id = smn_comercial.smn_documento.smn_tipo_documentos_fact_id
	inner join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id = smn_comercial.smn_documento.smn_documentos_generales_rf
	left join smn_comercial.smn_tipo_pedido on smn_comercial.smn_tipo_pedido.smn_tipo_pedido_id = smn_comercial.smn_documento.smn_tipo_pedido_id

