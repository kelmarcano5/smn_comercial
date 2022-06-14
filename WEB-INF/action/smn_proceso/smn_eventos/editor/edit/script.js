document.form1.eve_codigo.value='${fld:eve_codigo@js}';
document.form1.eve_descripcion_corta.value='${fld:eve_descripcion_corta@js}';
document.form1.eve_descripcion_larga.value='${fld:eve_descripcion_larga@js}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
document.form1.eve_fecha_inicial.value='${fld:eve_fecha_inicial@dd-MM-yyyy}';
document.form1.eve_fecha_final.value='${fld:eve_fecha_final@dd-MM-yyyy}';
document.form1.eve_hora_inicial.value='${fld:eve_hora_inicial@js}';
document.form1.eve_hora_final.value='${fld:eve_hora_final@js}';
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
setComboValue('smn_clasificacion_abc_rf','${fld:smn_clasificacion_abc_rf}','form1');
document.form1.eve_cupo.value='${fld:eve_cupo@#,###,###}';
document.form1.eve_reservas_por_afiliado.value='${fld:eve_reservas_por_afiliado@#,###,###}';
setComboValue('eve_estatus','${fld:eve_estatus}','form1');
document.form1.id.value='${fld:smn_evento_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.eve_codigo.disabled=true;
 

