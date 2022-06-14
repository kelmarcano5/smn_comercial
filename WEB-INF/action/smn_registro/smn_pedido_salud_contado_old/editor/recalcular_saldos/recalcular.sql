WITH rows as (
select smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id as id,
(select SUM(smn_comercial.smn_pedido_detalle.pde_cantidad_pedido) from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}) as cantidad,
(select SUM(smn_comercial.smn_pedido_detalle.pde_monto) from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}) as monto_pedido_cabecera,
(select SUM(smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna) from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}) as monto_pedido_cabecera_ma
from  smn_comercial.smn_pedido_detalle
inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
WHERE
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2} 
GROUP BY smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
) 
update smn_comercial.smn_pedido_cabecera
set
pca_cantidad=rows.cantidad,
pca_monto_pedido_ml=rows.monto_pedido_cabecera,
pca_monto_neto_ml=rows.monto_pedido_cabecera,
pca_monto_pedido_ma=rows.monto_pedido_cabecera_ma,
pca_monto_neto_ma=rows.monto_pedido_cabecera_ma
from rows
where
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id =  ${fld:id2} 