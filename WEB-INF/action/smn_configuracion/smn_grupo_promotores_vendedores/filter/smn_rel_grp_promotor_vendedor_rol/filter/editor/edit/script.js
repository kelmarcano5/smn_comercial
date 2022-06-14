setComboValue('smn_grupo_promotores_vendedores_id','${fld:smn_grupo_promotores_vendedores_id}','form1');
setComboValue('smn_rol_id','${fld:smn_rol_id}','form1');
document.form1.id.value='${fld:smn_rel_grp_promotor_vendedor_rol_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

