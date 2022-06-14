setComboValue('smn_oferta_id','${fld:smn_oferta_id}','form1');
setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
setComboValue('roc_estatus_proceso','${fld:roc_estatus_proceso}','form1');
document.form1.roc_fecha_aprobacion.value='${fld:roc_fecha_aprobacion@dd-MM-yyyy}';
document.form1.roc_fecha_vigencia_desde.value='${fld:roc_fecha_vigencia_desde@dd-MM-yyyy}';
document.form1.roc_fecha_vigencia_hasta.value='${fld:roc_fecha_vigencia_hasta@dd-MM-yyyy}';
document.form1.roc_fecha_cierre.value='${fld:roc_fecha_cierre@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_oferta_cliente_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 
document.getElementById('smn_oferta_id').disabled="true";
