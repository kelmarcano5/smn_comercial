select smn_base.smn_medio_pago.mpa_moneda_alterna as moneda_alterna from smn_base.smn_medio_pago
inner join smn_base.smn_formas_pago on smn_base.smn_formas_pago.fop_medio_pago = smn_base.smn_medio_pago.smn_medio_pago_id
where
smn_base.smn_formas_pago.smn_formas_pago_id=${fld:id2}