select
	smn_base.smn_monedas.mon_nombre,
	${field}
from
	smn_comercial.smn_oferta_detalle
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_oferta_detalle.ofd_moneda_rf
where
		smn_comercial.smn_oferta_detalle.smn_oferta_detalle_id is not null
