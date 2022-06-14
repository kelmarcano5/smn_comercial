setComboValue('smn_clasificacion_cliente_id','${fld:smn_clasificacion_cliente_id}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_clasificacion_abc_rf','${fld:smn_clasificacion_abc_rf}','form1');
setComboValue('smn_sector_economico_rf','${fld:smn_sector_economico_rf}','form1');
setComboValue('cli_nacional_ext','${fld:cli_nacional_ext}','form1');
document.form1.cli_vigencia.value='${fld:cli_vigencia@dd-MM-yyyy}';
setComboValue('cli_estatus','${fld:cli_estatus}','form1');
document.form1.id.value='${fld:smn_cliente_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

