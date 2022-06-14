select
		smn_base.smn_auxiliar_contacto.auc_descripcion
from
		smn_base.smn_auxiliar_contacto
where
		upper(smn_base.smn_auxiliar_contacto.auc_descripcion) = upper(${fld:auc_descripcion})
