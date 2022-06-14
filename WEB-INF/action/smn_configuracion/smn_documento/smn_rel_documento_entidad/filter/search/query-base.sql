select
	smn_comercial.smn_rel_documento_entidad.smn_rel_documento_entidad_id,
	smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidades_rf
from
	smn_comercial.smn_rel_documento_entidad
	inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_rel_documento_entidad.smn_documento_id
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_rel_documento_entidad.smn_entidades_rf
where
	smn_rel_documento_entidad_id is not null
	and 	smn_comercial.smn_documento.smn_documento_id=smn_comercial.smn_rel_documento_entidad.smn_documento_id
	${filter}
order by
		smn_rel_documento_entidad_id
