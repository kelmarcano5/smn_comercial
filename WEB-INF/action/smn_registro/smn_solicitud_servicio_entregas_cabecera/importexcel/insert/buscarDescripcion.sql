select
		smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_descripcion
from
		smn_comercial.smn_solicitud_servicio_entregas_cabecera
where
		upper(smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_descripcion) = upper(${fld:sec_descripcion})
