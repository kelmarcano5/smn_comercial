select
		smn_comercial.smn_pedido_impuestos.smn_codigos_impuestos_rf
from
		smn_comercial.smn_pedido_impuestos
where
		upper(smn_comercial.smn_pedido_impuestos.smn_codigos_impuestos_rf) = upper(${fld:smn_codigos_impuestos_rf})
