select smn_clase_auxiliar_rf, smn_auxiliar_rf, rta_numero_documento_identidad, smn_entidad_rf, smn_sucursal_rf, smn_area_servicio_rf, smn_serie_id, rta_ticket, 0 as smn_unidad_servicio_rf
from smn_comercial.smn_ruta_paciente
where smn_ruta_paciente.rta_estatus in ('EA','AT') and smn_ruta_paciente.rta_secuencia = 1 and smn_ruta_paciente.rta_ticket IN (
         SELECT igs_ticket 
         FROM smn_comercial.smn_ingresos 
         WHERE smn_ingresos_id = ${fld:id_ingreso}
     ) and rta_fecha_registro = current_date