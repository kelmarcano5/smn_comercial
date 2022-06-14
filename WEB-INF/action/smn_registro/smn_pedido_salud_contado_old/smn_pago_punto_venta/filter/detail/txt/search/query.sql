select
	case
	when smn_comercial.smn_pago_punto_venta.ppv_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_pago_punto_venta.ppv_estatus='IN' then '${lbl:b_inactive}'
	end as ppv_estatus,
	smn_comercial.smn_pago_punto_venta.*
from
	smn_comercial.smn_pago_punto_venta
where
	smn_pago_punto_venta_id = ${fld:id}
