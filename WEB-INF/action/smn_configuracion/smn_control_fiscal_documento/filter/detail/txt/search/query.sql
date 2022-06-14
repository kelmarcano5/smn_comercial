select
select
select
	case
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='RE' then '${lbl:b_registrada}'
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='SO' then '${lbl:b_solicitada}'
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='RE' then '${lbl:b_recibida}'
	when smn_comercial.smn_control_fiscal_documento.cfd_estatus='CO' then '${lbl:b_completada}'
	end as cfd_estatus,
	smn_comercial.smn_control_fiscal_documento.*
from
	smn_comercial.smn_control_fiscal_documento
where
	smn_control_fiscal_documento_id = ${fld:id}
