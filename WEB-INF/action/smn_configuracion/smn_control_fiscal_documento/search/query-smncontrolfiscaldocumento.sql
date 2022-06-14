select
	smn_comercial.smn_control_fiscal_documento.smn_control_fiscal_documento_id,
	case
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='RE' then '${lbl:b_registrada}'
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='SO' then '${lbl:b_solicitada}'
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='RE' then '${lbl:b_recibida}'
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='CO' then '${lbl:b_completada}'
	end as cfd_estatus,
	smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_control_fiscal_documento.cfd_numero_documento_fiscal_inicial,
	smn_comercial.smn_control_fiscal_documento.cfd_numero_documento_fiscal_final,
	smn_comercial.smn_control_fiscal_documento.cfd_ultimo_numero_fiscal_usado,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_proveedor_rf,
	smn_comercial.smn_control_fiscal_documento.cfd_fecha_solicitud,
	smn_comercial.smn_control_fiscal_documento.cfd_fecha_recepcion,
	smn_comercial.smn_control_fiscal_documento.cfd_serie,
	smn_comercial.smn_control_fiscal_documento.cfd_fecha_registro
	
from
	smn_comercial.smn_control_fiscal_documento
	left join smn_compras.smn_proveedor on smn_compras.smn_proveedor.smn_proveedor_id = smn_comercial.smn_control_fiscal_documento.smn_proveedor_rf
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_compras.smn_proveedor.smn_auxiliar_rf
	inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_control_fiscal_documento.smn_documento_id
