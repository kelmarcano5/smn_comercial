select smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id as id, smn_base.smn_tasas_de_cambio.tca_tasa_cambio as tasa from smn_base.smn_tasas_de_cambio inner join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_base.smn_tasas_de_cambio.smn_monedas_id
where smn_base.smn_tasas_de_cambio.smn_monedas_id=${fld:id} and smn_base.smn_tasas_de_cambio.tca_tipo_tasa=${fld:tipotasa} and smn_base.smn_tasas_de_cambio.tca_estatus='AC' and smn_base.smn_tasas_de_cambio.tca_fecha_vigencia = current_date limit 1