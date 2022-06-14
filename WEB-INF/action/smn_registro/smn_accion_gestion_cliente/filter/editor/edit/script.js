document.form1.smn_rel_oferta_cliente_id.value='${fld:smn_rel_oferta_cliente_id@#,###,###}';
setComboValue('smn_accion_id','${fld:smn_accion_id}','form1');
setComboValue('ago_estatus_proceso','${fld:ago_estatus_proceso}','form1');
document.form1.ago_fecha_seguimiento.value='${fld:ago_fecha_seguimiento@dd-MM-yyyy}';
document.form1.ago_fecha_aprobacion.value='${fld:ago_fecha_aprobacion@dd-MM-yyyy}';
document.form1.ago_fecha_vigencia_desde.value='${fld:ago_fecha_vigencia_desde@dd-MM-yyyy}';
document.form1.ago_fecha_vigencia_hasta.value='${fld:ago_fecha_vigencia_hasta@dd-MM-yyyy}';
document.form1.ago_fecha_cierre.value='${fld:ago_fecha_cierre@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_accion_gestion_cliente_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

