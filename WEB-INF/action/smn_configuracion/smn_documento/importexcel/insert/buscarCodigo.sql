select
		smn_comercial.smn_documento.dcf_codigo
from
		smn_comercial.smn_documento
where
		upper(smn_comercial.smn_documento.dcf_codigo) = upper(${fld:dcf_codigo})
