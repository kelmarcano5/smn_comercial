select smn_base.smn_tipo_doc_oficial.tdo_codigo as id from smn_base.smn_tipo_doc_oficial 
left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.aux_tipo_doc_oficial_rf=smn_base.smn_tipo_doc_oficial.smn_tipo_doc_oficial_id
where smn_base.smn_auxiliar.aux_tipo_doc_oficial_rf=${fld:id} GROUP BY id