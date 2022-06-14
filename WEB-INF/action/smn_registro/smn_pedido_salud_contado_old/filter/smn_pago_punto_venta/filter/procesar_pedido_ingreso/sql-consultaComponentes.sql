select DISTINCT smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,	
	case
		when smn_comercial.smn_pedido_detalle.pde_naturaleza = 'SE' then 'SE' 
		when smn_comercial.smn_pedido_detalle.pde_naturaleza = 'IT' then 'IT' 
	end as smn_tipo_componentes_rf,
	case
		when smn_comercial.smn_pedido_detalle.pde_naturaleza = 'SE' then smn_comercial.smn_pedido_detalle.smn_servicios_rf else 0
	end as smn_servicios_rf,
	case
		when smn_comercial.smn_pedido_detalle.pde_naturaleza = 'IT' then smn_comercial.smn_pedido_detalle.smn_item_rf else 0
	end as smn_item_rf,
	smn_comercial.smn_pedido_detalle.pde_monto as pde_precio,
	smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna as pde_precio_moneda_alterna,
	case
		when smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_comercial.smn_pedido_detalle.pde_monto * smn_base.smn_componentes.cmp_porcentaje/100 
		when smn_base.smn_componentes.cmp_forma_calculo='M' then 
			case
				when smn_base.smn_componentes.cmp_monto_moneda_local > 0 then smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada * smn_base.smn_servicios_componentes.sec_cantidad* cmp_monto_moneda_local
				else (smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada * smn_base.smn_servicios_componentes.sec_cantidad * cmp_monto_moneda_alterna * tca_tasa_cambio)
			end
		when smn_base.smn_componentes.cmp_forma_calculo='D' then smn_comercial.smn_pedido_detalle.pde_monto-(SELECT 
			COALESCE(sum(case 
			when smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_comercial.smn_pedido_detalle.pde_monto*smn_base.smn_componentes.cmp_porcentaje/100 
			when smn_base.smn_componentes.cmp_forma_calculo='M' then 
				case
					when smn_base.smn_componentes.cmp_monto_moneda_local > 0 then smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada * smn_base.smn_servicios_componentes.sec_cantidad*cmp_monto_moneda_local
						else (smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada * smn_base.smn_servicios_componentes.sec_cantidad * cmp_monto_moneda_alterna * tca_tasa_cambio)
				end
			end),0)
			FROM smn_comercial.smn_pedido_detalle
				inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_comercial.smn_pedido_detalle.smn_servicios_rf
				inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
				inner join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_comercial.smn_pedido_detalle.smn_tasa_rf
			WHERE 
				smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
			and
				smn_base.smn_componentes.cmp_forma_calculo<>'D'
			and
				smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf})
	end as monto_componente_ml,
	case
		when smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna * smn_base.smn_componentes.cmp_porcentaje/100 
		when smn_base.smn_componentes.cmp_forma_calculo='M' then smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada * smn_base.smn_servicios_componentes.sec_cantidad * cmp_monto_moneda_alterna
		when smn_base.smn_componentes.cmp_forma_calculo='D' then smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna-(SELECT 
			COALESCE(sum(case 
			when smn_base.smn_componentes.cmp_forma_calculo='PO' then pde_monto_moneda_alterna*smn_base.smn_componentes.cmp_porcentaje/100 
			when smn_base.smn_componentes.cmp_forma_calculo='M' then 
				case
					when smn_base.smn_componentes.cmp_monto_moneda_local > 0 then cmp_monto_moneda_alterna
					else (smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada*cmp_monto_moneda_alterna)
				end
			end),0)
			FROM smn_comercial.smn_pedido_detalle 
				inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_comercial.smn_pedido_detalle.smn_servicios_rf
				inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
			WHERE 
				smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
			and
				smn_base.smn_componentes.cmp_forma_calculo<>'D'
			and
				smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf})
	end as monto_componente_ma,
	case
		when smn_comercial.smn_pedido_detalle.smn_moneda_rf is null then 0 else smn_comercial.smn_pedido_detalle.smn_moneda_rf
	end as smn_moneda_rf,
	smn_comercial.smn_pedido_detalle.smn_tasa_rf,
	smn_base.smn_modulos.mod_nombre ||' - '|| smn_comercial.smn_pedido_cabecera.pca_descripcion as pde_especificaciones_pedido,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido as pde_cantidad_pedido,
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
	smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as smn_num_doc_origen_rf--,
	--${fld:smn_pedido_detalle_id} as smn_pedido_detalle_id
from smn_comercial.smn_pedido_cabecera
	inner join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
	inner join smn_base.smn_modulos on smn_base.smn_modulos.smn_modulos_id = 2
	inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_comercial.smn_pedido_detalle.smn_servicios_rf
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
	left join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_comercial.smn_pedido_cabecera.smn_tasa_rf
where
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id} and smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id} and smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf}
ORDER BY
	smn_base.smn_componentes.cmp_forma_calculo DESC