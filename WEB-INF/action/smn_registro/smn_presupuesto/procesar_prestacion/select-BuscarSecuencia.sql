select DISTINCT smn_comercial.smn_relacion_unidad_paso.rup_secuencia 
from smn_comercial.smn_relacion_unidad_paso
   LEFT OUTER JOIN smn_comercial.smn_series on smn_comercial.smn_series.smn_series_id = smn_comercial.smn_relacion_unidad_paso.smn_serie_id
   LEFT OUTER JOIN smn_comercial.smn_ingreso_cola_virtual on smn_comercial.smn_ingreso_cola_virtual.smn_unidad_servicio_rf = smn_comercial.smn_relacion_unidad_paso.smn_unidad_servicio_rf
   LEFT OUTER JOIN smn_base.smn_auxiliar on smn_base.smn_auxiliar.aux_codigo = ${fld:rta_numero_documento_identidad}
where smn_comercial.smn_relacion_unidad_paso.smn_area_servicio_rf= ${fld:smn_area_servicio_rf}
   and smn_comercial.smn_relacion_unidad_paso.smn_unidad_servicio_rf= ${fld:smn_unidad_servicio_rf}
   and smn_comercial.smn_series.sri_codigo= ${fld:smn_serie_id}