SELECT smn_mov_caja_cabecera_id
FROM smn_caja.smn_mov_caja_cabecera
WHERE mcc_documento_rf = ${fld:smn_documento_id} AND
 	  mcc_cod_descripcion_orig = ${fld:descripcion_origen} AND
 	  smn_num_doc_origen_rf = ${fld:igs_num_ingreso} AND
 	  mcc_doc_referencia = '${fld:igs_ticket}' AND
 	  smn_clase_auxiliar_rf = ${fld:smn_clase_rf} AND
 	  smn_auxiliar_rf = ${fld:smn_auxiliar_rf} AND
 	  mcc_fecha_registro = current_date
ORDER BY smn_mov_caja_cabecera_id asc
LIMIT 1