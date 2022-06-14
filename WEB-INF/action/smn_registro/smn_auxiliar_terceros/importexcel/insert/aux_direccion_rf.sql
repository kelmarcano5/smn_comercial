select 
	smn_base.smn_direccion.smn_direccion_id as aux_direccion_rf_ref 
from   
	smn_base.smn_direccion 
where  
	upper(smn_base.smn_direccion.dir_descripcion) = upper(${fld:aux_direccion_rf_desc})
