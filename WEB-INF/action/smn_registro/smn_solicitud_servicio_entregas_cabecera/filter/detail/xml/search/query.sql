select
	case
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_origen='W' then '${lbl:b_web}'
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_origen='C' then '${lbl:b_call_centre}'
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_origen='L' then '${lbl:b_local}'
	end as sec_origen,
	case
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='SO' then '${lbl:b_solicitada}'
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='AC' then '${lbl:b_aprobada_comercio}'
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='AS' then '${lbl:b_aprobada_solicitante}'
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='EP' then '${lbl:b_en_proceso}'
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='DE' then '${lbl:b_despachado}'
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='EN' then '${lbl:b_entregado}'
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_estatus_proceso='RE' then '${lbl:b_rechazado}'
	end as sec_estatus_proceso,
	case
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_estatus_financiera='PE' then '${lbl:b_pendiente}'
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_estatus_financiera='PA' then '${lbl:b_pagado}'
	when smn_comercial.smn_solicitud_servicio_entregas_cabecera.sec_estatus_financiera='DV' then '${lbl:b_devuelto}'
	end as sec_estatus_financiera,
	smn_comercial.smn_solicitud_servicio_entregas_cabecera.*
from
	smn_comercial.smn_solicitud_servicio_entregas_cabecera
where
	smn_solicitud_servicio_entregas_cabecera_id = ${fld:id}
