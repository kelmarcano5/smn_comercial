UPDATE smn_comercial.smn_ruta_paciente set rta_estatus =  'AT', rta_hora_salida_unidad = '${def:time}'
     WHERE rta_estatus = 'EA' and rta_secuencia = 1 and rta_ticket IN (
         SELECT igs_ticket 
         FROM smn_comercial.smn_ingresos 
         WHERE smn_ingresos_id = ${fld:id_ingreso}
     ) --and rta_fecha_registro = current_date;
     
UPDATE smn_comercial.smn_ruta_paciente set rta_hora_llegada_unidad = '${def:time}'
     WHERE rta_estatus = 'PE' and rta_secuencia = 2 and rta_ticket IN (
         SELECT igs_ticket 
         FROM smn_comercial.smn_ingresos 
         WHERE smn_ingresos_id = ${fld:id_ingreso}
     ) --and rta_fecha_registro = current_date;