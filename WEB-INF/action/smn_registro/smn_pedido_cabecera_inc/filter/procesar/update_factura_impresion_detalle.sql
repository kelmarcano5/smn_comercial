WITH RECURSIVE componente as (
	SELECT 
	smn_comercial.smn_factura_impresion_detalle.smn_factura_impresion_detalle_id,
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id,
	
	
	smn_comercial.smn_pedido_componentes.pco_imprime,
	smn_comercial.smn_pedido_componentes.smn_servicio_rf

FROM
	smn_comercial.smn_factura_impresion_detalle
	inner join smn_comercial.smn_pedido_componentes on smn_comercial.smn_pedido_componentes.smn_pedido_componentes_id=smn_comercial.smn_factura_impresion_detalle.smn_pedido_componente_id
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_pedido_componentes.smn_componente_rf
	
where 
	smn_comercial.smn_pedido_componentes.smn_pedido_cabecera_id= ${fld:smn_pedido_cabecera_id}
	and smn_comercial.smn_pedido_componentes.pco_imprime='S'
	and smn_base.smn_componentes.cmp_forma_calculo='D'
	and smn_comercial.smn_pedido_componentes.smn_servicio_rf=${fld:smn_servicio_rf}
) update smn_comercial.smn_factura_impresion_detalle
set fim_monto_ml=fim_monto_ml+${fld:pco_monto_ml}, fim_monto_ma=fim_monto_ma+${fld:smn_monto_ma}
where smn_comercial.smn_factura_impresion_detalle.smn_factura_impresion_detalle_id in (select smn_factura_impresion_detalle_id from componente)
