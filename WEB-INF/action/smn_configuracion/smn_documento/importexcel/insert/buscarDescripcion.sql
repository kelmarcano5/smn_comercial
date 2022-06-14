select
		smn_comercial.smn_documento.dcf_descripcion
from
		smn_comercial.smn_documento
where
		upper(smn_comercial.smn_documento.dcf_descripcion) = upper(${fld:dcf_descripcion})
