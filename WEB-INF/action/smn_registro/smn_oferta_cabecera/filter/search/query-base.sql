select
	smn_comercial.smn_oferta_cabecera.smn_oferta_cabecera_id,
	case
	when smn_comercial.smn_oferta_cabecera.ofe_estatus='A' then '${lbl:b_open}'
	when smn_comercial.smn_oferta_cabecera.ofe_estatus='C' then '${lbl:b_close}'
	end as ofe_estatus,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_oferta_cabecera.ofe_numero_documento,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo ||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_comercial.smn_oferta_cabecera.ofe_fecha_desde,
	smn_comercial.smn_oferta_cabecera.ofe_fecha_hasta,
	smn_comercial.smn_oferta_cabecera.ofe_observaciones,
	smn_comercial.smn_oferta_cabecera.ofe_descripcion,
	smn_comercial.smn_oferta_cabecera.ofe_fecha_registro
	
from
	smn_comercial.smn_oferta_cabecera
	left outer join smn_comercial.smn_documento 
	on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_oferta_cabecera.smn_documento_id
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_oferta_cabecera.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_oferta_cabecera.smn_sucursal_rf
where
	smn_oferta_cabecera_id is not null
	${filter}
order by
		smn_oferta_cabecera_id
