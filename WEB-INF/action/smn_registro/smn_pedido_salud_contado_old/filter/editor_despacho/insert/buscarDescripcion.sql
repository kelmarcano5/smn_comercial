select
		smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_descripcion
from
		smn_entrega.smn_solicitud_servicio_entregas_cabecera
where
		upper(smn_entrega.smn_solicitud_servicio_entregas_cabecera.sec_descripcion) = upper(${fld:sec_descripcion})
