select
	smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id,
	case
		when smn_comercial.smn_factura_cabecera.fca_estatus_proceso='RE' then '${lbl:b_register}'
		when smn_comercial.smn_factura_cabecera.fca_estatus_proceso='AP' then '${lbl:b_aprobated}'
		when smn_comercial.smn_factura_cabecera.fca_estatus_proceso='RZ' then '${lbl:b_refused}'
		when smn_comercial.smn_factura_cabecera.fca_estatus_proceso='GE' then '${lbl:b_generated}'
		when smn_comercial.smn_factura_cabecera.fca_estatus_proceso='PA' then '${lbl:b_partial_aprobated}'
	end as fca_estatus_proceso,
	smn_comercial.smn_factura_cabecera.smn_documento_id,
	smn_comercial.smn_factura_cabecera.fca_numero_documento, 
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_factura_cabecera.smn_cliente_id,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_comercial.smn_factura_cabecera.fca_rif,
	smn_comercial.smn_factura_cabecera.fca_direccion_fiscal,
	smn_base.smn_municipios.mun_nombre_largo as aux_direccion_munic,
	smn_comercial.smn_factura_cabecera.smn_entidad_rf,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_entidades.ent_nro_id_fiscal,
	smn_base.smn_direccion.dir_descripcion as ent_direccion,
	smn_base.smn_municipios.mun_nombre_largo as ent_direccion_munic,
	smn_base.smn_direccion.dir_descripcion as ent_descripcion_larga,
	smn_base.smn_auxiliar.aux_sectores_economicos_rf as ent_sector_economico,
	smn_base.smn_entidades.ent_act_economica,
	smn_base.smn_sectores_economicos.sec_codigo as ent_codigo,
	smn_comercial.smn_factura_cabecera.fca_fecha_registro,
	cast(smn_comercial.smn_factura_cabecera.fca_monto_factura_ml AS INTEGER) as fca_monto_factura_ml,
	cast(smn_comercial.smn_factura_cabecera.fca_monto_neto_ml as INTEGER) AS fca_monto_neto_ml,
	cast(smn_comercial.smn_factura_cabecera.fca_monto_impuesto_ml AS INTEGER) as fca_monto_impuesto_ml,
	--smn_caja.smn_mov_caja_cabecera.smn_estatus_cobro as smn_forma_pago_rf,
	case
		when smn_base.smn_tipo_documento_fiscal.smn_tipo_documento_fiscal_id is null then 0 else smn_base.smn_tipo_documento_fiscal.smn_tipo_documento_fiscal_id
	end as smn_tipo_dte,
	case
		when smn_comercial.smn_factura_cabecera.fca_folio is null then 0 else smn_comercial.smn_factura_cabecera.fca_folio
	end as fca_folio,
	case 
		when smn_comercial.smn_factura_cabecera.fca_direccion_fiscal is not null then 0
	end as ent_telefono_fijo,
	smn_comercial.smn_factura_cabecera.smn_tasa_rf as fde_tasa_rf,
	smn_comercial.smn_cliente.smn_forma_pago_rf as smn_forma_pago
	
from
	smn_comercial.smn_factura_cabecera
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_factura_cabecera.smn_entidad_rf
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_factura_cabecera.smn_cliente_id 
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_factura_cabecera.smn_documento_id
	left outer join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = smn_base.smn_entidades.ent_direccion
	left outer join smn_base.smn_municipios on smn_base.smn_municipios.smn_municipios_id = smn_base.smn_entidades.ent_direccion
	left outer join smn_base.smn_sectores_economicos on smn_base.smn_sectores_economicos.smn_sectores_economicos_id = smn_base.smn_entidades.ent_sector_economico
	left outer join smn_base.smn_rel_auxiliar_direccion on smn_base.smn_rel_auxiliar_direccion.smn_direccion_id = smn_base.smn_auxiliar.aux_direccion_rf
	left outer JOIN smn_caja.smn_mov_caja_cabecera on smn_caja.smn_mov_caja_cabecera.smn_documento_id = smn_comercial.smn_factura_cabecera.smn_documento_id
	left outer JOIN smn_comercial.smn_control_fiscal_documento on smn_comercial.smn_control_fiscal_documento.smn_documento_id = smn_comercial.smn_factura_cabecera.smn_documento_id
	left outer JOIN smn_base.smn_tipo_documento_fiscal on smn_base.smn_tipo_documento_fiscal.smn_tipo_documento_fiscal_id = smn_comercial.smn_control_fiscal_documento.smn_control_fiscal_documento_id
	inner join smn_comercial.smn_rel_pedido_factura on smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id = smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id
	inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id
WHERE
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = ${fld:smn_pedido_cabecera_id} AND
	 smn_comercial.smn_factura_cabecera.fca_estatus_proceso = 'RE' 

LIMIT 1
