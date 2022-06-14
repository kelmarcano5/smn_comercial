select smn_base.smn_formas_pago.smn_formas_pago_id as id, smn_base.smn_medio_pago.mpa_tipo_medio_pago || ' - ' || smn_base.smn_formas_pago.fop_descripcion as item,
smn_base.smn_medio_pago.mpa_moneda_alterna
from smn_base.smn_formas_pago
inner join smn_base.smn_medio_pago on smn_base.smn_medio_pago.smn_medio_pago_id = smn_base.smn_formas_pago.fop_medio_pago
order by fop_descripcion