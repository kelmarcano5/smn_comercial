select
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id,
	smn_comercial.smn_factura_detalle.fde_naturaleza as fde_naturaleza_pl0,
select
select
select
select
	case
	when smn_comercial.smn_factura_kits.fki_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_factura_kits.fki_estatus='PE' then '${lbl:b_pending}'
	when smn_comercial.smn_factura_kits.fki_estatus='PA' then '${lbl:b_paying}'
	end as fki_estatus,
	smn_comercial.smn_factura_kits.*
from
	smn_comercial.smn_factura_detalle,
	smn_comercial.smn_factura_kits
where
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id=smn_comercial.smn_factura_kits.smn_factura_detalle_id
	and
	smn_factura_kits_id = ${fld:id}
