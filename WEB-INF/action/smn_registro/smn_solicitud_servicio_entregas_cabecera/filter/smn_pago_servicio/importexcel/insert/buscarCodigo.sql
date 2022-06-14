select
		smn_comercial.smn_pago_servicio.pas_codigo_seguridad
from
		smn_comercial.smn_pago_servicio
where
		upper(smn_comercial.smn_pago_servicio.pas_codigo_seguridad) = upper(${fld:pas_codigo_seguridad})
