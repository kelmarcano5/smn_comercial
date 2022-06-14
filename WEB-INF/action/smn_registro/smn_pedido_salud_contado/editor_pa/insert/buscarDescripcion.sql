select
		smn_base.smn_auxiliar.aux_num_doc_oficial
from
		smn_base.smn_auxiliar
where
		upper(smn_base.smn_auxiliar.aux_num_doc_oficial) = upper(${fld:aux_num_doc_oficial})
