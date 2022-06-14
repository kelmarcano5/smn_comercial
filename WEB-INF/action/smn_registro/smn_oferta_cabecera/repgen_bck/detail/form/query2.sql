select
		smn_comercial.smn_oferta_cabecera.smn_documento_id,
	smn_comercial.smn_oferta_cabecera.ofe_numero_documento,
	smn_comercial.smn_oferta_cabecera.smn_entidad_rf,
	smn_comercial.smn_oferta_cabecera.smn_sucursal_rf,
	smn_comercial.smn_oferta_cabecera.ofe_fecha_desde,
	smn_comercial.smn_oferta_cabecera.ofe_fecha_hasta,
	smn_comercial.smn_oferta_cabecera.ofe_observaciones,
	smn_comercial.smn_oferta_cabecera.ofe_estatus,
	smn_comercial.smn_oferta_cabecera.ofe_fecha_registro
from
	smn_comercial.smn_oferta_cabecera 
where
	smn_comercial.smn_oferta_cabecera.smn_oferta_cabecera_id = ${fld:id}
