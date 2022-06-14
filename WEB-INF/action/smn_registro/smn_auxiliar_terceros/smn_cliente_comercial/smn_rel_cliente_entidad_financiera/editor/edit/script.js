setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
setComboValue('smn_entidad_financiera_rf','${fld:smn_entidad_financiera_rf}','form1');
setComboValue('smn_tipo_cuenta_banco_rf','${fld:smn_tipo_cuenta_banco_rf}','form1');
document.form1.cef_numero_cuenta.value='${fld:cef_numero_cuenta@js}';
setComboValue('cef_estatus','${fld:cef_estatus}','form1');
document.form1.cef_vigencia.value='${fld:cef_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_cliente_entidad_financiera_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

