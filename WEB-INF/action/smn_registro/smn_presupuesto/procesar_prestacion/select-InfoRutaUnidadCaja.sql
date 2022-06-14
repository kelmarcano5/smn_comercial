select rta_ticket, smn_entidad_rf, smn_sucursal_rf, smn_area_servicio_rf, smn_unidad_servicio_rf
from smn_comercial.smn_ruta_paciente
where rta_estatus = 'PE' and rta_secuencia = 2 and rta_ticket IN (
         SELECT igs_ticket 
         FROM smn_comercial.smn_ingresos 
         WHERE smn_ingresos_id = ${fld:id_ingreso}
     ) and rta_fecha_registro = current_date