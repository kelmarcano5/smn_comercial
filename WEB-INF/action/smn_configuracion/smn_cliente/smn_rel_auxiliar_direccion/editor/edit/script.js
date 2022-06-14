setComboValue('smn_clase_auxiliar_id','${fld:smn_clase_auxiliar_id}','form1');
setComboValue('smn_auxiliar_id','${fld:smn_auxiliar_id}','form1');
setComboValue('smn_direccion_id','${fld:smn_direccion_id}','form1');
document.form1.rad_tipo_direccion.value='${fld:rad_tipo_direccion@js}';
document.form1.rad_status.value='${fld:rad_status@js}';
document.form1.rad_fecha_vigencia.value='${fld:rad_fecha_vigencia@dd-MM-yyyy}';
document.form1.smn_zona_rf.value='${fld:smn_zona_rf@#,###,###}';
document.form1.id.value='${fld:smn_rel_auxiliar_direccion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

