WITH rows as (
select 
	SUM(smn_comercial.smn_pedido_detalle.pde_monto) as monto_ml,
	SUM(smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna) as monto_ma
from 
	smn_comercial.smn_pedido_detalle
where
smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}
) 
update smn_comercial.smn_pedido_cabecera
set
pca_monto_pedido_ml=rows.monto_ml,
pca_monto_pedido_ma=rows.monto_ma,
pca_monto_neto_ml=rows.monto_ml,
pca_monto_neto_ma=rows.monto_ma
from rows
where
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = ${fld:id2}