document.form1.cai_codigo.value='${fld:cai_codigo@js}';
document.form1.cai_descripcion.value='${fld:cai_descripcion@js}';
setComboValue('cai_estatus','${fld:cai_estatus}','form1');
document.form1.cai_fecha_vigencia.value='${fld:cai_fecha_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_categoria_item_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.cai_codigo.disabled=true;
 

