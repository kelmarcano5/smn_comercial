select
	bad_cantidad, bad_precio_moneda_local
from smn_base.smn_baremos_detalle
where smn_baremos_id = ${fld:smn_baremos_id} and smn_servicios_rf = ${fld:id_servicio}