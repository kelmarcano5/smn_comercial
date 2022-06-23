select smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id,
case
	when smn_caja.smn_mov_caja_detalle.mcd_tipo_producto = 'SE' or smn_caja.smn_mov_caja_detalle.mcd_tipo_producto = 'SS' then 'SE' 
	when smn_caja.smn_mov_caja_detalle.mcd_tipo_producto = 'IT' then 'IT' 
end as smn_tipo_componentes_rf,
case
	when smn_caja.smn_mov_caja_detalle.mcd_tipo_producto = 'SE' or smn_caja.smn_mov_caja_detalle.mcd_tipo_producto = 'SS' then smn_caja.smn_mov_caja_detalle.smn_id_rf else 0
end as smn_servicios_rf,
case
	when smn_caja.smn_mov_caja_detalle.mcd_tipo_producto = 'IT' then smn_caja.smn_mov_caja_detalle.smn_id_rf else 0
end as smn_item_rf,
smn_caja.smn_mov_caja_detalle.mcd_monto_por_pagar_ml as pde_precio,
case
 when smn_caja.smn_mov_caja_detalle.mcd_monto_por_pagar_ml is null then 0 else smn_caja.smn_mov_caja_detalle.mcd_monto_por_pagar_ml
end as pde_monto,
smn_caja.smn_mov_caja_detalle.smn_moneda_rf,
smn_caja.smn_mov_caja_detalle.smn_tasa_rf,
smn_base.smn_modulos.mod_nombre ||' - '|| smn_caja.smn_mov_caja_cabecera.mcc_cod_descripcion_orig as pde_especificaciones_pedido,
1 as pde_cantidad_pedido,
case 
 when smn_caja.smn_documento.doc_usa_moneda_alterna='N' then 0 else smn_caja.smn_mov_caja_detalle.mcd_monto_por_pagar_ma
end as pde_precio_moneda_alterna,
case 
 when smn_caja.smn_documento.doc_usa_moneda_alterna='N' then 0 else smn_caja.smn_mov_caja_detalle.mcd_saldo_pago_ma
end as pde_monto_moneda_alterna,
${fld:smn_pedido_cabecera_id} as smn_pedido_cabecera_id

from smn_caja.smn_mov_caja_cabecera
inner join smn_caja.smn_mov_caja_detalle on smn_caja.smn_mov_caja_detalle.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
inner join smn_base.smn_modulos on smn_base.smn_modulos.smn_modulos_id = smn_caja.smn_mov_caja_cabecera.smn_modulo_rf
inner join smn_caja.smn_documento on smn_caja.smn_documento.smn_documento_id = smn_caja.smn_mov_caja_cabecera.smn_documento_id
where
smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = ${fld:smn_mov_caja_cabecera_id}