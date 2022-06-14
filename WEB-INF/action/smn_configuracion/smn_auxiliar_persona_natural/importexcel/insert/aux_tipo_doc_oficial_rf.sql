select 
	smn_base.smn_tipo_doc_oficial.smn_tipo_doc_oficial_id as aux_tipo_doc_oficial_rf_ref 
from   
	smn_base.smn_tipo_doc_oficial 
where  
	upper(smn_base.smn_tipo_doc_oficial.tdo_descripcion) = upper(${fld:aux_tipo_doc_oficial_rf_desc})
