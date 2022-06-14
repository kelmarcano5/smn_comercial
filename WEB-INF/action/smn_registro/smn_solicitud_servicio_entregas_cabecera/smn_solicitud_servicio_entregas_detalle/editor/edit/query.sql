select	
	smn_comercial.smn_solicitud_servicio_entregas_cabecera.smn_solicitud_servicio_entregas_cabecera_id, 
	smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_origen as sec_origen_pl0,
	smn_comercial.smn_solicitud_servicio_entregas_detalle.*
from
	smn_comercial.smn_solicitud_servicio_entregas_cabecera,
	smn_comercial.smn_solicitud_servicio_entregas_detalle 
where
	smn_comercial.smn_solicitud_servicio_entregas_cabecera.smn_solicitud_servicio_entregas_cabecera_id=smn_comercial.smn_solicitud_servicio_entregas_detalle.smn_solicitud_servicio_entregas_cabecera_id and
	smn_solicitud_servicio_entregas_detalle_id = ${fld:id} 
	

