setComboValue('smn_oferta_id','${fld:smn_oferta_id}','form1');
document.form1.eof_fecha_envio.value='${fld:eof_fecha_envio@dd-MM-yyyy}';
document.form1.eof_fecha_cierre.value='${fld:eof_fecha_cierre@dd-MM-yyyy}';
setComboValue('smn_clasificacion_cliente_id','${fld:smn_clasificacion_cliente_id}','form1');
//document.form1.smn_clasificacion_cliente_id.value='${fld:smn_clasificacion_cliente_id@#,###,###}';
setComboValue('smn_clientes_area_interes_id','${fld:smn_clientes_area_interes_id}','form1');
//document.form1.smn_clientes_area_interes_id.value='${fld:smn_clientes_area_interes_id@#,###,###}';
setComboValue('smn_tipo_contactos_rf','${fld:smn_tipo_contactos_rf}','form1');
document.form1.eof_descripcion.value='${fld:eof_descripcion@js}';
document.form1.id.value='${fld:smn_envio_oferta_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

