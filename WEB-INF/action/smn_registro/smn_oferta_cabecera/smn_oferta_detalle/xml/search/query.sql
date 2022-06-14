select
	smn_base.smn_monedas.mon_nombre,
		smn_comercial.smn_oferta_detalle.smn_oferta_detalle_id,
	case
	when smn_comercial.smn_oferta_detalle.ofd_naturaleza='IT' then '${lbl:b_item}'
	when smn_comercial.smn_oferta_detalle.ofd_naturaleza='SE' then '${lbl:b_services}'
	when smn_comercial.smn_oferta_detalle.ofd_naturaleza='AF' then '${lbl:b_actfijo}'
	end as ofd_naturaleza,
	smn_comercial.smn_oferta_detalle.smn_oferta_id,
	smn_comercial.smn_oferta_detalle.ofd_cantidad,
	smn_comercial.smn_oferta_detalle.ofd_precio,
	smn_comercial.smn_oferta_detalle.ofd_monto_ml,
	smn_comercial.smn_oferta_detalle.ofd_precio_moneda_alterna,
	smn_comercial.smn_oferta_detalle.ofd_monto_moneda_alterna,
	smn_comercial.smn_oferta_detalle.ofd_fecha_registro
	
from
	smn_comercial.smn_oferta_detalle
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_oferta_detalle.ofd_moneda_rf
