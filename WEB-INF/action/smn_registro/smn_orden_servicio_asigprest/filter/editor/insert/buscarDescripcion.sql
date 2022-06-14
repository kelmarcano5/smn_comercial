select
		smn_comercial.smn_orden_servicio.ors_descripcion
from
		smn_comercial.smn_orden_servicio
where
		upper(smn_comercial.smn_orden_servicio.ors_descripcion) = upper(${fld:ors_descripcion})
