document.form1.smn_afiliado_id.value='${fld:smn_afiliado_id@#,###,###}';
document.form1.smn_pedido_id.value='${fld:smn_pedido_id@#,###,###}';
document.form1.crn_fecha_renovacion.value='${fld:crn_fecha_renovacion@dd-MM-yyyy}';
document.form1.crn_fecha_vigencia_hasta.value='${fld:crn_fecha_vigencia_hasta@dd-MM-yyyy}';
setComboValue('crn_estatus','${fld:crn_estatus}','form1');
document.form1.id.value='${fld:smn_control_renovacion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

