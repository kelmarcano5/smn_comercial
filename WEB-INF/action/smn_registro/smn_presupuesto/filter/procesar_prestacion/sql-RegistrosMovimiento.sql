select
	smn_ingresos_mov_id, smn_ingreso_id, smn_servicios_rf, smn_unidades_servicios_rf, '' as tipo_precio
from 
	smn_comercial.smn_ingreso_movimiento
where smn_ingreso_id = ${fld:id_ingreso} and smn_servicios_rf is not null and inm_estatus = 'AC'
