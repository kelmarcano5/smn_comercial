select
select
select
select
select
	case
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_proceso='RE' then '${lbl:b_registered}'
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_proceso='AP' then '${lbl:b_approved}'
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_proceso='AL' then '${lbl:b_applied}'
	end as mdc_estatus_proceso,
	case
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_financiero='PE' then '${lbl:b_pending}'
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_financiero='PA' then '${lbl:b_payed}'
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_financiero='DV' then '${lbl:b_refunded}'
	end as mdc_estatus_financiero,
	smn_cobranzas.smn_mov_documento_cob_cab.*
from
	smn_cobranzas.smn_mov_documento_cob_cab
where
	smn_mov_documento_cob_cab_id = ${fld:id}
