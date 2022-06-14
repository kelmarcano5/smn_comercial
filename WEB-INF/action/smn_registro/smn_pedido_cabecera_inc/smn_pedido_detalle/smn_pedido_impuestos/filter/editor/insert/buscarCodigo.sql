select
		smn_comercial.smn_pedido_impuestos.smn_codigos_impuestos_rf
from
		smn_comercial.smn_pedido_impuestos
where
		smn_comercial.smn_pedido_impuestos.smn_codigos_impuestos_rf = ${fld:smn_codigos_impuestos_rf}
