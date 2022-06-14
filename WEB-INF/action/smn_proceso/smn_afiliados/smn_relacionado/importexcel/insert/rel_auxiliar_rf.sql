select 
	smn_base.smn_auxiliar.smn_auxiliar_id as rel_auxiliar_rf_ref 
from   
	smn_base.smn_auxiliar 
where  
	upper(smn_base.smn_auxiliar.aux_descripcion) = upper(${fld:rel_auxiliar_rf_desc})
