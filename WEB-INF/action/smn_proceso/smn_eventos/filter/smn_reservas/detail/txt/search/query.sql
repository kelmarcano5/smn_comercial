select
	case
	when smn_comercial.smn_reservas.res_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_reservas.res_estatus='CA' then '${lbl:b_cancelled}'
	end as res_estatus,
	smn_comercial.smn_reservas.*
from
	smn_comercial.smn_reservas
where
	smn_reservas_id = ${fld:id}
