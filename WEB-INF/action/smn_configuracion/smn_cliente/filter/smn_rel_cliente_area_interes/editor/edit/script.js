setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
setComboValue('smn_area_interes_id','${fld:smn_area_interes_id}','form1');
setComboValue('rca_estatus','${fld:rca_estatus}','form1');
document.form1.rca_vigencia.value='${fld:rca_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_cliente_area_interes_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

