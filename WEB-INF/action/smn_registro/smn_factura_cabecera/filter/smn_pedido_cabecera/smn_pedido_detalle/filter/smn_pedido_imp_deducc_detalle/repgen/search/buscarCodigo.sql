select
		smn_comercial.smn_pedido_imp_deducc_detalle.smn_codigos_impuestos_rf
from
		smn_comercial.smn_pedido_imp_deducc_detalle
where
		upper(smn_comercial.smn_pedido_imp_deducc_detalle.smn_codigos_impuestos_rf) = upper(${fld:smn_codigos_impuestos_rf})
