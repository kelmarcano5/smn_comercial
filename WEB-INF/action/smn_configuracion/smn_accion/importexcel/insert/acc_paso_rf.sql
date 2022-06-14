select 
	smn_base.smn_paso.smn_paso_id as acc_paso_rf_ref 
from   
	smn_base.smn_paso 
where  
	upper(smn_base.smn_paso.pas_descripcion) = upper(${fld:acc_paso_rf_desc})
