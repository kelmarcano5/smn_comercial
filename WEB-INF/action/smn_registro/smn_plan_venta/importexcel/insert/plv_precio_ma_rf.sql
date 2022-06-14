select 
	smn_base.smn_monedas.smn_monedas_id as plv_precio_ma_rf_ref 
from   
	smn_base.smn_monedas 
where  
	upper(smn_base.smn_monedas.mon_nombre) = upper(${fld:plv_precio_ma_rf_desc})
