select
		smn_comercial.smn_control_fiscal_documento.smn_control_fiscal_documento_id,
	case
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='RE' then '${lbl:b_registrada}'
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='SO' then '${lbl:b_solicitada}'
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='RE' then '${lbl:b_recibida}'
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='CO' then '${lbl:b_completada}'
	end as cfd_estatus,
	smn_comercial.smn_control_fiscal_documento.smn_documento_id,
	smn_comercial.smn_control_fiscal_documento.cfd_numero_documento_fiscal_inicial,
	smn_comercial.smn_control_fiscal_documento.cfd_numero_documento_fiscal_final,
	smn_comercial.smn_control_fiscal_documento.cfd_ultimo_numero_fiscal_usado,
	smn_comercial.smn_control_fiscal_documento.smn_proveedor_rf,
	smn_comercial.smn_control_fiscal_documento.cfd_fecha_solicitud,
	smn_comercial.smn_control_fiscal_documento.cfd_fecha_recepcion,
	smn_comercial.smn_control_fiscal_documento.cfd_serie,
	smn_comercial.smn_control_fiscal_documento.cfd_estatus,
	smn_comercial.smn_control_fiscal_documento.cfd_fecha_registro
	
from
	smn_comercial.smn_control_fiscal_documento
