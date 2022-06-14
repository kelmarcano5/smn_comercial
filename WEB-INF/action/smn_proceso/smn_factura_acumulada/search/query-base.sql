SELECT
	(select smn_comercial.smn_cliente.smn_cliente_id ||'-'|| smn_base.smn_auxiliar.aux_descripcion from smn_comercial.smn_cliente inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf where smn_comercial.smn_cliente.smn_cliente_id=${fld:smn_cliente_id}) as cliente,
	SUM(smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml) as monto_ml,
	SUM(smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma) as monto_ma,
	SUM(smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ml) as monto_imp_ml,
	SUM(smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ma) as monto_imp_ma,
	SUM(smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml) as monto_desc_ml,
	SUM(smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ma) as monto_desc_ma,	
	SUM(smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ml) as monto_bonif_ml,
	SUM(smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ml) as monto_bonif_ma
FROM
	smn_comercial.smn_pedido_cabecera
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	inner join smn_base.smn_auxiliar cliente on cliente.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	inner join smn_base.smn_auxiliar paciente on paciente.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
	left join smn_caja.smn_mov_caja_cabecera  on smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id
	left join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id =   smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_pedido_cabecera.smn_entidad_rf
	left join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_pedido_cabecera.smn_sucursal_rf
	left join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_cabecera.smn_moneda_rf
where 
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id is not null AND smn_comercial.smn_pedido_cabecera.pca_estatus IN('PR')
	${filter}


