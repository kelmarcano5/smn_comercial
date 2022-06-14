update smn_comercial.smn_pedido_cabecera
set
pca_monto_pedido_ml=(select case when SUM(smn_comercial.smn_pedido_detalle.pde_monto) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_monto)  end  from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}),
pca_monto_pedido_ma=(select case when SUM(smn_comercial.smn_pedido_detalle.pde_precio_moneda_alterna) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_precio_moneda_alterna) end from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}),
pca_monto_neto_ml=(select case when SUM(smn_comercial.smn_pedido_detalle.pde_monto) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_monto)  end  from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}),
pca_monto_neto_ma=(select case when SUM(smn_comercial.smn_pedido_detalle.pde_precio_moneda_alterna) is null then 0 else SUM(smn_comercial.smn_pedido_detalle.pde_precio_moneda_alterna) end from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2})
where
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:id2}