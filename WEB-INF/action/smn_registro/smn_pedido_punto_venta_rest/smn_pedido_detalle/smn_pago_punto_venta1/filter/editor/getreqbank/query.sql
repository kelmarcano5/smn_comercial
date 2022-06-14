select smn_base.smn_formas_pago.fop_requiere_banco
from smn_base.smn_formas_pago 
where
smn_base.smn_formas_pago.smn_formas_pago_id=${fld:id}