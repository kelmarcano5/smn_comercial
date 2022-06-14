SELECT (coalesce(smn_precio_neto_ml_servicio,0)) as smn_precio_neto_ml_servicio, (coalesce(smn_precio_neto_ma_servicio,0)) as smn_precio_neto_ma_servicio, (coalesce(smn_moneda_alterna,0)) as smn_moneda_alterna, 1 as cantidad, 1 * smn_precio_neto_ml_servicio as inm_monto_ml, 1*(coalesce(smn_precio_neto_ma_servicio,0)) as inm_monto_ma, (coalesce(smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id,0)) as smn_tasas_de_cambio_id, 0 as id_detalle, 0 as id_ingreso 
FROM smn_base.smn_v_servicio_precio
LEFT JOIN smn_base.smn_tasas_de_cambio on
smn_base.smn_v_servicio_precio.smn_moneda_alterna = smn_base.smn_tasas_de_cambio.smn_monedas_id
WHERE smn_base.smn_v_servicio_precio.smn_tipo_precio = ${fld:tipo_precio} and smn_v_servicio_precio_id = ${fld:smn_servicios_rf}