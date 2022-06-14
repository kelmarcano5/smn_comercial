select DISTINCT smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id,
	smn_caja.smn_mov_caja_detalle.smn_mov_caja_detalle_id,	
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
	smn_caja.smn_mov_caja_detalle.mcd_monto_por_pagar_ma as pde_precio_moneda_alterna,
	case
		when smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_caja.smn_mov_caja_detalle.mcd_monto_por_pagar_ml * smn_base.smn_componentes.cmp_porcentaje/100 
		when smn_base.smn_componentes.cmp_forma_calculo='M' then 
			case
				when smn_base.smn_componentes.cmp_monto_moneda_local > 0 then cmp_monto_moneda_local
				else (cmp_monto_moneda_alterna * tca_tasa_cambio)
			end
		when smn_base.smn_componentes.cmp_forma_calculo='D' then smn_caja.smn_mov_caja_detalle.mcd_monto_por_pagar_ml-(SELECT 
			COALESCE(sum(case 
			when smn_base.smn_componentes.cmp_forma_calculo='PO' then mcd_monto_por_pagar_ml*smn_base.smn_componentes.cmp_porcentaje/100 
			when smn_base.smn_componentes.cmp_forma_calculo='M' then 
				case
					when smn_base.smn_componentes.cmp_monto_moneda_local > 0 then cmp_monto_moneda_local
						else (cmp_monto_moneda_alterna * tca_tasa_cambio)
				end
			end),0)
			FROM smn_caja.smn_mov_caja_detalle 
				inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_caja.smn_mov_caja_detalle.smn_id_rf 
				inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
				inner join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_mov_caja_cabecera_id=smn_caja.smn_mov_caja_detalle.smn_mov_caja_cabecera_id
			WHERE 
				smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
			and
				smn_base.smn_componentes.cmp_forma_calculo<>'D'
			and
				smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf})
	end as monto_componente_ml,
	case
		when smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_caja.smn_mov_caja_detalle.mcd_monto_por_pagar_ma * smn_base.smn_componentes.cmp_porcentaje/100 
		when smn_base.smn_componentes.cmp_forma_calculo='M' then cmp_monto_moneda_alterna
		when smn_base.smn_componentes.cmp_forma_calculo='D' then smn_caja.smn_mov_caja_detalle.mcd_monto_por_pagar_ma-(SELECT 
			COALESCE(sum(case 
			when smn_base.smn_componentes.cmp_forma_calculo='PO' then mcd_monto_por_pagar_ma*smn_base.smn_componentes.cmp_porcentaje/100 
			when smn_base.smn_componentes.cmp_forma_calculo='M' then cmp_monto_moneda_alterna
			end),0)
			FROM smn_caja.smn_mov_caja_detalle 
				inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_caja.smn_mov_caja_detalle.smn_id_rf 
				inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
				inner join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_mov_caja_cabecera_id=smn_caja.smn_mov_caja_detalle.smn_mov_caja_cabecera_id
			WHERE 
				smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
			and
				smn_base.smn_componentes.cmp_forma_calculo<>'D'
			and
				smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf})
	end as monto_componente_ma,
	case
		when smn_caja.smn_mov_caja_detalle.smn_moneda_rf is null then 0 else smn_caja.smn_mov_caja_detalle.smn_moneda_rf
	end as smn_moneda_rf,
	smn_caja.smn_mov_caja_detalle.smn_tasa_rf,
	smn_base.smn_modulos.mod_nombre ||' - '|| smn_caja.smn_mov_caja_cabecera.mcc_cod_descripcion_orig as pde_especificaciones_pedido,
	1 as pde_cantidad_pedido,
	smn_base.smn_componentes.smn_componentes_id,
	smn_base.smn_componentes.cmp_descripcion,
	smn_base.smn_componentes.cmp_forma_calculo,
	smn_base.smn_componentes.cmp_tipo_componente,
	smn_base.smn_componentes.cmp_visible,
	smn_base.smn_componentes.smn_imprime,
	case 
	 when smn_base.smn_componentes.cmp_grupo_prestador is null then 0 else smn_base.smn_componentes.cmp_grupo_prestador
	end as cmp_grupo_prestador,
	case 
	 when smn_base.smn_componentes.cmp_clase_auxiliar_rf is null then 0 else smn_base.smn_componentes.cmp_clase_auxiliar_rf
	end as smn_clase_auxiliar_rf,
	case 
	 when smn_base.smn_componentes.smn_grupo_componente_rf is null then 0 else smn_base.smn_componentes.smn_grupo_componente_rf
	end as smn_grupo_componente_rf,
	case 
	 when smn_base.smn_componentes.smn_grupo_titulo_impresion_rf is null then 0 else smn_base.smn_componentes.smn_grupo_titulo_impresion_rf
	end as smn_grupo_titulo_impresion_rf,
	case 
	 when smn_base.smn_componentes.smn_tipo_gasto_rf is null then 0 else smn_base.smn_componentes.smn_tipo_gasto_rf
	end as smn_tipo_gasto_rf,
	case 
	 when smn_base.smn_componentes.smn_sub_tipo_gasto_rf is null then 0 else smn_base.smn_componentes.smn_sub_tipo_gasto_rf
	end as smn_sub_tipo_gasto_rf,
	smn_caja.smn_mov_caja_cabecera.smn_auxiliar_rf,
	smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf,
	${fld:smn_pedido_detalle_id} as smn_pedido_detalle_id
from smn_caja.smn_mov_caja_cabecera
	inner join smn_caja.smn_mov_caja_detalle on smn_caja.smn_mov_caja_detalle.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.igs_num_ingreso = smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf
	inner join smn_base.smn_modulos on smn_base.smn_modulos.smn_modulos_id = smn_caja.smn_mov_caja_cabecera.smn_modulo_rf
	inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_caja.smn_mov_caja_detalle.smn_id_rf 
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
	inner join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
	left join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_caja.smn_mov_caja_detalle.smn_tasa_rf
where
	smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = ${fld:smn_mov_caja_cabecera_id} and smn_caja.smn_mov_caja_detalle.smn_id_rf = ${fld:smn_servicios_rf} and smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
ORDER BY
	smn_base.smn_componentes.cmp_forma_calculo DESC