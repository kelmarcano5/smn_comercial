select
	bad_cantidad, bad_precio_moneda_local
from smn_base.smn_baremos_detalle
inner join smn_base.smn_baremos_detalle_componente on smn_base.smn_baremos_detalle_componente.smn_baremos_detalle_id = smn_base.smn_baremos_detalle.smn_baremos_detalle_id 
where smn_baremos_id = ${fld:smn_baremos_id} and smn_base.smn_baremos_detalle_componente.smn_componente_rf = ${fld:id_servicio}