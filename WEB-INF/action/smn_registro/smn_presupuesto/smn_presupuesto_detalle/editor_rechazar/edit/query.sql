select	
	*
from 
	smn_comercial.smn_presupuesto_detalle
where 
	smn_presupuesto_detalle_id = ${fld:id} 
	--and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='IT'


